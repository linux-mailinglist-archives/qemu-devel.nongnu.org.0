Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C431E109
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:07:38 +0100 (CET)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU2r-0002Ka-Nl
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMk-0001gP-Oz
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:06 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMj-0007hf-8k
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:06 -0500
Received: by mail-pl1-x636.google.com with SMTP id b8so8024547plh.12
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=bpVKQ7nFpDPtF/vbRh9rUCFcgMaVM9QFdkIYXFtJpDV2zo5SzWM+EcIMnYO8F9wy3l
 waEpRYSceX13hr0yUu2QeBoZz+paunI6kGtA0ljoldmL9VFJQxN0rKzg+T0ziQdBLW7B
 oJuLBJr7jFrqoxaH5LIcRfl6qed+vDy3yerBEXAw/nKuboFFWOtqLWFTLCUAn4ObVeDc
 wAxpr4y3CYnVqu+n3KxVI3QsOeG228mkYUEwv5SbqjqY/2DCsHEXjdQSPu3uqxR2VmMu
 csjgF4kbd4jt3u9MAVWsWaTSCT+vVvt2dEjkZjg1d8png/wD74B43gD6QKaKjyRSSX6p
 lbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=EjYoYnMoFe0oFHplGGNMxZZjDxgAo1XRHIx9ssRK5K2du8b2J3oTdVonPErst2N7hX
 Izto0KiHF38yQo79vfBeQkSSuWWoP10Ouz3b1T5xNHI0TYWIm13voz5YvR3lWBOedOT8
 pnhYnH/SYsuLkbXNAVdJUqqLiggef43amwFM4I53e9IZgmw32v48Lp2SA9AraJO+G2HN
 8R0M1Lphi7ClsEZQTfoBHAabRd3sHf3AUtPy7nfPkU6qrNTvHFd/9tzKib3+fxZvyXR7
 HieexK0GXlJcd6qlnLSTYZmIWwDpgN9Wds4L6sTW1KLTGD9LDhc5BaubPB2cLdhV5NQX
 0NHA==
X-Gm-Message-State: AOAM532vFI9Djq01RV2MGXFnner14YwA285r7HqRNeOfz5qQ+ONXj92O
 YK0P0raImBj2r4MtXVYcp7xpfJweeP0eJg==
X-Google-Smtp-Source: ABdhPJw36xB+YxVcT8WDOlTE+Xz7u9OI12pH3q1QemRVOV1GvwyTOTj3AIg3pAkkqzRvuaOYumwd5g==
X-Received: by 2002:a17:902:ba92:b029:e3:8358:34c5 with SMTP id
 k18-20020a170902ba92b02900e3835834c5mr970366pls.9.1613593443957; 
 Wed, 17 Feb 2021 12:24:03 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 55/71] tcg/tci: Split out tcg_out_op_v
Date: Wed, 17 Feb 2021 12:20:20 -0800
Message-Id: <20210217202036.1724901-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
 tcg/tci/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f93772f01f..eeafec6d44 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -303,6 +303,15 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -587,8 +596,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                        const int *const_args)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_op_p(s, opc, (void *)args[0]);
@@ -725,8 +732,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_mb:
-        tcg_out_op_t(s, opc);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_v(s, opc);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-- 
2.25.1


