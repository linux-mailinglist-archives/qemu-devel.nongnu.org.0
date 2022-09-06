Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258C5AE64F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:14:30 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWXE-0005cq-Ra
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeh-0003Nz-J6
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeX-0005Am-Ph
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:07 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t14so7410003wrx.8
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LsDZbHydcTU+7tcU++exijoc1WAx3468SMsmfORvMzo=;
 b=fFPIr6sh8d1QYYMkT/KaALOSqq+yXmkto0lyVXM199YguOhqGu7yFnIIYmKb49oQeP
 dCpQsq55fKP+QVCDju+asWAXGqT7sge6JgTpF6LwA7AHRIdLmzpC7QWQtEOkvbtUcFsp
 Y9UD2J6cQ9jSx0hSHcERwZVxkkpAqn7jKEGxtAzvaPTJg8UdLGCf9Vv0iwYsf4cHt7Pe
 20q6oU2J6C2W2yIgAHSz01cS0KjmMbr/ybiXuCmsNFhzydixlmeR8HSRdTQqvO9CY3ld
 5S9o2TGQVRCIIsfuEE8+56s6UVj60Nsg83E0LLqMgEXiUul+i5/Kw4D7WJUYMLzw5VVZ
 epkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LsDZbHydcTU+7tcU++exijoc1WAx3468SMsmfORvMzo=;
 b=zNGE1wT2vdXbp4Jj52VhoV8JHg0tYuOY+uCGlmX3+vJTDc07WWhOgR0dC1t20jOh3z
 Q7cTz+pCVE1DjgHoA8Xw10NUYTz3e0v8QkzqQKn0U/JqMinEGdCMfuy5fAtsl9/YQWfP
 ++Bgl/uFWlb+XQw1VLgp++DLpSbJuK4VPNHVxehYl+4L9kD/f1OJnT/oi42c5a3J8t3U
 EuRlY0LPdt54xeyYtMbKp+7/pWjxdXDxXHOd8lbpozorZFOaDwotLEn8hDhBxE3j6zvt
 pwjIBI5IadQxA7EUcmrP/UCet+HXZyMUgpVWYSzlvnqRHrm3Z4ebPTpue1i0ZX/g0aZB
 dZ0A==
X-Gm-Message-State: ACgBeo2fprl/3WDNzlEatE3WfvUC1dx4J95Oh31tAJBGT40/7C3ii5YX
 Wr4Kjt40nnaBYGpBf0ZwGx1QAo2qtKH/roSl
X-Google-Smtp-Source: AA6agR6KdxG1xTA0foB1Lz3YH8GxGqayTl3p5D9SPB31/tsRUy3C2sBEU6+0JxPtTyt6UO/CtiCkPA==
X-Received: by 2002:a05:6000:78b:b0:226:d10f:1c3 with SMTP id
 bu11-20020a056000078b00b00226d10f01c3mr25551902wrb.149.1662459476945; 
 Tue, 06 Sep 2022 03:17:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 08/26] target/s390x: Use gen_psw_addr_disp in
 pc_to_link_info
Date: Tue,  6 Sep 2022 11:17:29 +0100
Message-Id: <20220906101747.344559-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is slightly more complicated that a straight displacement
for 31 and 24-bit modes.  Dont bother with a cant-happen assert.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 7c98a72ddd..4c3ea958d7 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -176,17 +176,20 @@ static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
 
 static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
 {
-    uint64_t pc = s->pc_tmp;
+    TCGv_i64 tmp;
 
-    if (s->base.tb->flags & FLAG_MASK_32) {
-        if (s->base.tb->flags & FLAG_MASK_64) {
-            tcg_gen_movi_i64(out, pc);
-            return;
-        }
-        pc |= 0x80000000;
+    if (s->base.tb->flags & FLAG_MASK_64) {
+        gen_psw_addr_disp(s, out, s->ilen);
+        return;
     }
-    assert(!(s->base.tb->flags & FLAG_MASK_64));
-    tcg_gen_deposit_i64(out, out, tcg_constant_i64(pc), 0, 32);
+
+    tmp = tcg_temp_new_i64();
+    gen_psw_addr_disp(s, tmp, s->ilen);
+    if (s->base.tb->flags & FLAG_MASK_32) {
+        tcg_gen_ori_i64(tmp, tmp, 0x80000000);
+    }
+    tcg_gen_deposit_i64(out, out, tmp, 0, 32);
+    tcg_temp_free_i64(tmp);
 }
 
 static TCGv_i64 psw_addr;
-- 
2.34.1


