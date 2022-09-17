Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162565BB7FF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 13:31:00 +0200 (CEST)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZW2E-0002zL-TW
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 07:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVx6-0005w1-9N
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVx4-0006qp-IU
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 07:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D4AX+gFg5QCWZ5N5qmHn6UaYtuPbsIwFgpRvO9VSHbc=; b=tIuNERrmdDUmXUjgMND+jByD/Y
 BFWHKV/b8eCa+KOtYY6BkLJVgCO+UQ9fdd4dPteB4eaQ7C+zMInIec9yGePVTUYr5qyOJ0TQyjytg
 ewk8ZsA/f7LLmGJIkXWKmUnbCqDOBEsKT2vG4/4f9yU4tkiLkjm022pJhKbhakgn8dubeFNYmzwcE
 WIGmesTXbg4NphoAVh1jrJFWjrRfLuaV/rFWZVzOyXOVXrl8AG33cI63EKmKurKZUrhCzDgrmG9RJ
 wSXFXr5uyuh+NJQMWyTB41EiyAfatGVpiOZc4JnJGkZxI3EAG69nEnqi6AGf7RfzvWluJycBk2mHn
 muICiEj5rVfuGcsg3YRjwOWNiqyxrdtkaAmuWRoxKshfzFaYJv8QA2v1shMO5B48myLnG59dTgmGd
 WSgaZv2l8hU5qm7H16ECGPFZ3/v8/cXIGbtjNzD90SMxIGrkjRm60vAXbd2//cJhbiphyuhkQFtml
 5RIEFloqdVGksJrYWYjdA+b7XV1iTNgBMRjaKjcLQCG6lJf3y1O9RkG3mYeDbVPAQcahujVMP0er8
 TG8HulhqfOsPVygcJWwYum4NAbJdIJgfxk6Olek4SzdyTHcnkNO99DdkirIXh/6HmBTOFup9cCINm
 VNcJl/05Yv6rnT88pJq0aXqZnoFWjc9sFC+3p4E7Y=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oZVvN-000C7q-55; Sat, 17 Sep 2022 12:23:57 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com,
 qemu-devel@nongnu.org
Date: Sat, 17 Sep 2022 12:25:14 +0100
Message-Id: <20220917112515.83905-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/4] target/m68k: use M68K_FEATURE_MOVEFROMSR_PRIV feature for
 move_from_sr privilege check
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now that M68K_FEATURE_M68000 has been renamed to M68K_FEATURE_M68K it is easier
to see that the privilege exception check is wrong: it is currently only generated
for ColdFire CPUs when in fact it should also be generated for Motorola CPUs from
the 68010 onwards.

Introduce a new M68K_FEATURE_MOVEFROMSR_PRIV feature which is set for all non-
Motorola CPUs, and for all Motorola CPUs from the 68010 onwards and use it to
determine whether a privilege exception should be generated for the MOVE-from-SR
instruction.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/cpu.c       | 5 +++++
 target/m68k/cpu.h       | 2 ++
 target/m68k/translate.c | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 7b4797e2f1..cc5311a4ac 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -102,6 +102,7 @@ static void m5206_cpu_initfn(Object *obj)
     CPUM68KState *env = &cpu->env;
 
     m68k_set_feature(env, M68K_FEATURE_CF_ISA_A);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 /* Base feature set, including isns. for m68k family */
@@ -129,6 +130,7 @@ static void m68010_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_RTD);
     m68k_set_feature(env, M68K_FEATURE_BKPT);
     m68k_set_feature(env, M68K_FEATURE_MOVEC);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 /*
@@ -241,6 +243,7 @@ static void m5208_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_BRAL);
     m68k_set_feature(env, M68K_FEATURE_CF_EMAC);
     m68k_set_feature(env, M68K_FEATURE_USP);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 static void cfv4e_cpu_initfn(Object *obj)
@@ -254,6 +257,7 @@ static void cfv4e_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_CF_FPU);
     m68k_set_feature(env, M68K_FEATURE_CF_EMAC);
     m68k_set_feature(env, M68K_FEATURE_USP);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 static void any_cpu_initfn(Object *obj)
@@ -275,6 +279,7 @@ static void any_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_USP);
     m68k_set_feature(env, M68K_FEATURE_EXT_FULL);
     m68k_set_feature(env, M68K_FEATURE_WORD_INDEX);
+    m68k_set_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV);
 }
 
 static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index d3384e5d98..57936ea780 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -537,6 +537,8 @@ enum m68k_features {
     M68K_FEATURE_UNALIGNED_DATA,
     /* TRAPcc insn. (680[2346]0, and CPU32) */
     M68K_FEATURE_TRAPCC,
+    /* MOVE from SR privileged (from 68010) */
+    M68K_FEATURE_MOVEFROMSR_PRIV,
 };
 
 static inline uint64_t m68k_feature(CPUM68KState *env, int feature)
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index fad8af8f83..be5561e1e9 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4598,7 +4598,7 @@ DISAS_INSN(move_from_sr)
 {
     TCGv sr;
 
-    if (IS_USER(s) && !m68k_feature(env, M68K_FEATURE_M68K)) {
+    if (IS_USER(s) && m68k_feature(env, M68K_FEATURE_MOVEFROMSR_PRIV)) {
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
         return;
     }
-- 
2.30.2


