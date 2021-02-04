Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0602D30EA5D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:44:44 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UdO-00058f-LU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tk4-0006Lv-94
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:32 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjx-0004Dm-Ht
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:31 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u11so866453plg.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=v7FDmm9PK6r3qBZgy7298sJ2lMbc/wxaFsnlDPCQ92y3+dQbR+rVKtIVCRCI2LBS4m
 OjRaVllh/bMBalUUhvYjElMtQqQ4VKaAQLGkHeZW5wPiPzlY3AK1RfLgMpJDbt63J3wH
 1uOVRGhredUULV6iKqmpEA1wFUzbU2S/YF6kxzRcLmflKuQARmlwXnYwhAimjwBSrHuz
 /SCgOKhKk2wmqxI3IIvZC/ZH4L0v5jGJ4hSu+b7yObbuvZD4EXK3DB6qD/yTi7XDZG9s
 ML2mLMVSVCAMJdbi1eRhTNs2PMsdZ8lShbEn5tCoQVZ2s5NBnD8lCknfkf2Tj275mHGC
 MgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=j/qBRFLsnOniPxxTluEttLveWlBSbWVeqYat4NNzJAjupqHO1M4i7OF1P7U8jLJvl/
 hxt9uH3mZvQsL0StoCyKvvKLrWqlwvHL90pmQQCbo3R6bllOWReuAKTc3VOEVsWMcdVt
 CSkxV5CE+2qReAJSSOUtqojg2fSys2h4NRezE2euTXtxeTVP6ytvdexdgqIZtlpY+hzg
 kw45VvTabntdkdMr2WlvCswHZzpdxIq4hHHHNNy4+PxmweD0JZSzAefAQC6E7/fLWS5u
 fjTiDDg6M1nR1XrcVrZCeOm0dahZD055Mh2QNWCgN1Ymu/XZ/KjExXbeZO05FdOZMiBq
 TpYw==
X-Gm-Message-State: AOAM532yNvjUWsRCk0KqCV32SQ9YtaE/uHv2Dd0+eoeFIr0Bx2o65WNQ
 dMes1aS49Twx9Y8M8YbI1Flo1pUKyPX7xS/c
X-Google-Smtp-Source: ABdhPJxHsXiosF3tszZVspZEJn4x4+ap1wDoBJRKbBwgUaPymFgRAzpAVuIblBYA9iOmFEuCfNR+tw==
X-Received: by 2002:a17:90a:43a7:: with SMTP id
 r36mr6034348pjg.189.1612403242597; 
 Wed, 03 Feb 2021 17:47:22 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 76/93] tcg/tci: Split out tcg_out_op_rrrrrr
Date: Wed,  3 Feb 2021 15:44:52 -1000
Message-Id: <20210204014509.882821-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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


