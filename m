Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCCA310F81
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:09:46 +0100 (CET)
Received: from localhost ([::1]:41120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85Y9-0007Gc-Gp
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l84jB-000090-G5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:17:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l84j8-0002qw-At
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bs9xW0n/RJktpGPaSJ5YlIrWl+4Rrz5pL183302BLYk=;
 b=TOghsxQem3jEjXAV3sGEM72/nOveOMIKshR0AkhGazHk0YPW4mYf08NzrwL+Jk6cbg8Pyi
 xIdF9pBkGYI4rJpvQBL8nuL99T784NHD02YOMh3DXmMWBmajW1Y256TAEZb7v7rEzElzGB
 RiMf0pVfZ15NWOqnEkf1C2pRFt5zY10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-ZAS2o4_NNOSYzQ4YL1sRSQ-1; Fri, 05 Feb 2021 12:16:56 -0500
X-MC-Unique: ZAS2o4_NNOSYzQ4YL1sRSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83F5E107ACE8;
 Fri,  5 Feb 2021 17:16:41 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-253.phx2.redhat.com [10.3.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCD719CA8;
 Fri,  5 Feb 2021 17:16:41 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] qga: Utilize QAPI_LIST_APPEND in
 qmp_guest_network_get_interfaces
Date: Fri,  5 Feb 2021 11:16:34 -0600
Message-Id: <20210205171634.1491258-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found another spot that can benefit from using our macros instead of
open-coding qapi list creation.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Marked v5 because it missed commit 95b3a8c8a82, which was v4:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06574.html

 qga/commands-posix.c | 75 ++++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 45 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 8dd94a33144b..3f18df1bb6d1 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2153,17 +2153,17 @@ void qmp_guest_suspend_hybrid(Error **errp)
     guest_suspend(SUSPEND_MODE_HYBRID, errp);
 }

-static GuestNetworkInterfaceList *
+static GuestNetworkInterface *
 guest_find_interface(GuestNetworkInterfaceList *head,
                      const char *name)
 {
     for (; head; head = head->next) {
         if (strcmp(head->value->name, name) == 0) {
-            break;
+            return head->value;
         }
     }

-    return head;
+    return NULL;
 }

 static int guest_get_network_stats(const char *name,
@@ -2232,7 +2232,7 @@ static int guest_get_network_stats(const char *name,
  */
 GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
 {
-    GuestNetworkInterfaceList *head = NULL, *cur_item = NULL;
+    GuestNetworkInterfaceList *head = NULL, **tail = &head;
     struct ifaddrs *ifap, *ifa;

     if (getifaddrs(&ifap) < 0) {
@@ -2241,9 +2241,10 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
     }

     for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
-        GuestNetworkInterfaceList *info;
-        GuestIpAddressList **address_list = NULL, *address_item = NULL;
-        GuestNetworkInterfaceStat  *interface_stat = NULL;
+        GuestNetworkInterface *info;
+        GuestIpAddressList **address_tail;
+        GuestIpAddress *address_item = NULL;
+        GuestNetworkInterfaceStat *interface_stat = NULL;
         char addr4[INET_ADDRSTRLEN];
         char addr6[INET6_ADDRSTRLEN];
         int sock;
@@ -2257,19 +2258,12 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)

         if (!info) {
             info = g_malloc0(sizeof(*info));
-            info->value = g_malloc0(sizeof(*info->value));
-            info->value->name = g_strdup(ifa->ifa_name);
+            info->name = g_strdup(ifa->ifa_name);

-            if (!cur_item) {
-                head = cur_item = info;
-            } else {
-                cur_item->next = info;
-                cur_item = info;
-            }
+            QAPI_LIST_APPEND(tail, info);
         }

-        if (!info->value->has_hardware_address &&
-            ifa->ifa_flags & SIOCGIFHWADDR) {
+        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
             /* we haven't obtained HW address yet */
             sock = socket(PF_INET, SOCK_STREAM, 0);
             if (sock == -1) {
@@ -2278,7 +2272,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             }

             memset(&ifr, 0, sizeof(ifr));
-            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->value->name);
+            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
             if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
                 error_setg_errno(errp, errno,
                                  "failed to get MAC address of %s",
@@ -2290,13 +2284,13 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             close(sock);
             mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;

-            info->value->hardware_address =
+            info->hardware_address =
                 g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
                                 (int) mac_addr[0], (int) mac_addr[1],
                                 (int) mac_addr[2], (int) mac_addr[3],
                                 (int) mac_addr[4], (int) mac_addr[5]);

-            info->value->has_hardware_address = true;
+            info->has_hardware_address = true;
         }

         if (ifa->ifa_addr &&
@@ -2309,15 +2303,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             }

             address_item = g_malloc0(sizeof(*address_item));
-            address_item->value = g_malloc0(sizeof(*address_item->value));
-            address_item->value->ip_address = g_strdup(addr4);
-            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
+            address_item->ip_address = g_strdup(addr4);
+            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;

             if (ifa->ifa_netmask) {
                 /* Count the number of set bits in netmask.
                  * This is safe as '1' and '0' cannot be shuffled in netmask. */
                 p = &((struct sockaddr_in *)ifa->ifa_netmask)->sin_addr;
-                address_item->value->prefix = ctpop32(((uint32_t *) p)[0]);
+                address_item->prefix = ctpop32(((uint32_t *) p)[0]);
             }
         } else if (ifa->ifa_addr &&
                    ifa->ifa_addr->sa_family == AF_INET6) {
@@ -2329,15 +2322,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             }

             address_item = g_malloc0(sizeof(*address_item));
-            address_item->value = g_malloc0(sizeof(*address_item->value));
-            address_item->value->ip_address = g_strdup(addr6);
-            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
+            address_item->ip_address = g_strdup(addr6);
+            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;

             if (ifa->ifa_netmask) {
                 /* Count the number of set bits in netmask.
                  * This is safe as '1' and '0' cannot be shuffled in netmask. */
                 p = &((struct sockaddr_in6 *)ifa->ifa_netmask)->sin6_addr;
-                address_item->value->prefix =
+                address_item->prefix =
                     ctpop32(((uint32_t *) p)[0]) +
                     ctpop32(((uint32_t *) p)[1]) +
                     ctpop32(((uint32_t *) p)[2]) +
@@ -2349,29 +2341,22 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             continue;
         }

-        address_list = &info->value->ip_addresses;
-
-        while (*address_list && (*address_list)->next) {
-            address_list = &(*address_list)->next;
-        }
-
-        if (!*address_list) {
-            *address_list = address_item;
-        } else {
-            (*address_list)->next = address_item;
+        address_tail = &info->ip_addresses;
+        while (*address_tail) {
+            address_tail = &(*address_tail)->next;
         }
+        QAPI_LIST_APPEND(address_tail, address_item);

-        info->value->has_ip_addresses = true;
+        info->has_ip_addresses = true;

-        if (!info->value->has_statistics) {
+        if (!info->has_statistics) {
             interface_stat = g_malloc0(sizeof(*interface_stat));
-            if (guest_get_network_stats(info->value->name,
-                interface_stat) == -1) {
-                info->value->has_statistics = false;
+            if (guest_get_network_stats(info->name, interface_stat) == -1) {
+                info->has_statistics = false;
                 g_free(interface_stat);
             } else {
-                info->value->statistics = interface_stat;
-                info->value->has_statistics = true;
+                info->statistics = interface_stat;
+                info->has_statistics = true;
             }
         }
     }
-- 
2.30.0


