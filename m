Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699B390660
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:15:24 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZiF-0002hp-2n
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeS-0001kt-Sr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:24 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeK-0006hT-Uy
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id q25so5791953pfn.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v63kiMKs6E/Jl628TTWBVtvYw6v1ob0t2PY/usIP/Gs=;
 b=ZflE1+L1NNcpkfLFYw75f5nGBlGPIqN/rWJsGBF/2F9WoZsPZQ/EWGyaq1udZ8uCQe
 B4eMUSQu0n1hctcfBsUNt4FA5tHQadUplVsI15M1ejCgD2Tue+Zzj1/U95IsbQavWFGo
 Ut/xyi+vCGPshD8aQ1Rpl6D6eOobX1fYIiJ8JXEfK03L/S/DotD5goiuIgAiTNriIIal
 rmF4Pak2Vf/Ee+ajPsVKFEA03UBsQeJxd0ZO965whYA9HOCaQS3VIB11GY9p3OUQ3goN
 c/f1klnAjaVA9LoKUFpnftCL8etqfDaUkMNamBggUmZesVDOiDMCS8l0V6iPt4elYxz8
 Z4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v63kiMKs6E/Jl628TTWBVtvYw6v1ob0t2PY/usIP/Gs=;
 b=pRm3IkIvX7wu1FheAJf/7Drg8IFBIkbIJ28loR9EDiL7JTQO5SYHbV62bBk7adE26Z
 6c/iQW9ZYKLv5YZXOn435ityuWtJx9nEC8CS2/NQ1gHQncGtanh2e8UGI8Vex43PLVzT
 CHJBwBd1hHxol2RwynTMjLNd/UYmbRBCnefjS2SbANV95y73Q+M7mTUWjD40vKMYw5bg
 38iI9ibxlNC7U/35KBJtsOaJ9HuhLyjrJrtHhrDAEmtFNgewr1o3gsNCX0gErHDvQids
 jgmqlko8CMbgi410gPZyOo78hdJT1Y+bnlqgdTLye98UN/fQoMysX6xzNcbcBEZ/d5HJ
 wV+w==
X-Gm-Message-State: AOAM5303lXx/ztjIiKlE+0OQ32RehfDp+kksyXuutmbx5VAz7+8i7hMT
 4v96MO6M4NpQ65czZy/uH8dWZgJoc+Fsjw==
X-Google-Smtp-Source: ABdhPJyMJBvblkEShkdpkmW9GYNR+4pyeo7h+4dfBsJ08+ZgM6T08huUPdfO+zxifc9mo8dYIg4qzg==
X-Received: by 2002:a05:6a00:1c43:b029:2e4:d188:fe38 with SMTP id
 s3-20020a056a001c43b02902e4d188fe38mr23056270pfw.20.1621955235337; 
 Tue, 25 May 2021 08:07:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/28] tests/fp/fp-test: Reverse order of floatx80
 precision tests
Date: Tue, 25 May 2021 08:06:50 -0700
Message-Id: <20210525150706.294968-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many qemu softfloat will check floatx80_rounding_precision
even when berkeley testfloat will not.  So begin with
floatx80_precision_x, so that's the one we use
when !FUNC_EFF_ROUNDINGPRECISION.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/fp/fp-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 1be3a9788a..352dd71c44 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -963,16 +963,16 @@ static void QEMU_NORETURN run_test(void)
             verCases_usesExact = !!(attrs & FUNC_ARG_EXACT);
 
             for (k = 0; k < 3; k++) {
-                FloatX80RoundPrec qsf_prec80 = floatx80_precision_s;
-                int prec80 = 32;
+                FloatX80RoundPrec qsf_prec80 = floatx80_precision_x;
+                int prec80 = 80;
                 int l;
 
                 if (k == 1) {
                     prec80 = 64;
                     qsf_prec80 = floatx80_precision_d;
                 } else if (k == 2) {
-                    prec80 = 80;
-                    qsf_prec80 = floatx80_precision_x;
+                    prec80 = 32;
+                    qsf_prec80 = floatx80_precision_s;
                 }
 
                 verCases_roundingPrecision = 0;
-- 
2.25.1


