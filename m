Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C278839260C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:20:54 +0200 (CEST)
Received: from localhost ([::1]:57638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7Vt-0007Af-QR
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PW-0001as-J5
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:20 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PS-0007EO-64
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:18 -0400
Received: by mail-pf1-x431.google.com with SMTP id y15so2631392pfn.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=429j/OIChOskBqYFqhLITpYSTNdNJxwR8yKdtB0Ywow=;
 b=ksZi3UO1+nFo8q9UQUw5k8FwXBjFiZZmmLE6I9Qp/4lpFPqILBAqjnh8wgepYlAWui
 QFBXBViCQZWHHZ8oEAuF2dIdrxtWTHuuuCaMvTbKXgm/vLcG/X74JUPIV18AFrx2r4cG
 u3pKPSxvGIz2YVTl++Omf3dISI8GGkRPFDH2zHFKoCb6a8BOu45416RgdmZswuyRloIW
 m1NrtagjFWvLV0VCVTaoN4sPoD3VEj6y1mIeuJHm3pcUZmVp1PsXoe/BXerdMGSMn+D8
 K5MBC6Jq+YBcCnWqDquTMPC9Xk9A9AdZ/0eonZ05uWEK8T6Jxg7GTqtIIOzDHfvEpBu8
 bkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=429j/OIChOskBqYFqhLITpYSTNdNJxwR8yKdtB0Ywow=;
 b=gvrm4+YhDks13uZ474Jvoyys6YMrpGz+LiQEcWD3vGCky41iuhNWBx27AC4S1kfW/g
 pkLlG84iLU6bS5i5ATl9yyjKjvL+MyLDYScLWW9JRGrLsX9t3GcC+ORMgJuMiAAKNqog
 35+7fTIBEIEZISlIHokIrAGHUcovgdu5fdcqv2nhc76oSWGwaVvRBtk9TndPVTubI6Mb
 j5wSLhKbSexhptIW08qA1Gpzn0xkieuK3QYdfjdKzY70NuZ//gi1EnjvSeWMnUTMYdAT
 /PqcjOkSvIuuzj6ku4vzSVf6ElMi58mVLgXrUFCc3lJJ+U+zDWk0dCUGY3KbiDAlhbk1
 yEdA==
X-Gm-Message-State: AOAM530OEitPciwUwoGyryqlPj9cQ72HhSzp9AqOxBCKUwezkkYmXVxA
 5pc5k/gz7XLnjttUUi+GEiRfdZwtQuHYtg==
X-Google-Smtp-Source: ABdhPJzI/Nrh7AOLNlBK04bQx67SRKGd91Z2nLSf0MozBnf49Aq3pp0BlGCpqQNTaU/tccQ/1ta8jg==
X-Received: by 2002:a62:1d52:0:b029:2dd:ee:1439 with SMTP id
 d79-20020a621d520000b02902dd00ee1439mr1793832pfd.57.1622088852402; 
 Wed, 26 May 2021 21:14:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] target/mips: Do not check MSACSR_FS_MASK in
 update_msacsr
Date: Wed, 26 May 2021 21:14:04 -0700
Message-Id: <20210527041405.391567-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FS_MASK has already been taken into account with
restore_msa_fp_status.  The definition of iflush and
oflush is that we *have* flushed to zero.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 2f89abe166..ffe6e630ed 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -6225,8 +6225,7 @@ static int update_msacsr(CPUMIPSState *env, int action, int denormal)
     enable = GET_FP_ENABLE(env->active_tc.msacsr) | FP_UNIMPLEMENTED;
 
     /* Set Inexact (I) when flushing inputs to zero */
-    if ((ieee_exception_flags & float_flag_iflush_denormal) &&
-            (env->active_tc.msacsr & MSACSR_FS_MASK) != 0) {
+    if (ieee_exception_flags & float_flag_iflush_denormal) {
         if (action & CLEAR_IS_INEXACT) {
             mips_exception_flags &= ~FP_INEXACT;
         } else {
@@ -6235,8 +6234,7 @@ static int update_msacsr(CPUMIPSState *env, int action, int denormal)
     }
 
     /* Set Inexact (I) and Underflow (U) when flushing outputs to zero */
-    if ((ieee_exception_flags & float_flag_oflush_denormal) &&
-            (env->active_tc.msacsr & MSACSR_FS_MASK) != 0) {
+    if (ieee_exception_flags & float_flag_oflush_denormal) {
         mips_exception_flags |= FP_INEXACT;
         if (action & CLEAR_FS_UNDERFLOW) {
             mips_exception_flags &= ~FP_UNDERFLOW;
-- 
2.25.1


