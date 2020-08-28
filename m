Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9452B2557BE
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 11:35:31 +0200 (CEST)
Received: from localhost ([::1]:49028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBanC-0000ah-G7
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 05:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBacw-0005J7-Se
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 05:24:54 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBacv-0004Nh-4c
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 05:24:54 -0400
Received: by mail-wr1-x444.google.com with SMTP id c15so615344wrs.11
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1GW3BI84GCmZiidHdtmgkWqzo7OaqNiSAAg4HT9cbzU=;
 b=jcPi86bhNYqaDP0XAUPH1mRiUYN7lK3NJCaukD42n5wXAAVl4AYgRgr/MFfPjFDCoC
 QYe6bseM4pMuRTxVtlQ9ujZ4HEcwRmY7PQHdegUwj5LN8grMgTzvoZbCeFPVhGojNSfk
 q0sjdK07Bvtih/HSyUkDB6WTx7ainJhIQJqFft18+sYHlogmTkBZkyoUe+4Ele9DPDtm
 UNj9xuaTOtMPfQiNxyT6THDZBnnEGi3MCcDP+FZKg5fFsy8aUQVljLSZA8KLtJnAPrhJ
 tMuBrLo1qPhQjdhZteb0Dzg7AyF7KXzX4Px/7aLhMBEAGnfeQntg4Ryk6LdQan+Kt1pX
 sUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GW3BI84GCmZiidHdtmgkWqzo7OaqNiSAAg4HT9cbzU=;
 b=Oy4X62pATUtvPF2e2Z1/mhlI3Qbic9lvZ+kC7ZWahFMqPw/myMKJ2u62sX8VEXdHGw
 BvO+fMsYCdwmwpoR4kxMuyfaWBXSEW2Zp8V97pi3FENgBwuxHn4cQYu2VSnRxYb3udLK
 1Pux1lKGtpKFHHZLbJVCF1I88ZXoK7tf0VaTLqozGl10a9mtNy2l8TCrij1xNSOoRVya
 8dH1kZlD9S9x123hjteYLLEOpl6vzuYi9q2cKrGvXX85fdTCly+RqyXC0TUHngCU5VhB
 ZRqfCanOvzYjvzzVxPzoLkMeYTYQHvwn2V1auAnXgOGd7Rp4l3qfhIbgy75vioXIyD3Z
 MxNQ==
X-Gm-Message-State: AOAM532KnEnFBB2iQA6Sdpcil5JO+Hn/wM+Tu9x9FM4vXkkJOpknqLgb
 7RxuSPKsYsAo76DuuDZnUp+Ao7jh38f3YhV8
X-Google-Smtp-Source: ABdhPJwCxzv9LUJp1zfWlygc2rmUqngJYuV29PJNbWOOjouaBhekR6DDUFTY1zp+PvMnV60CcJLDCQ==
X-Received: by 2002:adf:ee06:: with SMTP id y6mr615310wrn.225.1598606691574;
 Fri, 28 Aug 2020 02:24:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t13sm912304wru.65.2020.08.28.02.24.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 02:24:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/35] target/arm: Split out gen_gvec_ool_zz
Date: Fri, 28 Aug 2020 10:24:08 +0100
Message-Id: <20200828092413.22206-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828092413.22206-1-peter.maydell@linaro.org>
References: <20200828092413.22206-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20200815013145.539409-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0d5bcf6c1ed..15ad6c7d323 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -142,6 +142,16 @@ static int pred_gvec_reg_size(DisasContext *s)
     return size_for_gvec(pred_full_reg_size(s));
 }
 
+/* Invoke an out-of-line helper on 2 Zregs. */
+static void gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
+                            int rd, int rn, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs. */
 static void gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int rm, int data)
@@ -995,10 +1005,7 @@ static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a)
         return false;
     }
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vsz, vsz, 0, fns[a->esz]);
+        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
     }
     return true;
 }
@@ -2050,10 +2057,7 @@ static bool trans_REV_v(DisasContext *s, arg_rr_esz *a)
     };
 
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vsz, vsz, 0, fns[a->esz]);
+        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
     }
     return true;
 }
-- 
2.20.1


