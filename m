Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCED69FF8A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyX0-0001Cc-4A; Wed, 22 Feb 2023 18:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWm-0000pF-Ci
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:28:00 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWk-0005QO-R6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:28:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so10903296pjc.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6rAVEKvH88i+QH8CXFUlPcaghYPMd95m3CUWWiU3uQ0=;
 b=W/W61AyJ+mx9ByzY0qo+9wesH9QFCG+3Yjmqh30ZWAzvdA5oOlYAP5GifXMxf3d0XD
 Slatgo2o3StSb9TfUDnecVBBsFx602DlEIqQSagWEHzzbzg+TBAWkKXEANuot9fkiuI2
 fCGz8biqK2Kl47pzCbauFdHEX5m8hGe3AVhoWDBrT5CRLtGnM5E1dqQSGSWqevXjGSF5
 AUMd9ceKqGHS1Qes+eXA2twICquXQwMqBK8OG7btuTteA1margkS5rvNUrRCw2BcpoTU
 +8lKlNV7PMwX8Jz5pG3AyLRid8RSbJ51RuBlsDvmwyTOpHYV7gbsU4JWuAnITes5gd1K
 ZYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6rAVEKvH88i+QH8CXFUlPcaghYPMd95m3CUWWiU3uQ0=;
 b=dfwAs4sxpXI37xWYbFKtNcfc05KHoLygRtlDZ6BVPNa0Cy0peakpMlIgg9R9zHScUw
 ZyKpnmvNEzes7FR+MRA0Q8hOSlF9AxepqZGFCZ1nm0sNt6BADC9BS/rFJ/+zRqtaKNQT
 7Upqw7QrGlMJRItK5fW7hVnilaKXzf9UEc/KzmDbCTHjCmcl+q65JeUqPZaMUeNPGkhY
 D/i2tsuaWvm5WX8XIOI2NphDRTO4Ybt8a03UwNgMSnG4y9HeasVE6PE9LN/gK1Tpp8Gr
 zr0XleQpdnABfYC91b5RB77QVzEFIr3TKao5Vyot0iworUrIHgMMYPVL72LNeNIzuvJ8
 pBZQ==
X-Gm-Message-State: AO0yUKVl+DfvEeueoM13lm8fmyI88yCS/DBH7GtadZeQob6KryGwv9Lp
 9qwNVImqn4S91Dl1FsiEi1IJq6XLdWeMdS2hjDs=
X-Google-Smtp-Source: AK7set8NdYEe9vJx/LYAtkfrr7g7rWWd3BmflDv+Kc0cXqJa8wclgwkU/xF9HS5Jnr3CcZ3m0fbPpg==
X-Received: by 2002:a17:90b:4c0c:b0:233:feb4:895f with SMTP id
 na12-20020a17090b4c0c00b00233feb4895fmr10098398pjb.44.1677108477615; 
 Wed, 22 Feb 2023 15:27:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/28] tcg: Use noinline for major tcg_gen_code_subroutines
Date: Wed, 22 Feb 2023 13:27:15 -1000
Message-Id: <20230222232715.15034-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This makes it easier to assign blame with perf.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 4b244eebc2..b65f2ffdbe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2619,7 +2619,8 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 }
 
 /* Reachable analysis : remove unreachable code.  */
-static void reachable_code_pass(TCGContext *s)
+static void __attribute__((noinline))
+reachable_code_pass(TCGContext *s)
 {
     TCGOp *op, *op_next, *op_prev;
     bool dead = false;
@@ -2840,7 +2841,8 @@ static void la_cross_call(TCGContext *s, int nt)
  * Liveness analysis: Verify the lifetime of TEMP_TB, and reduce
  * to TEMP_EBB, if possible.
  */
-static void liveness_pass_0(TCGContext *s)
+static void __attribute__((noinline))
+liveness_pass_0(TCGContext *s)
 {
     void * const multiple_ebb = (void *)(uintptr_t)-1;
     int nb_temps = s->nb_temps;
@@ -2907,7 +2909,8 @@ static void liveness_pass_0(TCGContext *s)
 /* Liveness analysis : update the opc_arg_life array to tell if a
    given input arguments is dead. Instructions updating dead
    temporaries are removed. */
-static void liveness_pass_1(TCGContext *s)
+static void __attribute__((noinline))
+liveness_pass_1(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps = s->nb_temps;
@@ -3247,7 +3250,8 @@ static void liveness_pass_1(TCGContext *s)
 }
 
 /* Liveness analysis: Convert indirect regs to direct temporaries.  */
-static bool liveness_pass_2(TCGContext *s)
+static bool __attribute__((noinline))
+liveness_pass_2(TCGContext *s)
 {
     int nb_globals = s->nb_globals;
     int nb_temps, i;
-- 
2.34.1


