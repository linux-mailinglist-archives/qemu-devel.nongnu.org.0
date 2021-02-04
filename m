Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868230EA66
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:47:15 +0100 (CET)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ufq-0000VD-KB
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tk5-0006Ne-3N
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:33 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjz-0004E8-GX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:32 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m6so1089776pfk.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=yDp2QiqP+EutfIOic0KaJkm3rUDj7VZmbCacPw3oSw0GkkOq84BIyWCW79KhDbd17E
 kdGXa0vfDi8p3Yu7mB7QsvOAPIT/tyOKoTGGbCAjkmfnAHJi05QWHIqR6GvxNmf9cJQx
 2vZn1/C4M86h2HLLGoMoQplV/aiI4PD6NsOc6vdQK7mOci9K3+EdqqBAz6Yiuj8HNADT
 d/4CoonQixRj4ZmYVFpPNXlKjatjqb9ZQKtGX7b5U1y++Cr5j/tkzYFcH0DSBYi5qEdY
 VRyWHKW7cd+/R+5x95M7jHp4hNjkrY85kjfHMbwj1F56vbtpvigRoIWM4NW3cYlZr9+r
 bSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=H7kstULMa+NvEGu7BwIV1M4Sp2gklP+akfIUtFdtzwGr6EcFrt6q+bJxhkUoGA61bL
 l8NPISIIK+XM5jmO73PrLlSBnCcdcdHLaH1q54QK53FcG2XWIF+DGwB4YeQBNwp2mV1J
 r5MplRzIR+AxxrxgG86KaajFZ3qKx0QFS6NKljGN0if6Bg3vNqooSzHxr6wYptvPTKkF
 VSud2r/quJ45X2rAdYODRxBGGN3dYjpQiAIUyOOA1Ag6jXQ4cleZTl86TQqzVcL6DH2H
 b3i7vi1KMw1poyvFkrzRKiZxWI4JFIi6IwqCovPNVA+isxeaRSrecBHmAUhHvEHr3e/w
 LN+Q==
X-Gm-Message-State: AOAM532Ebk0dOwtJfyqwqG5ZKmOE1lqDjZGkivpd5jF9bV4DgEawZY86
 jNhRQFS4/3kAkN+6WfDv+LO8ZRu2Co2gWvni
X-Google-Smtp-Source: ABdhPJxmOtm3mR9A7PmhHbLuPJ5LS0x09RaE9yzD/agYC0CUBmwNrp3iNZjb0d2Mv5iyzTG/laOwqA==
X-Received: by 2002:a62:7883:0:b029:1b6:8641:1fb2 with SMTP id
 t125-20020a6278830000b02901b686411fb2mr5724848pfc.10.1612403245623; 
 Wed, 03 Feb 2021 17:47:25 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 78/93] tcg/tci: Split out tcg_out_op_rrrrcl
Date: Wed,  3 Feb 2021 15:44:54 -1000
Message-Id: <20210204014509.882821-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c2bbd85130..fb4aacaca3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -399,6 +399,23 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
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


