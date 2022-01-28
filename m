Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52049FE41
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:43:47 +0100 (CET)
Received: from localhost ([::1]:47012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDULi-0005f7-E8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:43:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDO-0002HC-Kz
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: from [2a00:1450:4864:20::32d] (port=43868
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0006Jd-SS
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso1250680wms.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tC3w9/x0OfjkAjjFI9nzbpgiKr47Rct6S90BOp4oX6s=;
 b=pyRNfOpnmQ7Mn2DA7Gj+8aumZCHhp56HTY/wqBqfPaiCEAtHyQv7wZnHxlUaexIY/y
 Ga8N8twpRDGOhvP/O88hKsgLcuS0sfG1/rEe0bIF7VJ6OdX0FQ6yDzjpStt2G46FW/ti
 rvVrDeZ1tX7/QxFfn3NoIVW4sZTjfvizr0Kng/j7ze3UtSM3VxVb547DiuxOzqxFjUmO
 HMGwVrByVJxvRK+dgFl3iDQ6o5bQwo9COU/Wu0tP/S9O5bot8IQT5ESi0bpFWXQthDbP
 MhCTuvJDMM4uPlZwoJymcL/o58DobMc0lAoxGIhOSkHAlslbIQ2wB/4tEc4M4LX5b7BS
 8k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tC3w9/x0OfjkAjjFI9nzbpgiKr47Rct6S90BOp4oX6s=;
 b=5NBVh9itkTHaRqOCP0oLXoDPfgavzXPTrt+kEfbKXY4AHKqByPnFS/QIYPBfWQen1V
 8SMIUwtMvXVt5kvSqXBWZhavlR7V4PtJ9R+5wC7PJs08rJSQciIongZHWCAfxCbx7FDH
 rtIbq2JPWErEosIGYTv1xfRHigkhD9qMkh9ND5+YmjA5fZi1cKfHPBQ0G/+bT4XOkGIb
 ssWX2DD9/dVTG2937CLPMcLdmPWRBaAMtXuMKOjIoPrmNctOtXrw5nbMDf+Lm/UXg9cU
 zLlXNvz6DDLNMSEyWBVfcuXXAOUw3eTX8B2z721LmNY/pqNClbM/RNmaLakpotnb1FLK
 20Bw==
X-Gm-Message-State: AOAM532fQov0RZ9zhydod5l+BAibuVjU8EO5BhehKNpXMRsAIKR6xRsD
 ZdHvECtS95/xQ28mQNvSDqjcmhevdPIG7Q==
X-Google-Smtp-Source: ABdhPJzT8QS3MniWHucPJi9NGXccrNHLb8za9DV68ms5//YXsyFm/inD6+cB3h/uFWk9h5nHA3llIA==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr2424296wmc.112.1643383817022; 
 Fri, 28 Jan 2022 07:30:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/32] hw/char/exynos4210_uart: Fix crash on trying to load VM
 state
Date: Fri, 28 Jan 2022 15:29:40 +0000
Message-Id: <20220128153009.2467560-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The exynos4210_uart_post_load() function assumes that it is passed
the Exynos4210UartState, but it has been attached to the
VMStateDescription for the Exynos4210UartFIFO type.  The result is a
SIGSEGV when attempting to load VM state for any machine type
including this device.

Fix the bug by attaching the post-load function to the VMSD for the
Exynos4210UartState.  This is the logical place for it, because the
actions it does relate to the entire UART state, not just the FIFO.

Thanks to the bug reporter @TrungNguyen1909 for the clear bug
description and the suggested fix.

Fixes: c9d3396d80fe7ece9b
   ("hw/char/exynos4210_uart: Implement post_load function")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/638
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220120151648.433736-1-peter.maydell@linaro.org
---
 hw/char/exynos4210_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 80d401a3795..addcd59b028 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -628,7 +628,6 @@ static const VMStateDescription vmstate_exynos4210_uart_fifo = {
     .name = "exynos4210.uart.fifo",
     .version_id = 1,
     .minimum_version_id = 1,
-    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(sp, Exynos4210UartFIFO),
         VMSTATE_UINT32(rp, Exynos4210UartFIFO),
@@ -641,6 +640,7 @@ static const VMStateDescription vmstate_exynos4210_uart = {
     .name = "exynos4210.uart",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(rx, Exynos4210UartState, 1,
                        vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
-- 
2.25.1


