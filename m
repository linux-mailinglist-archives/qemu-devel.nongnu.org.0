Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A278519DAB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:10:11 +0200 (CEST)
Received: from localhost ([::1]:57096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCtW-0000nV-1m
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBox-00008Y-J5
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBov-0006Bu-GA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651658480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/oYHCi98DqoX1i4GOw9C0kndEV6O3aVPdwJYp5PtqAc=;
 b=VnRzghxQyX9RpBkAQs6mKMLEjoMgDMcQKzOaADnYf5ZZP1VKde8xRjMvJocabshzMiXzx1
 fWkv+TXXrD8IunW0+rqi/7WE8gjU3Hy5l8YKQ113XnBNFyyWYMimRZdTo7ym2dtsRehFtd
 BRUa9CS7r7NyUwdLLvM0XLMng/LklBs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-zQK_vU9CN1abkbNW-g93cw-1; Wed, 04 May 2022 06:01:15 -0400
X-MC-Unique: zQK_vU9CN1abkbNW-g93cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 725C8800B21;
 Wed,  4 May 2022 10:01:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66939155CAD1;
 Wed,  4 May 2022 10:01:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Deason <adeason@sinenomine.net>
Subject: [PULL 2/7] qga/commands-posix: Fix iface hw address detection
Date: Wed,  4 May 2022 14:00:56 +0400
Message-Id: <20220504100101.564747-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220504100101.564747-1-marcandre.lureau@redhat.com>
References: <20220504100101.564747-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Deason <adeason@sinenomine.net>

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
Message-Id: <20220426195526.7699-3-adeason@sinenomine.net>
---
 qga/commands-posix.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 8fc56f7d71ac..febb2ef0ffd6 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2861,7 +2861,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
             QAPI_LIST_APPEND(tail, info);
         }
 
-        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {
+        if (!info->has_hardware_address) {
             /* we haven't obtained HW address yet */
             sock = socket(PF_INET, SOCK_STREAM, 0);
             if (sock == -1) {
@@ -2872,23 +2872,32 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
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
-- 
2.36.0.44.g0f828332d5ac


