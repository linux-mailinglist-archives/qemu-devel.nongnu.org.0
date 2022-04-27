Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70771511C9B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:27:26 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlRl-000697-Io
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMb-00065F-IX
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:05 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMY-00018v-1t
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:05 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso5543984pjb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rT8bQd7m/pPeBv76/MFc7awTRdevobv7e6iBSg3qJJc=;
 b=XdsvuY6V8CTE1tuGZdq0WpF2UxTs+4KBy4zLWha38ejmDhTOTSsxSiEAWK4Qvhpe3R
 eZMdTS9KbXe4bUww4UYODkr5yg+yFMqHt4D1u2JvyDQSWjfkfCuMbuNQEKlA+tLEqm3f
 ofyA26jDsvshHP6Q+0agb7TA7g8BtRSntgzUUyfmwRwD1I2QzluBT192aPVMpeWCIem+
 dZTKzYn7GzcpWG6UP2mNCzRbkASQLeM478qigU3G1A6kyGL8q55oADtpR/g+dnm89bxN
 e4K5imM9o90KK8PG05qgCo37Vi4vB8d5lyWOSr9TemdEFeAr8IeepG1D7zF1Cv7OUH9H
 950Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rT8bQd7m/pPeBv76/MFc7awTRdevobv7e6iBSg3qJJc=;
 b=ODcp1XuxiI4g4gyT2i6PFjBsnzp8M1d3Um0ifsSoC3eTmnkG0gYpRiHjq3TU2LUWhK
 L8xekGmF4jp43lF7pxfZFkBGbVP00oRbl9J2xjLqSqoprYsID56AcjryjvxN3qvAEPVG
 XR8wrjoDl0FvE1GqUwDh+9itYIf5svWyqNEy3mh3PygonmBmuwr3mAQMQV76PzbK0ILA
 2+qNbYAVkBBL2tKGi/hPLeBZnYHo2QEI8yDggBWV08hI87EPRhJqrXx3Zo8nUzybRS7W
 /LTxAlykXDrMrw0P124mYie69uYIAuI99Lf/Je2ny0z+H8i10hBrSnZlhiTne9Otemxv
 GZ9w==
X-Gm-Message-State: AOAM530wFcjZkg62pCUL+/sL1FBcHoF8MNIMVSS6cXg7jKRqKQjjIcLT
 xbt/l3qxGiXh6XtBlF8vNkmmDnDqAEY=
X-Google-Smtp-Source: ABdhPJy99F6YbcdXaPV8Hfwj+oBRdwkm89wZpcqWnyuNJ7e/+MkvXQdndJN7dAJOQhP1DKhp8063yA==
X-Received: by 2002:a17:902:854c:b0:159:a70:deca with SMTP id
 d12-20020a170902854c00b001590a70decamr30134125plo.142.1651080120477; 
 Wed, 27 Apr 2022 10:22:00 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:59 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] tests/tcg/xtensa: fix vectors and checks in timer test
Date: Wed, 27 Apr 2022 10:21:40 -0700
Message-Id: <20220427172140.1406059-8-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
References: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x102c.google.com
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

Timer test assumes that timer 0 IRQ has level 1 and other timers have
higher level IRQs. This assumption is not correct and the levels may be
arbitrary. Fix that assumption by providing TIMER*_VECTOR macro and
using it for vector selection and by making the check for the timer
exception cause conditional.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_timer.S | 48 ++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/tests/tcg/xtensa/test_timer.S b/tests/tcg/xtensa/test_timer.S
index 2a383e77190e..2a06eebad883 100644
--- a/tests/tcg/xtensa/test_timer.S
+++ b/tests/tcg/xtensa/test_timer.S
@@ -38,6 +38,28 @@ test_end
 
 #if XCHAL_NUM_TIMERS
 
+#if INTERRUPT_LEVEL(XCHAL_TIMER0_INTERRUPT) == 1
+#define TIMER0_VECTOR kernel
+#else
+#define TIMER0_VECTOR glue(level, INTERRUPT_LEVEL(XCHAL_TIMER0_INTERRUPT))
+#endif
+
+#if XCHAL_NUM_TIMERS > 1
+#if INTERRUPT_LEVEL(XCHAL_TIMER1_INTERRUPT) == 1
+#define TIMER1_VECTOR kernel
+#else
+#define TIMER1_VECTOR glue(level, INTERRUPT_LEVEL(XCHAL_TIMER1_INTERRUPT))
+#endif
+#endif
+
+#if XCHAL_NUM_TIMERS > 2
+#if INTERRUPT_LEVEL(XCHAL_TIMER2_INTERRUPT) == 1
+#define TIMER2_VECTOR kernel
+#else
+#define TIMER2_VECTOR glue(level, INTERRUPT_LEVEL(XCHAL_TIMER2_INTERRUPT))
+#endif
+#endif
+
 test ccount_update_deadline
     movi    a2, 0
     wsr     a2, intenable
@@ -90,9 +112,8 @@ test ccompare
     assert  nei, a5, 0
 test_end
 
-#if INTERRUPT_LEVEL(XCHAL_TIMER0_INTERRUPT) == 1
 test ccompare0_interrupt
-    set_vector kernel, 2f
+    set_vector TIMER0_VECTOR, 2f
     movi    a2, 0
     wsr     a2, intenable
     rsr     a2, interrupt
@@ -120,15 +141,16 @@ test ccompare0_interrupt
     bnez    a3, 1b
     test_fail
 2:
+#if INTERRUPT_LEVEL(XCHAL_TIMER0_INTERRUPT) == 1
     rsr     a2, exccause
     assert  eqi, a2, 4 /* LEVEL1_INTERRUPT_CAUSE */
-test_end
 #endif
+test_end
 
 #if XCHAL_NUM_TIMERS > 1
 
 test ccompare1_interrupt
-    set_vector glue(level, INTERRUPT_LEVEL(XCHAL_TIMER1_INTERRUPT)), 2f
+    set_vector TIMER1_VECTOR, 2f
     movi    a2, 0
     wsr     a2, intenable
     rsr     a2, interrupt
@@ -153,13 +175,17 @@ test ccompare1_interrupt
     bnez    a3, 1b
     test_fail
 2:
+#if INTERRUPT_LEVEL(XCHAL_TIMER1_INTERRUPT) == 1
+    rsr     a2, exccause
+    assert  eqi, a2, 4 /* LEVEL1_INTERRUPT_CAUSE */
+#endif
 test_end
 
 #endif
 #if XCHAL_NUM_TIMERS > 2
 
 test ccompare2_interrupt
-    set_vector glue(level, INTERRUPT_LEVEL(XCHAL_TIMER2_INTERRUPT)), 2f
+    set_vector TIMER2_VECTOR, 2f
     movi    a2, 0
     wsr     a2, intenable
     rsr     a2, interrupt
@@ -182,12 +208,16 @@ test ccompare2_interrupt
     bnez    a3, 1b
     test_fail
 2:
+#if INTERRUPT_LEVEL(XCHAL_TIMER2_INTERRUPT) == 1
+    rsr     a2, exccause
+    assert  eqi, a2, 4 /* LEVEL1_INTERRUPT_CAUSE */
+#endif
 test_end
 
 #endif
 
 test ccompare_interrupt_masked
-    set_vector kernel, 2f
+    set_vector TIMER0_VECTOR, 2f
     movi    a2, 0
     wsr     a2, intenable
     rsr     a2, interrupt
@@ -217,12 +247,14 @@ test ccompare_interrupt_masked
 
     test_fail
 2:
+#if INTERRUPT_LEVEL(XCHAL_TIMER0_INTERRUPT) == 1
     rsr     a2, exccause
     assert  eqi, a2, 4 /* LEVEL1_INTERRUPT_CAUSE */
+#endif
 test_end
 
 test ccompare_interrupt_masked_waiti
-    set_vector kernel, 2f
+    set_vector TIMER0_VECTOR, 2f
     movi    a2, 0
     wsr     a2, intenable
     rsr     a2, interrupt
@@ -247,8 +279,10 @@ test ccompare_interrupt_masked_waiti
     waiti   0
     test_fail
 2:
+#if INTERRUPT_LEVEL(XCHAL_TIMER0_INTERRUPT) == 1
     rsr     a2, exccause
     assert  eqi, a2, 4 /* LEVEL1_INTERRUPT_CAUSE */
+#endif
 test_end
 
 #endif
-- 
2.30.2


