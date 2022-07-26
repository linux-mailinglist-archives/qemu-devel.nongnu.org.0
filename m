Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441B2580AAD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 07:07:59 +0200 (CEST)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCnW-0005EN-Bu
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 01:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeT-0006FT-K0
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:40 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeQ-0002bO-RF
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:58:37 -0400
Received: by mail-pf1-x430.google.com with SMTP id e16so12247714pfm.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lpuu9FS+6IljQuvO2lx2PvlYEAAtS4M2JdBO3J1d0h0=;
 b=bMdhktFcD4mTOm8qxcc2SXtLVWbgFmlGpOt9S3xk2QBhzUvau42KHXYQY9XmlmbBqs
 pZfXVpVi+tabk6UqhSBBvEFgB2GtTkaauTlCgPE82ZGesCASNC5xroWo/CI9CvbIuYkZ
 z5+ipaqv6TpUYISPjY1voD8CkDsZSeEnNWCqDtJ5CPOnIrkS+0XwhwBjPukKSLq36+jf
 zr3rnxer2SbA8WShlzIXFnL5IW7nJfMfjEQwX+VQYcbvXxae1a4Cg9WpyIkMMsADj5Px
 Ywy31W9SBEWzKmNn+3P2N90mbe00LHLEXnz8OrFZuQBwCWAj8LaX/OsvbOCnn0lp8E1U
 negA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lpuu9FS+6IljQuvO2lx2PvlYEAAtS4M2JdBO3J1d0h0=;
 b=7wvrTnVTCPVeDFJTxDDrMNjFbZiOHo7HJiJJ5dE/+FaBAK8kSQAXdBMexarGfksGiu
 VHLGiePjIMP9TRpXVCmd+4QP8ffFN7DrhHTWaNXt3lBebJe7wuDHLrBFBIx47Xifq7tZ
 QFIyGHLaUB8cTRxvV+2Ggi2QHC0Bd9JW7oWoHQbxya5ZnlT1zdGk2c4BLBnxZTW7Y0N5
 qGfu7QjRcbrX4fJIC8mMlbumtyKBdvMhPN907urqc5L0+cJMLu3Plpc7FI4t21+mb895
 YV2O22Yw+bAwD3EPOiKPCZZ69FyTEmrdfUQiMUfIRr8VZeulwjNl8GLPJFZEKeFczeam
 ix4g==
X-Gm-Message-State: AJIora8jU9q3oZQoAUJ60nLgdZM1RaW3487uCYnZLOJ9v/gKDDECfoyD
 bW0HZwZmsmmkaBKRqgUAYKgE1QQ/65EqKQ==
X-Google-Smtp-Source: AGRyM1v8nwDXz45j/G0upRJXEM5hGVHgdML+MCRARuencHNTc6bbM7cjcRC8X6lPBMl08Zi0CbDqeg==
X-Received: by 2002:a63:1220:0:b0:411:f661:f819 with SMTP id
 h32-20020a631220000000b00411f661f819mr13945541pgl.250.1658811511713; 
 Mon, 25 Jul 2022 21:58:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa79793000000b00525343b5047sm10550460pfp.76.2022.07.25.21.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:58:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/3] target/arm: Use kvm_arm_sve_supported in
 kvm_arm_get_host_cpu_features
Date: Mon, 25 Jul 2022 21:58:26 -0700
Message-Id: <20220726045828.53697-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726045828.53697-1-richard.henderson@linaro.org>
References: <20220726045828.53697-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indication for support for SVE will not depend on whether we
perform the query on the main kvm_state or the temp vcpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index d16d4ea250..bb1516b3d5 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -675,7 +675,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    sve_supported = kvm_arm_sve_supported();
 
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
-- 
2.34.1


