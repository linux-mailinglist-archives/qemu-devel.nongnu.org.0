Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D72D59C6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:54:45 +0100 (CET)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKWy-0006kI-3b
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR0-0001Su-LW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQi-00073P-Jc
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id x22so4369046wmc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BigYO5HdCfFdu3P9A2wjZ5T3N7amcDFj0WcAvdbkd2A=;
 b=eyRrEEixygBpgaDIdnrJZG97Jc9ZavHXju/6hziKoq7IqqLYlm85woTYgKFeNzQ+F9
 nOGdZIKBhTv1n/cc9fwjk5TblxQrLDbImZDLbYMyGuS50InfcX/VhZgPdV1lbK148VAG
 XuUSxkYDJBsOQ6ZJ//h5YP8mBRibihHOyas9z5nNxlJ1+5wsZ/u6lHvmTLPP+jrB2v+U
 IExdM3bPtTEJpqtKK3qIJhBDkN0FbPS26765wAKyWq8TvPnzh2/a6yZRnrrSEci8MxVe
 Fhx2VgkF3wfkHjnAv+yTnOz0jAQMkFm78WYZy/+IDw/KgZChr6II47dgE8S+9bwn0bW1
 0s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BigYO5HdCfFdu3P9A2wjZ5T3N7amcDFj0WcAvdbkd2A=;
 b=HZOiZal7GWhOutlcAzAIyUJ2/ys2D7pF8KkZZ60Qhay/Coeye/zWyd+kU0PMjG0+LJ
 npi7aKzz+x/NKcR+utl7qPTLjDLdQeNxIxpOfp+nTC8BP5IcVlh7w+u7F3DKq2FozHCM
 Scvr8WL2eYOV8bq1P66UrBISBGJH0FOfCFrVLT60HboIju0J92yJkiOS+s9UraOnFQRS
 uPot0CqVMPhRY+GdulSmBHq1ccyF9zc8IF6/+zR1ENgJkpSrGMTRS2m00s3tIA0L/Pe6
 q1TnPWWj1E5Cf1B+pYyfONSEg08jpaau8Mxp9Ts6Qr2fq+lx0ncICFVvS9MBHlgWnYv+
 EcnQ==
X-Gm-Message-State: AOAM533TPsEeMoSVhVM6UEoeWyD0ntGVLpIPf7yUL3OjHqi+7xD+KY2W
 Vx5FH+JhukP/yxMqy9fiAbPtXYwUD5gXWA==
X-Google-Smtp-Source: ABdhPJwbVomU9zkiOHe/MqvIuERnCIG1fsSLf6FzJlC904RZpghtK6NGBqRrwoLJ0YjqPc0L/nPOIg==
X-Received: by 2002:a1c:df57:: with SMTP id w84mr7726878wmg.37.1607600893995; 
 Thu, 10 Dec 2020 03:48:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/36] target/arm: Implement v8.1M PXN extension
Date: Thu, 10 Dec 2020 11:47:33 +0000
Message-Id: <20201210114756.16501-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

In v8.1M the PXN architecture extension adds a new PXN bit to the
MPU_RLAR registers, which forbids execution of code in the region
from a privileged mode.

This is another feature which is just in the generic "in v8.1M" set
and has no ID register field indicating its presence.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-3-peter.maydell@linaro.org
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38cd35c0492..7b8bcd69030 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11754,6 +11754,11 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else {
         uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
         uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
+        bool pxn = false;
+
+        if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+            pxn = extract32(env->pmsav8.rlar[secure][matchregion], 4, 1);
+        }
 
         if (m_is_system_region(env, address)) {
             /* System space is always execute never */
@@ -11761,7 +11766,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         }
 
         *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
-        if (*prot && !xn) {
+        if (*prot && !xn && !(pxn && !is_user)) {
             *prot |= PAGE_EXEC;
         }
         /* We don't need to look the attribute up in the MAIR0/MAIR1
-- 
2.20.1


