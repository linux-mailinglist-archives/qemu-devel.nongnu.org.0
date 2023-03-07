Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9D6AED28
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:02:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbai-0006Ow-Ks; Tue, 07 Mar 2023 12:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaf-0006Ht-4F
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:09 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbac-0000GT-SE
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:08 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so17340159pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hMOxswRtcL6yj6l59+HmhlWoLE62yPuP9G/if4qYnK4=;
 b=JW6Fh2YqEprFGSTz5Cd5PhXonQ8HnZjbtPbPsyc4bfEsolcMTDC9mQSFAfOt9j3/j9
 93sWUlNX8Sx/tcPaIpFHZ2JRsHWKRmiejUmso/3so8cxO267anoiECrBjiDEV7kK8NlO
 QYkRhMmkBIhLsLvlwaDu9Xt+/7yAN2oNpZz3+1loSwhag4+i+XYg/A/pCP35ty7s76+t
 TyUDIdEz/k5PnJeCoZ7lRC0K76tCAGEGOPI5LYKuSPnMEGz34xgVIUwQoPMbYzqE4LNA
 w/nZxiFIdzsjkVF5dYK5o8kZynzC50b4bH8ViW8S3u0hBckOrUMaSKQSXSKlNMAH4qYI
 gkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hMOxswRtcL6yj6l59+HmhlWoLE62yPuP9G/if4qYnK4=;
 b=zTxH3r9i+uasJN/Z2gk+QX23WDsGvlPpWsiBT1+auJ5Lk46smMBV98Ov1LALXAnBSF
 h0Ry8jRu5hSzNVg+UOtQySk6NkJpfEx+bBr2evhvSfltL4O4BxgZ/NRpSrhH/O6+ciab
 wmMOzfTfB9oBn+csLX9FWXj75yMbXv09kLO+FTUh0xcJfVmz0s0eul6xerBtf0wAeNQt
 Qi2mNEIxmelq0+yi+TZPj35NccswoF1T7/waaVqEF4aloT9ZGO83AlENeFPAWu/taWGX
 zssHFf1F1k+JM94JFOrYPzrpvnfHDtDG4RnTFPrH75lVKp5pkEzqD2FiQWqetPSaDCuW
 VY7A==
X-Gm-Message-State: AO0yUKUCSbhjoJc9bguNRXk7H1gaapCI2imkYf1o6l8hiCWvXiOmVdnR
 OJcqHo/efMPUAR+gxXnBqbXan1IzlxJiAymccDA=
X-Google-Smtp-Source: AK7set/WPrBcCmR0X6if5qCKGCCiztiL80HXxlBgb1dzuBemJokUhmzG8PhzSA677y6G3WM2m0ft5Q==
X-Received: by 2002:a17:902:bd43:b0:19e:711b:83c with SMTP id
 b3-20020a170902bd4300b0019e711b083cmr13158485plx.39.1678211945595; 
 Tue, 07 Mar 2023 09:59:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 20/67] target/cris: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:01 -0800
Message-Id: <20230307175848.2508955-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-6-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/cris/cpu-param.h b/target/cris/cpu-param.h
index 12ec22d8df..b31b742c0d 100644
--- a/target/cris/cpu-param.h
+++ b/target/cris/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 13
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


