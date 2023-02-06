Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD2368C98E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPA5J-0001k4-TX; Mon, 06 Feb 2023 17:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4s-0001hX-PV
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA4r-0004Po-1Y
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 17:35:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id d14so11869781wrr.9
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 14:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ja4W3C6qV83ArpsCqeiM++4iDHSuckcO6fogIFpWs7c=;
 b=cHYpvU8KaluEpb/hCw66FBlkDd7BL2koB0chQOkT7S8XilYS0t80dAh8PooqKgYjW0
 y5RSR6xTq5nHLmZDMuqVconLu3ZxOF7r/bLLWZk5bIJCWXzW+DeFh6GezpowlDvVAgvy
 szxc7pwUlTy3zCPNFQVB8lF1/r58v+GDT3AMWaENWj+yqW3w3izQsYRnlaN0lp2VK215
 EaFs8y4qQdbhAV5Z3q6NAI/Dw0gttZ+ubmHQS5SrzFBYCm67D8D2vflz/QI5vdSQp7T9
 u8Qxj4iHFmWYMO7H3Vxto2ZerF9nyVA/ieBV2p1Gpy+Ui7zOjLcc4V/cWr77hX/ZJQdI
 /hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ja4W3C6qV83ArpsCqeiM++4iDHSuckcO6fogIFpWs7c=;
 b=Q5I+841EuCdYo3BGBKuAqQ0++YQ3otwXF3aCehFXce7ot+5KruoviEgMLdQLxb+9kr
 leyDusAKeQPExZ47GIztcg7AEgA3AOMNX4KBiEB5r9HL5PLsYXgdGAk6EdLgfba8V6+g
 bpd8hg7nTNcIePD9oKTBK8CXBjHb+FOVJBw60Sh2Feot60o39IcwFU666xAyNVm53p+5
 InWYLETJYjAMnT0s791w+kKBB4AeAyG1/LkATQUDYwI1JGNYWvqaabruPd2lhOVOA2g1
 NK2MxQFpoOYtmI3ih6WB2Ss9odNC92EsXjW09uZqL7UX+YZn7X1Z2XE3/LUytIMwPgLd
 KECg==
X-Gm-Message-State: AO0yUKVAX1h0/FTW/uNdGllQ6Cr847qQFC+Leb87Or1W0t0uRFrStqLP
 aUCz9sX9EZzDh+R8D1lVuSWnISAkNvFef31t
X-Google-Smtp-Source: AK7set+qFWDb5PPKW8H3xuj8+n41BDIVj8nET0Wfx9jqCowDlDrsP+dUO56+taP3ojiFS3gWt32cpw==
X-Received: by 2002:a05:6000:1a48:b0:2c3:db98:3e93 with SMTP id
 t8-20020a0560001a4800b002c3db983e93mr515860wry.18.1675722904840; 
 Mon, 06 Feb 2023 14:35:04 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b002b57bae7174sm9879158wrt.5.2023.02.06.14.35.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/11] target/arm: Housekeeping around NVIC
Date: Mon,  6 Feb 2023 23:34:51 +0100
Message-Id: <20230206223502.25122-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Missing review: 1-3, 5, 9-10

Few cleanups while using link properties between CPU/NVIC:
- Simplify ID_PFR1 on useremu
- Move NVIC helpers to "hw/intc/armv7m_nvic.h"

Since v1: addressed Richard's reviews
- Do not restrict v7-M MMU helpers to TCG sysemu since they can be
  used for user-emu. Hardcode ARMMMUIdx_MUser
- Convert CPUARMState::eabi to boolean
- Split 'Restrict nvic to sysemu and store as NVICState' in 3 patches
- Dropped following (RFC) patches:
  - neg_prio_requested / unrealized property problem
  - use object_property_add_const_link()

Philippe Mathieu-Daudé (11):
  hw/intc/armv7m_nvic: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
  target/arm: Simplify arm_v7m_mmu_idx_for_secstate() for user emulation
  target/arm: Reduce arm_v7m_mmu_idx_[all/for_secstate_and_priv]() scope
  target/arm: Constify ID_PFR1 on user emulation
  target/arm: Convert CPUARMState::eabi to boolean
  target/arm: Avoid resetting CPUARMState::eabi field
  target/arm: Restrict CPUARMState::gicv3state to sysemu
  target/arm: Restrict CPUARMState::arm_boot_info to sysemu
  target/arm: Restrict CPUARMState::nvic to sysemu
  target/arm: Store CPUARMState::nvic as NVICState*
  target/arm: Declare CPU <-> NVIC helpers in 'hw/intc/armv7m_nvic.h'

 hw/intc/armv7m_nvic.c         |  38 ++++------
 include/hw/intc/armv7m_nvic.h | 128 ++++++++++++++++++++++++++++++-
 linux-user/arm/cpu_loop.c     |   4 +-
 linux-user/user-internals.h   |   2 +-
 target/arm/cpu.c              |   5 +-
 target/arm/cpu.h              | 137 ++--------------------------------
 target/arm/cpu_tcg.c          |   3 +
 target/arm/helper.c           |  12 ++-
 target/arm/internals.h        |  14 ----
 target/arm/m_helper.c         |  86 +++++++++++----------
 10 files changed, 212 insertions(+), 217 deletions(-)

-- 
2.38.1


