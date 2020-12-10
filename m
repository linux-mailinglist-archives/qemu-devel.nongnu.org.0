Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E380C2D5A08
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:10:06 +0100 (CET)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKlp-0005gC-Sn
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQy-0001RZ-IW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:32 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQf-00072a-6p
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id v14so4386590wml.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PnlWOn3wj5epMR6Ukz4GSi3hf0wbVdyWVyWPmQyzxt0=;
 b=NO8hswIonz5L2tq9zhW1tMu+EMfN8DcaDgeKQue78QOwa1ncoN87OG1Bdvz9VB3Vsr
 LOPMlpLIjdK8tNTa69xOzb1+F9tR2V9Su7gNR2epFywQfO2jYGosppylj/6FQa1pLBfB
 hF9eZ7R+YFH8guHdLGFfyU09C1PbQrwMCX0V9xM0/v0ArgSZilbLeU0BcTg5Q/m/sgA7
 +1Bb20GCLyWljN+Bet/Dml509mHjyoCVzQ0JgKVc2cepVGDFTD0FkaS9coDUg3Bqqzvy
 /4PKIS0hTYXAu3v0IxD31xCrtjY4ylwW+J/081NhRv9EtV7rKmnnEa0KVhalyX2olswt
 zWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PnlWOn3wj5epMR6Ukz4GSi3hf0wbVdyWVyWPmQyzxt0=;
 b=Rrp0GyFox+5HtfdjXa4aHXH+rXPzZ5RmNLRstw2i/fZeYraiUIYuKVzYLRPTCz7VhG
 c60vaHSPD7fyBIOWyjPDa5l6fxoBduCpZouozo6nBPJ4doBQCVWuDEDh2mdl2pjmuzY7
 Z6xmXT5WRtkqseKjyoFgsgqsLeI25YGHlVaT1Pk9dYlYTJbbrgv3H3cUwvW0smRAWT4v
 BsAXdt5LQdtf+RTroYbl8ImNFIa3hllrbmvU7wR7QwELBfLMfVH3brT+NtF6/5Z1nbvt
 YNvbzDtOIK2mJXgiI3wCIFwrGm8XR3FqjgAhG32J1Pf3czVuO9VCN3gq3fSdGFPE/ozd
 ZLbg==
X-Gm-Message-State: AOAM532qvx6g861ke0GrPxJvrYMD2DgUV653n7Uk8bePT+clazlAsVwH
 tNl57MQx56tggMk0dex+Nkz8uZqDZq7shA==
X-Google-Smtp-Source: ABdhPJwLEP6BAUbMbF0roZKx3bRsrGL9WF3DXK1kA+kHenGRs7np5ivONKWUPA8l/M3H7uL+EIRY5A==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr7951014wmm.42.1607600891635; 
 Thu, 10 Dec 2020 03:48:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/36] i.MX6ul: Fix bad printf format specifiers
Date: Thu, 10 Dec 2020 11:47:31 +0000
Message-Id: <20201210114756.16501-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

From: Alex Chen <alex.chen@huawei.com>

We should use printf format specifier "%u" instead of "%d" for
argument of type "unsigned int".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-id: 20201126111109.112238-5-alex.chen@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx6ul_ccm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/imx6ul_ccm.c b/hw/misc/imx6ul_ccm.c
index 5e0661dacf7..a65d0314556 100644
--- a/hw/misc/imx6ul_ccm.c
+++ b/hw/misc/imx6ul_ccm.c
@@ -143,7 +143,7 @@ static const char *imx6ul_ccm_reg_name(uint32_t reg)
     case CCM_CMEOR:
         return "CMEOR";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
@@ -274,7 +274,7 @@ static const char *imx6ul_analog_reg_name(uint32_t reg)
     case USB_ANALOG_DIGPROG:
         return "USB_ANALOG_DIGPROG";
     default:
-        sprintf(unknown, "%d ?", reg);
+        sprintf(unknown, "%u ?", reg);
         return unknown;
     }
 }
-- 
2.20.1


