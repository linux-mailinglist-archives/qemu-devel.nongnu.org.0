Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF81307536
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:53:15 +0100 (CET)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55rO-0007Wm-Hc
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gx-0001pC-8E
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:27 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gm-0006G2-KZ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 190so4054465wmz.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pwpcLBXHOvRWj5QvyfZ6n6CIKMm7bWYCXZk6VnOW8cY=;
 b=LT3QeIr0r0xqgkpylzUf7BFx4Y+5U3eRFVm3/k7Px4fwmb3VTYGRikIPbYbTBhhPcn
 nAwEIBFTXFTOQgvnzHYRF0BQBxKGe8gixy05dXjj6uQUYKty2jGcV+eqNtHBgnTUtrDZ
 QWUnLuRaTqBoaJorwcum9I+s3sMjkDszgKlEaWBW8IfB+rhVWa0rqi5Cm+fFK+PBEsol
 0LNeDLieDSqGNdHjPgQ5EwnZj5xoTsZI7RO0wbVewlr8LXOJ7Mvq+ZICwEpRR/1ItPrt
 qvekhU76tcc/lmoyC4D4U2VigSNcuS9h6rnv9ozN0jMLdwTm1UFmIb5vtxA3uL6TJ5eg
 f3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pwpcLBXHOvRWj5QvyfZ6n6CIKMm7bWYCXZk6VnOW8cY=;
 b=VJaWANy/yctrSUNQFOr8GA+h83o5gbaCkFjm6qm8eBuQlKkfVZYwFZnIFYrIUp00ik
 2ciK23fU6uRjLpicudlG2NvWOu9JQVaEip3+h6sEt4e13yaeuexPs/+UFOjJdMoKusDT
 YIB8QCxBDdimZO6AE+hpNPxuxyxJR5mlBjEyZ4Ekq8uUf/KADVVQSXWwcirbG4wdD7g7
 97dJFseFiFXWLmdVpfR1c58uX1AwutanNb2bWGHsagyk8ZZ+i8Y6ZQOFjeQt4OcUr3j0
 x5aotx9jV99/xHwbTUEyB3P8zz16Fp0vF41xs1vpUUN0vKY3HI4cAcifN6JxQpQyUCFp
 gAAg==
X-Gm-Message-State: AOAM531Et80+kYeS2hLRu9tB8aQ2/Dn0ONCNZwXXvT5iIEX5FfFpcYDz
 JzZzkBcTieoI5Z3s/o+Gfi6OZO5A4SZldA==
X-Google-Smtp-Source: ABdhPJzb234Wp+hSBt6KPmuO8DPI3ey+5NFofyy/JM/bB3oP+kiLPIOJiDl6hUBWFOAYz2S/sjv2yA==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr8350905wma.103.1611834135053; 
 Thu, 28 Jan 2021 03:42:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 25/25] hw/arm/stellaris: Remove board-creation reset of
 STELLARIS_SYS
Date: Thu, 28 Jan 2021 11:41:45 +0000
Message-Id: <20210128114145.20536-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the watchdog device uses its Clock input rather than being
passed the value of system_clock_scale at creation time, we can
remove the hack where we reset the STELLARIS_SYS at board creation
time to force it to set system_clock_scale.  Instead it will be reset
at the usual point in startup and will inform the watchdog of the
clock frequency at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-26-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 5acb043a07e..ad72c0959f1 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -780,16 +780,6 @@ static DeviceState *stellaris_sys_init(uint32_t base, qemu_irq irq,
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
 
-    /*
-     * Normally we should not be resetting devices like this during
-     * board creation. For the moment we need to do so, because
-     * system_clock_scale will only get set when the STELLARIS_SYS
-     * device is reset, and we need its initial value to pass to
-     * the watchdog device. This hack can be removed once the
-     * watchdog has been converted to use a Clock input instead.
-     */
-    device_cold_reset(dev);
-
     return dev;
 }
 
-- 
2.20.1


