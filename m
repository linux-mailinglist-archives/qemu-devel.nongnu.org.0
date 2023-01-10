Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D9663BEB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9wa-0005US-Hz; Tue, 10 Jan 2023 03:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wY-0005Tu-BD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:14 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wV-0004T0-QJ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:14 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso11158827wms.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eO/Y1otoH15WnngXP0Dg6Co0UNjjzPD4e/DM67bs2EU=;
 b=A30Oys2mw6ZjEqxiC4JWnb6Hej+zQ5j4KcPxbh472LnAAXXKKnlUvllHf/iD7ckuGz
 E5CWxx5MJVIfNjHDXyNLpIP/dA3aJZZu5A8671Mb7vVMvz17CcR3Xq/bAQc8h/7lvgPw
 VDaarI7RyKwmmNYvApI1ZDFD3jSYg66zWJtXkDSAu2Hg1K4i3kTekDcqDYLC/M+qScC3
 tHc1hS823aXTHUDVAi+fuW+8JYWrpMcmcyIG0j1NTd0oA9MiV7SUYr6SQB3RAVPVH/xw
 HCHLm6luITJJMySwnD+NNbaOJXGoZOIBzYf+u2Jh5FVV8aapi8uPblNFHvIE75fgHTTr
 HcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eO/Y1otoH15WnngXP0Dg6Co0UNjjzPD4e/DM67bs2EU=;
 b=TkVaQS3XPawgyq2NeJQZ8uPnO46zgJMoKKyZA8DN7HyKDAJcc8lPsf/QecAqus+CgJ
 M9hzsch/dqd3QdgaoGHXa6bUEy2sfiJJCdCbKzVra7jVEofT+xCNmfEAfz453bnP5reY
 JfEqWqz5LwkhkLl15jtvYufCt3rx76vSYH9GCFYDAeexSKEq4fI3irESAELuBG0dUQ5E
 57EPBpR56v7dblKPv9H8slyLyEOPPkuJOP0EqI6Cf7/Pd6dzvBVoYF0zNxMnmGdydtnc
 hfM9a5lrCjYjvHIg+4ZB5UwdKj7uOXaZGHJzV6gSWijR4crj9MC7AjxW3rhWf+P86gNk
 vYYg==
X-Gm-Message-State: AFqh2krRS6C1Z2CB4DuJup7BKOWjTPzqjUHQ1jfo/wuOpTI/MPwYjONF
 IBP/ZLwnOLLEEx9a6YuaKOOMFH1e8y0Hzqko
X-Google-Smtp-Source: AMrXdXs4fhyhOAXogot+6Cefk/V3TvSzm41K8jZblaXzqDotF5S+dGoHuPksp7VscB6XVzidX7T84A==
X-Received: by 2002:a05:600c:4d14:b0:3d3:5c7d:a5f3 with SMTP id
 u20-20020a05600c4d1400b003d35c7da5f3mr51997316wmp.37.1673339110127; 
 Tue, 10 Jan 2023 00:25:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003d9a71ee54dsm13634785wmj.36.2023.01.10.00.25.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:25:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/5] hw/i2c: Rename TYPE_VERSATILE_I2C -> TYPE_ARM_SBCON_I2C
Date: Tue, 10 Jan 2023 09:25:03 +0100
Message-Id: <20230110082508.24038-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Series fully reviewed.

Since v1:
- Updated MAINTAINERS
- Picked R-b tags

---

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

 MAINTAINERS                                 |  1 +
 hw/arm/Kconfig                              |  4 +--
 hw/arm/realview.c                           |  2 +-
 hw/arm/versatilepb.c                        |  2 +-
 hw/arm/vexpress.c                           |  2 +-
 hw/i2c/Kconfig                              |  2 +-
 hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 39 +++++++++------------
 hw/i2c/meson.build                          |  2 +-
 include/hw/i2c/arm_sbcon_i2c.h              |  6 ++--
 9 files changed, 27 insertions(+), 33 deletions(-)
 rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (70%)

-- 
2.38.1


