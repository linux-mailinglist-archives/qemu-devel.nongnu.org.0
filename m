Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1D8322266
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:53:21 +0100 (CET)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEK4u-0006oS-Ef
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrf-0001Ha-5B
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:39 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrd-0005ZA-Rq
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:38 -0500
Received: by mail-ed1-x530.google.com with SMTP id c6so24012552ede.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YUh8CuRVecN07OYPv+7aGP1f69kub+P2q8KnhbsjCeI=;
 b=tElMSdp2VdxlBIZssNBCYQtvbIoj4k34J4TXgVq+87kKlFI5vz3Db9xv6lZ+hfsBLK
 6k97IS01XhJSCqGQfeA3M07NhPCuZV0Xg/Zw5uoy65Cy17/SceoiKsIlDLeMHuDzB2X8
 cliPijlBEwBavtcY1P8OkRIH9nHYghMMkGRNSJvZ+WmRNB20ZqToT7/jPX/e2N7psFxo
 h9b9/XIWxq7lgmBjtZRTdBdGPj52kT/PYQOOpcu2S9EO+VbR59URkl0OYiTCYCRGAc8k
 owc6YVjtCYiZFDq4mfLMOgUoqkCtIC21ZkLaPUlxbxnm+AXkcY8HLn1qaWd6Ovlc226z
 BS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YUh8CuRVecN07OYPv+7aGP1f69kub+P2q8KnhbsjCeI=;
 b=deKk9cR5XufHdZ1HrCzt5qdkR+MEZ8arPXZ++QeNXMysUzFGK9KT6g5t0u4jGpfCsy
 7s6AthrhUEnwLyIhA9czX8GF5r/FPByPMJgfOTxxU772Q6hyHaQtU+eljbSWju2KgQoY
 QE11SczOZVqHgoDJSrJpsMrKsVFKA9PpKcMW5+l0T6ahuBgYEsMdiu8kW2/nFJSx/MwR
 vOxFk3TgEIKgmjXCatR3aunSw6oACiuOZ0R9dKvUQ8SZPoUbHZA0TcW04tDyq3vlEovJ
 Rc0uQ/TLzF9rli1ykeZNhJhdN7umzOf0EPPhpAkmo6Rs9TSSqb05cFM0PMohjuGIABfg
 11Xg==
X-Gm-Message-State: AOAM530s6XQvYV7KEb9TvqcKJdg240uMe9vTlikiX9KFItgZLWVPbHal
 Pt/XjVyROY5OUyzhiuOQ7o6kk3bHxwk=
X-Google-Smtp-Source: ABdhPJyl2M9BNNtYZ2nUQYetDZjEMru931hLF2ub8vnXFgokVObIlyZOeZV7U+ZcXcZBjJpD60OSHQ==
X-Received: by 2002:a05:6402:3d3:: with SMTP id
 t19mr16642212edw.124.1614033576336; 
 Mon, 22 Feb 2021 14:39:36 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id la24sm10957452ejb.18.2021.02.22.14.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/10] target/mips: Use OPC_MUL instead of OPC__MXU_MUL
Date: Mon, 22 Feb 2021 23:38:57 +0100
Message-Id: <20210222223901.2792336-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a macro and definition to extract / check
the Special2 MUL opcode. Use it instead of the unnecessary
OPC__MXU_MUL macro.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6f853fcdcce..c897f3900d8 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1464,7 +1464,6 @@ enum {
  */
 
 enum {
-    OPC__MXU_MUL     = 0x02,
     OPC_MXU__POOL00  = 0x03,
     OPC_MXU_D16MUL   = 0x08,
     OPC_MXU_D16MAC   = 0x0A,
@@ -25838,7 +25837,7 @@ static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
  */
 static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
-    if (extract32(insn, 0, 6) == OPC__MXU_MUL) {
+    if (MASK_SPECIAL2(insn) == OPC_MUL) {
         uint32_t  rs, rt, rd, op1;
 
         rs = extract32(insn, 21, 5);
-- 
2.26.2


