Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433C3511C9C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:29:18 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlTZ-0002Sz-D6
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMb-00065H-IF
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:05 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMX-00018h-DF
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:05 -0400
Received: by mail-pl1-x635.google.com with SMTP id j8so2117653pll.11
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UEAt5r2NAylANXbyNoj2AepYXakGhqXh7lCYj/tgGDo=;
 b=Siu7VBAisob+LF8PlqL+X7IUMMu4uePdmeskZOL77OE2S10EWdZzsfz20hrCi7530Z
 Hxx7YDyt3yWsgYX4Oh+XMXvTq8vGGAvTQsUY/HLv9QSbdDFFSXH79S4wUhdACB+tkVA2
 YpW4kxTAwtx+deokgmi8r3zUCPZoDfgf2NVr8vebvzUX6w0ZGdecSx0uPsQbFNhypA4G
 Hie9VKNdZAM9hH3KmLviqlsndj2IoFpfPMD2+b5qLulpwkgA/DiGoXsTz8QlCncMraIl
 4TWWZxSD4XsNezWaI7N2Z3dszpt6Xvne4cTkj4ecwEmDHUTkzAuwsIr+dn8c1c6RS1Rv
 hFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UEAt5r2NAylANXbyNoj2AepYXakGhqXh7lCYj/tgGDo=;
 b=d71bULUN47w4I0Vvtv9C6PZJot0r/R5VHqMPoDArfcr/qwzruIS5EtfFeEHvpRy/MH
 sYljRdLWvI+PWgUhIzfIO0TovaqZy5GWOSNyaOlQoiZPKTIEAf72ZYb6Q19fy8J7cjQ/
 f4Z97rdvT/FIxrk0R81LBk0KA01kO8dmMI3c7O3I25stU3QDl8QOkCXvKIjCgzlv0fP5
 7mF01ItVz9Ek3nPXh9uyfSKQWJuRV6SNk+yGmRsOnFLf4QjzM3XDH7KfhYATARKkTPv0
 cx7G51/925uLMOKcMQbFcZUvGtruDTbD68qT6M8rPAz5NmUwHM1ma7nOnD3rZ3bfPlX0
 f4lA==
X-Gm-Message-State: AOAM531PZ9ZbXX96ylcXtkM/+nk3w6F6q1z63YqxsCa2LamCTiQi3Tcv
 bG2PxrL73id2NxxewHNF1tlS3fnRzKE=
X-Google-Smtp-Source: ABdhPJxmbUT3E58yiMCoIixUC3C/HLAVQsQ317pbhGa9HSG/ZLXp8wqsxyMpIMRxE1TgtcivyKGWzg==
X-Received: by 2002:a17:903:240c:b0:153:c8df:7207 with SMTP id
 e12-20020a170903240c00b00153c8df7207mr29310568plo.44.1651080119203; 
 Wed, 27 Apr 2022 10:21:59 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:58 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] tests/tcg/xtensa: enable mmu tests for MMUv3
Date: Wed, 27 Apr 2022 10:21:39 -0700
Message-Id: <20220427172140.1406059-7-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
References: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MMU test suite is disabled for cores that have spanning TLB way, i.e.
for all MMUv3 cores. Instead of disabling it make testing region virtual
addresses explicit and invalidate TLB mappings for entries that conflict
with the test.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_mmu.S | 182 ++++++++++++++++++++----------------
 1 file changed, 103 insertions(+), 79 deletions(-)

diff --git a/tests/tcg/xtensa/test_mmu.S b/tests/tcg/xtensa/test_mmu.S
index 4cbd6ef4f9d8..1006c8cf77b2 100644
--- a/tests/tcg/xtensa/test_mmu.S
+++ b/tests/tcg/xtensa/test_mmu.S
@@ -2,7 +2,9 @@
 
 test_suite mmu
 
-#if XCHAL_HAVE_PTP_MMU && !XCHAL_HAVE_SPANNING_WAY
+#if XCHAL_HAVE_PTP_MMU
+#define BASE 0x20000000
+#define TLB_BASE 0x80000000
 
 .purgem test_init
 
@@ -29,17 +31,27 @@ test_suite mmu
     idtlb   a2
     movi    a2, 0x00000009
     idtlb   a2
+#if XCHAL_HAVE_SPANNING_WAY
+    movi    a2, BASE | XCHAL_SPANNING_WAY
+    idtlb   a2
+    iitlb   a2
+    movi    a2, TLB_BASE | XCHAL_SPANNING_WAY
+    idtlb   a2
+    iitlb   a2
+    movi    a2, TLB_BASE
+    wsr     a2, ptevaddr
+#endif
 .endm
 
 test tlb_group
     movi    a2, 0x04000002 /* PPN */
-    movi    a3, 0x01200004 /* VPN */
+    movi    a3, BASE + 0x01200004 /* VPN */
     wdtlb   a2, a3
     witlb   a2, a3
     movi    a3, 0x00200004
     rdtlb0  a1, a3
     ritlb0  a2, a3
-    movi    a3, 0x01000001
+    movi    a3, BASE + 0x01000001
     assert  eq, a1, a3
     assert  eq, a2, a3
     movi    a3, 0x00200004
@@ -48,17 +60,17 @@ test tlb_group
     movi    a3, 0x04000002
     assert  eq, a1, a3
     assert  eq, a2, a3
-    movi    a3, 0x01234567
+    movi    a3, BASE + 0x01234567
     pdtlb   a1, a3
     pitlb   a2, a3
-    movi    a3, 0x01234014
+    movi    a3, BASE + 0x01234014
     assert  eq, a1, a3
-    movi    a3, 0x0123400c
+    movi    a3, BASE + 0x0123400c
     assert  eq, a2, a3
     movi    a3, 0x00200004
     idtlb   a3
     iitlb   a3
-    movi    a3, 0x01234567
+    movi    a3, BASE + 0x01234567
     pdtlb   a1, a3
     pitlb   a2, a3
     movi    a3, 0x00000010
@@ -72,7 +84,7 @@ test_end
 test itlb_miss
     set_vector kernel, 1f
 
-    movi    a3, 0x00100000
+    movi    a3, BASE + 0x00100000
     jx      a3
     test_fail
 1:
@@ -86,7 +98,7 @@ test_end
 test dtlb_miss
     set_vector kernel, 1f
 
-    movi    a3, 0x00100000
+    movi    a3, BASE + 0x00100000
     l8ui    a2, a3, 0
     test_fail
 1:
@@ -116,11 +128,11 @@ test dtlb_multi_hit
     set_vector kernel, 1f
 
     movi    a2, 0x04000002 /* PPN */
-    movi    a3, 0x01200004 /* VPN */
+    movi    a3, BASE + 0x01200004 /* VPN */
     wdtlb   a2, a3
-    movi    a3, 0x01200007 /* VPN */
+    movi    a3, BASE + 0x01200007 /* VPN */
     wdtlb   a2, a3
-    movi    a3, 0x01200000
+    movi    a3, BASE + 0x01200000
     pdtlb   a2, a3
     test_fail
 1:
@@ -168,15 +180,18 @@ test load_store_privilege
     and     a3, a3, a1
     movi    a1, 4
     or      a3, a3, a1
+    movi    a5, BASE
+    add     a3, a3, a5
     witlb   a2, a3
     movi    a3, 10f
     movi    a1, 0x000fffff
     and     a1, a3, a1
+    add     a1, a1, a5
 
     movi    a2, 0x04000003 /* PPN */
-    movi    a3, 0x01200004 /* VPN */
+    movi    a3, BASE + 0x01200004 /* VPN */
     wdtlb   a2, a3
-    movi    a3, 0x01200001
+    movi    a3, BASE + 0x01200001
     movi    a2, 0x4004f
     jx      a1
 10:
@@ -192,6 +207,7 @@ test load_store_privilege
     movi    a3, 1b
     movi    a1, 0x000fffff
     and     a3, a3, a1
+    add     a3, a3, a5
     assert  eq, a2, a3
     rsr     a2, exccause
     movi    a3, 26
@@ -206,9 +222,9 @@ test cring_load_store_privilege
     set_vector double, 2f
 
     movi    a2, 0x04000003 /* PPN */
-    movi    a3, 0x01200004 /* VPN */
+    movi    a3, BASE + 0x01200004 /* VPN */
     wdtlb   a2, a3
-    movi    a3, 0x01200004
+    movi    a3, BASE + 0x01200004
     movi    a2, 0x4005f    /* ring 1 + excm => cring == 0 */
     wsr     a2, ps
     isync
@@ -245,10 +261,13 @@ test inst_fetch_prohibited
     and     a3, a3, a1
     movi    a1, 4
     or      a3, a3, a1
+    movi    a5, BASE
+    add     a3, a3, a5
     witlb   a2, a3
     movi    a3, 10f
     movi    a1, 0x000fffff
     and     a1, a3, a1
+    add     a1, a1, a5
     jx      a1
     .align  4
 10:
@@ -268,9 +287,9 @@ test load_prohibited
     set_vector kernel, 2f
 
     movi    a2, 0x0400000c /* PPN */
-    movi    a3, 0x01200004 /* VPN */
+    movi    a3, BASE + 0x01200004 /* VPN */
     wdtlb   a2, a3
-    movi    a3, 0x01200002
+    movi    a3, BASE + 0x01200002
 1:
     l8ui    a2, a3, 0
     test_fail
@@ -289,9 +308,9 @@ test store_prohibited
     set_vector kernel, 2f
 
     movi    a2, 0x04000001 /* PPN */
-    movi    a3, 0x01200004 /* VPN */
+    movi    a3, BASE + 0x01200004 /* VPN */
     wdtlb   a2, a3
-    movi    a3, 0x01200003
+    movi    a3, BASE + 0x01200003
     l8ui    a2, a3, 0
 1:
     s8i     a2, a3, 0
@@ -311,10 +330,10 @@ test_end
  * and DTLB way 7 to cover this PTE, ring=pt_ring, attr=pt_attr
  */
 .macro pt_setup pt_ring, pt_attr, pte_ring, vaddr, paddr, pte_attr
-    movi    a2, 0x80000000
+    movi    a2, TLB_BASE
     wsr     a2, ptevaddr
 
-    movi    a3, 0x80000007 | (((\vaddr) >> 10) & 0xfffff000) /* way 7 */
+    movi    a3, TLB_BASE | 7 | (((\vaddr) >> 10) & 0xfffff000) /* way 7 */
     movi    a4, 0x04000003 | ((\pt_ring) << 4) /* PADDR 64M */
     wdtlb   a4, a3
     isync
@@ -324,7 +343,7 @@ test_end
     add     a2, a1, a2
     s32i    a3, a2, 0
 
-    movi    a3, 0x80000007 | (((\vaddr) >> 10) & 0xfffff000) /* way 7 */
+    movi    a3, TLB_BASE | 7 | (((\vaddr) >> 10) & 0xfffff000) /* way 7 */
     movi    a4, 0x04000000 | ((\pt_ring) << 4) | (\pt_attr) /* PADDR 64M */
     wdtlb   a4, a3
     isync
@@ -343,10 +362,13 @@ test_end
     and     a3, a3, a1
     movi    a1, 4
     or      a3, a3, a1
+    movi    a5, BASE
+    add     a3, a3, a5
     witlb   a2, a3
     movi    a3, 10f
     movi    a1, 0x000fffff
     and     a1, a3, a1
+    add     a1, a1, a5
 
     movi    a2, 0
     wsr     a2, excvaddr
@@ -396,6 +418,8 @@ test_end
     movi    a2, (\vaddr)
     movi    a1, 0xfffff
     and     a1, a1, a2
+    movi    a5, BASE
+    add     a1, a1, a5
     rsr     a2, epc1
     assert  eq, a1, a2
 .endm
@@ -403,7 +427,7 @@ test_end
 test dtlb_autoload
     set_vector kernel, 0
 
-    pt_setup    0, 3, 1, 0x1000, 0x1000, 3
+    pt_setup    0, 3, 1, BASE + 0x1000, 0x1000, 3
     assert_no_auto_tlb
 
     l8ui    a1, a3, 0
@@ -418,8 +442,8 @@ test autoload_load_store_privilege
     set_vector kernel, 0
     set_vector double, 2f
 
-    pt_setup    0, 3, 0, 0x2000, 0x2000, 3
-    movi    a3, 0x2004
+    pt_setup    0, 3, 0, BASE + 0x2000, 0x2000, 3
+    movi    a3, BASE + 0x2004
     assert_no_auto_tlb
 
     movi    a2, 0x4005f    /* ring 1 + excm => cring == 0 */
@@ -441,7 +465,7 @@ test_end
 test autoload_pte_load_prohibited
     set_vector kernel, 2f
 
-    pt_setup    0, 3, 0, 0x3000, 0, 0xc
+    pt_setup    0, 3, 0, BASE + 0x3000, 0, 0xc
     assert_no_auto_tlb
 1:
     l32i    a2, a3, 0
@@ -458,7 +482,7 @@ test_end
 test autoload_pt_load_prohibited
     set_vector kernel, 2f
 
-    pt_setup    0, 0xc, 0, 0x4000, 0x4000, 3
+    pt_setup    0, 0xc, 0, BASE + 0x4000, 0x4000, 3
     assert_no_auto_tlb
 1:
     l32i    a2, a3, 0
@@ -474,8 +498,8 @@ test_end
 
 test autoload_pt_privilege
     set_vector  kernel, 2f
-    pt_setup    0, 3, 1, 0x5000, 0, 3
-    go_ring     1, 0, 0x5001
+    pt_setup    0, 3, 1, BASE + 0x5000, 0, 3
+    go_ring     1, 0, BASE + 0x5001
 
     l8ui    a2, a3, 0
 1:
@@ -491,8 +515,8 @@ test_end
 
 test autoload_pte_privilege
     set_vector  kernel, 2f
-    pt_setup    0, 3, 0, 0x6000, 0, 3
-    go_ring     1, 0, 0x6001
+    pt_setup    0, 3, 0, BASE + 0x6000, 0, 3
+    go_ring     1, 0, BASE + 0x6001
 1:
     l8ui    a2, a3, 0
     syscall
@@ -507,9 +531,9 @@ test_end
 
 test autoload_3_level_pt
     set_vector  kernel, 2f
-    pt_setup    1, 3, 1, 0x00400000, 0, 3
-    pt_setup    1, 3, 1, 0x80001000, 0x2000000, 3
-    go_ring     1, 0, 0x00400001
+    pt_setup    1, 3, 1, BASE + 0x00400000, 0, 3
+    pt_setup    1, 3, 1, TLB_BASE + ((BASE + 0x00400000) >> 10), 0x2000000, 3
+    go_ring     1, 0, BASE + 0x00400001
 1:
     l8ui    a2, a3, 0
     syscall
@@ -526,14 +550,14 @@ test cross_page_insn
     set_vector kernel, 2f
 
     movi    a2, 0x04000003 /* PPN */
-    movi    a3, 0x00007000 /* VPN */
+    movi    a3, BASE + 0x00007000 /* VPN */
     witlb   a2, a3
     wdtlb   a2, a3
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     witlb   a2, a3
     wdtlb   a2, a3
 
-    movi    a2, 0x00007fff
+    movi    a2, BASE + 0x00007fff
     movi    a3, 20f
     movi    a4, 21f
     sub     a4, a4, a3
@@ -543,8 +567,8 @@ test cross_page_insn
     addi    a2, a2, 1
     addi    a3, a3, 1
 1:
-    movi    a2, 0x00007fff
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007fff
+    movi    a3, BASE + 0x00008000
     /* DTLB: OK, ITLB: OK */
     jx      a2
 
@@ -560,20 +584,20 @@ test cross_page_insn
     movi    a3, 1
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x8002
+    movi    a3, BASE + 0x8002
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007fff
+    movi    a3, BASE + 0x00007fff
     assert  ne, a2, a3
 
     reset_ps
     set_vector kernel, 3f
 
     movi    a2, 0x0400000c /* PPN */
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     wdtlb   a2, a3
-    movi    a2, 0x00007fff
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007fff
+    movi    a3, BASE + 0x00008000
     /* DTLB: FAIL, ITLB: OK */
     jx      a2
 3:
@@ -581,22 +605,22 @@ test cross_page_insn
     movi    a3, 28
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x7fff
+    movi    a3, BASE + 0x7fff
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007fff
+    movi    a3, BASE + 0x00007fff
     assert  eq, a2, a3
 
     reset_ps
     set_vector kernel, 4f
 
     movi    a2, 0x0400000c /* PPN */
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     witlb   a2, a3
     movi    a2, 0x04000003 /* PPN */
     wdtlb   a2, a3
-    movi    a2, 0x00007fff
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007fff
+    movi    a3, BASE + 0x00008000
     /* DTLB: OK, ITLB: FAIL */
     jx      a2
 4:
@@ -604,20 +628,20 @@ test cross_page_insn
     movi    a3, 20
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x7fff
+    movi    a3, BASE + 0x7fff
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007fff
+    movi    a3, BASE + 0x00007fff
     assert  eq, a2, a3
 
     reset_ps
     set_vector kernel, 5f
 
     movi    a2, 0x0400000c /* PPN */
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     wdtlb   a2, a3
-    movi    a2, 0x00007fff
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007fff
+    movi    a3, BASE + 0x00008000
     /* DTLB: FAIL, ITLB: FAIL */
     jx      a2
 5:
@@ -625,10 +649,10 @@ test cross_page_insn
     movi    a3, 20
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x7fff
+    movi    a3, BASE + 0x7fff
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007fff
+    movi    a3, BASE + 0x00007fff
     assert  eq, a2, a3
 test_end
 
@@ -636,14 +660,14 @@ test cross_page_tb
     set_vector kernel, 2f
 
     movi    a2, 0x04000003 /* PPN */
-    movi    a3, 0x00007000 /* VPN */
+    movi    a3, BASE + 0x00007000 /* VPN */
     witlb   a2, a3
     wdtlb   a2, a3
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     witlb   a2, a3
     wdtlb   a2, a3
 
-    movi    a2, 0x00007ffc
+    movi    a2, BASE + 0x00007ffc
     movi    a3, 20f
     movi    a4, 21f
     sub     a4, a4, a3
@@ -653,8 +677,8 @@ test cross_page_tb
     addi    a2, a2, 1
     addi    a3, a3, 1
 1:
-    movi    a2, 0x00007ffc
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007ffc
+    movi    a3, BASE + 0x00008000
     /* DTLB: OK, ITLB: OK */
     jx      a2
 
@@ -670,20 +694,20 @@ test cross_page_tb
     movi    a3, 1
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x7fff
+    movi    a3, BASE + 0x7fff
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007ffc
+    movi    a3, BASE + 0x00007ffc
     assert  ne, a2, a3
 
     reset_ps
     set_vector kernel, 3f
 
     movi    a2, 0x0400000c /* PPN */
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     wdtlb   a2, a3
-    movi    a2, 0x00007ffc
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007ffc
+    movi    a3, BASE + 0x00008000
     /* DTLB: FAIL, ITLB: OK */
     jx      a2
 3:
@@ -691,22 +715,22 @@ test cross_page_tb
     movi    a3, 28
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x7ffc
+    movi    a3, BASE + 0x7ffc
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007ffc
+    movi    a3, BASE + 0x00007ffc
     assert  eq, a2, a3
 
     reset_ps
     set_vector kernel, 4f
 
     movi    a2, 0x0400000c /* PPN */
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     witlb   a2, a3
     movi    a2, 0x04000003 /* PPN */
     wdtlb   a2, a3
-    movi    a2, 0x00007ffc
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007ffc
+    movi    a3, BASE + 0x00008000
     /* DTLB: OK, ITLB: FAIL */
     jx      a2
 4:
@@ -714,20 +738,20 @@ test cross_page_tb
     movi    a3, 20
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x7fff
+    movi    a3, BASE + 0x7fff
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007ffc
+    movi    a3, BASE + 0x00007ffc
     assert  ne, a2, a3
 
     reset_ps
     set_vector kernel, 5f
 
     movi    a2, 0x0400000c /* PPN */
-    movi    a3, 0x00008000 /* VPN */
+    movi    a3, BASE + 0x00008000 /* VPN */
     wdtlb   a2, a3
-    movi    a2, 0x00007ffc
-    movi    a3, 0x00008000
+    movi    a2, BASE + 0x00007ffc
+    movi    a3, BASE + 0x00008000
     /* DTLB: FAIL, ITLB: FAIL */
     jx      a2
 5:
@@ -735,10 +759,10 @@ test cross_page_tb
     movi    a3, 28
     assert  eq, a2, a3
     rsr     a2, epc1
-    movi    a3, 0x7ffc
+    movi    a3, BASE + 0x7ffc
     assert  eq, a2, a3
     rsr     a2, excsave1
-    movi    a3, 0x00007ffc
+    movi    a3, BASE + 0x00007ffc
     assert  eq, a2, a3
 test_end
 
-- 
2.30.2


