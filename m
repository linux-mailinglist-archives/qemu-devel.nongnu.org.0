Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B302A6A439C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5J-0003mo-UW; Mon, 27 Feb 2023 09:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4P-0000o6-Kh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:42 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4N-0007dh-Uo
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:37 -0500
Received: by mail-lf1-x136.google.com with SMTP id s22so8642071lfi.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s3p4BYVS0fXofW3OGu8iWGz+dlE7VopRg+VENQUXfKg=;
 b=Vn1OL1xDJJy/CCs7G1bkkFkMBB+lGrlM4TzYq2N+XuwO1rct9INP4clQJmUfDubxeH
 frLuHbhUCiWhGCalrTV7mSYBfMXq8E6IGVdTtNLHTxY/Uhhqs3P8rCLhbp5SLMvje2VU
 RnrVuVxdWQkZ9TElNNWUa5XoqwHEtSxobInn55wgUfPsImtQqvw9ydW/6FFJ/2u8317F
 nK3l8GLuHKV9/eOaG8n4XvfqSHgrpTNepn4k0W79KLpLyw4iSNkIokr0X9Wrb41lNtvT
 Fup2RtJ/AWbQ8rp6M4ZmGDZx4S3x4IYfrTWqVDInoWuL2jV0Pv4GD7xWaMlTkAHxY19l
 6j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3p4BYVS0fXofW3OGu8iWGz+dlE7VopRg+VENQUXfKg=;
 b=dy5V8gc07+Ztyhu7n+3vSn/qkuVV3Lxk5OJIPBx4N9x1ihJplw4Wokn/uNpLsEfpdB
 /DB2vERXdZDAe99C2zFXrSRBWn3NSGn01QrpWO22ojvnuL1djZIp3nnL+MtPYZTDHYLi
 LU9SoVYqjWnSfyeotRxhF7i0zNTEjM0163ExJhn6x0lmSf/Fd5e3tXLwnFEKavZBNohQ
 jxr3OowFrEi/hxd1mn7jPjAXPhsObbaHV3N6/aQ7pylQzAT/xM5c1hemhMi8vgwZXe8D
 S1HMf6SPBhYqM6NMfwRYvWZMtwccNx+eRC+kXB2Gi89yHdbi2zKunTmlnWA0Mz7Z4QBy
 V6/g==
X-Gm-Message-State: AO0yUKVIbBszyl6D18TsjOAlIKA9A+0LTmIxPzphKyhAXEjfd13kPe96
 UJ6nwGaX3SZScg2EFCHRtNxpAIZKinKqSZUp
X-Google-Smtp-Source: AK7set/+w+yx4VciZwmWWDjXvNgBh9mMwJnoBgvpZ4OaT6H9mcQ/Aq+N7i5OEW56xSYmNnTfTnbEwg==
X-Received: by 2002:ac2:4e65:0:b0:4df:3185:5e05 with SMTP id
 y5-20020ac24e65000000b004df31855e05mr1533042lfs.27.1677506493311; 
 Mon, 27 Feb 2023 06:01:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/25] hw/arm/musicpal: Remove unused dummy MemoryRegion
Date: Mon, 27 Feb 2023 14:00:58 +0000
Message-Id: <20230227140102.3712344-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musicpal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 89b66606c32..06d9add7c72 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1072,7 +1072,6 @@ struct musicpal_key_state {
     SysBusDevice parent_obj;
     /*< public >*/
 
-    MemoryRegion iomem;
     uint32_t kbd_extended;
     uint32_t pressed_keys;
     qemu_irq out[8];
@@ -1161,9 +1160,6 @@ static void musicpal_key_init(Object *obj)
     DeviceState *dev = DEVICE(sbd);
     musicpal_key_state *s = MUSICPAL_KEY(dev);
 
-    memory_region_init(&s->iomem, obj, "dummy", 0);
-    sysbus_init_mmio(sbd, &s->iomem);
-
     s->kbd_extended = 0;
     s->pressed_keys = 0;
 
-- 
2.34.1


