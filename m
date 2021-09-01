Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C63FD853
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:01:34 +0200 (CEST)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNzp-0008IJ-OK
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcL-00076q-KX
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcI-0005q0-Kp
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:17 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i6so3792399wrv.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qj0i5KL2ZuTJWlh9USuRwTygN60Vm69qctNqMX3MHmg=;
 b=o1Qn5q0JKVnKcB3L8o5kHATiO8zOGZn4K8q3VUoUdotBmANRFwllfWbsu73UcRD7Q/
 fafFz/vSBk83CEYw7zc3jdKkKaQTepNjQnl6SxGCT/TBi4nBSfFVA9NaEfXF82gnO4Pq
 KeQsH9ypjpeBwwveOBEuKe/N0gjFC1/LmKIQMaNlHNpbznAODkrUO8nhXB1Pg48kJ69l
 6ZgKaPI1xapkDMKj1KGJMQZgSV5K1VK0fir7tyHCKjjh/R2aNnx++iUPV9akIguDxOwE
 K6OuPp26jnWNdBXejQ+WDTFZkpALPogcLwk0jD//KpIsYUVrKyS3cXvO6ENWRhyLDfys
 6FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qj0i5KL2ZuTJWlh9USuRwTygN60Vm69qctNqMX3MHmg=;
 b=dkQXW+L1CKkjs0q8QylAlUsUyFehaoyGrWzRrTAaN5RJqC38LbzYQpUAyW+1EGWrw2
 tWJuYF1xN3Sy2/3MRpy+FP5sC8ug/Ivl+78+ctPp2gwnzZl7YIM4jthczkp7sPZwlNAQ
 l5ofUj5qplauOh3xVB804Wp+Y7Nj0BjFHOGTTZMrxe6vHHYGA1k8WeacogU/Pu/Iu8y3
 /FKs/ANLd1xxbfuTEwMzTyuYzBhR0Ejpkf8YQhQyu7g83ZhpPUXmo77xmr3LwOuR2pHc
 uJ4+Nt6bf0kmkqmOWcw0+YS3aHNSEvYMVHIA8ErlF6geyIw0TacpiYtTAvej5lX2SfAM
 NFVw==
X-Gm-Message-State: AOAM533RLsZtgOBM28uFEDfEuu3TtTM4Uo86lWC30ETqBuGQcUdqa4my
 b8JukgMxRAA37ydeiyofaslAOVmRDM5ixA==
X-Google-Smtp-Source: ABdhPJw+a4jbvuS0/dXsmImmpNdoOl6wydCdSh39poYOWuAb1REwheN02MZ3G5Dc/2LQHf0X62PZug==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr23410932wrv.205.1630492633258; 
 Wed, 01 Sep 2021 03:37:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/51] tests/arm-cpu-features: Add A64FX processor related tests
Date: Wed,  1 Sep 2021 11:36:28 +0100
Message-Id: <20210901103653.13435-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>

Add tests that the A64FX CPU model exposes the expected features.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
[PMM: added commit message body]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb85..90a87f0ea9f 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -473,6 +473,19 @@ static void test_query_cpu_model_expansion(const void *data)
         assert_has_feature_enabled(qts, "cortex-a57", "pmu");
         assert_has_feature_enabled(qts, "cortex-a57", "aarch64");
 
+        assert_has_feature_enabled(qts, "a64fx", "pmu");
+        assert_has_feature_enabled(qts, "a64fx", "aarch64");
+        /*
+         * A64FX does not support any other vector lengths besides those
+         * that are enabled by default(128bit, 256bits, 512bit).
+         */
+        assert_has_feature_enabled(qts, "a64fx", "sve");
+        assert_sve_vls(qts, "a64fx", 0xb, NULL);
+        assert_error(qts, "a64fx", "cannot enable sve384",
+                     "{ 'sve384': true }");
+        assert_error(qts, "a64fx", "cannot enable sve640",
+                     "{ 'sve640': true }");
+
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
 
-- 
2.20.1


