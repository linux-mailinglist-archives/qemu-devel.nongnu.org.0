Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E458CF83
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:14:33 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLA51-0005nx-Sv
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z7-0008E9-DC
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:25 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z4-0006KJ-Hh
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:25 -0400
Received: by mail-wr1-x435.google.com with SMTP id q30so12180014wra.11
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Mu+MglJymBxabIBvUwjw2AFdmuPrcCRK+x2ras11sSw=;
 b=UTfXqut8bTa7JgXBR0VHUYxttE39IIXdx+kGphECVoz2oaUb6+Y6af7tM8mqls+AI/
 TYiO5AfDd63KO9Wj6rBPphEThFLv0VdpQnGEBy3db3S/V8v7hGQzKhu+8L9zWwDHL2gL
 n8olPJGToPM9p08FoLg+Px5aVqK0UKMnCsl2vC5MKV/X380k9XwvVnJD3baCSqKrV4nE
 5ZJJv9b1OzCZC4x0vUlvDWYJxL2cQHBR/b4VCreP+DpNkuI6QlV+1Be5P2b46/pdLmUo
 UitdxJJTPCl5XX+8NkYt3e5LEui6Lu0UIkOZyUtgz8v1z4hQ2icbK2Bdv22kViR0ORc5
 KXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Mu+MglJymBxabIBvUwjw2AFdmuPrcCRK+x2ras11sSw=;
 b=KhuSkkvTeASYTRIH4N1FeSJapYPnU1ZXnHi7upsabGbbfHuVHu0bR8qdMpWGdm3Li9
 OM0WAUh1fRAvZcDKpULqS/sAFMubyZ/B3Su1byE6NjGCXgeLbkjEL9E0grvjR+rgE91j
 09a1kWHwMUExJmStX6qcJCv/ld/V2RNGrwB2/0mXueZuXNIpWEB+SRQRwPBMUf7X8A/f
 nXwdeB9orshHC779NV0USbFB4JOmMfo44drosdKBxSAb3nRgFU6uDS4Y3G4e7wIElWX1
 xulTGqsFZ9N13faeGRANZQDHDe7N5QhoYhX73ax4mAADynOYs97Dp4A7r2ArPGC9VoIm
 /Feg==
X-Gm-Message-State: ACgBeo0ByzayjFqrZjYb9XfPocvgvG58nZFmjYBjsRmGA7jxKS+QHS59
 5YnCPVuglRzcmr4ouI3yrP1vRg==
X-Google-Smtp-Source: AA6agR5JiztensB8u1Cffi0TRYzTm5X+4y5aFY/uvv8GKqlzYcjlG//LNaMJnint02TuHq3pnW9gVw==
X-Received: by 2002:adf:fe81:0:b0:21b:88ea:6981 with SMTP id
 l1-20020adffe81000000b0021b88ea6981mr13290068wrr.616.1659992900293; 
 Mon, 08 Aug 2022 14:08:20 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:08:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/4] QEMU: Fix RISC-V virt & spike machines' dtbs
Date: Mon,  8 Aug 2022 22:06:40 +0100
Message-Id: <20220808210643.2192602-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Conor Dooley <conor.dooley@microchip.com>

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.

I mostly opted for what appeared to be the smallest change that would
fix the warnings, partly due to my inexperience with the QEMU codebase.
A "sister" patchset for the kernel will clear the remaining warnings [0].
Thanks to Rob Herring for reporting these issues [1],
Conor.

Changes since v1:
- drop patch 1

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org

Conor Dooley (4):
  hw/riscv: virt: fix uart node name
  hw/riscv: virt: Fix the plic's address cells
  hw/riscv: virt: fix syscon subnode paths
  hw/core: fix platform bus node name

 hw/core/sysbus-fdt.c    |  2 +-
 hw/riscv/virt.c         | 10 +++++++---
 include/hw/riscv/virt.h |  1 +
 3 files changed, 9 insertions(+), 4 deletions(-)


base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
-- 
2.37.1


