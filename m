Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0D622FF8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnj4-00014Q-Jn; Wed, 09 Nov 2022 11:14:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osnj1-00013s-Ve
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:51 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1osniz-0007cR-8z
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:51 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bk15so26440734wrb.13
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=VWJDhcEjMyPB1ZONSm9eREZKeQanJK1e8vilV05wL/w=;
 b=Vlk0vM57hx9YUC3LIwvO4N1Mw+prT1wRn+qFIS+rE0mHl+keAhHhhTC5BwPk1mNXwP
 rgXVVumuungNZFVPcDOcLKMmHJk7xVPPBKYu2C02Qfkt3Kg2aQvODIuOzL8J0+hA9yu9
 OIJ8uTGH2vA78UVPQIu77A/Z8ANarx1We/0acLu8H/kt8Jrhv+sOoKo2aL1WcWh+SZjB
 prmqAuVLQCvBCS9wOR82Du0ph1MnPQh6T6eQk1AshB8Tg28Dw5n3s01aKEfqFvlLDhZ6
 +EF4pAznxxe5sDwmrtCpxEIJTSYXnpwgFJEpfghU6scGVXoGKRfWGLfKvFKoQsIuF+20
 Ymug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWJDhcEjMyPB1ZONSm9eREZKeQanJK1e8vilV05wL/w=;
 b=j17yHsQejHvdGj9Cb/TtsUZ4192CbUAsO+/4S1YwYY2yEieY6euZaOyCZa43n0iMiB
 1C/YULa7buQp3fms7LVWbTWtnGRTQ4CPtAQSXWUMDqddoVOVFUC7sj4WulmsmYT9Y9DF
 y7LzdvJAUNf8e9GJdU4egJ+DJDkwZICuT9Seg6e8eAoXSi1njh9nA1D5emslXeHXWphW
 /eKN/MvVBjk5qKwnC18ESR6jyI0uihFdAl8qekNUYxx0Oxz04mEXBeTwvWfrgbDwBirm
 3qW64bR+l+Rde9GZOJwXmL3eMnXq8IuDeovMNeORpSq4mXq/bRaK/xPNPbhK7WAYiq42
 UaGA==
X-Gm-Message-State: ACrzQf0CZUiEZ6OPpZU8JcMxTuv5t4Nd+QG4Z7IbxLmIz0wHOUTBEMJt
 bT80kiTn6zN6GblJQL08ogqyogP21wxAtQ==
X-Google-Smtp-Source: AMsMyM41CVarPdIa+p2J1rBQD3vFNJstZU2mF2HSziP65PbSravk6quJTFF4EinVDamK0Su0jDknsA==
X-Received: by 2002:adf:fc48:0:b0:238:d399:c55 with SMTP id
 e8-20020adffc48000000b00238d3990c55mr20976949wrs.683.1668010486576; 
 Wed, 09 Nov 2022 08:14:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm16209186wrn.27.2022.11.09.08.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:14:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.0 0/9] arm: Convert Arm GIC, ITS,
 SMMU devices to 3-phase reset
Date: Wed,  9 Nov 2022 16:14:35 +0000
Message-Id: <20221109161444.3397405-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

This patchset converts some Arm devices to 3-phase reset.  The
rationale here is that it would be nice to get rid of the
device_class_set_parent_reset() function, which is used by
legacy-reset subclasses which want to chain to their parent's reset
function. There aren't very many of these devices in total, and
if we convert them and their parent classes to 3-phase reset they
can use the 3-phase-reset equivalent function
resettable_class_set_parent_phases().

Eventually this will then let us simplify the transitional
code for handling old-style device reset.

Note that it's necessary to convert the parent class before
the subclass -- the resettable transitional logic will
handle the situation where the subclass is still using
legacy reset and chaining to what it thinks is the parent's
legacy reset function (by doing a 3-phase reset on the parent),
but if the subclass is 3-phase then the parent must be too.

I plan to do the other uses of device_class_set_parent_reset()
too, but since the conversion patchsets don't depend on each
other I'm going to send them out piecemeal so they can be
cc'd to the relevant maintainers, rather than having a
single massive patchset with a billion people on cc.

thanks
-- PMM

Peter Maydell (9):
  hw/arm: Convert TYPE_ARM_SMMU to 3-phase reset
  hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase reset
  hw/intc: Convert TYPE_ARM_GIC_COMMON to 3-phase reset
  hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase reset
  hw/intc: Convert TYPE_ARM_GICV3_COMMON to 3-phase reset
  hw/intc: Convert TYPE_KVM_ARM_GICV3 to 3-phase reset
  hw/intc: Convert TYPE_ARM_GICV3_ITS_COMMON to 3-phase reset
  hw/intc: Convert TYPE_ARM_GICV3_ITS to 3-phase reset
  hw/intc: Convert TYPE_KVM_ARM_ITS to 3-phase reset

 include/hw/arm/smmuv3.h        |  2 +-
 hw/arm/smmu-common.c           |  7 ++++---
 hw/arm/smmuv3.c                | 12 ++++++++----
 hw/intc/arm_gic_common.c       |  7 ++++---
 hw/intc/arm_gic_kvm.c          | 14 +++++++++-----
 hw/intc/arm_gicv3_common.c     |  7 ++++---
 hw/intc/arm_gicv3_its.c        | 14 +++++++++-----
 hw/intc/arm_gicv3_its_common.c |  7 ++++---
 hw/intc/arm_gicv3_its_kvm.c    | 14 +++++++++-----
 hw/intc/arm_gicv3_kvm.c        | 14 +++++++++-----
 10 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.25.1


