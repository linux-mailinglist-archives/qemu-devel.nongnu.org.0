Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43687362A8E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:46:48 +0200 (CEST)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXWIZ-0000k9-5J
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVde-00063x-25
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:30 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdK-0001i8-UQ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso3640508pjb.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwTGY29rJKdn3GggDiDCMT7mmPQzpwnC/ENztXM6VVY=;
 b=TZ924Yxc6dBCBVE/IrscPqnkeZuEYP7Q0zKoelhyezGh88pGfG65rVsuphPakjKkuu
 5QREu5N/1rXCynafPB0lLpxf2+06usO9DgzbWablmoOWd5PnhMba5cP6re9d9ne/L9/y
 +TBa/WSnF4FGEVy68zJDoASGcZqmb/wMPVQpkjpgqkHNaOSzeQUoTtuiYKEkdj/PJreE
 q/zTxhEeWCapmurz+p8csvnpUdfqH97G4WUAFQIX7gX84j6HxBr8yxa4xYlrLPt4fILb
 gfd6Ut6q2YEMAWWaVKR1oCJOy09fZHN8VIxWGb/GtD38O8r6fnzhjXaNO6QuVp/Y96fa
 myGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwTGY29rJKdn3GggDiDCMT7mmPQzpwnC/ENztXM6VVY=;
 b=uOy/zaCJJ4Ie3W3hov39hVBZQRtrIp3j3MBRAs4CtRqTIF0L3MiRKLFix/ptFSfyrA
 oI5XZEXTKPC8p1XUYCgCCngFIV3JLMENcNIHzIx387n2tdc1Tri2PPIUdfIvnCvDic0u
 ubVtqrohphNyCJjahMl6170EBPWLvzo7+qPMzD21T8sns1YN1zgyqmCcB4wU89Ctz9AC
 Z8meM4YnqUxdEmH8Fp11GZz97nYttA7wP17fXF+Z4H2hfIG2MVU2CR7SZqGu9u+QlXdj
 G0pOz97ynIGU8o+gIu3ohk11wFWn2IRIWjuj1X4xHCWnr6rTPdua6w32WDU4bJsj5cPa
 9IWw==
X-Gm-Message-State: AOAM530thSMWIPSm/wRTgXQm4VYJHD6KqwsWVqN/zffhItISVYtaq6uA
 fBZEYjbBtwRZEUe7lHUl0nSW/RkI6hO8yw==
X-Google-Smtp-Source: ABdhPJwUGJwEch6GlqdgMObY+kLd2YgPJ7ulhkFRgsr6GqxgtpSGpR1zMRhPlkQPw5z5/DJvoLT5OQ==
X-Received: by 2002:a17:90a:b10a:: with SMTP id
 z10mr11554023pjq.161.1618607044519; 
 Fri, 16 Apr 2021 14:04:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 53/81] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Fri, 16 Apr 2021 14:02:12 -0700
Message-Id: <20210416210240.1591291-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 65cb0a2206..9bfaf737b7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -783,6 +783,14 @@ SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
+MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
+MLA_zzxz_d      01000100 11 1 ..... 000010 ..... .....   @rrxr_1 esz=3
+MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
+MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
+MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0de8445fb4..25dadabe28 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,29 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, fn);
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_ool(s, a, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1


