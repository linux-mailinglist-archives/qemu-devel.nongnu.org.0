Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9688D696B51
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:21:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyzU-0006jx-Qr; Tue, 14 Feb 2023 12:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzP-0006Ny-UY
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pRyzM-0005eG-Qz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:21:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id n13so11462015wmr.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1o7dkQJ+2Jq4AnP/hQ+CdLt1UTgBQpw0WHFXcyfQhY=;
 b=nSgUDlDRM3xvlhf/5+iRqnyoLzQAyMXYIiIhj3R9tK+u1ZuV0BS7ipE4Na/K6IjHAw
 43pIwC78NQomPdG9RrdR95xfzlXrqq8PnJjaYBLXfFf3xyyK6F0HOdHfiVF3yolExNxG
 Tvb0J6/cfuGKtGU0tHE5io4j7s7iBWlw/J9MtKLEVhHfXn81a/bcw3RXWAF5yb2DsA/6
 4j43vAdiKtIbV00/dKzYAki4Sjc1oGPSAigG6PsvQ0l23yaqX6n8EuECMStV7lyU1vqr
 wlYnBoWFTMg/7tHADP8XuEWaIDrfQuBtpBPGQUYftKBX8Upz8cTo0vqhXrCw13vjnjNI
 Jb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1o7dkQJ+2Jq4AnP/hQ+CdLt1UTgBQpw0WHFXcyfQhY=;
 b=OTsUnbqtT60QGlwkMCjAIfAFArxnmrzUkQiypHonpsn/H/B8Kcw+zzZTO6yEvtKhJg
 wIlL7ImwVuZ+ax+Epip2zUov3q/Dr9wLRnGMh/1fx+JvQT1TJ2VKdo41Ac2nkaNHcCSp
 EGxrGl41qhnniDguT71oPpw7SPxb/GfGE1sGjuWOm5IJIDZUHI7szM/gC49EetWAcUn6
 V3aLvjR800EU9fj0i8QAimPGPaSxJGTuyQH4Edahbw5P1IAF47p+wuADAJ5ZIi0ry56m
 KUqc16uef7ptCljUfypoLhHGiEcxxSZVPqJcoRMq3zYlvi1IsR8DRZ3sBeAD6prPwvAE
 zpxw==
X-Gm-Message-State: AO0yUKVmOwHWznDKiyMFqT0DKT5imcNLmROZIP0XaACxZGO1Wu6+x1K2
 M4OOH1T08ILHXakaqOwKMLxhwA==
X-Google-Smtp-Source: AK7set9+lCVBihl+rqwtVtZiYshj1QI7c4Kq1g2OdvhneeEXWc6fQdkEy8CBVHNFFPqW/GTzpQb/dg==
X-Received: by 2002:a05:600c:3492:b0:3dc:4313:fd1e with SMTP id
 a18-20020a05600c349200b003dc4313fd1emr2665434wmq.34.1676395267355; 
 Tue, 14 Feb 2023 09:21:07 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm20636570wms.22.2023.02.14.09.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:21:07 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, ola.hugosson@arm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 2/2] hw/arm/smmu-common: Fix TTB1 handling
Date: Tue, 14 Feb 2023 17:19:22 +0000
Message-Id: <20230214171921.1917916-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230214171921.1917916-1-jean-philippe@linaro.org>
References: <20230214171921.1917916-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Addresses targeting the second translation table (TTB1) in the SMMU have
all upper bits set (except for the top byte when TBI is enabled). Fix
the TTB1 check.

Reported-by: Ola Hugosson <ola.hugosson@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/smmu-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 2b8c67b9a1..0a5a60ca1e 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
         /* there is a ttbr0 region and we are in it (high bits all zero) */
         return &cfg->tt[0];
     } else if (cfg->tt[1].tsz &&
-           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
+        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
         /* there is a ttbr1 region and we are in it (high bits all one) */
         return &cfg->tt[1];
     } else if (!cfg->tt[0].tsz) {
-- 
2.39.0


