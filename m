Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7D5430158
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 10:57:11 +0200 (CEST)
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbfV8-0005kb-Tb
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSp-000434-EJ
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:54:47 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbfSl-0005JO-UN
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 04:54:47 -0400
Received: by mail-pf1-x435.google.com with SMTP id v8so6313156pfu.11
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JNRuPJRCcQRqPIYjRsxdxp2S24G0fTNG/5ailoIkAOA=;
 b=knixvliGovfClwtCf6zjrzj0WMFQWbQhmbTXaqefz+exS2sPsYC09ItWBYSHQHhVCO
 gHiZLu4IuSr3kpkeJ0F1Qf3Psa7m+G7EmU5cJs91TUK80mMeATKo1K3jGJ2GbNPHBtJj
 sQmV8Hn3RKH4MV6vyE0LafkzUsIWQ8j43DDZpqilNDYOm8zHXlP995ancm4KHnDq50BQ
 rOAsXeeETmXanPxsiO56xz5DXMVYS9EVDotcxpOIpK+fIbDORGr9EnEqYME403WWXY1N
 Csiu0mBATWzGGFB1wTrpVcsJchBiUx2aoYW/p6yr6RiKjfpbOLfcMaFlYcqHGvIGBx4A
 F2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JNRuPJRCcQRqPIYjRsxdxp2S24G0fTNG/5ailoIkAOA=;
 b=EMDP1ICNOAbnKBnSi/U2euP5aAtzFnemygLUMGlhzT90SIFRutC9y1sju9Qdbvv3rT
 ZLBBxaGFtQEAUgz3qbNBlkxE8RvHdTqI0dxPpeDLf1COJg/ysMZFswkomgTH0JUAKfik
 qcT9wJuLIFjy1VMygxy5jG1heWM9+y96DmCZIuO1iWJpoqpqrqsox0++mV62MHoORUxx
 5TwID+fwTNF/4hLMP8Hi2f4oQtoMhYsck2Ks9h3fn74bBeUbqTW6gGLOJ+9Tr4/i0cPw
 TV0T8JidzzguqgJU6gcVeqG9RN2ZrTryKOCdBCvD34jQ4369YOjkAD8683fPd51GZrmC
 Zw6A==
X-Gm-Message-State: AOAM531+wW+rz33W0ez1csUjUzNCL7ZMrgyJa7bPnLnYZODZEkyKcTnO
 RKmp709Bc6nMagEZZ7VaK0NQolTJD9jwAg==
X-Google-Smtp-Source: ABdhPJzmIkZyWRelk5ZYg1UwdJEnXobooU3vHoI6Ws8NEbcFRdYz2B2hG0guqakganrcRqMzTBqV9Q==
X-Received: by 2002:a63:7e45:: with SMTP id o5mr12921242pgn.445.1634374481609; 
 Sat, 16 Oct 2021 01:54:41 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id p3sm7028691pfb.205.2021.10.16.01.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 01:54:41 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 2/2] target/riscv: change the api for RVF/RVD fmin/fmax
Date: Sat, 16 Oct 2021 16:54:27 +0800
Message-Id: <20211016085428.3001501-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016085428.3001501-1-frank.chang@sifive.com>
References: <20211016085428.3001501-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chih-Min Chao <chihmin.chao@sifive.com>

The sNaN propagation behavior has been changed since
cd20cee7 in https://github.com/riscv/riscv-isa-manual.

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/fpu_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 8700516a14c..d62f4709002 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -174,14 +174,18 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float32_minnum(frs1, frs2, &env->fp_status) :
+                    float32_minimum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float32_maxnum(frs1, frs2, &env->fp_status) :
+                    float32_maximum_number(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
@@ -283,12 +287,16 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 
 uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_minnum(frs1, frs2, &env->fp_status);
+    return env->priv_ver < PRIV_VERSION_1_11_0 ?
+            float64_minnum(frs1, frs2, &env->fp_status) :
+            float64_minimum_number(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_maxnum(frs1, frs2, &env->fp_status);
+    return env->priv_ver < PRIV_VERSION_1_11_0 ?
+            float64_maxnum(frs1, frs2, &env->fp_status) :
+            float64_maximum_number(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
-- 
2.25.1


