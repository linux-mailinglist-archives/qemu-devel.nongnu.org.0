Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFF84F18F2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:56:26 +0200 (CEST)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbP46-0002JY-1y
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:56:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv2-0004kZ-8S
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:04 -0400
Received: from [2a00:1450:4864:20::435] (port=33542
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv0-0000Rl-FX
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id c7so15263434wrd.0
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9NOnD3vVpSF0JZLEe5MPnWt14DUTgg+N2g8DWuSWEY=;
 b=lHL+GHh0QL97DP6ASJTVgnwd/Kl1XpiJf7wph62L1RX7yFIXCXndXOn0k6iL7WnKzL
 h1l0g38UY/r0pmCUQ30aT/feCNeMVwLYV/FduVfCbCYLfNSAiR8rVSkrylM1S78/Sh+B
 NGvjHhHnVq8tNmfmrA9FceHDVn3NBQcLBbD5lMD/kfsA3Zps//YnMqQt+631yeA3yE3C
 ty5uulX4tmfGJfkz+tGrfxXvZv7zcIF7qovk8Rv/eBNE5IxE9ZGtzURooTjp4v/HD+u5
 wFqZAEv1/K4UJQ5f0XOyBAH369coOaI//JAUzQV0Bjcy18SOXnCcx8TQt0+OE2ocsLvN
 uH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V9NOnD3vVpSF0JZLEe5MPnWt14DUTgg+N2g8DWuSWEY=;
 b=d6Ix8JNWCd+j8xdAiuA0KRo2gqErn4lrz6hJwFIEWQdOerbbWxUGfDA1MWBWJctDFv
 msISAFw/jtVRv7d+9vNSgkM3dseGQ8HZGEKWEv7GXMLoEbbQkWxIheExDurn+zsLCJkI
 hAnxPbfqri3tpZziqTrURIqBCA2oEtWEa0LNrZMbR8dn2tTTP4GYY9LNH9FcNOiU6UZR
 CEFxGtyZQx2O0T48qxWDANUPW8jGFrqiDHnSmDDiUJOCrssWOa3qK2nfrFtV+DhhBvbO
 2oyXVfc3TIyjizaqDXdSeJ4MLavLQzDKEyX4cGNCfILrFAtyHRE96THpUiQxT5BDWG+j
 Xdsg==
X-Gm-Message-State: AOAM532NHlCJel1w2bBxUbjvulkDIqNCJNGHIvPNb5qbj9WrOJm2Y7gR
 le2ozd05d1it87Dqdaij7esDew==
X-Google-Smtp-Source: ABdhPJweinWYnkNsFbxfA2NzMPfwIozzvWlLOZZcQPYL7vU+hAOiIdUy412Wo572xtgHlZq/aix5hw==
X-Received: by 2002:a5d:47a1:0:b0:204:9f5:e72f with SMTP id
 1-20020a5d47a1000000b0020409f5e72fmr291561wrb.656.1649087220662; 
 Mon, 04 Apr 2022 08:47:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 00/18] hw/arm: Make exynos4210 use TYPE_SPLIT_IRQ
Date: Mon,  4 Apr 2022 16:46:40 +0100
Message-Id: <20220404154658.565020-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The primary aim of this patchset is to make the exynos4210 code use
the TYPE_SPLIT_IRQ device instead of the old qemu_split_irq() function
(which we are trying to get rid of). However, the current code is
quite complicated and so we have to do a fair amount of refactoring
in order to be able to use TYPE_SPLIT_IRQ in a clean way.

The interrupt wiring on this SoC is complicated and interrupt
lines from devices may be wired up to multiple places:
 * a GIC device
 * an internal combiner
 * an external combiner
(a combiner is a fairly simple "OR multiple IRQ sources together
in groups with enable/disable and mask logic" piece of hardware).
In some cases an interrupt is wired up to more than one input
on each combiner.

The current code has a struct Exynos4210Irq where it keeps arrays of
qemu_irqs corresponding to the inputs of these devices, and it handles
the "wire interrupt lines to multiple places" logic in functions which
are called by the SoC device model but which live in the source files
with the combiner and GIC models. This series moves the logic to the
SoC device model's source file (because it is really part of the SoC
wiring, not part of the individual combiner or GIC devices) and makes
use of the TYPE_SPLIT_IRQ ability to provide more than 2 output lines
to simplify things so that each interrupt line connects to just one
splitter, whose outputs go to all the places they need to. In the
new setup, these splitter devices clearly belong to the SoC object,
and so they are created as QOM children of it. The Exynos4210Irq
struct ends up unneeded and is deleted.

I have also done some conversion of specific child devices of this SoC
from the old-style "call qemu_new()" to the new-style "embed the child
device struct in the parent state struct". I haven't done a complete
conversion, but only touched those devices where making the conversion
was useful for the TYPE_SPLIT_IRQ changes.

I don't have a datasheet for this SoC that describes all the external
combiner and external GIC wiring, so I have mostly kept the QEMU
behaviour the same as it is currently. In a few places, however, I
have fixed what seem to me to be fairly clearly bugs in the current
handling. (Largely these bugs weren't visible to the guest because
we weren't actually connecting up devices to the affected bits of
the interrupt line wiring.)

I've tested this with a simple Linux image, which I think is basically
the same one as the 'make check-acceptance' test. If anybody has
access to other test images that would be interesting.

thanks
-- PMM

Peter Maydell (18):
  hw/arm/exynos4210: Use TYPE_OR_IRQ instead of custom OR-gate device
  hw/intc/exynos4210_gic: Remove unused TYPE_EXYNOS4210_IRQ_GATE
  hw/arm/exynos4210: Put a9mpcore device into state struct
  hw/arm/exynos4210: Drop int_gic_irq[] from Exynos4210Irq struct
  hw/arm/exynos4210: Coalesce board_irqs and irq_table
  hw/arm/exynos4210: Fix code style nit in combiner_grp_to_gic_id[]
  hw/arm/exynos4210: Move exynos4210_init_board_irqs() into exynos4210.c
  hw/arm/exynos4210: Put external GIC into state struct
  hw/arm/exynos4210: Drop ext_gic_irq[] from Exynos4210Irq struct
  hw/arm/exynos4210: Move exynos4210_combiner_get_gpioin() into
    exynos4210.c
  hw/arm/exynos4210: Delete unused macro definitions
  hw/arm/exynos4210: Use TYPE_SPLIT_IRQ in exynos4210_init_board_irqs()
  hw/arm/exynos4210: Fill in irq_table[] for internal-combiner-only IRQ
    lines
  hw/arm/exynos4210: Connect MCT_G0 and MCT_G1 to both combiners
  hw/arm/exynos4210: Don't connect multiple lines to external GIC inputs
  hw/arm/exynos4210: Fold combiner splits into
    exynos4210_init_board_irqs()
  hw/arm/exynos4210: Put combiners into state struct
  hw/arm/exynos4210: Drop Exynos4210Irq struct

 include/hw/arm/exynos4210.h           |  50 ++-
 include/hw/intc/exynos4210_combiner.h |  57 ++++
 include/hw/intc/exynos4210_gic.h      |  43 +++
 hw/arm/exynos4210.c                   | 430 +++++++++++++++++++++++---
 hw/intc/exynos4210_combiner.c         | 108 +------
 hw/intc/exynos4210_gic.c              | 344 +--------------------
 MAINTAINERS                           |   2 +-
 7 files changed, 508 insertions(+), 526 deletions(-)
 create mode 100644 include/hw/intc/exynos4210_combiner.h
 create mode 100644 include/hw/intc/exynos4210_gic.h

-- 
2.25.1


