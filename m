Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D0F33763F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:56:19 +0100 (CET)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMja-0007Oi-Fr
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUo-0003pT-44
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:02 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:35041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUc-0006ec-W2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:01 -0500
Received: by mail-qk1-x72b.google.com with SMTP id d20so20806656qkc.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=dHjXLFtsfSVTex5WpfJPI3x5pVOeSGKyKuwnXW/qT5RRTddWfSxZHC/kvJHpViGoSP
 PpcqQqriAMgk9X2yRki4g5hD7V3yqgzpAHnLfPgvJG0NBP+SM4Qf8rrZF5cYrCKKct2P
 WqjILZmeaTdrteoysWTN+C1DT8lUo7VSc8J0w9/M/+Dcr1Fel/cxbTmVxsWlS03amMUw
 bYPLrg3E/UwpdFoDP+dVQ2Bs4OzX2WhCuOWdJrO0ywhPvqttH6GqFFt3iTIXxuflv1lb
 YMvKw8qDbdmpMrTAJsr/eEkhs+MvDHry2TOhMQkJLTQYbanPXLJ9XXIrcs+f1isv1JE9
 AfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=g+qoMdXc1S+J/FCZDkxI8zO1hisxQ9kYyUnHZXAyzBcVVKENAmjUy+VQaLdn+2/05f
 hnn8UUMs2jFXTcBXKo8iiec+f0L1Z3orfEciaUiupYnIWXeeL/0PMGtnc8CZtdm2dQqn
 DL5gL35v1c0az+VKuybvRSqt6UDUKdGkAxdsbfi2Mo+53GROdI+DfJCuvyRRIlyK5M6v
 2SM9Pi3OWejcNLXWYxFsKdEX0+mWKt54ryKyCELDYBfvVgLomZMY5wLNINSpcgBE25Fu
 3XgEXs7ONy2wWPeg3jdMrM7RknBlrpohHKgtosmgs1AGEs/C0T7IB1oCCm9NDEYwAL0b
 BLwg==
X-Gm-Message-State: AOAM533Vwmji8KwNVdx2O40xhNxe6GdOpsf/QQ8m+SPPQLjjfpRaMsnJ
 DXqPKjLONDVnsbP1FcVKKw9Y8Bs2vm4ePV0N
X-Google-Smtp-Source: ABdhPJwqjvjJ3pPPi1KMZLDFfo5kuK1Z+jujRrk2v6zZWZbmbuozNgR89ljIpE/4u+sknRmNQ+Dqbw==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr8108972qkj.382.1615473650093; 
 Thu, 11 Mar 2021 06:40:50 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 36/57] tcg/tci: Split out tcg_out_op_rrrrrr
Date: Thu, 11 Mar 2021 08:39:37 -0600
Message-Id: <20210311143958.562625-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8cc63124d4..f7595fbd65 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -401,6 +401,23 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
 
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
+
+static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2,
+                              TCGReg r3, TCGReg r4, TCGReg r5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out_r(s, r4);
+    tcg_out_r(s, r5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
 #endif
 
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
@@ -601,14 +618,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out_r(s, args[4]);
-        tcg_out_r(s, args[5]);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
         tcg_out_op_t(s, opc);
-- 
2.25.1


