Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE7692382
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:40:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWRG-0007My-Lb; Fri, 10 Feb 2023 11:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR7-0006gu-F3
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pQWR4-0000UZ-BJ
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:39:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso6715085wms.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6P8HLBt4ufHIqb717DBvHQgjnd6QfYZ+mBBlnxbNRQ=;
 b=VJoB1KSgexIV3gWjsTTMEKj446wJyahxrcZeqJrmrBlKlC8xGv/qJ7QoG1pDASCo4w
 BdUrrn9KkID9LCIto5dfMmwuGrbdKowocC7jt/gncawiFUg7YMXAiutXTFBgS8I/4Vk9
 gE2VTna3Mzk/63Eq9t7Sn80Ij5k2v1mKeu0vd7HU/KDLOAePCYmvc99UnF5onPO5UK0/
 Y3rCzRQzcFbvndn+GHrEQ1RuafMb/8knyPgIZ8F37wznjjF3dmtuNRlchETf/AXtAafr
 ECnz3WaGVt0DGDKf2o7O5nMX6Y2bGWJpqpWNl2JOclPZTcg0H5ZJwkwSzQJmgeMmlx4Z
 Agag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6P8HLBt4ufHIqb717DBvHQgjnd6QfYZ+mBBlnxbNRQ=;
 b=HstIIqe9QkYSbAzphXkXvpgLpBrZ/FQlXPjForYluWhKDTtC3LDD/bqGbkMijl2nNZ
 EEWlWH6osaLdNJGhU4OceiLwHEW+57DczuEDPNPQoVXfullHOeCf+ZN4nB4fMkNNKWPF
 sv4DF9+3Fp/3Z0b5VhIp6jUQD3rVzkPQYEISgY/h7GxI30dAbwLtttYBpYA0hFez9CU+
 60Ap6+/Z+7ShmlLnF2CMiz+irm3gEsa5x3jFzZEoTLqo2nUiwDlvyO4NLnGhijyfm2Hv
 wqtGODnqypxzN2tZAWWH6SSZRESqAOobX5WbpKmB+PF5ov6gqSee0TBTsmywynd36OBW
 MFNA==
X-Gm-Message-State: AO0yUKWbjFAXSeyZ5wIgyuGk0r7cnWdJjVUH/LTgX7Z0Nqii+oRbZ8A3
 cA/icjRu9Zoe2O2JG0lFBQjJDg==
X-Google-Smtp-Source: AK7set986a6ZuITYZjpWkgwGA/7MvxUdmzEgn0uhNpK5w5AKZKIkEBrRHYEZUgtGbby7+SdtORCCpw==
X-Received: by 2002:a05:600c:4387:b0:3da:b40f:7a55 with SMTP id
 e7-20020a05600c438700b003dab40f7a55mr2585644wmn.6.1676047180517; 
 Fri, 10 Feb 2023 08:39:40 -0800 (PST)
Received: from localhost.localdomain (054592b0.skybroadband.com.
 [5.69.146.176]) by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b003da28dfdedcsm6312144wmq.5.2023.02.10.08.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 08:39:40 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
Date: Fri, 10 Feb 2023 16:37:32 +0000
Message-Id: <20230210163731.970130-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210163731.970130-1-jean-philippe@linaro.org>
References: <20230210163731.970130-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


