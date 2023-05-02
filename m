Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0006F43D3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:26:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoux-0003uC-NQ; Tue, 02 May 2023 08:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouZ-0003lY-Ej
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-00030T-Qk
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f199696149so22771835e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029704; x=1685621704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=75oLMFi9woiIKO0B/bZIkTS8BOscsn8EIfRIdrclRkQ=;
 b=Tw1L3qgYPwOgXXLuZprEYYv1r6hVTRe80fBgkx0cL77fGyBHc8dLTM11ZT9ih743mC
 TzlfpJGOB0qJ7jMLHDTBfTKpy/lGv74JGEnzxsYUV48zFihBF8wnA0SEn2bJkYH0BXgb
 wb2l6wGBN/evM+ZwfIx5Ln2srJ05sVAgfHovi2b/VChQE8JZCZV0sjH3/RLrxY1GOdyg
 c15+ZPnacrhZEJfFEXpBTuHg6PhZ+qFpObB4vmF3+jh1z/xGpVqExfdQ+ZVd9f8be+CU
 aef3ON1XbEZ9B3H/iTkU/SC6ihQlT+gttSSdx+l0HAc+LuxWVFfVbnyry6g4HLh2O4d6
 F4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029704; x=1685621704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75oLMFi9woiIKO0B/bZIkTS8BOscsn8EIfRIdrclRkQ=;
 b=TPmaag+c1YPt1v4Bhk5VwTFmt2oTkjYwU+H2Yl8WsEt0hrTpbNHwd/NYSz5z0IB4E/
 KGUNkyBaX0RxcCab/B0+hsfv+tyDlDwz5Ts+bGH8872Z/aqHjTAO6lBNjUjpGd3j0xEd
 U/6PtFNQuf1MllICYBffU8NAeoYj/k3dJtWV2uf9PWnOTXqcYSrWenMD7WEJNo/ONUcL
 c52YITZHtrK1LHWd8+jfvpkW5zTYuP4T13OJC6qXtl2dhgtBsoYBoNs4NuloyiCIGtGh
 c7dViUnejKHeTj/01qf+Rj4irJ616ipN8KXJmVTWynvtUBbKmr6F8j/01LECj6K4RGin
 1MOw==
X-Gm-Message-State: AC+VfDwWCk0M7TQRCQOr01z+70rpFw7kLwzmbOnfivyl76dMXDtkIXQV
 F4euuKeNkixfvjgCOlpXO8NYzT7DPTmwSou4O8g=
X-Google-Smtp-Source: ACHHUZ7t8XhE6gK2mfaVo5rGg6Gpp67tLBpzwXzlsJWt4x6tATery50zV6jJtDKvl7EPGhHloKyEhQ==
X-Received: by 2002:a7b:c7d0:0:b0:3f1:75b3:60df with SMTP id
 z16-20020a7bc7d0000000b003f175b360dfmr11613238wmk.41.1683029704054; 
 Tue, 02 May 2023 05:15:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/35] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
Date: Tue,  2 May 2023 13:14:30 +0100
Message-Id: <20230502121459.2422303-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
query-cpu-model-expansion test to check against the cortex-a7, which
is already under CONFIG_TCG. That allows the next patch to contain
only code movement. (All the test cares about is that the CPU type
it's checking is one which definitely doesn't work under KVM.)

While here add comments clarifying what we're testing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-id: 20230426180013.14814-7-farosas@suse.de
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 1cb08138ad1..3fc33fc24dd 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -506,9 +506,23 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         QDict *resp;
         char *error;
 
-        assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
+        /*
+         * When using KVM, only the 'host' and 'max' CPU models are
+         * supported. Test that we're emitting a suitable error for
+         * unsupported CPU models.
+         */
+        if (qtest_has_accel("tcg")) {
+            assert_error(qts, "cortex-a7",
+                         "We cannot guarantee the CPU type 'cortex-a7' works "
+                         "with KVM on this host", NULL);
+        } else {
+            /*
+             * With a KVM-only build the 32-bit CPUs are not present.
+             */
+            assert_error(qts, "cortex-a7",
+                         "The CPU type 'cortex-a7' is not a "
+                         "recognized ARM CPU type", NULL);
+        }
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-- 
2.34.1


