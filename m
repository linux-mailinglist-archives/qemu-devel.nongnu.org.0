Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B6E3513CE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:43:13 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRunA-0000mq-40
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulI-00073Q-IG
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:16 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:33499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulF-0002MA-Oh
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:16 -0400
Received: by mail-oi1-x22c.google.com with SMTP id w70so1377771oie.0
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGYBGkCw32k45Ta27ICyGdC2SYG8sJKDr39eAgP8n2U=;
 b=HGon65tJeZU+nIDtLVir42Wa+5SiRLWxRDT5eAePfO5HGI6c/C8kL7WgDbmjD+FZDv
 t+bs2l62squVILEWs1LaeavaUdm7ByW1byS/praWp4TLb8kzPFrxm4N/nbm8QkLwzzwG
 yNUblwim1W9GuA3Mmh0RYKyige8bGd0Ol/D/iBmEw/jtLQqusvrr9ClKBRTHveRB/9ov
 YytePGHHZ3xsGeKivGVW1LZ39RyGj4h3ShXsVkanojeP3uYtADb260kg0JkXTtsHZ+0s
 aTU2fNmh9Q0k3kcIGM/b2F3FTg3cs4Oe5C5rC1hPCOcaqkwlwzb5DiBMkBvIxfHl89+O
 VPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGYBGkCw32k45Ta27ICyGdC2SYG8sJKDr39eAgP8n2U=;
 b=cNfrZjK03IQa3Cjp5+p6rrANQEXEb0prLPY563caMuLz+FGrQ9H63KAqqa6+A9ltAn
 lP7VNPOs7fl8ZkdK4nIYeiIKOcmVn/98sF7oaycMZkw/em6x3s9D775GXmevIR73Rk47
 16VFHyO4SsDPJ2PdnZS+sL+M/e5/IJ9NHnoz5siKJ2TuF16FOrUbBuMnShlre5wNnsIV
 stgJx+VCbQgBAcz+9WHCDRfopgpXTPVKd0azo02eORKbAgft/cBSYSpXxlBhKYCAL0bh
 +2I89AlGmW1adoXfYtPdrm03aHjGKGM5DrVxO8StXZXwGLEQur9KWvlV0Rq6ottyNSwJ
 nNKA==
X-Gm-Message-State: AOAM5303Y2vxJePToTfFiV3qWusKBERDBz7MjgkXgPpqivZyD9rAzCx0
 L/BTTWdO9ihRRO6TlKgEiteqj5jAdUyv
X-Google-Smtp-Source: ABdhPJzcg0VUA16bzs6TrdNSjzYYUDmTWd0HZY2+ZVwFxT+GaZ/MeIJTD8pIbzaAYqzkUujjhhyDwg==
X-Received: by 2002:aca:1302:: with SMTP id e2mr5346157oii.170.1617273671822; 
 Thu, 01 Apr 2021 03:41:11 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:11 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 0/6] target/arm: Add nested virtualization support
Date: Thu,  1 Apr 2021 10:40:52 +0000
Message-Id: <cover.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
  - Move the NV to a CPU feature flag(Andrea&Andrew)
  - Add CPU feature 'el2' test(Andrew)

Many thanks to Andrea and Andrew for their comments!

This series add support for ARMv8.3/8.4 nested virtualization support
in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and 
has been tested on a FVP model to run a L2 guest with Qemu. Now the 
feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
starting a VM. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-5.12-WIP

Haibo Xu (6):
  Update linux header with new arm64 NV macro
  target/arm/kvm: Add helper to detect el2 when using KVM
  target/arm/kvm: Add an option to turn on/off el2 support
  hw/intc/arm_gicv3: Enable support for setting vGIC maintenance IRQ
  target/arm/cpu: Enable 'el2' to work with host/max cpu
  target/arm: Add vCPU feature 'el2' test.

 hw/arm/virt.c                      | 19 ++++++++---
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 16 +++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  2 ++
 linux-headers/linux/kvm.h          |  1 +
 target/arm/cpu.c                   | 14 +++++++-
 target/arm/cpu.h                   |  4 +++
 target/arm/cpu64.c                 | 53 ++++++++++++++++++++++++++++++
 target/arm/kvm64.c                 | 15 +++++++++
 target/arm/kvm_arm.h               | 13 ++++++++
 target/arm/monitor.c               |  2 +-
 tests/qtest/arm-cpu-features.c     |  9 +++++
 13 files changed, 144 insertions(+), 6 deletions(-)

-- 
2.17.1


