Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A32FEA8F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:47:48 +0100 (CET)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZNL-0002BA-Sl
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEu-0006jc-UY
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:05 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:38657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2ZEq-0007PA-1y
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:39:04 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MiJhW-1lhvs726li-00fS8g; Thu, 21 Jan 2021 13:38:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] linux-user: Add IPv6 options to do_print_sockopt()
Date: Thu, 21 Jan 2021 13:38:51 +0100
Message-Id: <20210121123852.91187-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121123852.91187-1-laurent@vivier.eu>
References: <20210121123852.91187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JD7SgQgJyw8pIIelnmQIf+QImVqKmplofngE3GnwPZ48vKXGw78
 hSwWxAzGRWUJ9OO1s1h916gpmRr1muvwrqWcdyFdIta6sjqfzuu94R3kSPcfAwDOCw2j8QX
 j0zR9zkfizXh+e0i6UF14nvtNczUKvw9i7/2v4tMxdGWb1PK0tcZt/JMm8nFvJmnJVyJ8Pr
 nH4CjS5Ir3FoT3AvshzBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6BmlkWRVFp0=:XfDOCeq+30kNEd9SMXzB5b
 gL7FH8A1EVxxS2hmDJDAQoIw5Nuhibq0itDq5ILCGJCpbdMU5rb0pwxkgPCsFZ4/NJo/V61Px
 Q4hgcl5eZ40YWIlXFywJab4fMMpi0+VNg9a45uZvU3vCwdY0atY5qclV/3A5/YQQQghfwDGYW
 KBNwJq/zhmepgANrHixjyVLaMkH/jIn7Si3Ok/IC0ICoLUZcjC+5Tj8OTKhDX2IPo2RgJ+v3V
 5v5LclEv2SmX9tlYmeVN/FVORtic2u92EmSO/DqpEy7eGWk0XvYQAs/zxTh6Irnk88ctcAwbW
 G7TCAJ8Tpm9P8sVc1TBMsWVcv140M1Oi1D8mfPQLn8ycOz61j8YqIC7ndBwc/gDL81SohaYWL
 +76OnhdUs1AxyznLFabkHW8Bx096y9JLor2uI5nrCLSyPCa4W4ERkSBws2rOu
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201218193213.3566856-5-scw@google.com>
[lv: Add missing <linux/in6.h> include for IPV6_ADDR_PREFERENCES]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 109 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 64172de99d98..e969121b6cd7 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -6,9 +6,11 @@
 #include <sys/select.h>
 #include <sys/mount.h>
 #include <arpa/inet.h>
+#include <netinet/in.h>
 #include <netinet/tcp.h>
 #include <netinet/udp.h>
 #include <linux/if_packet.h>
+#include <linux/in6.h>
 #include <linux/netlink.h>
 #include <sched.h>
 #include "qemu.h"
@@ -2761,6 +2763,113 @@ print_optint:
             break;
         }
         break;
+    case SOL_IPV6:
+        qemu_log("SOL_IPV6,");
+        switch (optname) {
+        case IPV6_MTU_DISCOVER:
+            qemu_log("IPV6_MTU_DISCOVER,");
+            goto print_optint;
+        case IPV6_MTU:
+            qemu_log("IPV6_MTU,");
+            goto print_optint;
+        case IPV6_V6ONLY:
+            qemu_log("IPV6_V6ONLY,");
+            goto print_optint;
+        case IPV6_RECVPKTINFO:
+            qemu_log("IPV6_RECVPKTINFO,");
+            goto print_optint;
+        case IPV6_UNICAST_HOPS:
+            qemu_log("IPV6_UNICAST_HOPS,");
+            goto print_optint;
+        case IPV6_MULTICAST_HOPS:
+            qemu_log("IPV6_MULTICAST_HOPS,");
+            goto print_optint;
+        case IPV6_MULTICAST_LOOP:
+            qemu_log("IPV6_MULTICAST_LOOP,");
+            goto print_optint;
+        case IPV6_RECVERR:
+            qemu_log("IPV6_RECVERR,");
+            goto print_optint;
+        case IPV6_RECVHOPLIMIT:
+            qemu_log("IPV6_RECVHOPLIMIT,");
+            goto print_optint;
+        case IPV6_2292HOPLIMIT:
+            qemu_log("IPV6_2292HOPLIMIT,");
+            goto print_optint;
+        case IPV6_CHECKSUM:
+            qemu_log("IPV6_CHECKSUM,");
+            goto print_optint;
+        case IPV6_ADDRFORM:
+            qemu_log("IPV6_ADDRFORM,");
+            goto print_optint;
+        case IPV6_2292PKTINFO:
+            qemu_log("IPV6_2292PKTINFO,");
+            goto print_optint;
+        case IPV6_RECVTCLASS:
+            qemu_log("IPV6_RECVTCLASS,");
+            goto print_optint;
+        case IPV6_RECVRTHDR:
+            qemu_log("IPV6_RECVRTHDR,");
+            goto print_optint;
+        case IPV6_2292RTHDR:
+            qemu_log("IPV6_2292RTHDR,");
+            goto print_optint;
+        case IPV6_RECVHOPOPTS:
+            qemu_log("IPV6_RECVHOPOPTS,");
+            goto print_optint;
+        case IPV6_2292HOPOPTS:
+            qemu_log("IPV6_2292HOPOPTS,");
+            goto print_optint;
+        case IPV6_RECVDSTOPTS:
+            qemu_log("IPV6_RECVDSTOPTS,");
+            goto print_optint;
+        case IPV6_2292DSTOPTS:
+            qemu_log("IPV6_2292DSTOPTS,");
+            goto print_optint;
+        case IPV6_TCLASS:
+            qemu_log("IPV6_TCLASS,");
+            goto print_optint;
+        case IPV6_ADDR_PREFERENCES:
+            qemu_log("IPV6_ADDR_PREFERENCES,");
+            goto print_optint;
+#ifdef IPV6_RECVPATHMTU
+        case IPV6_RECVPATHMTU:
+            qemu_log("IPV6_RECVPATHMTU,");
+            goto print_optint;
+#endif
+#ifdef IPV6_TRANSPARENT
+        case IPV6_TRANSPARENT:
+            qemu_log("IPV6_TRANSPARENT,");
+            goto print_optint;
+#endif
+#ifdef IPV6_FREEBIND
+        case IPV6_FREEBIND:
+            qemu_log("IPV6_FREEBIND,");
+            goto print_optint;
+#endif
+#ifdef IPV6_RECVORIGDSTADDR
+        case IPV6_RECVORIGDSTADDR:
+            qemu_log("IPV6_RECVORIGDSTADDR,");
+            goto print_optint;
+#endif
+        case IPV6_PKTINFO:
+            qemu_log("IPV6_PKTINFO,");
+            print_pointer(optval, 0);
+            break;
+        case IPV6_ADD_MEMBERSHIP:
+            qemu_log("IPV6_ADD_MEMBERSHIP,");
+            print_pointer(optval, 0);
+            break;
+        case IPV6_DROP_MEMBERSHIP:
+            qemu_log("IPV6_DROP_MEMBERSHIP,");
+            print_pointer(optval, 0);
+            break;
+        default:
+            print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
+            print_pointer(optval, 0);
+            break;
+        }
+        break;
     default:
         print_raw_param(TARGET_ABI_FMT_ld, level, 0);
         print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
-- 
2.29.2


