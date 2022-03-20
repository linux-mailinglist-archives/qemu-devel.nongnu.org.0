Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A94E1E04
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:43:53 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3L6-0003o1-LC
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:43:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Gt-0007I4-3H
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:39:31 -0400
Received: from smtp103.iad3a.emailsrvr.com ([173.203.187.103]:51600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Gp-0003hf-Cj
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:39:30 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp21.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 23BF922AEC; 
 Sun, 20 Mar 2022 17:39:03 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qga/commands-posix: Fix iface hw address detection
Date: Sun, 20 Mar 2022 16:38:42 -0500
Message-Id: <20220320213843.4544-3-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220320213843.4544-1-adeason@sinenomine.net>
References: <20220320213843.4544-1-adeason@sinenomine.net>
X-Classification-ID: 24b37eb1-89c9-490c-a9ff-4b3c6c12b24b-3-1
Received-SPF: pass client-ip=173.203.187.103;
 envelope-from=adeason@sinenomine.net; helo=smtp103.iad3a.emailsrvr.com
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
---
As implemented, this commit results in a behavior difference between Linux and
Solaris. It's fixable, but I'm not sure which behavior we should have, or if
it's okay that they behave differently:

On Linux, we've always returned the MAC address for loopback as all zeroes. In
this commit, on Solaris we don't return a MAC address at all for loopback
(because trying to get the MAC for lo results in an error).

It doesn't have to be like this; the behavior could be made the same if we
wanted, by either:

- Making it so failing to get the hw address falls back to providing an
  all-zeroes address (making Solaris look more like Linux).

- Stop providing a 'fake' all-zeroes hw address on Linux (arguably more
  accurate, but harder to detect, and different than past behavior).

Or we could just leave the behavior as it is and have the two behave slightly
differently; we're merely reflecting what the underlying platform does, and I'm
not sure anyone cares about the difference. I assume this applies to any
network interface that doesn't have a hardware address, but loopback is the
only one I've seen on the simple test VMs I've been using so far.

 qga/commands-posix.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index e0feb5ffb5..bd0d67f674 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2875,48 +2875,57 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 
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


