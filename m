Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6522AD563
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:36:56 +0100 (CET)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRxH-0006MP-IG
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgR-0001zX-W3
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:32 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgP-0006pC-Vx
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s8so5152521wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h6cmnC4syNYJyq+kRB9MZJYpWw99R0j6xzYSNouC8Jw=;
 b=b7pvJB0TUFGR/k+sBd0GQ9APnQCP97oVlMLSsBR1EafT3OfPlwFAuuXJ6iWplwWm9p
 qRCU36tFc6WLiktnPqiT3FtMEog9AARfvvAowqVZECAEbN37IB54Au03BZzEvzVgFVAV
 nl9F9kuxXbKo0iRr7h50ZhLkRVVkOrO2u2eFqx5eefL852V6Egs4ijpuJjacpPaje5rI
 igRVeM/inEyhQdqklslBZmLJ/zq29GvqGKdSnQqKYCz/nFgO76w9wzn+bAKySad09+mP
 ilKZnW1wyYxFJOs7m/o3N8pFgd9y+INNlhuTYIc0W9awwc/zC7pfpufITJDraxaLhUNi
 b3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h6cmnC4syNYJyq+kRB9MZJYpWw99R0j6xzYSNouC8Jw=;
 b=EuRF0DZEepPVh1EWZREhCwdnGoKaYqvH0AAJRcNpjHMCiJ9XfcQRYXtBnM8YIiHuYC
 6CgLRnhUTNE0GyUotbfn7W7Ki3ZJwpN0IGtDMQ0m8SUoJYsGDs3teIku8Y9cdlBwI+Pl
 XpFfYqItgWS5vkuxsYmXdofzTyLEK9fITvWCszjkn9V1p9bGatlcbMiuWI2IwfCR9lTQ
 mrNSEeRCJubJSgnhpElltaa6w/yS8B1isbjXnoubi2abbTp3dNfO99DAizn74rNv8J0E
 kbAHs2M3X4z3UpbJoTOvviOsH/fsbrPHR0slM0oJJA2q7VV5CgVWLhj+8fkiP7OQDOrL
 7JBA==
X-Gm-Message-State: AOAM530q3V09dTGXjWaVcFMWkjIurQ7IsomNpmPx0flNt4awnJgTc3uo
 U7qB3f+1shxP3lTvhLLLFzV5+r5et6PMHA==
X-Google-Smtp-Source: ABdhPJzkpNiFPyTchWxlW19p20raHNcPrk36oqL/YcWWjAlT+zJCQINfxS66rLJZPJfTvJ8yXYEctw==
X-Received: by 2002:adf:f808:: with SMTP id s8mr8768043wrp.257.1605007168335; 
 Tue, 10 Nov 2020 03:19:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] hw/arm/virt: Remove dependency on Cortex-A15 MPCore
 peripherals
Date: Tue, 10 Nov 2020 11:19:08 +0000
Message-Id: <20201110111917.29539-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When using a Cortex-A15, the Virt machine does not use any
MPCore peripherals. Remove the dependency.

Fixes: 7951c7b7c05 ("hw/arm: Express dependencies of the virt machine with Kconfig")
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201107114852.271922-1-philmd@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7d5d89e1acf..c9f60e82516 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,7 +6,6 @@ config ARM_VIRT
     imply VFIO_PLATFORM
     imply VFIO_XGMAC
     imply TPM_TIS_SYSBUS
-    select A15MPCORE
     select ACPI
     select ARM_SMMUV3
     select GPIO_KEY
-- 
2.20.1


