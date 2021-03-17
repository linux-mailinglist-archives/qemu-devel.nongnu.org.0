Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD333F496
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:52:11 +0100 (CET)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYSw-0004lI-C0
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCl-0005JP-Gn
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:29 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCa-0007GV-CM
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:27 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 l23-20020a05683004b7b02901b529d1a2fdso2165509otd.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UFZDBPNZimSsuOkOL2L2r1QFDi95/PNPigtssncfrr4=;
 b=jlEjw0VMMkpVAWoLG/bA+1bUqN365wphMPq5S91N8avLkosIxT8IOETIdmLK1jbi6b
 Qvg8P471eWno/yg7+CRZL5ROWafk28c8VSmUpsLR3FMxPYKg2F272Nf18Ga0H9FNhkw4
 W5/7yRVor60tBX0Uf5Mlqh+z5Vw/GvZN3v0xgIR+6rY+j0gaCM6yhCRlv2ytaZxnpaFP
 OwBQm+839W38Ln02d0yJ/B2sGlF9G6+FWca7UZDJXNZQfPpwcrp/q+J/SQYb9mm1EUSV
 MstrM3gO7lUdqVAEGbPMD/QDU3cIwRLYeQlwxX8k7Lr6262Dh0txGK9/Bxzg9buJo4r5
 e6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UFZDBPNZimSsuOkOL2L2r1QFDi95/PNPigtssncfrr4=;
 b=AUFiRetztrDFOVA8ck6Csaa116pYV0fC10sv/kX3VmMFX9L7IfksfZNxAmWDfQmajb
 IAohqYVQZEL9q0Ged9pSgUWspvk97iru+XXuUbTIFRaiM+6rG8Z+YMsTEmpJbzNRzQVo
 LO529ZguVtN0eZe5Wqfw6XlmnM6ElshMjYh0KPEn7Ajzd1CSrJcHIKv6RNy/8Ynzp07z
 T/uL1ApeaccoqhNbbh5+WNlMU//66n2xrhaWnO6ppPx5xW3m8Az1thVOk5j5ZSW9yQ5z
 V3Vmcb4o+2Gs7eufJo8yn4uDKW8gWH/hwZZZI2cBuzHZCT+ETZRhdysDOPBiqmkyJ4+k
 cyNg==
X-Gm-Message-State: AOAM531eg/QS75vnHPoDSAH+AMdXHBaysvhoSTR7xhXxX9HdY3xMoP0p
 Najm7Fs6KNAMt3BUv651KXK7HeGV7bpf3LDS
X-Google-Smtp-Source: ABdhPJwidl0NliNLryR1WoVVCWcC/7SAav8yJTd0oKfdaVYh5mWGzyBgeisjWby+4258pNxpFk5Heg==
X-Received: by 2002:a9d:370:: with SMTP id 103mr3750181otv.232.1615995314410; 
 Wed, 17 Mar 2021 08:35:14 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/38] tcg/tci: Split out tcg_out_op_rrrc
Date: Wed, 17 Mar 2021 09:34:34 -0600
Message-Id: <20210317153444.310566-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 3320ec1088..d4207818cf 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -355,6 +355,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, c3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
@@ -454,12 +468,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(setcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrc(s, opc, args[0], args[1], args[2], args[3]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


