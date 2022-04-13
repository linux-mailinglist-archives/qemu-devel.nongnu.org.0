Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED0500181
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 00:02:41 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nel4S-0003K7-3Q
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 18:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nel2b-0001Jb-O9
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 18:00:45 -0400
Received: from smtp120.ord1d.emailsrvr.com ([184.106.54.120]:57914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nel2Z-0004Lx-4Q
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 18:00:45 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp8.relay.ord1d.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 80743C01B5; 
 Wed, 13 Apr 2022 18:00:17 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] qga/commands-posix: Log all net stats failures
Date: Wed, 13 Apr 2022 17:00:06 -0500
Message-Id: <20220413220007.14467-5-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220413220007.14467-1-adeason@sinenomine.net>
References: <20220413220007.14467-1-adeason@sinenomine.net>
X-Classification-ID: 5647c629-c4e4-4626-ae9f-55e4ffbba697-5-1
Received-SPF: pass client-ip=184.106.54.120;
 envelope-from=adeason@sinenomine.net; helo=smtp120.ord1d.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

guest_get_network_stats can silently fail in a couple of ways. Add
debug messages to these cases, so we're never completely silent on
failure.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
---
Changes since v1:
- new in v2

 qga/commands-posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index c0b00fc488..97e001e998 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2789,20 +2789,22 @@ static int guest_get_network_stats(const char *name,
                        GuestNetworkInterfaceStat *stats)
 {
 #ifdef CONFIG_LINUX
     int name_len;
     char const *devinfo = "/proc/net/dev";
     FILE *fp;
     char *line = NULL, *colon;
     size_t n = 0;
     fp = fopen(devinfo, "r");
     if (!fp) {
+        g_debug("failed to open network stats %s: %s", devinfo,
+                g_strerror(errno));
         return -1;
     }
     name_len = strlen(name);
     while (getline(&line, &n, fp) != -1) {
         long long dummy;
         long long rx_bytes;
         long long rx_packets;
         long long rx_errs;
         long long rx_dropped;
         long long tx_bytes;
@@ -2837,21 +2839,23 @@ static int guest_get_network_stats(const char *name,
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
-#endif /* CONFIG_LINUX */
+#else /* !CONFIG_LINUX */
+    g_debug("Network stats reporting available only for Linux");
+#endif /* !CONFIG_LINUX */
     return -1;
 }
 
 /*
  * Build information about guest interfaces
  */
 GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 {
     GuestNetworkInterfaceList *head = NULL, **tail = &head;
     struct ifaddrs *ifap, *ifa;
-- 
2.11.0


