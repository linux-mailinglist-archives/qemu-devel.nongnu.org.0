Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7C16A2847
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqkB-0000y1-Ob; Sat, 25 Feb 2023 04:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjV-00071n-9N
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:45 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqjQ-00038X-SP
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:20:44 -0500
Received: by mail-pg1-x531.google.com with SMTP id d10so902901pgt.12
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ynjwWGgj/GWnEPQQaPLH0AnCGUIHagoL6cGCq3NhAGI=;
 b=KrDXayeb9vas0zc5uqAJyddUpBGhrFYNxF5dprxpTAOZaJ4Vm7hvlIoqESaneeEFq7
 sD9k+zvhj2Ls4vrqCKYimKAdCC4QI2YNljYZ4z+ye1dRaSE9ayMXIk9Ll2DQzPVY/rDU
 AcNiUpzAA+9cV3ffVrTxh9eyaTBewNYz7CF2w1OlY686lFaeKqnq0GXLU3rucQTuKepJ
 lS+pMZTWbcjcfrwXKr7Lpsp1tzb7xfYK8fcWru8YkX0KPhYTvQ23cMmQ01k9MbzBpCa7
 711equ4A1C5mr6t7zI6JY6CwFGXyyxduFREpsYAr1mASqE2ZJjGRu68z/B2z80uC8iND
 7rTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ynjwWGgj/GWnEPQQaPLH0AnCGUIHagoL6cGCq3NhAGI=;
 b=KPw6z6eWtYHVvppH5WChlWbHsJIugT4kBJTsa0Co3LUohxG4vYxFBeASMrvP69O7rC
 8RkBVg8uJNWWRj0wzGC1Dq/4Y+Rgu1OInpHXz99m194xovMBx4OvOAEtKhjAh6FrGzAl
 eIlZapYfRGM9yLTrzn1dCCi7sFSXenm6wSARXzjDxfqSYIZwLJYweRqycMRgcdduzpPL
 /Vo59mz2QVwdR5UqC0PE6ngqvR3BTIpMAsWDZx1gpsNRprgoa6nWgYLsJsCBIrExxhHo
 f77h0wMJTUpAJr5sRfGbou4/be9JUHr8oaSzXzmTzuJru13c9Kd49Qih9f0g9w2xEz5m
 OXbA==
X-Gm-Message-State: AO0yUKWmfyxPRNARJZhwRH0KD0CbHo6/slf6at5VoqXBY9R9liJl7Hum
 WNyiri0kgN3dJcXqlzkmpEs3i215o0JU0r8g3H0=
X-Google-Smtp-Source: AK7set9TvEt+CiLtsYvXw/UAcozOw18T7q/pO0+3yV76FWg+M0rXyFD54NB5I2aK/b5LxbM/aZABXg==
X-Received: by 2002:a62:6454:0:b0:5a9:c2b0:428f with SMTP id
 y81-20020a626454000000b005a9c2b0428fmr17724854pfb.31.1677316837811; 
 Sat, 25 Feb 2023 01:20:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 26-20020aa7921a000000b00592417157f2sm843114pfo.148.2023.02.25.01.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:20:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 71/76] target/sparc: Drop reset_sar_tracker
Date: Fri, 24 Feb 2023 23:14:22 -1000
Message-Id: <20230225091427.1817156-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Translators are no longer required to free tcg temporaries.
Remove sar_m32_allocated, as sar_m32 non-null is equivalent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 4af0650deb..910350dec6 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -57,7 +57,6 @@ struct DisasContext {
 
     bool sar_5bit;
     bool sar_m32_5bit;
-    bool sar_m32_allocated;
     TCGv_i32 sar_m32;
 
     unsigned window;
@@ -284,14 +283,7 @@ static void init_sar_tracker(DisasContext *dc)
 {
     dc->sar_5bit = false;
     dc->sar_m32_5bit = false;
-    dc->sar_m32_allocated = false;
-}
-
-static void reset_sar_tracker(DisasContext *dc)
-{
-    if (dc->sar_m32_allocated) {
-        tcg_temp_free(dc->sar_m32);
-    }
+    dc->sar_m32 = NULL;
 }
 
 static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
@@ -306,9 +298,8 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
-    if (!dc->sar_m32_allocated) {
+    if (!dc->sar_m32) {
         dc->sar_m32 = tcg_temp_new_i32();
-        dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
     tcg_gen_sub_i32(cpu_SR[SAR], tcg_constant_i32(32), dc->sar_m32);
@@ -1247,7 +1238,6 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    reset_sar_tracker(dc);
     if (dc->icount) {
         tcg_temp_free(dc->next_icount);
     }
-- 
2.34.1


