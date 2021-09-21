Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B141379A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 18:33:03 +0200 (CEST)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSihZ-0002i8-3B
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 12:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSido-0008Lu-H2
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidl-000298-Kn
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 12:29:08 -0400
Received: by mail-wr1-x432.google.com with SMTP id t8so41003769wrq.4
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anYZWD/qRzaU2uLmQ5ODwyA34rNw2sBFKIUWhqd0x0U=;
 b=FaH8az2mhPt1B/EKyriHYV5Ofilnjv7m6lzgcM1GSEsz8SW0Dby9lOGEfdRmABxp3O
 Fz4hbot72bWQX0zSLmsFSt83vjd1Qb3//N4MSTOPUYxjijT2mhB2Oc/4gI2QxjejHVMd
 2hdc9SFqfCJlRec2XY2jBEpfJuW4bTWCk+zXYMzCAjcspEsdKAQOn4RVv16s+e+NkDjZ
 piFfu6ckCIacx6lunYy8pre9UmO4plvXfPq5E9XXOJ5sgt3G7aj2RZnUqULR9Acwhjje
 BlUB0SR2mheCT6um1cx5SC9KMcr86/YYKlzCUHgqVPlJAhnhea2pPgFlH8QOkYGhtVmg
 DsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anYZWD/qRzaU2uLmQ5ODwyA34rNw2sBFKIUWhqd0x0U=;
 b=Y80hBVDjbqBhWgHYtGZgp7P4fMjpaJsL9G0UVbcqRGIp6RomfzAUnIvpCTbspIROrT
 z7nxEslrLaVkAzUrrPL6jJcsnDhICRAdm/vzRjnrP4llyHVwjwzSmybxFZbh3a1cp584
 YXYKNX32RaUkVspuB2adyLp2ZjEGEhYRZDMYs6E/7aNjDF+/DN+ZP6g+4i8DeVMZORCo
 ShhJ6viBfALnFk7c46krwItuDcliad17LzSoN+RrUSXG/vbVjNJ5xFEgYV+sdBphPvOS
 q/wprcSf64rmtRJi80hdmZ0VV8KxN/QTG6Iw6GQXuJWNarWlhd3CdUd/S5SL2NCRpMNF
 vL2w==
X-Gm-Message-State: AOAM533bK8X9Qd4Qcu8U3yunv4LAluLop7zU9Hv6OH96hTNwwRKLYl57
 DKR9tfoI2A0TEWi0u6W/u4EL0g==
X-Google-Smtp-Source: ABdhPJzyG1Jb4oZQhF2b7tdub1RvWdhc8NVqcu0PnZRPpJ2C2qZTIHkiVE2Flh+u0Mmsi2D6t1XGzg==
X-Received: by 2002:a05:600c:21d6:: with SMTP id
 x22mr5698503wmj.121.1632241743626; 
 Tue, 21 Sep 2021 09:29:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q7sm19841014wru.56.2021.09.21.09.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:29:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/arm: Support MVE in gdbstub
Date: Tue, 21 Sep 2021 17:28:56 +0100
Message-Id: <20210921162901.17508-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset's aim is to report MVE to gdb via the gdbstub.
That is done by the final patch, which is an RFC because the
gdb patches to support it are not yet upstream and so the XML
format isn't final. (Sending the XML works fine with a GDB
without the MVE support; you just don't get the auto-generated
pseudo-registers that display the Q-regs, so all you see is the
S and D reg versions of the data.)

Patches 1 through 4 are cleanup of the arm gdbstub related code of
various kinds; this part of the series should be OK to go into QEMU
as soon as it's reviewed.

Luis: you'll find that with this entire patchset a GDB built with
your patches doesn't crash, because in patch 4 I stopped QEMU
reporting FPSID and FPEXC in the org.gnu.gdb.arm.vfp XML feature.

thanks
-- PMM

Peter Maydell (5):
  configs: Don't include 32-bit-only GDB XML in aarch64 linux configs
  target/arm: Fix coding style issues in gdbstub code in helper.c
  target/arm: Move gdbstub related code out of helper.c
  target/arm: Don't put FPEXC and FPSID in org.gnu.gdb.arm.vfp XML
  [RFC] target/arm: Advertise MVE to gdb when present

 configs/targets/aarch64-linux-user.mak    |   2 +-
 configs/targets/aarch64-softmmu.mak       |   2 +-
 configs/targets/aarch64_be-linux-user.mak |   2 +-
 configs/targets/arm-linux-user.mak        |   2 +-
 configs/targets/arm-softmmu.mak           |   2 +-
 configs/targets/armeb-linux-user.mak      |   2 +-
 target/arm/internals.h                    |   7 +
 target/arm/gdbstub.c                      | 179 +++++++++++++++
 target/arm/gdbstub64.c                    | 140 ++++++++++++
 target/arm/helper.c                       | 262 ----------------------
 gdb-xml/arm-m-profile-mve.xml             |  19 ++
 gdb-xml/arm-neon.xml                      |   2 -
 gdb-xml/arm-vfp-sysregs.xml               |  17 ++
 gdb-xml/arm-vfp.xml                       |   2 -
 gdb-xml/arm-vfp3.xml                      |   2 -
 15 files changed, 368 insertions(+), 274 deletions(-)
 create mode 100644 gdb-xml/arm-m-profile-mve.xml
 create mode 100644 gdb-xml/arm-vfp-sysregs.xml

-- 
2.20.1


