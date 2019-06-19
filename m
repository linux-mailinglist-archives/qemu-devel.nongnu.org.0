Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28024BAF1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 16:14:45 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdbML-0000hW-6B
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 10:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53057)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbJi-0007Nr-4i
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:12:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbJg-00049i-0I
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:12:01 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:58080 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdbJf-0003Tf-Pc
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:11:59 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 1EC9E1A1FC9;
 Wed, 19 Jun 2019 16:10:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 015521A1E7D;
 Wed, 19 Jun 2019 16:10:56 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 16:10:25 +0200
Message-Id: <1560953429-29203-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560953429-29203-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1560953429-29203-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v11 1/5] linux-user: Add support for
 setsockopt() options IPV6_<ADD|DROP>_MEMBERSHIP
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
Cc: lvivier@redhat.com, Neng Chen <nchen@wavecomp.com>, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Neng Chen <nchen@wavecomp.com>

Add support for the option IPV6_<ADD|DROP>_MEMBERSHIP of the syscall
setsockopt(). This option controls membership in multicast groups.
Argument is a pointer to a struct ipv6_mreq.

The glibc <netinet/in.h> header defines the ipv6_mreq structure,
which includes the following members:

  struct in6_addr  ipv6mr_multiaddr;
  unsigned int     ipv6mr_interface;

Whereas the kernel in its <linux/in6.h> header defines following
members of the same structure:

  struct in6_addr  ipv6mr_multiaddr;
  int              ipv6mr_ifindex;

POSIX defines ipv6mr_interface [1].

__UAPI_DEF_IVP6_MREQ appears in kernel headers with v3.12:

  cfd280c91253 net: sync some IP headers with glibc

Without __UAPI_DEF_IVP6_MREQ, kernel defines ipv6mr_ifindex, and
this is explained in cfd280c91253:

  "If you include the kernel headers first you get those,
  and if you include the glibc headers first you get those,
  and the following patch arranges a coordination and
  synchronization between the two."

So before 3.12, a program can't include both <netinet/in.h> and
<linux/in6.h>.

In linux-user/syscall.c, we only include <netinet/in.h> (glibc) and
not <linux/in6.h> (kernel headers), so ipv6mr_interface is the one
to use.

[1] http://pubs.opengroup.org/onlinepubs/009695399/basedefs/netinet/in.h.html

Signed-off-by: Neng Chen <nchen@wavecomp.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/syscall.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b187c12..f267ad0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1920,6 +1920,25 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
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


