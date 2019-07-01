Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6101835056
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 21:38:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYFGZ-0006YE-I0
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 15:38:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYFEY-0005fo-OO
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYFEW-0002Oh-RO
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:36:34 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35955 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hYFEV-0002GK-4h
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:36:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 002871A2141;
	Tue,  4 Jun 2019 21:36:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id B777C1A2029;
	Tue,  4 Jun 2019 21:36:28 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 21:35:50 +0200
Message-Id: <1559676952-17927-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559676952-17927-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559676952-17927-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v9 1/3] linux-user: Add support for
 setsockopt() options IPV6_<ADD|DROP>_MEMBERSHIP
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, lvivier@redhat.com, Neng Chen <nchen@wavecomp.com>,
	ysu@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Neng Chen <nchen@wavecomp.com>

Add support for options IPV6_ADD_MEMBERSHIP and IPV6_DROP_MEMPEMBERSHIP
of the syscall setsockopt(). These options control membership in
multicast groups. Their argument is a pointer to a struct ipv6_mreq,
which is in turn defined in IP v6 header netinet/in.h as:

 struct ipv6_mreq {
     /* IPv6 multicast address of group */
     struct  in6_addr  ipv6mr_multiaddr;
     /* local IPv6 address of interface */
     int     ipv6mr_interface;
 };

...whereas its definition in kernel's include/uapi/linux/in6.h is:

 #if __UAPI_DEF_IPV6_MREQ
 struct ipv6_mreq {
     /* IPv6 multicast address of group */
         struct  in6_addr ipv6mr_multiaddr;
     /* local IPv6 address of interface */
     int     ipv6mr_ifindex;
 };
 #endif

The first field of ipv6_mreq has the same name ("ipv6mr_multiaddr")
and type ("in6_addr") in both cases. Moreover, the in6_addr structure
consists of fields that are always big-endian (on host of any endian),
therefore the ipv6_mreq's field ipv6mr_multiaddr doesn't need any
endian conversion.

The second field of ipv6_mreq may, however, depending on the build
environment, have different names. This is the reason why the lines
"#if __UAPI_DEF_IPV6_MREQ" and "#if defined(__UAPI_DEF_IPV6_MREQ)"
are used in this patch - to establish the right choice for the field
name. Also, endian conversion is needed for this field, since it is
of type "int".

Signed-off-by: Neng Chen <nchen@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/syscall.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5e29e67..dde6889 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1921,6 +1921,33 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
                                        &pki, sizeof(pki)));
             break;
         }
+        case IPV6_ADD_MEMBERSHIP:
+        case IPV6_DROP_MEMBERSHIP:
+        {
+            struct ipv6_mreq ipv6mreq;
+
+            if (optlen < sizeof(ipv6mreq)) {
+                return -TARGET_EINVAL;
+            }
+
+            if (copy_from_user(&ipv6mreq, optval_addr, sizeof(ipv6mreq))) {
+                return -TARGET_EFAULT;
+            }
+
+#if defined(__UAPI_DEF_IPV6_MREQ)
+#if __UAPI_DEF_IPV6_MREQ
+            ipv6mreq.ipv6mr_ifindex = tswap32(ipv6mreq.ipv6mr_ifindex);
+#else
+            ipv6mreq.ipv6mr_interface = tswap32(ipv6mreq.ipv6mr_interface);
+#endif /* __UAPI_DEF_IVP6_MREQ */
+#else
+            ipv6mreq.ipv6mr_interface = tswap32(ipv6mreq.ipv6mr_interface);
+#endif /* defined (__UAPI_DEF_IPV6_MREQ) */
+
+            ret = get_errno(setsockopt(sockfd, level, optname,
+                                       &ipv6mreq, sizeof(ipv6mreq)));
+            break;
+        }
         default:
             goto unimplemented;
         }
-- 
2.7.4


