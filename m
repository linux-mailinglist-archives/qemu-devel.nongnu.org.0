Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EDD628EE4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:06:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik8-0004x5-SU; Mon, 14 Nov 2022 18:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouif2-00049x-9i
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:42 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oubkm-0007Ht-Di
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:52:10 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o4so18939910wrq.6
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gAoRJ9snJqPL2rFJvOBSQyfEm9L6rPkUPHA5i8B/Ug=;
 b=WwL3kcuaij1Ydn7R4NXPASMMXpMStD4Aid/N+ZbV4JNQ99q0HLCSc2DROyM0I55opE
 lBI+zjEJp8naZ09spKGz14NJOh2sRtqBkZjNGKOmTuXb0Dxtv+KrY/HlwzAmHCuaUdDd
 H5dVs+t1YPizlQl4lXHrhobeXOuRXFXS7DFbIVDjHoZNbAdSeKHkjMe2yUce0QypNHWh
 LhbCY962mtlP0T5RL2yk2fzJ/cQACruNGfloW5cRg/U0OAAevflsZBwGIwmPK9Hh410h
 jun9tC9kYqFuPNmg1Gnb+00tEx3uIjSJhZULueNfutktVdQwb5N1lzV+PYwp3N5I06zZ
 RVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5gAoRJ9snJqPL2rFJvOBSQyfEm9L6rPkUPHA5i8B/Ug=;
 b=dmqQ6D0MA2T9r/Aq01+x6AX4BoxTCpqsORZDi/e5vkSGmPjG7sCdXcSxOh0ym3L90/
 yQ49gCstqmM6jXXHrk3+lmv+dmUPDSpqxg2yxlNr0mQqOPzo/yc6TuJ8+xUodv7d/VNj
 8LxcSiqnoDCiaTUnW6KIhBSrkkOjapYQK/p4awEZqKjeVJ1eEjVRoxd1hgnJKzDUc8Kz
 VxZbmZ4Ay9mQ3+YMp5BYOpxzq/BKfWfgyHUoSA7rnjWc1CdnWcP6y/kaVwO27u9Crh2r
 Yy8Aoqu9geigq/WiiAZdGKnPEePDcqrPrloIel2As/XX+jEntuKrLmPMz2Pq446LsaIU
 rEag==
X-Gm-Message-State: ANoB5pn/+1v6qDejtn3gmkxwlviHYBDCOeAP6lWsFTwf2wo5vhFoMGdm
 D9Zct1GWSI3WGcAvVuQAknE4qIXrcgqSgA==
X-Google-Smtp-Source: AA0mqf7DO44ALXhRZAPiuM+V1W0fxkgyZzkX4bB8c4FdxtK4JKZQi4P/Lv+fx2QhRoxVhqJfECndEw==
X-Received: by 2002:adf:e852:0:b0:236:8d39:6f84 with SMTP id
 d18-20020adfe852000000b002368d396f84mr7549203wrn.152.1668441127088; 
 Mon, 14 Nov 2022 07:52:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m66-20020a1c2645000000b003cfd58409desm9039277wmm.13.2022.11.14.07.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:52:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 2/2] hw/intc/arm_gicv3: fix prio masking on pmr write
Date: Mon, 14 Nov 2022 15:52:01 +0000
Message-Id: <20221114155201.425027-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114155201.425027-1-peter.maydell@linaro.org>
References: <20221114155201.425027-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Jens Wiklander <jens.wiklander@linaro.org>

With commit 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of
priority bits for the CPU") the number of priority bits was changed from
the maximum value 8 to typically 5. As a consequence a few of the lowest
bits in ICC_PMR_EL1 becomes RAZ/WI. However prior to this patch one of
these bits was still used since the supplied priority value is masked
before it's eventually right shifted with one bit. So the bit is not
lost as one might expect when the register is read again.

The Linux kernel depends on lowest valid bit to be reset to zero, see
commit 33625282adaa ("irqchip/gic-v3: Probe for SCR_EL3 being clear
before resetting AP0Rn") for details.

So fix this by masking the priority value after it may have been right
shifted by one bit.

Cc: qemu-stable@nongnu.org
Fixes: 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of priority bits for the CPU")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 8ca630e5ad1..b17b29288c7 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1016,8 +1016,6 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     trace_gicv3_icc_pmr_write(gicv3_redist_affid(cs), value);
 
-    value &= icc_fullprio_mask(cs);
-
     if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env) &&
         (env->cp15.scr_el3 & SCR_FIQ)) {
         /* NS access and Group 0 is inaccessible to NS: return the
@@ -1029,6 +1027,7 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
         value = (value >> 1) | 0x80;
     }
+    value &= icc_fullprio_mask(cs);
     cs->icc_pmr_el1 = value;
     gicv3_cpuif_update(cs);
 }
-- 
2.25.1


