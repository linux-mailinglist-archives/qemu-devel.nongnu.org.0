Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64851095C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:58:15 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRKA-0006hS-5S
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRIB-0004cP-FN
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:12 -0400
Received: from smtp117.iad3a.emailsrvr.com ([173.203.187.117]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1njRI8-0004bw-IO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:56:11 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp31.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id D2BAE239F2; 
 Tue, 26 Apr 2022 15:55:43 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] qga/commands-posix: Use getifaddrs when available
Date: Tue, 26 Apr 2022 14:55:22 -0500
Message-Id: <20220426195526.7699-2-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220426195526.7699-1-adeason@sinenomine.net>
References: <20220426195526.7699-1-adeason@sinenomine.net>
X-Classification-ID: cc5ef99f-0605-4056-825c-a202bb8c6ff8-2-1
Received-SPF: pass client-ip=173.203.187.117;
 envelope-from=adeason@sinenomine.net; helo=smtp117.iad3a.emailsrvr.com
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

Currently, commands-posix.c assumes that getifaddrs() is only
available on Linux, and so the related guest agent command
guest-network-get-interfaces is only implemented for #ifdef __linux__.
This function does exist on other platforms, though, such as Solaris.
So, add a meson check for getifaddrs(), and move the code for
guest-network-get-interfaces to be built whenever getifaddrs() is
available.

The implementation for guest-network-get-interfaces still has some
Linux-specific code, which is not fixed in this commit. This commit
moves the relevant big chunks of code around without changing them, so
a future commit can change the code in place.

Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
---
 meson.build          |   1 +
 qga/commands-posix.c | 474 ++++++++++++++++++++++++++-------------------------
 2 files changed, 246 insertions(+), 229 deletions(-)

diff --git a/meson.build b/meson.build
index d083c6b7bf..860f593e9f 100644
--- a/meson.build
+++ b/meson.build
@@ -1631,20 +1631,21 @@ config_host_data.set('CONFIG_VALLOC', cc.has_function('valloc'))
 config_host_data.set('CONFIG_MEMALIGN', cc.has_function('memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_PTHREAD_FCHDIR_NP', cc.has_function('pthread_fchdir_np'))
 config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
 config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
 config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
 config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
 config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
 config_host_data.set('HAVE_COPY_FILE_RANGE', cc.has_function('copy_file_range'))
+config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
 config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 if rdma.found()
   config_host_data.set('HAVE_IBV_ADVISE_MR',
                        cc.has_function('ibv_advise_mr',
                                        args: config_host['RDMA_LIBS'].split(),
                                        prefix: '#include <infiniband/verbs.h>'))
 endif
 
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 77f4672ca2..75ac19800f 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -27,38 +27,45 @@
 #include "qemu/cutils.h"
 #include "commands-common.h"
 
 #ifdef HAVE_UTMPX
 #include <utmpx.h>
 #endif
 
 #if defined(__linux__)
 #include <mntent.h>
 #include <linux/fs.h>
-#include <ifaddrs.h>
-#include <arpa/inet.h>
-#include <sys/socket.h>
-#include <net/if.h>
 #include <sys/statvfs.h>
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
 #endif
 
 #ifdef FIFREEZE
 #define CONFIG_FSFREEZE
 #endif
 #ifdef FITRIM
 #define CONFIG_FSTRIM
 #endif
 #endif
 
+#ifdef HAVE_GETIFADDRS
+#include <arpa/inet.h>
+#include <sys/socket.h>
+#include <net/if.h>
+#include <sys/types.h>
+#include <ifaddrs.h>
+#ifdef CONFIG_SOLARIS
+#include <sys/sockio.h>
+#endif
+#endif
+
 static void ga_wait_child(pid_t pid, int *status, Error **errp)
 {
     pid_t rpid;
 
     *status = 0;
 
     do {
         rpid = waitpid(pid, status, 0);
     } while (rpid == -1 && errno == EINTR);
 
@@ -2122,237 +2129,20 @@ void qmp_guest_suspend_disk(Error **errp)
 void qmp_guest_suspend_ram(Error **errp)
 {
     guest_suspend(SUSPEND_MODE_RAM, errp);
 }
 
 void qmp_guest_suspend_hybrid(Error **errp)
 {
     guest_suspend(SUSPEND_MODE_HYBRID, errp);
 }
 
-static GuestNetworkInterface *
-guest_find_interface(GuestNetworkInterfaceList *head,
-                     const char *name)
-{
-    for (; head; head = head->next) {
-        if (strcmp(head->value->name, name) == 0) {
-            return head->value;
-        }
-    }
-
-    return NULL;
-}
-
-static int guest_get_network_stats(const char *name,
-                       GuestNetworkInterfaceStat *stats)
-{
-    int name_len;
-    char const *devinfo = "/proc/net/dev";
-    FILE *fp;
-    char *line = NULL, *colon;
-    size_t n = 0;
-    fp = fopen(devinfo, "r");
-    if (!fp) {
-        return -1;
-    }
-    name_len = strlen(name);
-    while (getline(&line, &n, fp) != -1) {
-        long long dummy;
-        long long rx_bytes;
-        long long rx_packets;
-        long long rx_errs;
-        long long rx_dropped;
-        long long tx_bytes;
-        long long tx_packets;
-        long long tx_errs;
-        long long tx_dropped;
-        char *trim_line;
-        trim_line = g_strchug(line);
-        if (trim_line[0] == '\0') {
-            continue;
-        }
-        colon = strchr(trim_line, ':');
-        if (!colon) {
-            continue;
-        }
-        if (colon - name_len  == trim_line &&
-           strncmp(trim_line, name, name_len) == 0) {
-            if (sscanf(colon + 1,
-                "%lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld",
-                  &rx_bytes, &rx_packets, &rx_errs, &rx_dropped,
-                  &dummy, &dummy, &dummy, &dummy,
-                  &tx_bytes, &tx_packets, &tx_errs, &tx_dropped,
-                  &dummy, &dummy, &dummy, &dummy) != 16) {
-                continue;
-            }
-            stats->rx_bytes = rx_bytes;
-            stats->rx_packets = rx_packets;
-            stats->rx_errs = rx_errs;
-            stats->rx_dropped = rx_dropped;
-            stats->tx_bytes = tx_bytes;
-            stats->tx_packets = tx_packets;
-            stats->tx_errs = tx_errs;
-            stats->tx_dropped = tx_dropped;
-            fclose(fp);
-            g_free(line);
-            return 0;
-        }
-    }
-    fclose(fp);
-    g_free(line);
-    g_debug("/proc/net/dev: Interface '%s' not found", name);
-    return -1;
-}
-
-/*
- * Build information about guest interfaces
- */
-GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
-{
-    GuestNetworkInterfaceList *head = NULL, **tail = &head;
-    struct ifaddrs *ifap, *ifa;
-
-    if (getifaddrs(&ifap) < 0) {
-        error_setg_errno(errp, errno, "getifaddrs failed");
-        goto error;
-    }
-
-    for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
-        GuestNetworkInterface *info;
-        GuestIpAddressList **address_tail;
-        GuestIpAddress *address_item = NULL;
-        GuestNetworkInterfaceStat *interface_stat = NULL;
-        char addr4[INET_ADDRSTRLEN];
-        char addr6[INET6_ADDRSTRLEN];
-        int sock;
-        struct ifreq ifr;
-        unsigned char *mac_addr;
-        void *p;
-
-        g_debug("Processing %s interface", ifa->ifa_name);
-
-        info = guest_find_interface(head, ifa->ifa_name);
-
-        if (!info) {
-            info = g_malloc0(sizeof(*info));
-            info->name = g_strdup(ifa->ifa_name);
-
-            QAPI_LIST_APPEND(tail, info);
-        }
-
-        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
-            /* we haven't obtained HW address yet */
-            sock = socket(PF_INET, SOCK_STREAM, 0);
-            if (sock == -1) {
-                error_setg_errno(errp, errno, "failed to create socket");
-                goto error;
-            }
-
-            memset(&ifr, 0, sizeof(ifr));
-            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
-            if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
-                error_setg_errno(errp, errno,
-                                 "failed to get MAC address of %s",
-                                 ifa->ifa_name);
-                close(sock);
-                goto error;
-            }
-
-            close(sock);
-            mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
-
-            info->hardware_address =
-                g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
-                                (int) mac_addr[0], (int) mac_addr[1],
-                                (int) mac_addr[2], (int) mac_addr[3],
-                                (int) mac_addr[4], (int) mac_addr[5]);
-
-            info->has_hardware_address = true;
-        }
-
-        if (ifa->ifa_addr &&
-            ifa->ifa_addr->sa_family == AF_INET) {
-            /* interface with IPv4 address */
-            p = &((struct sockaddr_in *)ifa->ifa_addr)->sin_addr;
-            if (!inet_ntop(AF_INET, p, addr4, sizeof(addr4))) {
-                error_setg_errno(errp, errno, "inet_ntop failed");
-                goto error;
-            }
-
-            address_item = g_malloc0(sizeof(*address_item));
-            address_item->ip_address = g_strdup(addr4);
-            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
-
-            if (ifa->ifa_netmask) {
-                /* Count the number of set bits in netmask.
-                 * This is safe as '1' and '0' cannot be shuffled in netmask. */
-                p = &((struct sockaddr_in *)ifa->ifa_netmask)->sin_addr;
-                address_item->prefix = ctpop32(((uint32_t *) p)[0]);
-            }
-        } else if (ifa->ifa_addr &&
-                   ifa->ifa_addr->sa_family == AF_INET6) {
-            /* interface with IPv6 address */
-            p = &((struct sockaddr_in6 *)ifa->ifa_addr)->sin6_addr;
-            if (!inet_ntop(AF_INET6, p, addr6, sizeof(addr6))) {
-                error_setg_errno(errp, errno, "inet_ntop failed");
-                goto error;
-            }
-
-            address_item = g_malloc0(sizeof(*address_item));
-            address_item->ip_address = g_strdup(addr6);
-            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
-
-            if (ifa->ifa_netmask) {
-                /* Count the number of set bits in netmask.
-                 * This is safe as '1' and '0' cannot be shuffled in netmask. */
-                p = &((struct sockaddr_in6 *)ifa->ifa_netmask)->sin6_addr;
-                address_item->prefix =
-                    ctpop32(((uint32_t *) p)[0]) +
-                    ctpop32(((uint32_t *) p)[1]) +
-                    ctpop32(((uint32_t *) p)[2]) +
-                    ctpop32(((uint32_t *) p)[3]);
-            }
-        }
-
-        if (!address_item) {
-            continue;
-        }
-
-        address_tail = &info->ip_addresses;
-        while (*address_tail) {
-            address_tail = &(*address_tail)->next;
-        }
-        QAPI_LIST_APPEND(address_tail, address_item);
-
-        info->has_ip_addresses = true;
-
-        if (!info->has_statistics) {
-            interface_stat = g_malloc0(sizeof(*interface_stat));
-            if (guest_get_network_stats(info->name, interface_stat) == -1) {
-                info->has_statistics = false;
-                g_free(interface_stat);
-            } else {
-                info->statistics = interface_stat;
-                info->has_statistics = true;
-            }
-        }
-    }
-
-    freeifaddrs(ifap);
-    return head;
-
-error:
-    freeifaddrs(ifap);
-    qapi_free_GuestNetworkInterfaceList(head);
-    return NULL;
-}
-
 /* Transfer online/offline status between @vcpu and the guest system.
  *
  * On input either @errp or *@errp must be NULL.
  *
  * In system-to-@vcpu direction, the following @vcpu fields are accessed:
  * - R: vcpu->logical_id
  * - W: vcpu->online
  * - W: vcpu->can_offline
  *
  * In @vcpu-to-system direction, the following @vcpu fields are accessed:
@@ -2908,26 +2698,20 @@ void qmp_guest_suspend_disk(Error **errp)
 void qmp_guest_suspend_ram(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
 }
 
 void qmp_guest_suspend_hybrid(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
 }
 
-GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return NULL;
-}
-
 GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
 int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
     return -1;
@@ -2955,20 +2739,248 @@ qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
 }
 
 GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
 #endif
 
+#ifdef HAVE_GETIFADDRS
+static GuestNetworkInterface *
+guest_find_interface(GuestNetworkInterfaceList *head,
+                     const char *name)
+{
+    for (; head; head = head->next) {
+        if (strcmp(head->value->name, name) == 0) {
+            return head->value;
+        }
+    }
+
+    return NULL;
+}
+
+static int guest_get_network_stats(const char *name,
+                       GuestNetworkInterfaceStat *stats)
+{
+    int name_len;
+    char const *devinfo = "/proc/net/dev";
+    FILE *fp;
+    char *line = NULL, *colon;
+    size_t n = 0;
+    fp = fopen(devinfo, "r");
+    if (!fp) {
+        return -1;
+    }
+    name_len = strlen(name);
+    while (getline(&line, &n, fp) != -1) {
+        long long dummy;
+        long long rx_bytes;
+        long long rx_packets;
+        long long rx_errs;
+        long long rx_dropped;
+        long long tx_bytes;
+        long long tx_packets;
+        long long tx_errs;
+        long long tx_dropped;
+        char *trim_line;
+        trim_line = g_strchug(line);
+        if (trim_line[0] == '\0') {
+            continue;
+        }
+        colon = strchr(trim_line, ':');
+        if (!colon) {
+            continue;
+        }
+        if (colon - name_len  == trim_line &&
+           strncmp(trim_line, name, name_len) == 0) {
+            if (sscanf(colon + 1,
+                "%lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld",
+                  &rx_bytes, &rx_packets, &rx_errs, &rx_dropped,
+                  &dummy, &dummy, &dummy, &dummy,
+                  &tx_bytes, &tx_packets, &tx_errs, &tx_dropped,
+                  &dummy, &dummy, &dummy, &dummy) != 16) {
+                continue;
+            }
+            stats->rx_bytes = rx_bytes;
+            stats->rx_packets = rx_packets;
+            stats->rx_errs = rx_errs;
+            stats->rx_dropped = rx_dropped;
+            stats->tx_bytes = tx_bytes;
+            stats->tx_packets = tx_packets;
+            stats->tx_errs = tx_errs;
+            stats->tx_dropped = tx_dropped;
+            fclose(fp);
+            g_free(line);
+            return 0;
+        }
+    }
+    fclose(fp);
+    g_free(line);
+    g_debug("/proc/net/dev: Interface '%s' not found", name);
+    return -1;
+}
+
+/*
+ * Build information about guest interfaces
+ */
+GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
+{
+    GuestNetworkInterfaceList *head = NULL, **tail = &head;
+    struct ifaddrs *ifap, *ifa;
+
+    if (getifaddrs(&ifap) < 0) {
+        error_setg_errno(errp, errno, "getifaddrs failed");
+        goto error;
+    }
+
+    for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
+        GuestNetworkInterface *info;
+        GuestIpAddressList **address_tail;
+        GuestIpAddress *address_item = NULL;
+        GuestNetworkInterfaceStat *interface_stat = NULL;
+        char addr4[INET_ADDRSTRLEN];
+        char addr6[INET6_ADDRSTRLEN];
+        int sock;
+        struct ifreq ifr;
+        unsigned char *mac_addr;
+        void *p;
+
+        g_debug("Processing %s interface", ifa->ifa_name);
+
+        info = guest_find_interface(head, ifa->ifa_name);
+
+        if (!info) {
+            info = g_malloc0(sizeof(*info));
+            info->name = g_strdup(ifa->ifa_name);
+
+            QAPI_LIST_APPEND(tail, info);
+        }
+
+        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
+            /* we haven't obtained HW address yet */
+            sock = socket(PF_INET, SOCK_STREAM, 0);
+            if (sock == -1) {
+                error_setg_errno(errp, errno, "failed to create socket");
+                goto error;
+            }
+
+            memset(&ifr, 0, sizeof(ifr));
+            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
+            if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
+                error_setg_errno(errp, errno,
+                                 "failed to get MAC address of %s",
+                                 ifa->ifa_name);
+                close(sock);
+                goto error;
+            }
+
+            close(sock);
+            mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
+
+            info->hardware_address =
+                g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
+                                (int) mac_addr[0], (int) mac_addr[1],
+                                (int) mac_addr[2], (int) mac_addr[3],
+                                (int) mac_addr[4], (int) mac_addr[5]);
+
+            info->has_hardware_address = true;
+        }
+
+        if (ifa->ifa_addr &&
+            ifa->ifa_addr->sa_family == AF_INET) {
+            /* interface with IPv4 address */
+            p = &((struct sockaddr_in *)ifa->ifa_addr)->sin_addr;
+            if (!inet_ntop(AF_INET, p, addr4, sizeof(addr4))) {
+                error_setg_errno(errp, errno, "inet_ntop failed");
+                goto error;
+            }
+
+            address_item = g_malloc0(sizeof(*address_item));
+            address_item->ip_address = g_strdup(addr4);
+            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
+
+            if (ifa->ifa_netmask) {
+                /* Count the number of set bits in netmask.
+                 * This is safe as '1' and '0' cannot be shuffled in netmask. */
+                p = &((struct sockaddr_in *)ifa->ifa_netmask)->sin_addr;
+                address_item->prefix = ctpop32(((uint32_t *) p)[0]);
+            }
+        } else if (ifa->ifa_addr &&
+                   ifa->ifa_addr->sa_family == AF_INET6) {
+            /* interface with IPv6 address */
+            p = &((struct sockaddr_in6 *)ifa->ifa_addr)->sin6_addr;
+            if (!inet_ntop(AF_INET6, p, addr6, sizeof(addr6))) {
+                error_setg_errno(errp, errno, "inet_ntop failed");
+                goto error;
+            }
+
+            address_item = g_malloc0(sizeof(*address_item));
+            address_item->ip_address = g_strdup(addr6);
+            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
+
+            if (ifa->ifa_netmask) {
+                /* Count the number of set bits in netmask.
+                 * This is safe as '1' and '0' cannot be shuffled in netmask. */
+                p = &((struct sockaddr_in6 *)ifa->ifa_netmask)->sin6_addr;
+                address_item->prefix =
+                    ctpop32(((uint32_t *) p)[0]) +
+                    ctpop32(((uint32_t *) p)[1]) +
+                    ctpop32(((uint32_t *) p)[2]) +
+                    ctpop32(((uint32_t *) p)[3]);
+            }
+        }
+
+        if (!address_item) {
+            continue;
+        }
+
+        address_tail = &info->ip_addresses;
+        while (*address_tail) {
+            address_tail = &(*address_tail)->next;
+        }
+        QAPI_LIST_APPEND(address_tail, address_item);
+
+        info->has_ip_addresses = true;
+
+        if (!info->has_statistics) {
+            interface_stat = g_malloc0(sizeof(*interface_stat));
+            if (guest_get_network_stats(info->name, interface_stat) == -1) {
+                info->has_statistics = false;
+                g_free(interface_stat);
+            } else {
+                info->statistics = interface_stat;
+                info->has_statistics = true;
+            }
+        }
+    }
+
+    freeifaddrs(ifap);
+    return head;
+
+error:
+    freeifaddrs(ifap);
+    qapi_free_GuestNetworkInterfaceList(head);
+    return NULL;
+}
+
+#else
+
+GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+#endif /* HAVE_GETIFADDRS */
+
 #if !defined(CONFIG_FSFREEZE)
 
 GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
 {
     error_setg(errp, QERR_UNSUPPORTED);
     return NULL;
 }
 
 GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
 {
@@ -3017,33 +3029,37 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 }
 #endif
 
 /* add unsupported commands to the blacklist */
 GList *ga_command_blacklist_init(GList *blacklist)
 {
 #if !defined(__linux__)
     {
         const char *list[] = {
             "guest-suspend-disk", "guest-suspend-ram",
-            "guest-suspend-hybrid", "guest-network-get-interfaces",
-            "guest-get-vcpus", "guest-set-vcpus",
+            "guest-suspend-hybrid", "guest-get-vcpus", "guest-set-vcpus",
             "guest-get-memory-blocks", "guest-set-memory-blocks",
             "guest-get-memory-block-size", "guest-get-memory-block-info",
             NULL};
         char **p = (char **)list;
 
         while (*p) {
             blacklist = g_list_append(blacklist, g_strdup(*p++));
         }
     }
 #endif
 
+#if !defined(HAVE_GETIFADDRS)
+    blacklist = g_list_append(blacklist,
+                              g_strdup("guest-network-get-interfaces"));
+#endif
+
 #if !defined(CONFIG_FSFREEZE)
     {
         const char *list[] = {
             "guest-get-fsinfo", "guest-fsfreeze-status",
             "guest-fsfreeze-freeze", "guest-fsfreeze-freeze-list",
             "guest-fsfreeze-thaw", "guest-get-fsinfo",
             "guest-get-disks", NULL};
         char **p = (char **)list;
 
         while (*p) {
-- 
2.11.0


