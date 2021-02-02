Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBC30C91E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:13:04 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70Ah-00069j-94
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztz-0005WR-QT
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ztp-0002Gi-0s
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:55:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l12so21439790wry.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0IbeLEv+nBGqgdfGoMlEhJ+BrvMFVB6OHrLiFHgUDlA=;
 b=MBMTAd99AdxyL+9wT5RJTfh0bNUfLluVw8v8Y+AULOmERVkqhTIytEi0ycBtSPrMxZ
 /kRPON5Zxctr08465n7scXL0NfkyaBDn/zOh7S2Z/9gI3BmqSQ1e9tmWEGuOkJw+Y/jq
 sz6rx6znpMdxQ3mJJQmERs1gV5d3JZVbilUXVGXVI8BzQpkpCxyXLuAqi+YTkAOdZWrO
 N23yrzX/r0ZfT4smrnAXI86r0RAjyevFJ7rCXMnpRb2a6bPfGc+pphVOD8dJY0ozVlqI
 RukrlOMbtIOnP+VU/86BLUU33RQiE3pJ1LZ7t+QtjyHrEYO1uiMNX4mY1JXvTlAJaq/N
 cbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0IbeLEv+nBGqgdfGoMlEhJ+BrvMFVB6OHrLiFHgUDlA=;
 b=HlT/gfMMH4JnNAc1n2bcWZBhJy/11Z5DoKzAT25U0bPP3a0YttsZlOIyS8iFsf6OsZ
 4fU1vSrC1Tuq6bOIPJwjbB1V1Fn81+OVn8a+AGU7JfoowO4Mss/617YcEi/btZeu2sHh
 ZKEtlDfLbFyF55d9tvSxhm7WwAIJQm5Vi1iWk/2382Ca+xCRhAZKPU0NYmcR4x3eu1NE
 H/2kLUgmYJr0UUzEpCtK2FSVE+kEAH3e34qOEbmXuSJ7TQxrTpap7lmerCPXmLC8SIKE
 rdI70j3Zu8B9xuw579hs/vkpa1r/wM+wMoJcKgVE7Q2DAT8sv64Ht0GWG8sGamInzSDJ
 PSyw==
X-Gm-Message-State: AOAM530bV4tpzixkomLiqK8D2I3kYkY8kEa5IyqXA9mkjCLv8easkpRp
 L6S1izmHdd/8nou31yoV9nG9ClzBtX1kvQ==
X-Google-Smtp-Source: ABdhPJyDPZJjNuL0LajBgqb+ufw0JcqwcP7W5oYbfcWfl1/DYvGKxbA7hwpvqKBDTXB1sOSUhxicAg==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr24800539wru.152.1612288531738; 
 Tue, 02 Feb 2021 09:55:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm4142283wmj.32.2021.02.02.09.55.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:55:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] hw/ssi: imx_spi: Round up the burst length to be
 multiple of 8
Date: Tue,  2 Feb 2021 17:55:08 +0000
Message-Id: <20210202175517.28729-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202175517.28729-1-peter.maydell@linaro.org>
References: <20210202175517.28729-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Bin Meng <bin.meng@windriver.com>

Current implementation of the imx spi controller expects the burst
length to be multiple of 8, which is the most common use case.

In case the burst length is not what we expect, log it to give user
a chance to notice it, and round it up to be multiple of 8.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-id: 20210129132323.30946-9-bmeng.cn@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/imx_spi.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 2fb65498c3b..41fe199c9f1 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -128,7 +128,14 @@ static uint8_t imx_spi_selected_channel(IMXSPIState *s)
 
 static uint32_t imx_spi_burst_length(IMXSPIState *s)
 {
-    return EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    uint32_t burst;
+
+    burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+    if (burst % 8) {
+        burst = ROUND_UP(burst, 8);
+    }
+
+    return burst;
 }
 
 static bool imx_spi_is_enabled(IMXSPIState *s)
@@ -328,6 +335,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     IMXSPIState *s = opaque;
     uint32_t index = offset >> 2;
     uint32_t change_mask;
+    uint32_t burst;
 
     if (index >=  ECSPI_MAX) {
         qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
@@ -380,6 +388,13 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
     case ECSPI_CONREG:
         s->regs[ECSPI_CONREG] = value;
 
+        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
+        if (burst % 8) {
+            qemu_log_mask(LOG_UNIMP,
+                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
+                          TYPE_IMX_SPI, __func__, burst);
+        }
+
         if (!imx_spi_is_enabled(s)) {
             /* device is disabled, so this is a soft reset */
             imx_spi_soft_reset(s);
-- 
2.20.1


