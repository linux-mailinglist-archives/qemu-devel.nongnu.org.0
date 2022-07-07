Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A258956A212
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:34:53 +0200 (CEST)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qia-0005In-6k
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbd-0007gq-Fe
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qba-0006uw-Eh
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id a5so11400710wrx.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZT+eNmzNOgQ/fdJR1/NfibTtOzhCUCbQtCWIySN6sc=;
 b=HeTpE7UFiO266DEc4iRyuswXwelzRMrSrmVt//6G62R2qUd1R8UecaJzTV3LkZjoPe
 CO80cOWaHdauO2ks/3RMCxEKL0DLdFI1XKyLgdKLC8SQ29LV7Ew5qJBvu+hEOtb5DNTe
 i1PD3FZKkaRauBW6is6KqFP4XQowO9WyrYU1ezzK/FjFzEGSALFzL7xuVGj6S9D5VkkH
 0Owx7XZy6Z8mx/WZayJ5y6hNjmrl4vUOTSYh5rJP3lR2WXWeodL1fUBWAaxYMII9LD6K
 hM++fkRV5U9ff/Ep/2qBhAw4OIJvZF57wTHBPJmdb87z4YzfVOEJp+TFZYsf0gKpD3IX
 YG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZT+eNmzNOgQ/fdJR1/NfibTtOzhCUCbQtCWIySN6sc=;
 b=4CUv+gVsE7KApdnrCZyP6D/4nvL9dFk4tq/0LyaI4JpFX25d86EP+axbLKI/MZmjqR
 qKm1LJbugKcEkIe2oQ1I4H4mZ1TiQrS8w24tEfT1e05UUJDaOUXUNxWxHD7P9TyChMOp
 pmFGNtn//GqkeBjg/pXHGbFnMtnGN5eGczSHAA9sDQofCZxgNrKuk4iP/ZXBXRFny+2s
 VvVT34eBWyEHmCeMhUXDj4fhExW+Vf/LJWCF3gxgbNPglIWFNTTA26upRQls54YCtP5T
 iUIO/s6VovfkrIyDbZ89qpQYGhFOoq0QF9JVEjzT1d6KXwBXw9vjRb6lX+G1k19kpMpx
 z3Gg==
X-Gm-Message-State: AJIora+z24Sbrcs5f8AKyuWnYax6Gjj3fEzoNwX4aaW+Vw/fiTB7H6IF
 wKi+5xWzIy96aUXwgILhctPdk6DmiZQRKA==
X-Google-Smtp-Source: AGRyM1vQpKSL+lXf1LCqwBVv+th3RLYsl3AxCxWYxU7SANUNAf6DyuPqUQwACU+gaFdYpzbZRezbaQ==
X-Received: by 2002:a5d:56ca:0:b0:21d:8b21:9fd5 with SMTP id
 m10-20020a5d56ca000000b0021d8b219fd5mr670912wrw.179.1657196856133; 
 Thu, 07 Jul 2022 05:27:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] target-arm queue
Date: Thu,  7 Jul 2022 13:27:25 +0100
Message-Id: <20220707122734.288929-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My OS Lock/DoubleLock patches, plus a small selection of other
bug fixes and minor things.

thanks
-- PMM

The following changes since commit 8e9398e3b1a860b8c29c670c1b6c36afe8d87849:

  Merge tag 'pull-ppc-20220706' of https://gitlab.com/danielhb/qemu into staging (2022-07-07 06:21:05 +0530)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220707

for you to fetch changes up to c2360eaa0262a816faf8032b7762d0c73df2cc62:

  target/arm: Fix qemu-system-arm handling of LPAE block descriptors for highmem (2022-07-07 11:41:04 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/virt: dt: add rng-seed property
 * Fix MTE check in sve_ldnfff1_r
 * Record tagged bit for user-only in sve_probe_page
 * Correctly implement OS Lock and OS DoubleLock
 * Implement DBGDEVID, DBGDEVID1, DBGDEVID2 registers
 * Fix qemu-system-arm handling of LPAE block descriptors for highmem

----------------------------------------------------------------
Jason A. Donenfeld (1):
      hw/arm/virt: dt: add rng-seed property

Peter Maydell (6):
      target/arm: Fix code style issues in debug helper functions
      target/arm: Move define_debug_regs() to debug_helper.c
      target/arm: Suppress debug exceptions when OS Lock set
      target/arm: Implement AArch32 DBGDEVID, DBGDEVID1, DBGDEVID2
      target/arm: Correctly implement Feat_DoubleLock
      target/arm: Fix qemu-system-arm handling of LPAE block descriptors for highmem

Richard Henderson (2):
      target/arm: Fix MTE check in sve_ldnfff1_r
      target/arm: Record tagged bit for user-only in sve_probe_page

 docs/about/deprecated.rst |   8 +
 docs/system/arm/virt.rst  |  17 +-
 include/hw/arm/virt.h     |   2 +-
 target/arm/cpregs.h       |   3 +
 target/arm/cpu.h          |  27 +++
 target/arm/internals.h    |   9 +
 hw/arm/virt.c             |  44 ++--
 target/arm/cpu64.c        |   6 +
 target/arm/cpu_tcg.c      |   6 +
 target/arm/debug_helper.c | 580 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c       | 513 +---------------------------------------
 target/arm/ptw.c          |   2 +-
 target/arm/sve_helper.c   |   5 +-
 13 files changed, 684 insertions(+), 538 deletions(-)

