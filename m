Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962385FA0DD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:06:14 +0200 (CEST)
Received: from localhost ([::1]:60664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohuM9-0006vY-5B
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtlB-0006WI-QI
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:01 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtl9-0005aG-At
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:28:00 -0400
Received: by mail-wm1-x329.google.com with SMTP id t4so6938510wmj.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nSdHJeWqWDZOQeABzXBHYYSEmw+sgR02dIC9udOVmMk=;
 b=t+BErM9br1YlQLslYwau5GkqlHmMJKbeFKdIE+dRMBkUsviOxvr7nqMVC4h4Rfd3P3
 Z+l2Kg89EAYCfqD5t92+O9I8A2D4/dOI0yLoIWkjuDvIpww7WrXyNAiWn+/wRr92Y1m5
 aO7KLE2CxnI9wYle+Pa8Nc80TV+G0VBZraux65W557GTAxKnZcfJJLpO9nRXdiBctSGS
 JZRtNG/v7WIK2pz3kNi2SQWUtjoi0H4Aqj4++zq3s1CrgHYJ/w3XoZQgbhGtWKa4Zmsj
 uSBCZ6MlpTlghwRw5KqM9IWrpVLyeo1hqsRjeQ0RXyA9sVvD7DPVcbUDwYKFU5qPkJ73
 KT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSdHJeWqWDZOQeABzXBHYYSEmw+sgR02dIC9udOVmMk=;
 b=x7eouCXmtSF0ZPIDkXg3b+674SJkWgJvnHcSSKJEVwuj7BuSxfYWoo1Nsaz3/go4OE
 +wDWW1yg/OZqqcY2Bw7gTm8mnsNcu1b2vqa5dW1dml4dkPYclRHgKf+WfDr5uTCg0THD
 ByDHG/SqM768B8QFJGB5OFu2fI1r9+Q3afLOwYm31g2XcLib0InDtLV/OzXnbfKy6KQu
 efnLugRlm7MEXbAEAotTNWjFAkjSbG9m++/vmxtt/anLUJ/aFXw3XdYYIR+NanZDl6+k
 kwUgarxRcYvHSv8/sQbGPK0z3QAidmopG0ajOSoJTPd5ch/6klVEdy1GN9HmOgV3Lp88
 8SKA==
X-Gm-Message-State: ACrzQf3+BfJKkHyJGaVQ9CwNLMjxgadveOd6c8mmDub/fPrEZgB9IiOQ
 4ZIdBkKoUIsKHUSoyAJThQ5U3bq9N45z9g==
X-Google-Smtp-Source: AMsMyM7vGpq9iKlD4tYYt2TCx0PX9NwCaZjthv72EbK0U02h1Sat/yS3/JQZ/zKgvf3nZrfbQ+kl6w==
X-Received: by 2002:a1c:730e:0:b0:3b4:b0c0:d616 with SMTP id
 d14-20020a1c730e000000b003b4b0c0d616mr13128048wmb.72.1665412078642; 
 Mon, 10 Oct 2022 07:27:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/28] hw/arm/boot: set CPTR_EL3.ESM and SCR_EL3.EnTP2 when
 booting Linux with EL3
Date: Mon, 10 Oct 2022 15:27:27 +0100
Message-Id: <20221010142730.502083-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jerome Forissier <jerome.forissier@linaro.org>

According to the Linux kernel booting.rst [1], CPTR_EL3.ESM and
SCR_EL3.EnTP2 must be initialized to 1 when EL3 is present and FEAT_SME
is advertised. This has to be taken care of when QEMU boots directly
into the kernel (i.e., "-M virt,secure=on -cpu max -kernel Image").

Cc: qemu-stable@nongnu.org
Fixes: 78cb9776662a ("target/arm: Enable SME for -cpu max")
Link: [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst?h=v6.0#n321
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
Message-id: 20221003145641.1921467-1-jerome.forissier@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f760..ee3858b673a 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -763,6 +763,10 @@ static void do_cpu_reset(void *opaque)
                     if (cpu_isar_feature(aa64_sve, cpu)) {
                         env->cp15.cptr_el[3] |= R_CPTR_EL3_EZ_MASK;
                     }
+                    if (cpu_isar_feature(aa64_sme, cpu)) {
+                        env->cp15.cptr_el[3] |= R_CPTR_EL3_ESM_MASK;
+                        env->cp15.scr_el3 |= SCR_ENTP2;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.25.1


