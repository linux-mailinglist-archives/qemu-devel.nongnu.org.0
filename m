Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0489313363
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 19:54:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMcNn-0002uB-4j
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 13:54:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hMcLZ-0001lJ-VT
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hMcLY-0008Vp-3C
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:51:45 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56287 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hMcLW-0008U8-QV
	for qemu-devel@nongnu.org; Fri, 03 May 2019 13:51:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 58D831A200D;
	Fri,  3 May 2019 19:51:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 2E5121A1F9B;
	Fri,  3 May 2019 19:51:41 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 19:50:45 +0200
Message-Id: <1556905846-14074-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556905846-14074-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1556905846-14074-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v4 4/5] linux-user: Add support for
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
Cc: lvivier@redhat.com, thuth@redhat.com, jcmvbkbc@gmail.com,
	arikalo@wavecomp.com, daniel.santos@pobox.com,
	amarkovic@wavecomp.com, nchen@wavecomp.com, philmd@redhat.com,
	aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Neng Chen <nchen@wavecomp.com>

Add support for options IPV6_ADD_MEMBERSHIP and IPV6_DROP_MEMPEMBERSHIP
of the syscall setsockopt(). These options control membership in
multicast groups. Their argument is a pointer to a struct ipv6_mreq,
which is in turn defined as:

struct ipv6_mreq {
    /* IPv6 multicast address of group */
    struct in6_addr  ipv6mr_multiaddr;
    /* local IPv6 address of interface */
    int              ipv6mr_interface;
};

The in6_addr structure consists of fields that are always big-endian
(on host of any endian), so the ipv6_mreq's field ipv6mr_multiaddr
doesn't need any endian conversion, whereas ipv6mr_interface does.

Signed-off-by: Neng Chen <nchen@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/syscall.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 96cd4bf..b7eb4b7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1892,6 +1892,25 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
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
+            ipv6mreq.ipv6mr_interface = tswap32(ipv6mreq.ipv6mr_interface);
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


