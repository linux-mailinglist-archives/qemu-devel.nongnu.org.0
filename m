Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9C33F4A8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:53:53 +0100 (CET)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYUa-0008Qh-Jy
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCo-0005Kc-75
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:30 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCa-0007HT-VR
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:29 -0400
Received: by mail-oi1-x230.google.com with SMTP id y7so2814644oih.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPLK/1amd4KCcNjMbn3QSjoEMmr6k2cwNg1lkL3Tpg4=;
 b=t+IdojBik1RhrXBQHCnrcFbS7Lcb2ulww/8pJsvlJXpc4bA16swN7ujvzeRgY0+OLp
 duEgf9fxGnMvN9ekNDf+MKVDNRx90qo8WmnM9eTxuxPfeqgRngMCYtqPXt4XVahwJrhB
 zjX1/vb+R04i7BlLV1MjKetRSdr1UeU86i245pkkQGjcOeyuHgeu/B6JbtusHZpC5XXr
 wyEU0axOWvqMZKYVPOwqUCftVXW8gPTBqXKKP94p70bWRtK6kwBlmkQKvPP2kHNPKnQQ
 br3DCTtK6Ks+gTRGiR35ro0ZVoAT4E43mVAMtsqnTxD7mRhSgqDjMzs7p1umr+4U+gg6
 wWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPLK/1amd4KCcNjMbn3QSjoEMmr6k2cwNg1lkL3Tpg4=;
 b=kTNifMmOwHvdizjtkvBCARxAKxaDOJSJZMFrwWJ9b/DcTRcjmicKEOBvjRAUPyIRX8
 nj40mLymUh9cez0uY8jRfkIS/vPkI3A7nk2MZoyvZH1oHXZEdlv2Du0H+8zjwlOBvCp3
 vT3Isbbmf4Ww8xCN0JTZoTDB9kavdbxwnlQ/a/ifX4yzISYSYgeMmGVE3/Dz2/UCH9ir
 HWC70IuU+PTo3ggwjU8OXgc3N6P7Y8D0f6z8e58wnUSof3f8z9Ly1h82jJd7hncbuWYv
 nhsLMZb4taksFR+t0bCbD64x6m7PIZZVrg9Qx4NpzvuU31YAVsKhNn0h2mZWV0YayFmM
 OZ9g==
X-Gm-Message-State: AOAM533Y26C0x8SRNWdRJ7v0a4gebjjc3bwyJ+F+f2kRXjgVc6VxLJYJ
 jgRgrBRVOslmBWkwxMVgCEZEa+3gRj6R3UUi
X-Google-Smtp-Source: ABdhPJx+SROE5frbl3IE2QZkBIVC8H33kZqrOZoeNiaYQVcLBzrFP973m/LvTYNjBk++shHWQ3N+hA==
X-Received: by 2002:aca:1c18:: with SMTP id c24mr3098796oic.7.1615995315380;
 Wed, 17 Mar 2021 08:35:15 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/38] tcg/tci: Split out tcg_out_op_rrrrrc
Date: Wed, 17 Mar 2021 09:34:35 -0600
Message-Id: <20210317153444.310566-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 tcg/tci/tcg-target.c.inc | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index d4207818cf..8504e82e95 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -369,6 +369,25 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2,
+                              TCGReg r3, TCGReg r4, TCGCond c5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out_r(s, r4);
+    tcg_out8(s, c5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+#endif
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
@@ -473,15 +492,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
-        /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out_r(s, args[4]);
-        tcg_out8(s, args[5]);   /* condition */
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrrc(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], args[5]);
         break;
 #endif
 
-- 
2.25.1


