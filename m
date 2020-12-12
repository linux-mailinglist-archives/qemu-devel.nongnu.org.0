Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F622D8356
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:20:01 +0100 (CET)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsdj-0004aa-Qk
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZc-0002YD-Uq
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:15:44 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZa-0005cc-4w
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:15:43 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so10102671wmb.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rlaiofm38bEaLMEO28iARVzpWKGjlOwxJ+z1qE/Eq4o=;
 b=xSnIG/9PAJpkvGzhtJEwB43XqDT6whKkE3MOekhnUx7cKpnKu7/Io2vJR+rjpSaFyl
 6/LWHZQULSUGpDc2wAoNEnbN98T0yviI76vIWj7JCctJjLm/RLsgoVoAfZw3hWMbVy/h
 OxX3oZSumhZfZX7mCzDTLH/IC7DaLU/7oefLMUeMzAA9mrpoHU2r2cNHhrBzfAgRGAc9
 VPLgSwduGqTf2i+PFK0NyYrlpejaWGK/LEdVifBuCwz+XeL61Cfe/AgRRPF9KHpI8JOW
 R85bDnhmeJ3zaA81GMKmVy2H4LYfo6kilh4l2FBzjVD1waeqcyS9B33jA57AnDW9n7GW
 AcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rlaiofm38bEaLMEO28iARVzpWKGjlOwxJ+z1qE/Eq4o=;
 b=kymqRaj0NRpXbxfAvL+FZATDCYTFOZu2B+iCHgfNdoiIx5LDHRTZ776mFXC8BZI4X7
 1UKhxMaJxwQl2OR7VftSCXAJLrx7dvWawMDLKA59OtsbvnbVPxLp7dPNhw8B9xPNWIKy
 QWzBqnibRW+ygtRd23tqxHlcwtDKKgRtv8n2rq0VNAO5wF2YAGYE7cUd0jTqiO0o/48+
 LKXdpQbWVMaVAllE97h26s/YgytM3lXyRbrAHDvgxzI306OA2rlW/XUmOIACOcUHy9CE
 1i5I7meopQo8ZPJ0wOpMMsUYLpvvocIfD/DQYDtSig8zkRHMLna6t9Lr4phFmiCtmh86
 IElg==
X-Gm-Message-State: AOAM532zDEdkvj7Mcg0P+DLjzzWeMxIuuZXMpGWLfKweX04+wtobiI2/
 b+Ys52rXkexJ+8iuH7aOfcxSBlrw5CjoAw==
X-Google-Smtp-Source: ABdhPJxHBTu+CxT13qSakjH2boo69Nf6zQsODWIcHeHFbG484NpQkPyNLMLyB5UcW0peA5P80XcUKw==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr16003873wmb.83.1607732140181; 
 Fri, 11 Dec 2020 16:15:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm16306001wmb.11.2020.12.11.16.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:15:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] hw/ppc: Convert UIC device to QOM
Date: Sat, 12 Dec 2020 00:15:29 +0000
Message-Id: <20201212001537.24520-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries converts the PPC UIC "Universal Interrupt
Controller" to a QOM device.  My main reason for doing it is that
this fixes a couple of long-standing trivial Coverity issues -- the
current ppcuic_init() function allocates an array of qemu_irqs which
the callers then leak.  (The leak is trivial because it happens once
when QEMU starts.)

The patchseries converts the UIC to a QOM device but initially leaves
the old ppcuic_init() creation function with its old API intact.  It
then goes through converting the various boards that were using
ppcuic_init() to instead directly create the UIC using the usual qdev
APIs, so that it can delete the ppcuic_init() function entirely.

The patchset includes one patch which deletes 350 lines of dead code
-- the ppc405cr_init() function seems to have never been used since
it was added in 2007, so rather than converting this user of
ppcuic_init() it seemed more sensible to delete it.

I have tested with 'make check' and 'make check-acceptance' but I
don't think the latter really exercises the affected boards, which
are:

 bamboo
 ref405ep
 sam460ex
 taihu
 virtex-ml507

I found instructions on how to boot an AROS image on sam460ex, so I
have tested that: it works as well after this series as it did before
(gets to "Libs/workbench.library" and stops); it does seem to
successfully do things like scanning the USB bus and responding to
keyboard input at the boot menu, which suggests that IRQs must be
working.

Side note: the 'irq_inputs' hacks in the PPC CPU I think would really
benefit from conversion to being qdev gpio inputs now that CPUs are
real devices. There are also a lot of non-QOM devices in this
ppc4xx code if anybody is interested in working on more QOM
conversions for these boards.

thanks
-- PMM

Peter Maydell (8):
  hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
  ppc: Convert PPC UIC to a QOM device
  hw/ppc/virtex_ml507: Drop use of ppcuic_init()
  hw/ppc/ppc440_bamboo: Drop use of ppcuic_init()
  hw/ppc/sam460ex: Drop use of ppcuic_init()
  hw/ppc: Delete unused ppc405cr_init() code
  hw/ppc/ppc405_uc: Drop use of ppcuic_init()
  hw/ppc: Remove unused ppcuic_init()

 hw/ppc/ppc405.h           |   8 +-
 include/hw/intc/ppc-uic.h |  80 ++++++++
 include/hw/ppc/ppc4xx.h   |   9 -
 hw/intc/ppc-uic.c         | 321 +++++++++++++++++++++++++++++
 hw/ppc/ppc405_boards.c    |   8 +-
 hw/ppc/ppc405_uc.c        | 415 ++++----------------------------------
 hw/ppc/ppc440_bamboo.c    |  38 +++-
 hw/ppc/ppc4xx_devs.c      | 246 +---------------------
 hw/ppc/sam460ex.c         |  70 +++++--
 hw/ppc/virtex_ml507.c     |  21 +-
 MAINTAINERS               |   2 +
 hw/intc/Kconfig           |   3 +
 hw/intc/meson.build       |   1 +
 hw/ppc/Kconfig            |   1 +
 14 files changed, 555 insertions(+), 668 deletions(-)
 create mode 100644 include/hw/intc/ppc-uic.h
 create mode 100644 hw/intc/ppc-uic.c

-- 
2.20.1


