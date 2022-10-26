Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A86D60E6E0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:58:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkd2-000064-Ly; Wed, 26 Oct 2022 13:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcz-00005k-6F
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcu-0005fW-CX
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NbN/bsOBAfri9fgQ6JE01uG9HT7lgfPFRus+BIxDMU=;
 b=CensaxdodppNo1gZkE0ZLLgbfIWiq9l6d1lG9O5kC3wavHtDfEljMr4WsSLRgNAx3/QcfH
 BfEpFUzGGResk5I29aWKXghikLvaZ5MN/9NR3fEQRWAFCZHftinnWFSfkGGxWiPbn33y6c
 9v02PUEP+5VWngZk6FCTdgXYq/W58uQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-naHFagsfMqOVN3AvRiJxyA-1; Wed, 26 Oct 2022 13:55:36 -0400
X-MC-Unique: naHFagsfMqOVN3AvRiJxyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D6DE857D15;
 Wed, 26 Oct 2022 17:55:36 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 152D62166B2B;
 Wed, 26 Oct 2022 17:55:34 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 6/8] qga: Move HW address getting to a separate function
Date: Wed, 26 Oct 2022 20:55:16 +0300
Message-Id: <20221026175518.2636846-7-kkostiuk@redhat.com>
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

In the next patch FreeBSD support for guest-network-get-interfaces will be
added. Previously move Linux-specific code of HW address getting to a
separate functions and add a dumb function to commands-bsd.c.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-bsd.c    | 16 +++++++
 qga/commands-common.h |  6 +++
 qga/commands-posix.c  | 98 ++++++++++++++++++++++++-------------------
 3 files changed, 78 insertions(+), 42 deletions(-)

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
index ca06692179..ebf0fb8b0f 100644
--- a/qga/commands-bsd.c
+++ b/qga/commands-bsd.c
@@ -167,3 +167,19 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
     return NULL;
 }
 #endif /* CONFIG_FSFREEZE */
+
+#ifdef HAVE_GETIFADDRS
+/*
+ * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
+ * buffer with ETHER_ADDR_LEN length at least.
+ *
+ * Returns false in case of an error, otherwise true. "obtained" arguument
+ * is true if a MAC address was obtained successful, otherwise false.
+ */
+bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                       bool *obtained, Error **errp)
+{
+    *obtained = false;
+    return true;
+}
+#endif /* HAVE_GETIFADDRS */
diff --git a/qga/commands-common.h b/qga/commands-common.h
index d0583c6ddb..8c1c56aac9 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -56,6 +56,12 @@ int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
 int qmp_guest_fsfreeze_do_thaw(Error **errp);
 #endif /* CONFIG_FSFREEZE */
 
+#ifdef HAVE_GETIFADDRS
+#include <ifaddrs.h>
+bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                       bool *obtained, Error **errp);
+#endif
+
 typedef struct GuestFileHandle GuestFileHandle;
 
 GuestFileHandle *guest_file_handle_find(int64_t id, Error **errp);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index e0ee0bea00..32493d6383 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -41,20 +41,12 @@
 #endif
 #endif
 
-#ifdef __FreeBSD__
-/*
- * The code under HAVE_GETIFADDRS condition can't be compiled in FreeBSD.
- * Fix it in one of the following patches.
- */
-#undef HAVE_GETIFADDRS
-#endif
-
 #ifdef HAVE_GETIFADDRS
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <net/if.h>
+#include <net/ethernet.h>
 #include <sys/types.h>
-#include <ifaddrs.h>
 #ifdef CONFIG_SOLARIS
 #include <sys/sockio.h>
 #endif
@@ -2889,6 +2881,57 @@ static int guest_get_network_stats(const char *name,
     return -1;
 }
 
+#ifndef __FreeBSD__
+/*
+ * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
+ * buffer with ETHER_ADDR_LEN length at least.
+ *
+ * Returns false in case of an error, otherwise true. "obtained" argument
+ * is true if a MAC address was obtained successful, otherwise false.
+ */
+bool guest_get_hw_addr(struct ifaddrs *ifa, unsigned char *buf,
+                       bool *obtained, Error **errp)
+{
+    struct ifreq ifr;
+    int sock;
+
+    *obtained = false;
+
+    /* we haven't obtained HW address yet */
+    sock = socket(PF_INET, SOCK_STREAM, 0);
+    if (sock == -1) {
+        error_setg_errno(errp, errno, "failed to create socket");
+        return false;
+    }
+
+    memset(&ifr, 0, sizeof(ifr));
+    pstrcpy(ifr.ifr_name, IF_NAMESIZE, ifa->ifa_name);
+    if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
+        /*
+         * We can't get the hw addr of this interface, but that's not a
+         * fatal error.
+         */
+        if (errno == EADDRNOTAVAIL) {
+            /* The interface doesn't have a hw addr (e.g. loopback). */
+            g_debug("failed to get MAC address of %s: %s",
+                    ifa->ifa_name, strerror(errno));
+        } else{
+            g_warning("failed to get MAC address of %s: %s",
+                      ifa->ifa_name, strerror(errno));
+        }
+    } else {
+#ifdef CONFIG_SOLARIS
+        memcpy(buf, &ifr.ifr_addr.sa_data, ETHER_ADDR_LEN);
+#else
+        memcpy(buf, &ifr.ifr_hwaddr.sa_data, ETHER_ADDR_LEN);
+#endif
+        *obtained = true;
+    }
+    close(sock);
+    return true;
+}
+#endif /* __FreeBSD__ */
+
 /*
  * Build information about guest interfaces
  */
@@ -2909,9 +2952,8 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         GuestNetworkInterfaceStat *interface_stat = NULL;
         char addr4[INET_ADDRSTRLEN];
         char addr6[INET6_ADDRSTRLEN];
-        int sock;
-        struct ifreq ifr;
-        unsigned char *mac_addr;
+        unsigned char mac_addr[ETHER_ADDR_LEN];
+        bool obtained;
         void *p;
 
         g_debug("Processing %s interface", ifa->ifa_name);
@@ -2926,45 +2968,17 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
         }
 
         if (!info->has_hardware_address) {
-            /* we haven't obtained HW address yet */
-            sock = socket(PF_INET, SOCK_STREAM, 0);
-            if (sock == -1) {
-                error_setg_errno(errp, errno, "failed to create socket");
+            if (!guest_get_hw_addr(ifa, mac_addr, &obtained, errp)) {
                 goto error;
             }
-
-            memset(&ifr, 0, sizeof(ifr));
-            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
-            if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
-                /*
-                 * We can't get the hw addr of this interface, but that's not a
-                 * fatal error. Don't set info->hardware_address, but keep
-                 * going.
-                 */
-                if (errno == EADDRNOTAVAIL) {
-                    /* The interface doesn't have a hw addr (e.g. loopback). */
-                    g_debug("failed to get MAC address of %s: %s",
-                            ifa->ifa_name, strerror(errno));
-                } else{
-                    g_warning("failed to get MAC address of %s: %s",
-                              ifa->ifa_name, strerror(errno));
-                }
-
-            } else {
-#ifdef CONFIG_SOLARIS
-                mac_addr = (unsigned char *) &ifr.ifr_addr.sa_data;
-#else
-                mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
-#endif
+            if (obtained) {
                 info->hardware_address =
                     g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                     (int) mac_addr[0], (int) mac_addr[1],
                                     (int) mac_addr[2], (int) mac_addr[3],
                                     (int) mac_addr[4], (int) mac_addr[5]);
-
                 info->has_hardware_address = true;
             }
-            close(sock);
         }
 
         if (ifa->ifa_addr &&
-- 
2.25.1


