Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA3510964
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:00:16 +0200 (CEST)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRM7-0002Wo-8v
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRIC-0004cR-Dv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:12 -0400
Received: from smtp115.iad3a.emailsrvr.com ([173.203.187.115]:39415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRI9-0004c0-Au
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:12 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp31.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 8787824804; 
 Tue, 26 Apr 2022 15:55:44 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] qga/commands-posix: Fix iface hw address detection
Date: Tue, 26 Apr 2022 14:55:23 -0500
Message-Id: <20220426195526.7699-3-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220426195526.7699-1-adeason@sinenomine.net>
References: <20220426195526.7699-1-adeason@sinenomine.net>
X-Classification-ID: cc5ef99f-0605-4056-825c-a202bb8c6ff8-3-1
Received-SPF: pass client-ip=173.203.187.115;
 envelope-from=adeason@sinenomine.net; helo=smtp115.iad3a.emailsrvr.com
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since its introduction in commit 3424fc9f16a1 ("qemu-ga: add
guest-network-get-interfaces command"), guest-network-get-interfaces
seems to check if a given interface has a hardware address by checking
'ifa->ifa_flags & SIOCGIFHWADDR'. But ifa_flags is a field for IFF_*
flags (IFF_UP, IFF_LOOPBACK, etc), and comparing it to an ioctl like
SIOCGIFHWADDR doesn't make sense.

On Linux, this isn't a big deal, since SIOCGIFHWADDR has so many bits
set (0x8927), 'ifa->ifa_flags & SIOCGIFHWADDR' will usually have a
nonzero result for any 'normal'-looking interfaces: anything with
IFF_UP (0x1) or IFF_BROADCAST (0x2) set, as well as several
less-common flags. This means we'll try to get the hardware address
for most/all interfaces, even those that don't really have one (like
the loopback device). For those interfaces, Linux just returns a
hardware address of all zeroes.

On Solaris, however, trying to get the hardware address for a loopback
device returns an EADDRNOTAVAIL error. This causes us to return an
error and the entire guest-network-get-interfaces call fails.

Change this logic to always try to get the hardware address for each
interface, and don't return an error if we fail to get it. Instead,
just don't include the 'hardware-address' field in the result if we
can't get the hardware address.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
---
 qga/commands-posix.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75ac19800f..dbfbb14152 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2850,48 +2850,57 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 
         info = guest_find_interface(head, ifa->ifa_name);
 
         if (!info) {
             info = g_malloc0(sizeof(*info));
             info->name = g_strdup(ifa->ifa_name);
 
             QAPI_LIST_APPEND(tail, info);
         }
 
-        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
+        if (!info->has_hardware_address) {
             /* we haven't obtained HW address yet */
             sock = socket(PF_INET, SOCK_STREAM, 0);
             if (sock == -1) {
                 error_setg_errno(errp, errno, "failed to create socket");
                 goto error;
             }
 
             memset(&ifr, 0, sizeof(ifr));
             pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
             if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
-                error_setg_errno(errp, errno,
-                                 "failed to get MAC address of %s",
-                                 ifa->ifa_name);
-                close(sock);
-                goto error;
-            }
+                /*
+                 * We can't get the hw addr of this interface, but that's not a
+                 * fatal error. Don't set info->hardware_address, but keep
+                 * going.
+                 */
+                if (errno == EADDRNOTAVAIL) {
+                    /* The interface doesn't have a hw addr (e.g. loopback). */
+                    g_debug("failed to get MAC address of %s: %s",
+                            ifa->ifa_name, strerror(errno));
+                } else{
+                    g_warning("failed to get MAC address of %s: %s",
+                              ifa->ifa_name, strerror(errno));
+                }
 
-            close(sock);
-            mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
+            } else {
+                mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
 
-            info->hardware_address =
-                g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
-                                (int) mac_addr[0], (int) mac_addr[1],
-                                (int) mac_addr[2], (int) mac_addr[3],
-                                (int) mac_addr[4], (int) mac_addr[5]);
+                info->hardware_address =
+                    g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
+                                    (int) mac_addr[0], (int) mac_addr[1],
+                                    (int) mac_addr[2], (int) mac_addr[3],
+                                    (int) mac_addr[4], (int) mac_addr[5]);
 
-            info->has_hardware_address = true;
+                info->has_hardware_address = true;
+            }
+            close(sock);
         }
 
         if (ifa->ifa_addr &&
             ifa->ifa_addr->sa_family == AF_INET) {
             /* interface with IPv4 address */
             p = &((struct sockaddr_in *)ifa->ifa_addr)->sin_addr;
             if (!inet_ntop(AF_INET, p, addr4, sizeof(addr4))) {
                 error_setg_errno(errp, errno, "inet_ntop failed");
                 goto error;
             }
-- 
2.11.0


