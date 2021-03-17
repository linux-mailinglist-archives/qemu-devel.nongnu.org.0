Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61C933F4C1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:56:54 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYXV-0003ef-ML
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCp-0005N4-Hh
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:32 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:37850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCf-0007Iy-CM
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:31 -0400
Received: by mail-oi1-x22f.google.com with SMTP id u198so37226696oia.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACE1sMT8wY4iUN+EqRzW5k07GACFzZCdY0lH0VS72yo=;
 b=fUEvKG6aAEMjtm9GaEPWzq9fpbo/JJKWgrX301eFWv9n8h9SSnkcywja4V76ElfnJp
 gjiI1az1tGunOArtxVCnPZQM7eo8kj6o1WncgX03AAeWHb0JXbNmVRvKx3+Qe1VoXgiv
 BdvH1wjx8uGL1aOIurIjCHNremP6HTdapwAFqA3RtoGD8jwGCi7ZX09BlE2nX6jKkHy/
 MSMu3ZzztEJNq+Ah/SD7Csey1t6/DV+WdJXAmkddxC/yEbeWIw0+z6xA0tPYsMQBZl7N
 sR0Frezvs+L15lNNI0WjHu8wvsJuNeDrkyIOUAJJOFTGhkrPjcluzNwLlFLvMJCoZqzP
 whHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACE1sMT8wY4iUN+EqRzW5k07GACFzZCdY0lH0VS72yo=;
 b=Gk93iELJFPyf0CAVlhDNTvx11bXkC/FXv7IPh1SEoYXDottfw7rc+QodSJJwwgtw8w
 BZ6iF2WJqyVWo7pfM2Q5KXrNe36pnOB8XfD2KiWRkObWB03Kke3Dg8A5wiaOFTAQtyyi
 VdV6WIMOUFVq2S89oUiF+a1jbQ1ZMf9prjG1jNBXks/fErD/wTy1rGZagXFF2roLLYDA
 elVC0B5f672nhq7sZvNGGiKd2++pW0u6i7nAdHUXUkNdzjqZlqKDPMYSeSrzdWaldXuO
 SrYkMbPk6vE3f5dCWUEPTPHBeWeJMtyWFfET5ykjYCbNRijOQOItBPHEyXnO0ydsmI/s
 gbpg==
X-Gm-Message-State: AOAM531SCjwUuVCHmR02rPumY+QwPP7g3LjfABkKjINZAznw2DvSRtOC
 vJadHeSNU+lvVD/C0ExfWs1YH7Weg3wGJQRZ
X-Google-Smtp-Source: ABdhPJz2wmNo/5DUrTSCmRydaZswCrVhEXxE1JUprUF79YxBuE8U2EdPuiJe4EfdoeCWfARJzmWIZA==
X-Received: by 2002:aca:3046:: with SMTP id w67mr3161043oiw.57.1615995320383; 
 Wed, 17 Mar 2021 08:35:20 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/38] tcg/tci: Split out tcg_out_op_rrrrcl
Date: Wed, 17 Mar 2021 09:34:40 -0600
Message-Id: <20210317153444.310566-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 1e98c73417..86b59179bb 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -413,6 +413,23 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrrcl(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3,
+                              TCGCond c4, TCGLabel *l5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out8(s, c4);
+    tci_out_label(s, l5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -636,14 +653,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                           args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out8(s, args[4]);           /* condition */
-        tci_out_label(s, arg_label(args[5]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrcl(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], arg_label(args[5]));
         break;
     case INDEX_op_mulu2_i32:
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
-- 
2.25.1


