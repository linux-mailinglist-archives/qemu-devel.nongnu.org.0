Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE9689BAE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:31:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4h-0006su-Fk; Fri, 03 Feb 2023 09:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4U-0006fQ-Md
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:46 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4O-00055Z-Og
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:44 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so4005652wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PCE6xhlUxSVGC/HAzEQA6//gIKkr5P4027KM8duLe7Y=;
 b=smExylBu+dCWNA3iRN6G2wrNloWUa4Uctl9f5ddsyGBmSvd1wEu2psoXlRaCVlgwXN
 lxOaHTlobfPHw90UtMUr55q9wZkxJd8u+UQ5YejV7EEyXUAPLmy8HB0oS8wrMfHzBzl+
 byjE/lJDZKRmyGn6eTv/uUYmGiBKuFH9BS9zFI63xs0gaWpCX9qpULBAxgShz1MssgOe
 954oporfEtAEUUj8S2XTGLgRYxlUDGPwt3CjPaF3jaHwMAyadJ1Aaimpzzn8zwjmLsEj
 js+ZwEQijRwYJ7eZHVX1hFVBDlbVjIOBVgLFUpLKwiq5f730K+6m3aAZnc0oWWqKfG+E
 a8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PCE6xhlUxSVGC/HAzEQA6//gIKkr5P4027KM8duLe7Y=;
 b=AT4PrlwhPVD+uK2Zah9r4/BlReFCx9l0XV38R008xR6TYJjya8Q8XCIkeD0y2X7gjP
 pqDKzu1ZBQjbYojVr661Q66lc8fgAhbQ6a8d7CfSWB1KX2YPkcw9qUHW86OBheLZIIyi
 3scZO8iFTkMQeIvdi/8pxeK8uMWKz217zp10RbWcUjiuqJjxo8FA9ThYqwvvpx5eSqZM
 toSEGFd0jDMtyem+80UfW80OZ1UUojmzk/mu+r/s40uy8vwlW/GNwpgIiUPNITr6Mbsr
 ZaQOq0IIG419kFlsDfEdAT4GNojGWPwTTFl612IA0nk1h/rOCrtLH66KXWpCoXIETSbr
 V9LQ==
X-Gm-Message-State: AO0yUKUdXK/6pM2Zxo+5T8WWTxWSqasfUPEj2TgSmS3WHXXV0H8EZSfJ
 BrgWrlgmU67GAFkUh4vduzdJhEtFUujwLrOe
X-Google-Smtp-Source: AK7set89ukBBqbO05qOF3lfrtWqaA5ETDwxUYFFjXh7QigWABw6K5GHO3DLH3ZmspjUCBqwUhwxogA==
X-Received: by 2002:a05:600c:3795:b0:3dc:561a:79e7 with SMTP id
 o21-20020a05600c379500b003dc561a79e7mr9541317wmr.2.1675434577609; 
 Fri, 03 Feb 2023 06:29:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] sbsa-ref: remove cortex-a76 from list of supported cpus
Date: Fri,  3 Feb 2023 14:29:04 +0000
Message-Id: <20230203142927.834793-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Cortex-A76 supports 40bits of address space. sbsa-ref's memory
starts above this limit.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230126114416.2447685-1-marcin.juszkiewicz@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 8378441dbb1..f778cb6d097 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -146,7 +146,6 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
-    ARM_CPU_TYPE_NAME("cortex-a76"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.34.1


