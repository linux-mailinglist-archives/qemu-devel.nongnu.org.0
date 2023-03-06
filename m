Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13AF6AB413
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYz14-0002IH-CB; Sun, 05 Mar 2023 19:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0o-0001E3-BD
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:35 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYz0m-00083q-6p
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:47:33 -0500
Received: by mail-pl1-x634.google.com with SMTP id n6so8523978plf.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdoIg7z+EU1qAkUBw1OLkChzjjlmMvLO++FZ80hImps=;
 b=o/hvmtQCKqgMYfwV9tUUwu0WCUmmArWgYzdwdsCeFPWM8lLjQHQz/0ZVnaaKLyoAiV
 ELWc7kx4gPh2WWvJ0jvnG/Vu8SQyulCOwCBDG8Iy9pEEzzjSltZoCHklmQQH4vBgmdSr
 1lo3RLc8A5dGdkNq1qUZbYaEi9sJK4sB1HAC/s685gRSFlnfPVVEDTiyUKsV549wtlle
 vPcsxn1PWpX0Nq5lLd9mjaapF5I1Y8XBxaotO69bNOjG3/nI7U2OwNp0WotjDoSvFftu
 5rCxbx/92Jtc2nROXRFwJBy2lrumC+QmLUV6z0FMZ8KnxOiT+j5uIntKqp6NpLhxC2wn
 KRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdoIg7z+EU1qAkUBw1OLkChzjjlmMvLO++FZ80hImps=;
 b=DLDg471EDEeZihhs/3w4G8GYjA7BHEUXtSVpP+ci0coTBMJYbCXJ64mjKloExPOru4
 K2GsO56FEpyJSfOT8J7WaH3ywFlzFItHsniJi/AaQJHN8fwbb5HGvCZh/td8yQe683Ge
 vOJpnuzOT/AjG3nw+uABzXFBC/I/v1FadHv2v0X42YoFLGpWXuOZ04BFAgE9VUvprzfE
 nfBVBEAXaXFVsS5X7KhCSWFUEkutfKztxNKR6aEn5Qi/IXTvLUaIRL2xq2pCFFNLz/9j
 Y4nAQUW0sxnW142tmJIh81SFFhWgF+CGf0wB1UCl2OGBGki3I52yU3X87918xWDTiuLA
 vddQ==
X-Gm-Message-State: AO0yUKWUV4SlpqssN2z36zyYdYrq1MJo7VIpJXHLdMKVnKgJI85c0eZh
 NcwQ93P7Fz9kWz4x9KbDe9qGIDqtgeX6Wgbv1OiFRw==
X-Google-Smtp-Source: AK7set95JVFTJGEHN/pZz2gxj5ZQmVnwFb1rmAOiohME9Y+87mbRDWjqgI7hgQRntDvC9gxhH5ejQA==
X-Received: by 2002:a17:90b:3b86:b0:234:a299:b50a with SMTP id
 pc6-20020a17090b3b8600b00234a299b50amr9307061pjb.2.1678063649950; 
 Sun, 05 Mar 2023 16:47:29 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 mv15-20020a17090b198f00b0023087e8adf8sm4971492pjb.21.2023.03.05.16.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:47:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 83/84] target/xtensa: Split constant in bit shift
Date: Sun,  5 Mar 2023 16:39:53 -0800
Message-Id: <20230306003954.1866998-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
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


