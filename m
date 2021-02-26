Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0594326045
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 10:40:30 +0100 (CET)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFZbp-0004YK-MR
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 04:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTU-0004Ri-Tt
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:52 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFZTT-0003B6-Dl
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 04:31:52 -0500
Received: by mail-ej1-x629.google.com with SMTP id jt13so13703583ejb.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 01:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyX97rnCu0DJ6j05hLetfQh2Gc//wDyTV1nAcRxoU6Q=;
 b=nvYi2TIVFQJdHUNZl3bx9cYKxGRQpAtMacfJMbx0K3++9MRnaEsu9HOatEc0iJTjYe
 1sQNJvIyiPQLAcjmZ9WLyCCjrbUtEHt3VJtaLgxKBBqov+Ttt+n44iFvwd9rsHsYHW4g
 cf7bVt+WVoQFt7HkrIa3cXgEMGLA1hxx/KNlzBVKCQGKjf7aiIquFpUCRPkUgFrMq7t/
 vmzX0qqoUn6QMLSNJzbg1g39ZqHXbw+2fWpz4XQLfZcIhwP0yhiYUB2Ria5ttCBxeqjk
 4UZz/T1jsA2UO5XzyUiqrJIf8LjRdAguY3+enk5I7s+h9gUR1/J1e0mm4HWpyvNbMvoE
 WwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VyX97rnCu0DJ6j05hLetfQh2Gc//wDyTV1nAcRxoU6Q=;
 b=ju7s7cwd7aahkyulwd4G2TZnabZ9rxzJGEliQJV611pA/CKYTBs4mmdjme5CKB2uOG
 PcRFD4zw5e4LsNRxr9THueHCIpkpnqp/87C2hhbHvZnbfBUPJmfs2g4Xyqg4Il2hRRjj
 NevodM1+TWEH4Fc04z46CTUEmlMk1KCphh1xA8a5HFluCzPJtW25sx/4fxAWLe/jy17G
 XP/n5vGO5/ZTEmF0PSBbaOSmp2hqy360VRL3KUxv9R0i2lbC3KG6CdZVdgM3lZVKlhwu
 lolrJA6KSwgDVZVFJJABL1cRuESkyLsnjR24Jo9ctkeXEBsA1y1V//hsogugfip4TuJq
 17ZQ==
X-Gm-Message-State: AOAM5316S+u8xsWwz64AgD7YwfwHGoglp1Y32irzcEAsAroGybr+13mW
 jvNDKrE0XkCpWtNE9mkOPCf9loREgNU=
X-Google-Smtp-Source: ABdhPJyOJSaulBdf8jnnCM8AmoBgqkxCx5hb3Oe9Es4BKldDNTVB3c+S1i92nFSs0tlvav8ZFWsWZA==
X-Received: by 2002:a17:906:c82e:: with SMTP id
 dd14mr2306167ejb.102.1614331909952; 
 Fri, 26 Feb 2021 01:31:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k9sm5326380edo.30.2021.02.26.01.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:31:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/13] target/mips: Use OPC_MUL instead of OPC__MXU_MUL
Date: Fri, 26 Feb 2021 10:31:04 +0100
Message-Id: <20210226093111.3865906-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226093111.3865906-1-f4bug@amsat.org>
References: <20210226093111.3865906-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a macro and definition to extract / check
the Special2 MUL opcode. Use it instead of the unnecessary
OPC__MXU_MUL macro.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9e875fa4a25..2d8ddbad112 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1464,7 +1464,6 @@ enum {
  */
 
 enum {
-    OPC__MXU_MUL     = 0x02,
     OPC_MXU__POOL00  = 0x03,
     OPC_MXU_D16MUL   = 0x08,
     OPC_MXU_D16MAC   = 0x0A,
@@ -25784,7 +25783,7 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-    if (opcode == OPC__MXU_MUL) {
+    if (MASK_SPECIAL2(insn) == OPC_MUL) {
         uint32_t  rs, rt, rd, op1;
 
         rs = extract32(insn, 21, 5);
-- 
2.26.2


