Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38976496D52
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:34:52 +0100 (CET)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLDv-0006J8-8J
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:34:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4W-0005hz-89
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:16 -0500
Received: from [2a00:1450:4864:20::42a] (port=37630
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4M-0007fv-Bc
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:00 -0500
Received: by mail-wr1-x42a.google.com with SMTP id ba4so5894957wrb.4
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oio/6hQtxU+ak5mBC4OE0O9hK4DvVfj15JxHsC1mIdI=;
 b=D+5BRtnhiOOliUfLNP4O6XoCj+XizSg2q9MaO9a6gcjhF2jVTjYrMFjuinpqxPK4Q2
 NixPheBwfdzRozt7GXUzZys2bQOH4WPMfNKJNg59nDFuoSwBaeSGBEQdCYqHA7NzFi+Q
 eucZKJzsgD9ZXoxXxM1ommDDNpWH/AspKs8EyM2DzirNRIqGhhrXTN2OJoG3OLmAjqhk
 eUmgZh5BKm2QFRn5+921yfpuO/RrhIk73o9oM0EOYqs8irHK3YFul/dX0AZcwFtOMX+f
 qKPYJitLPb/fdVgi0Vh7bJGFAJ75GCO/IUi8GUkkR/hbbqEXMvmgEi2Nq69Wju0yGHU8
 PzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oio/6hQtxU+ak5mBC4OE0O9hK4DvVfj15JxHsC1mIdI=;
 b=TNolleAN3D8PaarAZ09gvZm0H8Zo0LFCVVe/xZ6aMjSfC+/vV604IrcRzIY6G5bFbf
 H2C6DTKivpmspXPKrBRjvcQi6IQcPJYaZBIb7belVcgulChmfL685pkC8lT8ti/ZQVgm
 B4XLGw8kUB/TkAq9uPDl+pY8UY4GbCO+bAv1VEQT6EqVPpe9rk0yManYg3HnaeJUEcUQ
 WMQ1GX/ENg5sAp/b1urCzPeHMGWp+csW+joy6FTBdFUVNlGsIRZ1wFrFvFP0efH4mvBU
 nNUyzlQ17yRH5+ZV3h3ajYR4P7MxNpNIk9x3I9K/f4VqAE0d4iNOOsuoAvjyoAppX/YC
 O+YA==
X-Gm-Message-State: AOAM533KFqNMPeLtPKbjTKWTCXTnqi5IfziAQtMD/Y4ZMnjoHZP3JAkj
 VNN+lgnnFfYe9YehwmmHUXTHZA==
X-Google-Smtp-Source: ABdhPJzdF0rSDCi/lqElQPQDejk2PaVTeQU1T1KFzNYwWKIU3uTEhhMGC3uSGv3ovdmg/zCQGal7wQ==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr8118810wri.398.1642875886232; 
 Sat, 22 Jan 2022 10:24:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/14] arm_gicv3_its: Implement MOVI and MOVALL commands
Date: Sat, 22 Jan 2022 18:24:30 +0000
Message-Id: <20220122182444.724087-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed while working on the new-in-GICv4 ITS commands
that we'd forgotten to implement the GICv3 MOVI and MOVALL
commands. These move interrupts from one redistributor to
another; Linux doesn't use MOVALL but does use MOVI if
it wants to power down a CPU (when it needs to migrate
interrupts formerly targeting that CPU to a different one).

This patchseries starts with a couple of patches that I
found useful to improve the debug logging when I was
writing this. It then has a collection of fixes for various
minor bugs that I noticed while I was in the code (including
yet another fix to the table lookup bounds checking...).
Finally the last two patches implement the two new commands.

thanks
-- PMM

Peter Maydell (14):
  target/arm: Log CPU index in 'Taking exception' log
  hw/intc/arm_gicv3_its: Add tracepoints
  hw/intc/arm_gicv3: Initialise dma_as in GIC, not ITS
  hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when GITS_CTLR.ENABLED
    is set
  hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on writes to
    GITS_CBASER
  hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS for LPIs
  hw/intc/arm_gicv3_its: Sort ITS command list into numeric order
  hw/intc/arm_gicv3_redist: Remove unnecessary zero checks
  hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are supported
  hw/intc/arm_gicv3_its: Provide read accessor for translation_ops
  hw/intc/arm_gicv3_its: Make GITS_BASER<n> RAZ/WI for unimplemented
    registers
  hw/intc/arm_gicv3_its: Check table bounds against correct limit
  hw/intc/arm_gicv3_its: Implement MOVALL
  hw/intc/arm_gicv3_its: Implement MOVI

 hw/intc/gicv3_internal.h               |  43 ++++-
 include/hw/intc/arm_gicv3_its_common.h |   1 -
 target/arm/internals.h                 |   2 +-
 hw/intc/arm_gicv3.c                    |   1 +
 hw/intc/arm_gicv3_common.c             |   9 +
 hw/intc/arm_gicv3_its.c                | 258 +++++++++++++++++++++++--
 hw/intc/arm_gicv3_redist.c             | 115 ++++++++++-
 target/arm/helper.c                    |   9 +-
 target/arm/m_helper.c                  |   2 +-
 hw/intc/trace-events                   |   8 +
 10 files changed, 416 insertions(+), 32 deletions(-)

-- 
2.25.1


