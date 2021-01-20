Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1252FDA31
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:55:57 +0100 (CET)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ja8-0003kE-Vw
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXm-0001zg-96
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:30 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:52557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l2JXi-00030q-Tp
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:53:30 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N9d91-1m7fpR2PRN-015cTA; Wed, 20 Jan 2021 20:53:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] linux-user: Add IPv6 options to do_print_sockopt()
Date: Wed, 20 Jan 2021 20:53:16 +0100
Message-Id: <20210120195317.84222-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120195317.84222-1-laurent@vivier.eu>
References: <20210120195317.84222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X4PMQ8sJjwlXRPuO9hnBAdQzxVcYXqtE4mlGZcNukSl2eKj88cR
 BQTvA7gJmyGUscvNzQXv73jAZ0D4j6xRQ6sLNmIMENKUASNU3+rdJF2g6jDUn2Tz0jjCTX0
 r0/W8Yt8HAEg5/7y1LRrEZ8lZFzsGsH+XQWqlhtZFotwlGJJqGqfvKe+dqp8hCIdEz0rg4z
 1MXYjwDtjYDHVyvOb44jA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EiiSjPoQpRM=:ic5iIN3/+1ARZGMJ55Q+1l
 sM35l8q4Y/JiwbvwtVaNoHMHZYPIz0ELUtK24HrARQ6W0W3t5TOP0DFgLHJ7h6JRu3eXC/H3C
 +ZJYRa6dh8wODf6wewN41uyucg+gcTqVN7O6EMQW2Gn4s0MvAkOpUdgUZuyA31Z35YTx5F5D2
 hkROSHXTNTFs2upmGUE4fPiscSRsbhSlF2JVxLIM+bRbiGpam6pajzTTz5gl7iPbTJFZAwuon
 CgS0crUpHwleQodlGEIwtQd8+IPGX3FXxYXtff275Tl83zPlWkWSI8F/OXrgOv1AbDFq6LIIV
 xLLPcVfvjaQ4Q723+8eLcaUzA1cb87Ctq+GAq6tQcUoZgCq2zEHePNVC9RWjRFpx3ag6YYljL
 4u/hQd5PUrXn/G6ihwdiluVurOyu4LEz/sEFiYO4HQEXHri25b2utlUDzjU2qvd7sTJfnGF98
 CzEUM3K+Fg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 108 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 64172de99d98..bc3bb6b2f949 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -6,6 +6,7 @@
 #include <sys/select.h>
 #include <sys/mount.h>
 #include <arpa/inet.h>
+#include <netinet/in.h>
 #include <netinet/tcp.h>
 #include <netinet/udp.h>
 #include <linux/if_packet.h>
@@ -2761,6 +2762,113 @@ print_optint:
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


