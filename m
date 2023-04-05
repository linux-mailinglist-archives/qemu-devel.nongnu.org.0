Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF56D8303
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:07:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5dH-0005rg-SE; Wed, 05 Apr 2023 12:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5d8-0005qY-JM
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5d5-0007XG-PS
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m2so36726825wrh.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vl/tcRzlSLFP8I0QYpufOB41zMuDYKv+twPlQw3+A7Y=;
 b=z2nGX/sbknCymlzrQ9v16a39LCmw2vWJ+052z8qCXp7C4jGf6bXcXu3B7SE2op86CM
 pZWCxIOp3+X8l3AJqCp2i3FP8bFOTsRw0XKW5Vu5GlUd7a77LW832HlQNzKVAQA6Unii
 ywjYKNh6fSPU47UFgAbZ/m+OdxIevSbiXkJMApc20LE9+QSxxrSbS2AhGEsWbiV30ZGs
 tGZCcSsg/j2+HjulCXVtZOqEQgLreXUOtJx3aVjPkjgdF5Gib/2iRwHJE/TDtzWp2cfI
 BCx9gnMsct8Sih+glmi6JpbVhwxn29093cKIRS61NExqCA4Hm2FHRQvku8it5hwfLWWG
 8qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710698;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vl/tcRzlSLFP8I0QYpufOB41zMuDYKv+twPlQw3+A7Y=;
 b=yiTJwuPyhfkGZA0JQ5IwigB8tm0ybJ/v8ktoL98RvhHzAL3/zxRTEFJdCyj5kPyJiW
 ve9RDbz2X/TNl9+nSQHg/CDmioWYAfGqJup+3UzBDrPJmXWhHcPCkUZWvD7sIAv5TtBP
 aJKjsJ5hfk2EkM+faQakEWYfbMeqG5f+0ueUOy7r3Je5Lldp2120AC9o7Oy1AJiu/zrk
 uFH1QDNP4//22XKhbPeMtJvBnOiZHFdqiDAgWKrXaAUxR2X4LW9u6Qfs/3Gj62kFafCh
 sAafXPNWWB02q8dSCcqUbECDUmB5ZE4nwc/UMX8aUVGSPHcNcO+G6bZPXGSPxq+NcX5G
 bVew==
X-Gm-Message-State: AAQBX9doqe7ViYVobFJtNDstR4lg70rFo7uKfT2NwvHbH8T/dB6kN5NM
 lrDZPoZYDvudau8A0YXchSyo8PHnhWLZdyOzU+c=
X-Google-Smtp-Source: AKy350a2v8x4w7quWU/H2xrgdicBj2Mb70/KyTRdW4r/bTcsFan0Cz9m9OOnUgEYSEuCthtLF8HE9g==
X-Received: by 2002:a5d:4f8d:0:b0:2d8:1aff:813 with SMTP id
 d13-20020a5d4f8d000000b002d81aff0813mr4655005wru.43.1680710697754; 
 Wed, 05 Apr 2023 09:04:57 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a5d48c2000000b002e61923575csm14691415wrs.74.2023.04.05.09.04.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:04:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/10] accel/kvm: Spring cleaning
Date: Wed,  5 Apr 2023 18:04:44 +0200
Message-Id: <20230405160454.97436-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Misc KVM-related cleanup patches split from a bigger
"extract KVM specific fields from CPUState" series.

Philippe Mathieu-Daudé (10):
  sysemu/kvm: Remove unused headers
  accel/kvm: Declare kvm_direct_msi_allowed in stubs
  hw/intc/arm_gic: Un-inline GIC*/ITS class_name() helpers
  hw/intc/arm_gic: Rename 'first_cpu' argument
  hw/arm/sbsa-ref: Include missing 'sysemu/kvm.h' header
  target/arm: Reduce QMP header pressure by not including 'kvm_arm.h'
  target/arm: Restrict KVM-specific fields from ArchCPU
  target/ppc: Restrict KVM-specific field from ArchCPU
  target/riscv: Restrict KVM-specific fields from ArchCPU
  hw/s390x: Rename pv.c -> pv-kvm.c

 include/hw/intc/arm_gic.h              |  2 ++
 include/hw/intc/arm_gicv3_common.h     | 10 ++++++
 include/hw/intc/arm_gicv3_its_common.h |  9 ++++++
 include/sysemu/kvm.h                   |  3 --
 target/arm/cpu.h                       |  2 ++
 target/arm/kvm_arm.h                   | 45 --------------------------
 target/ppc/cpu.h                       |  2 ++
 target/riscv/cpu.h                     |  2 ++
 accel/stubs/kvm-stub.c                 |  1 +
 hw/arm/sbsa-ref.c                      |  1 +
 hw/arm/virt-acpi-build.c               |  2 +-
 hw/arm/virt.c                          |  1 +
 hw/intc/arm_gic_common.c               | 12 +++++--
 hw/intc/arm_gicv3_common.c             | 14 ++++++++
 hw/intc/arm_gicv3_its_common.c         | 12 +++++++
 hw/s390x/{pv.c => pv-kvm.c}            |  0
 target/arm/arm-qmp-cmds.c              |  3 +-
 target/ppc/mmu_common.c                |  4 +++
 target/riscv/machine.c                 |  4 +++
 hw/s390x/meson.build                   |  2 +-
 20 files changed, 78 insertions(+), 53 deletions(-)
 rename hw/s390x/{pv.c => pv-kvm.c} (100%)

-- 
2.38.1


