Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754CB65F187
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTLs-0000Fv-Qo; Thu, 05 Jan 2023 11:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLq-00008y-5L
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:22 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLo-00071v-6O
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1786344wmq.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=J9OEuFJOVqWuaP0H8jMiOVTRp+PE+YBAf0aUcwI1+Yw=;
 b=zP75stJSKryHQI5Wk3dNEaubM36ZjU62yL+s/zRVErICcGL1EMhLzG1x7GjhSFrQ8f
 v5Wzc/XUvIK10/2WZJiSaibHXVibUvReBqA1KTm1zzMIRXQNtiBFAcNvlrMq2vM4idII
 XwUj5hD+ktR4gJFyFIVfbxCXfsh/635VSff7K+xq+JOx2cdy0gH26HSB3OcElvOcXsaE
 PMFa9OGN6lSdAXdGOWP/uCVqHMv9flCBoslYS/xGe5kdDw4pqUdxzM6B0KT/pOHYH7JI
 YJvLd+ASlS6rQ0SeRESUGVtolmv1Kh+a4eG6GFKDQvXtmVnhgsEfhpdKhQTPi5zSInl/
 oGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J9OEuFJOVqWuaP0H8jMiOVTRp+PE+YBAf0aUcwI1+Yw=;
 b=CD4Y90bkManso4qJlspFfhxeJ862r6VcTPzjxwHFpAN8FkJlR21T3R/pEDanfM1sbX
 iS+Y2Oqm68ILazcuYTgUmFcPtvjUfw7JG/XGBvQIVcuiYGTsicqVtClMkyCnSTD9rBa+
 uj0bB6m6sYDeagrmd3XzXsUJDSNLzJZwxUrhyudtzDmnaN3umXGGBPlrYf7A+YzluCG0
 yCw7Z+NjUYXQtTvssJHqPAfaoOWCDce1boP2yH758hh4IwkjNsZhDE16sXp1x25b5X53
 TvZbBaFfERswM8/8kmrq7850ZCdgw2ABdjcPBm7Y31yDrFBWnpZf9ZLU9uQVPObxXFiB
 yRXg==
X-Gm-Message-State: AFqh2koKpqF+TfnqGuIqu0dU6CidySoGvxI1DAprY0Ujx+NC+sGWWwza
 /APITiXK5RUDF34FaVsn0va49yYsNDNoMxjD
X-Google-Smtp-Source: AMrXdXtW7XNiDc9qc5a/rSY0V4wbDhlzpc63ABexKNG67HkxdD2FLBXq9JqaThQo7KVL0SLeOeVfZw==
X-Received: by 2002:a1c:ed19:0:b0:3d3:52bb:3984 with SMTP id
 l25-20020a1ced19000000b003d352bb3984mr37879747wmh.17.1672937059368; 
 Thu, 05 Jan 2023 08:44:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/34] target-arm queue
Date: Thu,  5 Jan 2023 16:43:43 +0000
Message-Id: <20230105164417.3994639-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Some arm patches; my to-review queue is by no means empty, but
this is a big enough set of patches to be getting on with...

-- PMM

The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:

  .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230105

for you to fetch changes up to 93c9678de9dc7d2e68f9e8477da072bac30ef132:

  hw/net: Fix read of uninitialized memory in imx_fec. (2023-01-05 15:33:00 +0000)

----------------------------------------------------------------
target-arm queue:
 * Implement AArch32 ARMv8-R support
 * Add Cortex-R52 CPU
 * fix handling of HLT semihosting in system mode
 * hw/timer/ixm_epit: cleanup and fix bug in compare handling
 * target/arm: Coding style fixes
 * target/arm: Clean up includes
 * nseries: minor code cleanups
 * target/arm: align exposed ID registers with Linux
 * hw/arm/smmu-common: remove unnecessary inlines
 * i.MX7D: Handle GPT timers
 * i.MX7D: Connect IRQs to GPIO devices
 * i.MX6UL: Add a specific GPT timer instance
 * hw/net: Fix read of uninitialized memory in imx_fec

----------------------------------------------------------------
Alex Bennée (1):
      target/arm: fix handling of HLT semihosting in system mode

Axel Heider (8):
      hw/timer/imx_epit: improve comments
      hw/timer/imx_epit: cleanup CR defines
      hw/timer/imx_epit: define SR_OCIF
      hw/timer/imx_epit: update interrupt state on CR write access
      hw/timer/imx_epit: hard reset initializes CR with 0
      hw/timer/imx_epit: factor out register write handlers
      hw/timer/imx_epit: remove explicit fields cnt and freq
      hw/timer/imx_epit: fix compare timer handling

Claudio Fontana (1):
      target/arm: cleanup cpu includes

Fabiano Rosas (5):
      target/arm: Fix checkpatch comment style warnings in helper.c
      target/arm: Fix checkpatch space errors in helper.c
      target/arm: Fix checkpatch brace errors in helper.c
      target/arm: Remove unused includes from m_helper.c
      target/arm: Remove unused includes from helper.c

Jean-Christophe Dubois (4):
      i.MX7D: Connect GPT timers to IRQ
      i.MX7D: Compute clock frequency for the fixed frequency clocks.
      i.MX6UL: Add a specific GPT timer instance for the i.MX6UL
      i.MX7D: Connect IRQs to GPIO devices.

Peter Maydell (1):
      target/arm:Set lg_page_size to 0 if either S1 or S2 asks for it

Philippe Mathieu-Daudé (5):
      hw/input/tsc2xxx: Constify set_transform()'s MouseTransformInfo arg
      hw/arm/nseries: Constify various read-only arrays
      hw/arm/nseries: Silent -Wmissing-field-initializers warning
      hw/arm/smmu-common: Reduce smmu_inv_notifiers_mr() scope
      hw/arm/smmu-common: Avoid using inlined functions with external linkage

Stephen Longfield (1):
      hw/net: Fix read of uninitialized memory in imx_fec.

Tobias Röhmel (7):
      target/arm: Don't add all MIDR aliases for cores that implement PMSA
      target/arm: Make RVBAR available for all ARMv8 CPUs
      target/arm: Make stage_2_format for cache attributes optional
      target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
      target/arm: Add PMSAv8r registers
      target/arm: Add PMSAv8r functionality
      target/arm: Add ARM Cortex-R52 CPU

Zhuojia Shen (1):
      target/arm: align exposed ID registers with Linux

 include/hw/arm/fsl-imx7.h         |  20 +
 include/hw/arm/smmu-common.h      |   3 -
 include/hw/input/tsc2xxx.h        |   4 +-
 include/hw/timer/imx_epit.h       |   8 +-
 include/hw/timer/imx_gpt.h        |   1 +
 target/arm/cpu.h                  |   6 +
 target/arm/internals.h            |   4 +
 hw/arm/fsl-imx6ul.c               |   2 +-
 hw/arm/fsl-imx7.c                 |  41 +-
 hw/arm/nseries.c                  |  28 +-
 hw/arm/smmu-common.c              |  15 +-
 hw/input/tsc2005.c                |   2 +-
 hw/input/tsc210x.c                |   3 +-
 hw/misc/imx6ul_ccm.c              |   6 -
 hw/misc/imx7_ccm.c                |  49 ++-
 hw/net/imx_fec.c                  |   8 +-
 hw/timer/imx_epit.c               | 376 +++++++++-------
 hw/timer/imx_gpt.c                |  25 ++
 target/arm/cpu.c                  |  35 +-
 target/arm/cpu64.c                |   6 -
 target/arm/cpu_tcg.c              |  42 ++
 target/arm/debug_helper.c         |   3 +
 target/arm/helper.c               | 871 +++++++++++++++++++++++++++++---------
 target/arm/m_helper.c             |  16 -
 target/arm/machine.c              |  28 ++
 target/arm/ptw.c                  | 152 +++++--
 target/arm/tlb_helper.c           |   4 +
 target/arm/translate.c            |   2 +-
 tests/tcg/aarch64/sysregs.c       |  24 +-
 tests/tcg/aarch64/Makefile.target |   7 +-
 30 files changed, 1330 insertions(+), 461 deletions(-)

