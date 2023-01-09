Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D832666214B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:20:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoI5-0000rV-VV; Mon, 09 Jan 2023 04:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI3-0000qi-D0
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:17:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI1-0002ZJ-Of
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:17:59 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso6582134wmb.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2QbiPkSepNTipu9Sy6f9nk00cA9LLT9J23YFFYJq0ZY=;
 b=X4TIAu7PuTihi+UQYeyf91GRDtqtPHUGxdgLU6l88g43G+1G5Ct1lBgz/eylVHUspM
 cSZmO2WDb7/sAeCe8yccpKAQjZnLI+aKYKUnti6GpjTTTBQw8TzBMe4cQVObuqenWSYh
 d2RMy52h3RXDKe2STO+GauatZCp7r4wenELUUZRJdlSWQKv0peXXZVKZfzA+0CVAs9e0
 1f0G8zMK4DrFdCJUFrJNShSrXgfmjUDD7lV6JBsNp44EfIuZkw3IVwMrHb3PmuInaEs7
 P35Xf3MfQiP6UdkPuJyTLZaCDxntDSsivtCpE6gcjNrt5h7w4imDlX6s0Wflx/T3wb/d
 Qurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2QbiPkSepNTipu9Sy6f9nk00cA9LLT9J23YFFYJq0ZY=;
 b=D5gA3Yph/tPUY8PKw5GS0+0vvf3njdvrdjF2GmtOdaQtu23pfTgq9knI3UYUqrBWVQ
 dAuMRLqC31CMfIV4WSP2St5d9/B4bDbGC+48UQgLB5izKXGqFdbyfACG2BdJgBtmj584
 IMoTHn2dVVqZdH6SxdGTCyUeQTzwm2Rh/HFO633xFfNgec3HiiSFR4gyEqan2rBvzO/7
 eNJfIPl/YW62FhQovL07xOfdm3mWOHNOO1KD4ZtVUuWMhc6AGOhLyJY2zH4CqnPcN+bS
 EaaE5dE8k3TClh+V9QQAwKl6K/RcUbNXoT1kHn7ieIH1Dx7kuH3bkS4ikRTTLoLcpRs/
 e8VQ==
X-Gm-Message-State: AFqh2kpLscGU8IuYwNH7eI8mJESxVmqlWKObomdmCuDQdp/t5Si3GAQq
 DZq/clkNb6QNPVmHgxNGN8hO1xu7cLifRdAe
X-Google-Smtp-Source: AMrXdXuiCE+rIsfj5LR4KcklIgRl4pCYJRUNYD41jx/xV533Eo+wzX4X799beVw4kFw5W+BhBUTsLw==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr48772705wmq.33.1673255876012; 
 Mon, 09 Jan 2023 01:17:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm12072388wmq.37.2023.01.09.01.17.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:17:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/i2c: Rename TYPE_VERSATILE_I2C -> TYPE_ARM_SBCON_I2C
Date: Mon,  9 Jan 2023 10:17:49 +0100
Message-Id: <20230109091754.79499-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Lot of churn for what started as a QOM cleanup. We have:

  typedef ArmSbconI2CState VersatileI2CState; // [*]
  DECLARE_INSTANCE_CHECKER(VersatileI2CState, VERSATILE_I2C,
                           TYPE_VERSATILE_I2C)

  typedef struct ArmSbconI2CState ArmSbconI2CState;
  DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C,
                           TYPE_ARM_SBCON_I2C)

In a later QOM rework series, [*] produces definitions clash.
The simplest fix is to avoid having different types defining
the same QOM model.

This model started named TYPE_VERSATILE_I2C then we figured
the official ARM name (did it came later?), and renamed as
TYPE_ARM_SBCON_I2C. Finish the conversion, remove VERSATILE_I2C
name and only refer to this model as ARM_SBCON_I2C.

Philippe Mathieu-Daudé (5):
  hw/i2c/versatile_i2c: Drop useless casts from void * to pointer
  hw/i2c/versatile_i2c: Replace VersatileI2CState -> ArmSbconI2CState
  hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C -> TYPE_ARM_SBCON_I2C
  hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
  hw/i2c/versatile_i2c: Rename versatile_i2c -> arm_sbcon_i2c

 hw/arm/Kconfig                              |  4 +--
 hw/arm/realview.c                           |  2 +-
 hw/arm/versatilepb.c                        |  2 +-
 hw/arm/vexpress.c                           |  2 +-
 hw/i2c/Kconfig                              |  2 +-
 hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 39 +++++++++------------
 hw/i2c/meson.build                          |  2 +-
 include/hw/i2c/arm_sbcon_i2c.h              |  6 ++--
 8 files changed, 26 insertions(+), 33 deletions(-)
 rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (70%)

-- 
2.38.1


