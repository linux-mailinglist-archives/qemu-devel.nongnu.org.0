Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE284572E9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:28:27 +0100 (CET)
Received: from localhost ([::1]:57762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6kU-0006eo-Lt
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:28:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6P1-0006tw-IW
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:15 -0500
Received: from [2a00:1450:4864:20::429] (port=46833
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6Oz-0004WC-UV
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:15 -0500
Received: by mail-wr1-x429.google.com with SMTP id u1so18938637wru.13
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPDnRjXDtJe7Oslw4gAf/4C0KOH5Pk1bxDKB/NnOWg8=;
 b=ZHL0xSIc0jZAILdYLbLpdTqBBk1eadfIsjcyN+MFSCUDGQK/55PAEoY/4xAU0rUNu+
 /1XtEgSTrv2n+/wVR+s9is+yroIkIH0g5uOtjDqG/Re/SD5cn+VGBEQ4kKV8LYd0dfIi
 LD2bMJzJVmk9A365+QdMYqIBnprsGnWqidtkJ13CkCA9qwytlfWjnlioNMVBe27Zwk3U
 m6JxGMrMT/18YksyTN3XK188nhfYbPXPnWj0pzkCFIOWJfwteKk+m/W18cP6A4DJhHZ0
 l4sBd2khrdtNZBp56wKKTmNSqydELnFA/P3JuJxdqBx5t6IviRVue8XKLu1X2/N2ZdBG
 ViCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPDnRjXDtJe7Oslw4gAf/4C0KOH5Pk1bxDKB/NnOWg8=;
 b=4uMW51radIv/Twtj1lK8iOhJSkOlHljVw8JnF2AhgWWmxc33b2OWuH6SS68as43J0N
 P0GYZHEK4Zb7y7nugb9xIFefSwqaPuW1Y8pxfKGWbaBOkp5nZRznPUOnwAse+rTIQ9qK
 nEs+jD3+g61sQGRKxhKriw+/hALHiyn/Umo7rNshbRxKYwLKLsa35gMwSHjEi3JrrDgi
 OxirlXdC2sTzaeOBUUlVz9Uap7eggRsFALd15FZURsBTEZA8V3L7eFVDgFnkMpQoxeeV
 ddaZt/GPoWdpW4hlZajTkBgZlRuP0PtNprGz9nzLLVUBWWHdJlNOY8E1cv62R0Br9LKh
 CzFQ==
X-Gm-Message-State: AOAM531oWg2GcGw9Cc60YWyvm50rZtbPNlIhkZJHDoUy9wYMh1hsRnaB
 760qFIWzLAVsBjRLP/Aid0IHUdf6bAx2TfMUwbw=
X-Google-Smtp-Source: ABdhPJzLC3dL9EJkyVqv5NO9rWHItymHbAlw6Bsa4FwTkpNd0O7GjOcCW2wqf410NumEE7QO3C4tyA==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr8738008wre.140.1637337972571; 
 Fri, 19 Nov 2021 08:06:12 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:06:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/35] target/ppc: Add helper for fsqrts
Date: Fri, 19 Nov 2021 17:04:56 +0100
Message-Id: <20211119160502.17432-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use float64r32_sqrt.  Fixes a double-rounding issue with performing
the compuation in float64 and then rounding afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                |  1 +
 target/ppc/fpu_helper.c            | 12 ++++++++++++
 target/ppc/translate/fp-impl.c.inc |  3 +--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ca893e1232..a6683dceec 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -105,6 +105,7 @@ DEF_HELPER_4(fmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmadds, i64, env, i64, i64, i64)
 DEF_HELPER_4(fnmsubs, i64, env, i64, i64, i64)
 DEF_HELPER_2(fsqrt, f64, env, f64)
+DEF_HELPER_2(fsqrts, f64, env, f64)
 DEF_HELPER_2(fre, i64, env, i64)
 DEF_HELPER_2(fres, i64, env, i64)
 DEF_HELPER_2(frsqrte, i64, env, i64)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 5caeed2c45..7e275ea134 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -727,6 +727,18 @@ float64 helper_fsqrt(CPUPPCState *env, float64 arg)
     return ret;
 }
 
+/* fsqrts - fsqrts. */
+float64 helper_fsqrts(CPUPPCState *env, float64 arg)
+{
+    float64 ret = float64r32_sqrt(arg, &env->fp_status);
+    int flags = get_float_exception_flags(&env->fp_status);
+
+    if (unlikely(flags & float_flag_invalid)) {
+        float_invalid_op_sqrt(env, flags, 1, GETPC());
+    }
+    return ret;
+}
+
 /* fre - fre. */
 float64 helper_fre(CPUPPCState *env, float64 arg)
 {
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index b1af4bef61..898de9fe53 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -270,8 +270,7 @@ static void gen_fsqrts(DisasContext *ctx)
     t1 = tcg_temp_new_i64();
     gen_reset_fpstatus();
     get_fpr(t0, rB(ctx->opcode));
-    gen_helper_fsqrt(t1, cpu_env, t0);
-    gen_helper_frsp(t1, cpu_env, t1);
+    gen_helper_fsqrts(t1, cpu_env, t0);
     set_fpr(rD(ctx->opcode), t1);
     gen_compute_fprf_float64(t1);
     if (unlikely(Rc(ctx->opcode) != 0)) {
-- 
2.25.1


