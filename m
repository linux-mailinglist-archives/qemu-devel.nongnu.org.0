Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD6381EE3
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:53:38 +0200 (CEST)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGH3-0005A9-RL
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz2-0007Qf-K9
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:03 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFym-0007lr-WB
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:59 -0400
Received: by mail-qk1-x731.google.com with SMTP id v8so3337092qkv.1
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+0x8Nk29/SnfgdnKuRZIh8yPkErRHPxcHfxg3QL/Gg=;
 b=LPA5YcKgUCh9zKjzuuyyWY6g3BKz9NwEm4lR8lNfqCzbzkFzACdu9yN9Ckx3UhadrJ
 2T8oRVbfqPwz8ytg1+Fvsq0WdTWJDb78gydq1S0bMT9CDDFIeksKZxF6s0dw/WtopgqX
 Oxsz+VDvzcW/VzT0LYPoTrLCwBEwPQXS1dwLnjLDGt2+cXsLMFQfXdwIYrrpnzrj0qDc
 CzhQbfXG2i8WMNjFyVAZ3wcKgHUCQKPZxrHi2u4SQ4BS0oB6oMGeKxNv3HkbmXGA60b6
 xSujSmBiaBeJjURf+S0YsyvEi0vjC2vfAEh+IIuT/qpWA2IR/wAqX286CO9j9AqUth7L
 hJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h+0x8Nk29/SnfgdnKuRZIh8yPkErRHPxcHfxg3QL/Gg=;
 b=obIvsJtF5xlIWiPkPZT2bZXqfCV6BypUX+8lTBSItN0YJizDpDYOXb1g1dSKEzC5QA
 WfJbJdfWqHvYrf879AzWBbJM+k1IiiehrfxN5zlVx4BYvGeABs3+vmtkowCxMKiv6BM5
 OntLqBnHFKPer5YHX6HQsx9qgDBjFd68Xxr5QAfHAxdhUwfIi74vb7PIGGjwuNalT/C/
 QgrYIgkOHpGA1X20xhCmJkImD7gwOQwdfDVYmzePchi8ROjGibJ9VU4pWWwLueXXuQrm
 djBmEpxe8Lca3NLzxqBQmgMCDUTVe0hDhpkOPZ4l+ZmfdLAzAlijnGaMP+LK9qK+kxBf
 2JAw==
X-Gm-Message-State: AOAM532nq+pFFsbJDGkuyK/hAdUxOZhk6vuWneVOY0H0R924A1BRq4fs
 bYNpIdcUeW0CDQg7LIJe2LFmw5jyBAnZXnK3t6I=
X-Google-Smtp-Source: ABdhPJylEd+zFPEI65Hoijdt+Ws7cRp/unlSDH2UZgGDD6bBrjMNU4IQZJAb7cwfp1nwNTbwDV9Ihw==
X-Received: by 2002:a37:e10b:: with SMTP id c11mr51712383qkm.152.1621168483854; 
 Sun, 16 May 2021 05:34:43 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/46] target/mips: Set set_default_nan_mode with
 set_snan_bit_is_one
Date: Sun, 16 May 2021 07:33:58 -0500
Message-Id: <20210516123431.718318-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This behavior is currently hard-coded in parts_silence_nan,
but setting this bit properly will allow this to be cleaned up.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/fpu_helper.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index 1c2d6d35a7..ad1116e8c1 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -27,8 +27,14 @@ static inline void restore_flush_mode(CPUMIPSState *env)
 
 static inline void restore_snan_bit_mode(CPUMIPSState *env)
 {
-    set_snan_bit_is_one((env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) == 0,
-                        &env->active_fpu.fp_status);
+    bool nan2008 = env->active_fpu.fcr31 & (1 << FCR31_NAN2008);
+
+    /*
+     * With nan2008, SNaNs are silenced in the usual way.
+     * Before that, SNaNs are not silenced; default nans are produced.
+     */
+    set_snan_bit_is_one(!nan2008, &env->active_fpu.fp_status);
+    set_default_nan_mode(!nan2008, &env->active_fpu.fp_status);
 }
 
 static inline void restore_fp_status(CPUMIPSState *env)
-- 
2.25.1


