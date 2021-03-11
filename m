Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B94337682
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:08:45 +0100 (CET)
Received: from localhost ([::1]:50926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMvc-00025N-1j
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVJ-00040x-IB
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:33 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVD-0006r4-3G
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:33 -0500
Received: by mail-qk1-x731.google.com with SMTP id t4so20837627qkp.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=tJwvSENXfrQRrZ8UA2FCvtI8YpUn6s52jZ5OjF9+sof/kWpOkTcRkMOvFxljP57S8S
 SKbfA0Etd38nMvfD4cA8HqhdmsI/HjX1MA95UircdeUBd5ehcq9SYOdAH+NVivjhrgUw
 BRvsUYPtYcaQaaTiwKbUvQBmiD+xpiSMLSA7ySIfZSgbZjV7ZRvcvHcfk09J7lauLC/h
 n3R1EGNDvPqWCr1omMZ3dsTBVARVZiDHy1z6JH/mGchOdH17ceb8n+J9E3mAIs4Z5pm7
 MYLkPYtH/zRIYSPNzwlxHYP0h23VpMA5ubjPlhoQfPBhtS0bS65jbg9mFG2Mkf7Iy24T
 ZPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=mtJGBs+HD6TIGhnu5OWU5boTSYRMnTIy64yKbIiR7wJ5vkN5JrDozAihZp5TZPNpLN
 V8Djtn3Irf31+k3er5tSFhO97e39qcayuFGu/01GA6bsX0qwzSG7i7ydK+U6+If/xQeH
 ehyjxFnhizZd7EDrFZJswCI2BQOUlJHkQd2m25hvHnu7xoilKxG1uycIe5EHcAMYzVyx
 j/AkO1YOoadnO6snCwnmPOmO81XZqR2KM8vd+1wo9YqUoPVvLKRXF+CxBnrpbmRECTQx
 FsCpT+QqyJAN+1PYNwM7lKS2gu1+Qb0z4IZStBgoBkzEZRv3oskInpJl0JG4uztBBj+9
 ba3w==
X-Gm-Message-State: AOAM532yErjwOJVSjmBDAiHD8B5UXoiRsb+NqQK/AIFdkPOQzqgQ9uir
 I2wcnnQz8Dr+OejareaDtOhe/8tGjATroOyK
X-Google-Smtp-Source: ABdhPJx4vFZpFBx8TvhM+9BEcQbsd7CECA4BJjvMVTnAjuswHP0TLetiIMFTRY4cARpEwYY+XelwEQ==
X-Received: by 2002:a05:620a:914:: with SMTP id
 v20mr7976624qkv.140.1615473685676; 
 Thu, 11 Mar 2021 06:41:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 40/57] tcg/tci: Split out tcg_out_op_v
Date: Thu, 11 Mar 2021 08:39:41 -0600
Message-Id: <20210311143958.562625-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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


