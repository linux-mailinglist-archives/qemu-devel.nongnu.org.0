Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69CA663117
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRj-0002yz-1M; Mon, 09 Jan 2023 15:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRg-0002we-L4
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:36 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRe-0007Ub-R6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:36 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c6so10776674pls.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aRf7w7ZOWvevd8ePH3+KPSTGXAG+AAapDCGBGEQxlrc=;
 b=xoiuMtacu9k4LjMvi3YLdD8bBA0wLlJKFxO/nkEG2CacRpPbaMOTVh0eo+g20nNGn1
 o3eCKj9siNiq37NfnYyvKJzWEHV8ztTCsqb2U0OAKPqZm4LJBULNu7J5hXzchmZgS/AL
 oJPP+BENtGu1wQeX75Ha0c8kx8LcSBuhxBF1zpwsAXsA6iCTnzWu3W4LC2FVE7N4LxyQ
 hmhju9Int6/71GaP5O6HcAkd/tz/kPArfyFhvBBaL0UXWcmblFgDDZjBBusKkI0Ccm6h
 hgcebP4YR53mLFul1/rg8xgKIHGwHGjDGSG/hetVLE3oBGaI2QB+pScHA9b7SWIV3oV4
 fcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aRf7w7ZOWvevd8ePH3+KPSTGXAG+AAapDCGBGEQxlrc=;
 b=Vb3q4PMTeCyISou2d9BNQvQdfagW7f0kKqqbixTLIeKIgb2JWJygxHiNxtbAY7G6wT
 N06LQYPDoqLXnnv8b6X3Tu0FMD6mR01f6fgdj40BwHuHV+aOmauojpWGWWXYMVNWt6P1
 BgbR//C4LKCnW4i5Rfox/camSx3/IDu9Zg1JjbRpnP9DJvV/0MVYt8lnydSyzyBrKeM+
 XLQKt96XUds0QoTcNlRymqImS5XHq7ViIPqYE0D2eFo3XZkx0FDFuAueXRobEcV7EmyU
 1jUgitVxZwpDF2cQS6fOMmRCld05AjslftvBIBC32CfF5wLwO+GkRM6/OyGjhrStuJhN
 8eYQ==
X-Gm-Message-State: AFqh2koCtcgumtPuN8yXPB2KXm0Hdvs+Sr7h8PNwIOjpFd8DWk+4BuTm
 8OTIVZkjGjkfjfAF7MyvxZhHVwTvbOmhjqV3
X-Google-Smtp-Source: AMrXdXsntYDblkbVoLm9CrZpYJ0nI6L6vhb0qKTPUIWCgiZYFBjMsL6K/TzFjCqzmnPP69+Ou0U3mQ==
X-Received: by 2002:a17:90a:5889:b0:226:79:41dd with SMTP id
 j9-20020a17090a588900b00226007941ddmr48209394pji.0.1673294913099; 
 Mon, 09 Jan 2023 12:08:33 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 10/27] target/s390x: Use gen_psw_addr_disp in
 pc_to_link_info
Date: Mon,  9 Jan 2023 12:08:02 -0800
Message-Id: <20230109200819.3916395-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is slightly more complicated than a straight displacement
for 31 and 24-bit modes.  Dont bother with a cant-happen assert.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index fadb87ad4a..05a11df00e 100644
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


