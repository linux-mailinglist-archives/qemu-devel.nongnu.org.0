Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D12FBEF6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:29:54 +0100 (CET)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vlJ-0006Rm-SP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vDE-00029a-2F
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:40 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:39415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l1vD9-00041S-Eu
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:54:39 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOzCW-1lP3h614Q8-00PLlG; Tue, 19 Jan 2021 18:54:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] linux-user: Add IPv6 options to do_print_sockopt()
Date: Tue, 19 Jan 2021 18:54:26 +0100
Message-Id: <20210119175427.2050737-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119175427.2050737-1-laurent@vivier.eu>
References: <20210119175427.2050737-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WaskIXOXU+oClRSROHwIUuAN1iBErHakOLCtvU8gLRuYejxPpC6
 0TKEMY8V7w8MsvxTdL0X3Lovzr/mlrWaSfMyy1hBUnIQkMpXJf0r8D8NBAmGtRcuxG50fnP
 nUSidKrqFgRO6+F8rbn20AYsiT6MGnPRg2nFnSZvyFOrJ7dLR1yjVKTdWuz8UDfeMnf0npX
 bCEAW/RDq5gcV9VztsvWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:smVlYxbLOQQ=:UT5oQA5UbvcAzC5AIv/kwx
 /jBHQ0OjM8zbCo6G4ptmdoCMSguuhdypx4bTKeZtw28Xgz7rjiDoePbZRytfa8PhHRwQNAeyK
 s/gHCopAX8l7WTwqKpVi0oeW4bWt6hm8u9unmfX95mt6Qu92XwIZerMe6E5Y/HVtiARxamC72
 56c+pOe61jG5f2+qCM9Xs/rO8MFXbtyToXng67GJgViW0jViRaSS8zEQr8MuBxHRuX1C9Omw0
 Rj2uWti+n0ntKxhTqITZ8JNqBNqPpylGr+GyGGBhjmnYs57ISG/gTbZi/xIk7llwoLTI/35gc
 u4AKsjHyCqF6s0pAFBRI4B0/m2hL7tJrepzi37Vd+JdQXGL6I98zuPevW/LyEuwLyfuhqufa2
 OnavcZsXPygmFHgRoAqAlG8g6Fr401Wks82LPU1NrReLTydy/GPj3AgU/Hewh
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


