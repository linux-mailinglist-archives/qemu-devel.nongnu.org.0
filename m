Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB8931E101
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:06:22 +0100 (CET)
Received: from localhost ([::1]:37220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU1a-0000Wg-RL
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMf-0001Th-5c
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:01 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:33025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMd-0007fb-KJ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:00 -0500
Received: by mail-pj1-x102d.google.com with SMTP id lw17so2011222pjb.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=O8BkguewGhjyBqUnCwNI3syKsIfPV8R0wAVGgYLqiJsfDwZyvvr+AMrelGDYztirk8
 iYl/gW63qdLLV0KVSCuoJWpNuNKdvW0dgkftAPuRFn5ooT767lxX+GE09QoxryBolkod
 WDObfaZnI5nGITcX5iaO3m/ZAfjJIA2nlQXQePAMWHBMGrz5Ii2KbgfLFowoIDPMSqt+
 HN/aHVtkqxBgwwtHw2sTdf5TdkHJAl5Yl6nmD6+QcIUKTwFkS5u41eFN47yWoesBoNu7
 jdQpJgIRohY2czwDoguX2HFCYLw607CQkVm1uGMgpGN8PaiF6RGjW1ow2g+WBm4DBDYo
 pGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Muk10JaSTB/BV2ItdFkgjXJDIa6PJidFm2ztv5V4ygc=;
 b=gVWD0L7t9p9mU5+ncDN9A+MoyLA2Y5Ni0kkff0m+96jhZ++7y1JqlAgkJCR8K51ALn
 KPCxNNykONsQvhWdRZXdnTNaEILeuxf/Vd87I0glW/Ov2vm8sRwixY01dAhqt5HMb2dw
 Go10AWGcMaMdolbzM6pFSQjaEnOGD4Km67xuCZ8ubNiLovpIwwljQE0G4EgC4oAcOuXQ
 3w9SfJ1GgNYEX2SIDI58EYJQf/i4nLF3/plGBOviuPU5PbDzERq2d8YpxR9+4t/Z5tqR
 ywN9BpGRUDIoJfddkuTysIuPQsqrHWi+wnkUrBgcP+KKUzGshfQEyZZwdczP+4sfz4W6
 7ilQ==
X-Gm-Message-State: AOAM530bCxhT48zfyg0cT2uhmI5Kb2955poKCryLiYC+k9wVf0Zz7631
 FHut4pLnZUIVqlfpyTkTE2raQaMGwk8DMg==
X-Google-Smtp-Source: ABdhPJwh1ZvFZJBTXrkjYnPOVoIEE1t5fj0jaVdyiiW4pLxpAW1ZDDq6rPP9+perrhpn+6guA0jiCQ==
X-Received: by 2002:a17:90b:4a0d:: with SMTP id
 kk13mr526431pjb.7.1613593438462; 
 Wed, 17 Feb 2021 12:23:58 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 51/71] tcg/tci: Split out tcg_out_op_rrrrrr
Date: Wed, 17 Feb 2021 12:20:16 -0800
Message-Id: <20210217202036.1724901-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
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


