Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96DB6A3C23
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:15:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOt-0003GB-CO; Mon, 27 Feb 2023 00:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNU-0004gl-EE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:48 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNQ-00074k-9j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:47 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l1so4916048pjt.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bY34aIa/D4KZaSYWEDAithLbdY3yc2J0anloDn2pzs0=;
 b=uPdiN89MjVFFEn1dStm/Hpm1ukmsRxs2RDWHMgfwTSBsz8HvLS5YrcuDzJ4m3Hm3as
 DsLZeMdWHLrQVqg45vKPLCt/En6I98NHMif3xQptQWd4MN9A41BQ30UbjOOXo+orItTU
 GDzHv+NqRNQ99wOf9tM7Y3gSr2Qc9r4kMdle4wrqUitnpMatPsvWSEXSIUP/Wv3n2MVv
 fH9hC2rHwkiabAa4Oq19E4D8k8b2RLREVyFxsv5OuDM2WytCpfQxETSp4ZN65rVK29iZ
 LtlgccIE7B1yxjek0mgBdDrUM5ssobokIl4Xk+0D94XyhHmQeO7PNnF+pAW8rAzvl0tf
 mXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bY34aIa/D4KZaSYWEDAithLbdY3yc2J0anloDn2pzs0=;
 b=2bJ/6b4wmiFbvtx1WMlQIz80LiZaNVJyg4yxe4G36pSXGQjmnPYOi9BlmTqVhSp1Rr
 gXkGeBD2uAhISlnxJmQBAFFg+ZEglVzWOdYWBA0i2kH/VcwQasJwfy4iTLPRBG//jra9
 zNzt4Hl0JH9gj2DSYLyYEbaGzbjVPbU6xo5uJzbH2U/iOoAVFhpQpBwHyVaBPc943SWc
 ck2GA8WYgyhkesxlFyKJ7FClrA0SnJeeDqaLkkcTCEBTheI3OJdVBdqUIiFVzdgD37kl
 /oTkAtFk4YNA8hL1dKpkm0z+mn5ZrFk5UK9AlYc7RiWnj/S/oZmKCBK7VQjgZmNDrhn2
 eS3w==
X-Gm-Message-State: AO0yUKXo/Jze66cdE6Sdr8F5FI+nqDY+tFBQGpN0jyQhTipTEGkPh4IG
 ABQgutGN5c/fIVgtSDXej8jNFBnQOD9FsvbrFuU=
X-Google-Smtp-Source: AK7set/mFLEUM19kZkJ0OuzOqk62t9m6IpAGjBKpBmCplWojQDJsWXfVdCqysIogODWCmLU+lzS7gQ==
X-Received: by 2002:a17:903:2903:b0:19c:d550:803e with SMTP id
 lh3-20020a170903290300b0019cd550803emr8427778plb.57.1677476919768; 
 Sun, 26 Feb 2023 21:48:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 66/70] target/xtensa: Split constant in bit shift
Date: Sun, 26 Feb 2023 19:42:29 -1000
Message-Id: <20230227054233.390271-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 2903c73f8e..f906ba7ed5 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2047,8 +2047,8 @@ static uint32_t test_exceptions_retw(DisasContext *dc, const OpcodeArg arg[],
 static void translate_retw(DisasContext *dc, const OpcodeArg arg[],
                            const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(1);
-    tcg_gen_shl_i32(tmp, tmp, cpu_SR[WINDOW_BASE]);
+    TCGv_i32 tmp = tcg_temp_new();
+    tcg_gen_shl_i32(tmp, tcg_constant_i32(1), cpu_SR[WINDOW_BASE]);
     tcg_gen_andc_i32(cpu_SR[WINDOW_START],
                      cpu_SR[WINDOW_START], tmp);
     tcg_gen_movi_i32(tmp, dc->pc);
@@ -2080,10 +2080,10 @@ static void translate_rfi(DisasContext *dc, const OpcodeArg arg[],
 static void translate_rfw(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_const_i32(1);
+    TCGv_i32 tmp = tcg_temp_new();
 
     tcg_gen_andi_i32(cpu_SR[PS], cpu_SR[PS], ~PS_EXCM);
-    tcg_gen_shl_i32(tmp, tmp, cpu_SR[WINDOW_BASE]);
+    tcg_gen_shl_i32(tmp, tcg_constant_i32(1), cpu_SR[WINDOW_BASE]);
 
     if (par[0]) {
         tcg_gen_andc_i32(cpu_SR[WINDOW_START],
-- 
2.34.1


