Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E984CDDBA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:08:19 +0100 (CET)
Received: from localhost ([::1]:56276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEDq-000483-6W
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8r-00051U-Gj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:03:14 -0500
Received: from [2607:f8b0:4864:20::633] (port=36377
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8p-0005yF-U4
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 15:03:09 -0500
Received: by mail-pl1-x633.google.com with SMTP id e13so8706558plh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 12:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yi+EL9Y616xgLruwinXIVDzc3CuIbCMiF0BTJMc+UOg=;
 b=KGZm/T7R3DSVgO5Ml373UVOvKgzN2cad6Aj7WkfSGgFYtMFX8/IaO5uDD3HHFMzDUC
 NzV34No+jwCRbWqioZLE1KOpO+pqEvcCnMiNa3EdpyPosh0bYSWJYnQVRuth4J2do2v5
 Ndvd1Oo1gYEGRKlVEESmLjRHuoORLbSoOJRlX19ln57bD21QccBMgQB5W0sQHu5EZIr2
 noAzwey9B+Q0wdcW8bPob7oCmdfkObXDH60T3/kN5IUIsSb64N3erC2ZAT9WflEgabFO
 mUyTqfketqSIu3L5cWA9o5kyd3KbeE0GdM4YiA300i5Axn65c9O86yZGKVc3/doxCYk1
 +dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yi+EL9Y616xgLruwinXIVDzc3CuIbCMiF0BTJMc+UOg=;
 b=Lj97G08u5KY7jiswJvOb2Fd+vEaOzlL5Jc3RWHg2+kozw2puqyQMBagQ4kVICOfKyE
 DUXe+7a3xv+mOEtsZwLG9qyE/TmRHf/K4C72qbLM3z6OIOmr3VK6B8efxs3aavb/WNNX
 FvZkfI9hcsD1LaCUYNwtMlGgR5FKpBm+VoxZiycYa48b/5Y7jheppHlebrlucWl8LuM/
 x+HYywplPsV5ygiaCXMUNzLvfeT1JtoKMFXVcLyJR+QhyLgDZ9Qv4C7xHk50Rr8ThPSV
 xiMLgJCx6Zh+x7h6DJBY6s6XVlgsmU5B7mGa+i+jb148QpeLjCuujZZ5ULJMoeacjpZK
 akVA==
X-Gm-Message-State: AOAM533R7A/LzhniQiBGPIZXKefzX8MQ+ZnXr+AiwgcbbUcKTtXwEtct
 89gdRp6/wxwTYaOViMZ1oNcE9lH6tTFWHQ==
X-Google-Smtp-Source: ABdhPJzsVM20y28U88GMI/JEHjN6VWriYdggz2kFpW7p7F2wjwvfPe8xhtrDBGzqQL3rE2Y+CvsF7w==
X-Received: by 2002:a17:90b:1b0e:b0:1bf:1c4f:2bc4 with SMTP id
 nu14-20020a17090b1b0e00b001bf1c4f2bc4mr317616pjb.200.1646424186636; 
 Fri, 04 Mar 2022 12:03:06 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 hk2-20020a17090b224200b001bf0a7d9da3sm5716744pjb.9.2022.03.04.12.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:03:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] hw/core: Disable LPA2 for -machine virt-6.2
Date: Fri,  4 Mar 2022 10:03:01 -1000
Message-Id: <20220304200301.524525-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304200301.524525-1-richard.henderson@linaro.org>
References: <20220304200301.524525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG,
disable this feature for machine versions prior to 7.0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/machine.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4..f3c410fe58 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_2[] = {};
+GlobalProperty hw_compat_6_2[] = {
+    { "max-arm-cpu", "lpa2", "off" },
+};
 const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
 
 GlobalProperty hw_compat_6_1[] = {
-- 
2.25.1


