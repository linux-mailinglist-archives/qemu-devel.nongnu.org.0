Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8762B6496
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:50:31 +0100 (CET)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1NO-00055d-9A
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Le-0003OE-45
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lc-0001uX-3G
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id 1so1780895wme.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EJXyyAUUfoS63NoOHsrWihhaSKcfYx5yWaS+ZUcS+aw=;
 b=nfTrI6ZOeteitIDSieKJlHw+vCvR0AD5j7BOsxafYuIpP1lXHC4BJpkTjMrMwuwzCg
 s1BdUwmF1LVxzdv/glheQSSdBItLzolkSVpRMbCr5wFhwHiGaIkECrBGRrLn6FAAp2Wj
 qwqRd2t3y6IuanTY8R/5R5R78y0YNFlmoKKx6q6ErG7qwidn/9oYejgIO2177v8BQCEU
 bRwlZ7Am08CMoNhUjo6PTcOaII5LZ4W9vhfBY0k2ruPja3nTS1ZQlFRN5lmRzDSHMOm8
 E3XdkeazQhn2eYyIWsRbmXRGcptOSj5zzS7qBI+OCepr2894DTKsNKLI7C0zbqEMNsbI
 qrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EJXyyAUUfoS63NoOHsrWihhaSKcfYx5yWaS+ZUcS+aw=;
 b=hDT6sm2T5oVfyW3cW5OHSHSH74CInvNQ6EmWAnk8g2K7i8M4nMFsuHlD7WeisMA1i8
 Ojffpu1RSE30hXSFLu1QI9X8BPk2KVwF59qN76+Y12CKQNqcq5yzm+ycBMiO5LPfwPWB
 wu8RPSBav0E475g180Wd0gTg9oXmFVBF1fQWktpd07aqPBXMeW2ADWxyCKIcOEA1tobJ
 sbJZ2pVt0DM6EXFz7Jb2NzQ6rFmR8mleN9qc2eCYJPf2Xg9mikapAiY4zHv7uHraSVyM
 d/pkEjkKMhv6rRLk3G9lFu0fgUHdK7xwYWdoG+l1FSLFvrEQNpVEswIoSjigGT/E3pbl
 LSBg==
X-Gm-Message-State: AOAM531fWlww8TUuyrYLZkl8eJAj0QB/TqJw/wq8KjrxYDWR6+QxwNjl
 CNLdfZfneyw+EUmLjlxlp6OPQEhMFtsPWA==
X-Google-Smtp-Source: ABdhPJyg2B8gyELYAVvLQsn7IqaPRyMmN0iLXhq6bDUk15dEr6OIdEm7Qp52NfFAHQ/ne+f0r4aT3Q==
X-Received: by 2002:a1c:208f:: with SMTP id g137mr4440725wmg.116.1605620917876; 
 Tue, 17 Nov 2020 05:48:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] hw/arm/virt: ARM_VIRT must select ARM_GIC
Date: Tue, 17 Nov 2020 13:48:26 +0000
Message-Id: <20201117134834.31731-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: Andrew Jones <drjones@redhat.com>

The removal of the selection of A15MPCORE from ARM_VIRT also
removed what A15MPCORE selects, ARM_GIC. We still need ARM_GIC.

Fixes: bec3c97e0cf9 ("hw/arm/virt: Remove dependency on Cortex-A15 MPCore peripherals")
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201111143440.112763-1-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7d022eeefdb..e69a9009cf0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
+    select ARM_GIC
     select ACPI
     select ARM_SMMUV3
     select GPIO_KEY
-- 
2.20.1


