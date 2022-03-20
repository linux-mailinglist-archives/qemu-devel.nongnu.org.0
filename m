Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742064E1E02
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:40:53 +0100 (CET)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3IC-0000Fa-JE
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:40:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Gt-0007I0-25
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:39:31 -0400
Received: from smtp102.iad3a.emailsrvr.com ([173.203.187.102]:49114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Gp-0003hm-SU
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:39:30 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp21.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 92C0223EDC; 
 Sun, 20 Mar 2022 17:39:03 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] qga/commands-posix: Fix listing ifaces for Solaris
Date: Sun, 20 Mar 2022 16:38:43 -0500
Message-Id: <20220320213843.4544-4-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220320213843.4544-1-adeason@sinenomine.net>
References: <20220320213843.4544-1-adeason@sinenomine.net>
X-Classification-ID: 24b37eb1-89c9-490c-a9ff-4b3c6c12b24b-4-1
Received-SPF: pass client-ip=173.203.187.102;
 envelope-from=adeason@sinenomine.net; helo=smtp102.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, Andrew Deason <adeason@sinenomine.net>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code for guest-network-get-interfaces needs a couple of small
adjustments for Solaris:

- The results from SIOCGIFHWADDR are documented as being in ifr_addr,
  not ifr_hwaddr (ifr_hwaddr doesn't exist on Solaris).

- The implementation of guest_get_network_stats is Linux-specific, so
  hide it under #ifdef CONFIG_LINUX. On non-Linux, we just won't
  provide network interface stats.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
 qga/commands-posix.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index bd0d67f674..c0b00fc488 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2781,20 +2781,21 @@ guest_find_interface(GuestNetworkInterfaceList *head,
             return head->value;
         }
     }
 
     return NULL;
 }
 
 static int guest_get_network_stats(const char *name,
                        GuestNetworkInterfaceStat *stats)
 {
+#ifdef CONFIG_LINUX
     int name_len;
     char const *devinfo = "/proc/net/dev";
     FILE *fp;
     char *line = NULL, *colon;
     size_t n = 0;
     fp = fopen(devinfo, "r");
     if (!fp) {
         return -1;
     }
     name_len = strlen(name);
@@ -2836,20 +2837,21 @@ static int guest_get_network_stats(const char *name,
             stats->tx_errs = tx_errs;
             stats->tx_dropped = tx_dropped;
             fclose(fp);
             g_free(line);
             return 0;
         }
     }
     fclose(fp);
     g_free(line);
     g_debug("/proc/net/dev: Interface '%s' not found", name);
+#endif /* CONFIG_LINUX */
     return -1;
 }
 
 /*
  * Build information about guest interfaces
  */
 GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 {
     GuestNetworkInterfaceList *head = NULL, **tail = &head;
     struct ifaddrs *ifap, *ifa;
@@ -2901,22 +2903,25 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
                 if (errno == EADDRNOTAVAIL) {
                     /* The interface doesn't have a hw addr (e.g. loopback). */
                     g_debug("failed to get MAC address of %s: %s",
                             ifa->ifa_name, strerror(errno));
                 } else{
                     g_warning("failed to get MAC address of %s: %s",
                               ifa->ifa_name, strerror(errno));
                 }
 
             } else {
+#ifdef CONFIG_SOLARIS
+                mac_addr = (unsigned char *) &ifr.ifr_addr.sa_data;
+#else
                 mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
-
+#endif
                 info->hardware_address =
                     g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                     (int) mac_addr[0], (int) mac_addr[1],
                                     (int) mac_addr[2], (int) mac_addr[3],
                                     (int) mac_addr[4], (int) mac_addr[5]);
 
                 info->has_hardware_address = true;
             }
             close(sock);
         }
-- 
2.11.0


