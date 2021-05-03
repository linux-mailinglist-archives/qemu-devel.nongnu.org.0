Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516DE371D26
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:00:39 +0200 (CEST)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbvy-0007Uz-8D
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbr7-0002Ba-Pt
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbr4-0003xX-Vy
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id m9so6324401wrx.3
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sufPYBXl/XlfFN5YQ0XgohAInzRqzYbi1Ozy2tIcTHA=;
 b=vB9TX8BlLHz8qjrDXZykdpc55QpidlZtp0jABrhS1ZoU7OGFGNLjs95qQpMNxN+p5/
 pJ2eNQlksDC86CNQ8VUdqAxRvk9A8twMvi9y4jrcml81o9+F9N6gcgNQrsLVDLgvg2Gb
 KiMuU0SpKiSxda+tpY+6UkiSbY9nCyxeR7yeZTFzVH+AJrzknNIZ5ur6yB8CCAfVINKo
 wzZtU9QbNxgigRMcheaVGuTV7x2ye5rJZzR4CX/n8bGz5yT0+nHRiyjNHp4uydLiUfjB
 mOFAOp6ZIfIhuW3LznOF4FAZ3Khi6Ly7Z29cxbsSutWflRyLPPEsapGAX4f33QFmfIov
 hwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sufPYBXl/XlfFN5YQ0XgohAInzRqzYbi1Ozy2tIcTHA=;
 b=qF3aBfuqWuwXk7x8a4KoDRJR0QYfKAqDDEsbUR4qwfSBGn5D2abX9oIRIRn/Y9Fkeu
 X0v53TEy/85ddb2IuNr+HXzOHsOgQgZjAVCHiJnXJOSNFZvQfU0E4RG80F6ORX4QIOUk
 +sh0P3UTjK+BrihpN7i9uWGt8kOnSCtEpumD3y6Ygm+UBzvU27QTl8BY9aNkliP23RMO
 nnmeGevqysEFBKE99JR5yHFkeH5ftYpSP8A3O4txr0kYQhEmuRtaWZZcr8MEdmSaqBzz
 G6y0xz/ORH+Hh9sXHtMmkaEROgNhmw+sXOivsVaf5shgQX7+xgb2ckvolS1GZGOxu0Yo
 rijw==
X-Gm-Message-State: AOAM5314HdljPmKldbiW4GIupkaLU5iPoxxy+mQf9fFLhLomZRXHt8uu
 XD4ndAPtKWnLomX4A5ueVw7BWraZ/ZwgXA==
X-Google-Smtp-Source: ABdhPJwuAlc8AcDr819y+k/gsDCcgPhUfpypNB0k8h62pmpaKDETb6G2T21+7TnA0NA8wgeYANFkWg==
X-Received: by 2002:adf:d22c:: with SMTP id k12mr26598195wrh.25.1620060931081; 
 Mon, 03 May 2021 09:55:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l12sm15282794wrq.36.2021.05.03.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 09:55:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tests: Avoid side effects inside g_assert() arguments
Date: Mon,  3 May 2021 17:55:25 +0100
Message-Id: <20210503165525.26221-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503165525.26221-1-peter.maydell@linaro.org>
References: <20210503165525.26221-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For us, assertions are always enabled, but side-effect expressions
inside the argument to g_assert() are bad style anyway. Fix three
occurrences in IPMI related tests, which will silence some Coverity
nits.

Fixes: CID 1432322, CID 1432287, CID 1432291
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/ipmi-bt-test.c  | 6 ++++--
 tests/qtest/ipmi-kcs-test.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
index a42207d416f..8492f02a9c3 100644
--- a/tests/qtest/ipmi-bt-test.c
+++ b/tests/qtest/ipmi-bt-test.c
@@ -98,7 +98,8 @@ static void bt_wait_b_busy(void)
 {
     unsigned int count = 1000;
     while (IPMI_BT_CTLREG_GET_B_BUSY() != 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
         usleep(100);
     }
 }
@@ -107,7 +108,8 @@ static void bt_wait_b2h_atn(void)
 {
     unsigned int count = 1000;
     while (IPMI_BT_CTLREG_GET_B2H_ATN() == 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
         usleep(100);
     }
 }
diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
index fc0a918c8d1..afc24dd3e46 100644
--- a/tests/qtest/ipmi-kcs-test.c
+++ b/tests/qtest/ipmi-kcs-test.c
@@ -73,7 +73,8 @@ static void kcs_wait_ibf(void)
 {
     unsigned int count = 1000;
     while (IPMI_KCS_CMDREG_GET_IBF() != 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
     }
 }
 
-- 
2.20.1


