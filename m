Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8F33F512
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:08:09 +0100 (CET)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYiO-0007qm-PJ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCn-0005JU-7H
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:29 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:41841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCb-0007Hv-RN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:28 -0400
Received: by mail-oi1-x22b.google.com with SMTP id y131so39323798oia.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8I1YCSoWNXxPVW6fLoHCz2kYQaXyDJJKMZjEFQ+AKY=;
 b=POpz4bqHnU5KMw4PyfEoYttsa+Bq6eTR/UvNRsGkD9mU71UtArGIbrw2FBDn/hB83Q
 Iz0CfAklbi3HQhPZ4xhXJEu8jVNgV0B5qvT+WzFmZMHugwYeITDi4pKPtuZiaEt9Hm0d
 fkR4K1YvNZy1UOc84QYPjTscaKzuQmbwT57zdSP+C2Zz/H3NlgJRW9ISBPbaLxWlki9z
 /a1/55DvY44SMjNkgVzlU2vGzZ02mKSNRpnCcwVzxHnMGIQ70d227bhUkko59pv6Tiq/
 Wr6tP19HNNpeg5zIbrKA/12ug+yr4ulhj8UzgUTfwd7FuvsUomLjWllzzMFyzX3ghhpZ
 Y1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8I1YCSoWNXxPVW6fLoHCz2kYQaXyDJJKMZjEFQ+AKY=;
 b=UUIaXXxQ6uqP+siakSA6zWHmV9D/LjUQNqGDR/M30Ikt0ISuSTjcoqk71wpLgwYN77
 oXhczYePS7aDx6NgFRfqV3SBcT2UOwtzZlBsIulrLHDcwj779WwgbfNLck2BvjLdCF3b
 8N7MucW7YlWcj2cTGLgOqrsSVMcSvi+S+S3wFdWVTaM3Z85R6um+dVItqMWHN7w551cn
 /eoIPqla+IKrrQfd8dw8dMBAJm+uAjXLz36K1uge9yceK+uFjSiTJ++qlsj52epDLaaR
 ja8xkH+9lupvnwnrY6EMHghdyXtiM9zKgq9aqpYZ9al1wDc+wZ2ZaQDY3bX7luA/oheD
 E4ow==
X-Gm-Message-State: AOAM530XBHNp6M1a8lBtSFSK8AZbdCEWDMY9lflHHiNm2K4H9hbGwxMh
 rwS3vr/deIfi8mttrykGqR20LRsrDoi5XMLE
X-Google-Smtp-Source: ABdhPJygihfYRwaKH83tztE9JDadaFCHiLZ71aBkArRVuspNyuyrqZZBZ40nA+zDLg9U8cphGnQFsw==
X-Received: by 2002:a05:6808:313:: with SMTP id
 i19mr3070662oie.67.1615995316393; 
 Wed, 17 Mar 2021 08:35:16 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/38] tcg/tci: Split out tcg_out_op_rrrbb
Date: Wed, 17 Mar 2021 09:34:36 -0600
Message-Id: <20210317153444.310566-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
 tcg/tci/tcg-target.c.inc | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8504e82e95..b153334dfb 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -369,6 +369,21 @@ static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
+                             TCGReg r1, TCGReg r2, uint8_t b3, uint8_t b4)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, b3);
+    tcg_out8(s, b4);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -538,7 +553,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-        tcg_out_op_t(s, opc);
         {
             TCGArg pos = args[3], len = args[4];
             TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
@@ -546,13 +560,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
             tcg_debug_assert(pos < max);
             tcg_debug_assert(pos + len <= max);
 
-            tcg_out_r(s, args[0]);
-            tcg_out_r(s, args[1]);
-            tcg_out_r(s, args[2]);
-            tcg_out8(s, pos);
-            tcg_out8(s, len);
+            tcg_out_op_rrrbb(s, opc, args[0], args[1], args[2], pos, len);
         }
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
         break;
 
     CASE_32_64(brcond)
-- 
2.25.1


