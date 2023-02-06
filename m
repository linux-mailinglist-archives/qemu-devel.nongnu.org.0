Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944968BCA0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0R1-0007LF-4b; Mon, 06 Feb 2023 07:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Qy-0007GA-Qs
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Qx-0005lF-7A
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8605939wms.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oLH2N/w79VptGJTqWIiiTK47yGtiakTQYhWs+w0Tnzs=;
 b=vpTBjOrhoP2eho/wxD9qI1tCjBwca/09Ay0iqfQjYvmcmhO73JFKmsrDqk+BN2cW05
 qfEs3FcwTCX3a7RAuRHR33lSANEDHVE9HFza6Ko9Rkd4cgPWQTUE9uzgxr2H2FZS7yBR
 +vLX0XwMc0fWgbAJcp0CynrtTNLORtBYxjYQzWpb0ecAqrxQsrThkcSVJ2QrOc9Vixuc
 69lozeg9ZkJvejwI1aOulC7LTQGnSLBxli/p4AhqJ0kaJ5fX9yTNBjSkU4Is+Zz8qa/r
 kxNjlSx8bk5g980ZJdAcGbgLTB8s8HK23q0J3DEF15G/eY3v15Yi3BiG78ATun42gEKw
 mfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLH2N/w79VptGJTqWIiiTK47yGtiakTQYhWs+w0Tnzs=;
 b=ZsfiHAZJXro6NTicsQt9mjXKIVaRTc0tGg2pHn5Gw0cCLJKRwRAzTgNl1+chgtWFP2
 4BMhLlb3+vAGb1mEmL+DUGr3lVqtUZ9wJ6v2nqmC0naqZKRDaJ+4dYveDpgHAGvynOfM
 kZ6IxaYOGerDP0CLSUQGOzn3RSP7nsnv86OBB0ZnJTZpIu/ICUu2TcSxUPt6LArnd/2I
 twwiVM/ukkv7RREsB4+NXDv0FWN1p3VHcYn3+umMpMiZPQ3xk+WS5tT6ljQPpPH/KLM5
 hoJ+am9vUa5/5LRiOM5FpWRSAHAQgwC+CtDLAv/GF4eZr9uKOftW06C1pa+zkJ7MBtm9
 KNBg==
X-Gm-Message-State: AO0yUKWfyADraZ/g3WB5yA9raqT39ZP1JVR+tgs3tst9W4Yt+6SYBLHR
 4yN+LhbMvtnMRYJh/tLomplpx5JIw2hEpryZ
X-Google-Smtp-Source: AK7set+yRobzC1DFrEUt0rQMzn7/OmyqFSPU4tw16CihIi+wA1Fwah/r9OvoCFHbdjAje+I8Dps72A==
X-Received: by 2002:a05:600c:3caa:b0:3da:270b:ba6b with SMTP id
 bg42-20020a05600c3caa00b003da270bba6bmr20362007wmb.41.1675685837267; 
 Mon, 06 Feb 2023 04:17:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b003cffd3c3d6csm11698690wms.12.2023.02.06.04.17.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] target/arm: Housekeeping around NVIC
Date: Mon,  6 Feb 2023 13:17:05 +0100
Message-Id: <20230206121714.85084-1-philmd@linaro.org>
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

Few cleanups while using link properties between CPU/NVIC:
- Restrict code to sysemu|useremu or tcg
- Simplify ID_PFR1 on useremu
- Move NVIC helpersto "hw/intc/armv7m_nvic.h"

Something odd occurs when an ARM CPU is realized, the
CPU reset handler is called, ending calling
armv7m_nvic_neg_prio_requested() on an unrealized NVIC.
I kludged by checking whether the NVIC is realized, but
this rather looks like a code smell...

Philippe Mathieu-Daudé (9):
  target/arm: Restrict v7-M MMU helpers to sysemu TCG
  target/arm: Constify ID_PFR1 on user emulation
  target/arm: Avoid resetting CPUARMState::eabi field
  target/arm: Restrict CPUARMState::arm_boot_info to sysemu
  target/arm: Restrict CPUARMState::gicv3state to sysemu
  target/arm: Restrict CPUARMState::nvic to sysemu and store as
    NVICState*
  target/arm: Declare CPU <-> NVIC helpers in 'hw/intc/armv7m_nvic.h'
  hw/intc/armv7m_nvic: Allow calling neg_prio_requested on unrealized
    NVIC
  hw/arm/armv7m: Pass CPU/NVIC using object_property_add_const_link()

 hw/arm/armv7m.c               |   4 +-
 hw/intc/armv7m_nvic.c         |  44 +++++------
 include/hw/intc/armv7m_nvic.h | 128 ++++++++++++++++++++++++++++++-
 target/arm/cpu.c              |   8 +-
 target/arm/cpu.h              | 137 ++--------------------------------
 target/arm/cpu_tcg.c          |   3 +
 target/arm/helper.c           |  14 +++-
 target/arm/m_helper.c         |   9 ++-
 8 files changed, 179 insertions(+), 168 deletions(-)

-- 
2.38.1


