Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566BD324445
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:03:08 +0100 (CET)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzRD-0003eV-AX
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:03:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMF-0006rQ-NN
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:59 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzME-0002so-BF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w7so2682094wmb.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyX97rnCu0DJ6j05hLetfQh2Gc//wDyTV1nAcRxoU6Q=;
 b=TR1m8alkXSSWuh0ue70I80mRhl0mOiWP6wtnUgzIQJKi+vFbAyMQJccpHNfaBT9gf5
 LxyxWthTKkhMKSo0fSTFOxONFUjyHcX2AKOTAQgW+Q7dGEzkG+ZHNGpUchHfgiDIiDTh
 B7yXxxrtSqFN54KfdwW5TNLiscRJZ0gVqc6HQoLP7sdqAHJVRvlKxIAxD3kIIJGUN9Ik
 +/F4bLr8z7ILPlo+VQeNe1HI6Pk1aneqi8n5s7CZMA4fX0p0Nu6Dpvtanx2f0EjadSq7
 Ap0mBpKBXifpTE/XLoDSgczAfWMli5blK1TF5n9opRBw9f2ga2CWBRgGh9B4EWWZsd5b
 Vjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VyX97rnCu0DJ6j05hLetfQh2Gc//wDyTV1nAcRxoU6Q=;
 b=bcvmONCee8pqHfRR630aiPD81gYkBRKSNTbzIQ/PeYRzwIWKky4xAXQX5RTE3omYif
 CRhW+Upd/xIiigX+wazwRj0bAlpBCovx24IzPoPrRmFiW19rF2O49HpO84gIRg45unCU
 b5uC3k5JfLLYXe/qCYt5IYRHbEpXS2nS+b+F1aXGvpVQ4ahwrgLnnC3v0I/6qJBkagm0
 UMHdvPCJRUlgBDRK5Dax6a0a36O/fDzQ82MkYgXloHkNzOrR8DLCvlVM3ZEekcZGJcok
 iIBpopVMQTu1J55W3dUTuQjtUDJ1VQb18eIakO9WRYjytXQ0K0T+sRzmSoTqjSFTeAML
 R4Ow==
X-Gm-Message-State: AOAM532j19S9nU0Qs8fI6uDkzIQ/apMjGyleo42Ma/nwKUp6lSqS6/b4
 fJQaBStHPLoMP+hrZijei3NBCQxkl4Q=
X-Google-Smtp-Source: ABdhPJzN3WamSth++Vw6oDKZYpgaGMkGaL8Xt/2+n3dH5aN/TmWLoKHgrURHrOxioxebn4qxfeMqDQ==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr4980910wmr.179.1614193076703; 
 Wed, 24 Feb 2021 10:57:56 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 12sm4250050wmw.43.2021.02.24.10.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:57:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/12] target/mips: Use OPC_MUL instead of OPC__MXU_MUL
Date: Wed, 24 Feb 2021 19:57:01 +0100
Message-Id: <20210224185706.3293058-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Craig Janeczek <jancraig@amazon.com>,
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


