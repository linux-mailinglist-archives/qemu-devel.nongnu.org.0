Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45445137EB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:15:03 +0200 (CEST)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5rC-0003Tg-Ro
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K8-0005hA-B8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K6-0006Vs-CA
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id v12so7062409wrv.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ih8OyvaSZbmi9jPW5nde5PZ70/g9uoxKd0lF+4LxvPw=;
 b=hIHB+9Ma8X1Ul6dSf2nx7QF9EL48jboZIuHk8VHj32DARr3ltMRH1MCWpmzLLSMVr4
 i3i2BZDCJV5XC1pD+Vbfa+qD6u0ki3iLSGtd4yuhq7ndY/yE6P+N1xVU8MHRgYaZmNf1
 X0kaonZIBwTEuH4KGQsAMKrT57s5gKzd13wOgTBMj/UekAiX8apruamy7jskex1VnoA2
 asOgbeYdv1BExq5iN6gtwl7Kzk5lHIiHBM+8xS8Z378A8Ap5IdtSE2I02ZL+Azdpbi2h
 P18keUf4OBVj0GettWvQHtm/mGtOyRVh0zLqMnDcFgQPOXYMAx4Tys6fqQBats7e93fR
 mSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ih8OyvaSZbmi9jPW5nde5PZ70/g9uoxKd0lF+4LxvPw=;
 b=sV2ss/4mGAInUd9O7fsg7jyiR6kokk6ox9eCeRxq1wBk6r9N+ANzTxoIvgvmnKklK7
 0OqoeioDPDbs+5XYHr0AVdKp9POejJtNILBvBonKyCb238u+4FRst6znAfz7dof5WJ0W
 WQzxpnSHfLVMkyZrAyfWUan0fTVIJ5XsHcu5wDq6DbpAImzs3/LN14+wlHIeExA5cOg1
 dK9mtFcylFN7EaaRR+7KCy3LFJH0qIr1ziwu5IICl6kK7oda/FffjGP70DGrs7gFjGfg
 +EyZ8FPtndG2cN7t1l0aR7DkF3vwk5uqCIILFrzAaKGEQOMhWgKBbVXbAJHiVPnSLwzF
 cjFw==
X-Gm-Message-State: AOAM5321fqJ1McNnpPckOnLDZK3br+6KyFIZFkDdRWL0NJ6gQ2J4FIxT
 IOW1lvTn/H+K7Fkk27ChtcoMR68YXR7dwA==
X-Google-Smtp-Source: ABdhPJz4PCcF82jhAlaM3cidwt7jjU8KlC7lY18VikCz+D9cSMZibncKVGHoU0L/R2/44MOj3a9P2w==
X-Received: by 2002:a5d:6d0d:0:b0:20a:d741:6949 with SMTP id
 e13-20020a5d6d0d000000b0020ad7416949mr20003015wrq.312.1651156848968; 
 Thu, 28 Apr 2022 07:40:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 51/54] hw/arm/smmuv3: Add space in guest error message
Date: Thu, 28 Apr 2022 15:39:55 +0100
Message-Id: <20220428143958.2451229-52-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Make the translation error message prettier by adding a missing space
before the parenthesis.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220427111543.124620-2-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8b1d8103dc8..3a989b09cb4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -786,7 +786,7 @@ epilogue:
         break;
     case SMMU_TRANS_ERROR:
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s translation failed for iova=0x%"PRIx64"(%s)\n",
+                      "%s translation failed for iova=0x%"PRIx64" (%s)\n",
                       mr->parent_obj.name, addr, smmu_event_string(event.type));
         smmuv3_record_event(s, &event);
         break;
-- 
2.25.1


