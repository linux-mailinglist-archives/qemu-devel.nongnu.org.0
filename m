Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232036D83BA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:31:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk61b-0005SJ-DO; Wed, 05 Apr 2023 12:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk61R-0005Qi-FC
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:30:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk61N-0004Qe-Qt
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:30:08 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so24088056wmq.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680712204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EAb8lMkcf5cD6uOQdEQO0L3nW4YeL6kpZLcRrER5U3w=;
 b=cXHcu/vV/o2KhWfu64eO06RJBePy4noUl6QjtHS9g19CAowrS7j3dQbHwZ7uYVjW4z
 eA+9JtquAaAlBlgjHV8SyT/YkwQsckVdmZe3Ch7fetzlB2U6XOaAO9BwrwQ9DcHdcV15
 ZjHcRO5sFwuMb8Q3oKWRLt6YRqZFznOS4g5vKtj+guHFoxej+s3rEYriVNA5nWGej0Cy
 FdWe62RfiavpTAf2UCHkN0Gohce5nqeb8QlBDJC5AKkXa+EoaIEV7ARgJeIiPZuJ3Rsn
 sH9JQFZWiXwRXsu8w0fPnsnJj2HJeCx56z/SloAMMZtjAiX/fjopmtlhWCQ/rhxgwNd7
 OXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680712204;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EAb8lMkcf5cD6uOQdEQO0L3nW4YeL6kpZLcRrER5U3w=;
 b=oQkdS97Sm61j6HmnCM8hHCQZX7JmCZjhCK3UTQBWj08/maXHTHqSopaPZ7MqPh/Wp/
 wws3coC+6le+TJFrQxl5bPECV+QN5pqfpH0gjaSH40KHyZNPfww7OlJ+HTipAUL6J55E
 cezKMOCdCcjDhIK2W1kYNxNjVBk4eTmjJ4vMrv4xFFG9ZzzJ5snLBT3XnwnJWyr7VioV
 1hyPgSaF72DR4Tz3Infac/quqVIufhKvVUMHfPgIYrCzX03w++MA4HphuJnTnJu4M8B0
 kJDolkAQds6SfrxvesVbOGfTSscFezwD/7nG2xVTqWzq106q9ZO8Y7lZL82/GaZ+HG1u
 qEkg==
X-Gm-Message-State: AAQBX9cmUHaNJ/lLPC+D9n7kGNvhT30X1uNEQrwun3bKsnmJaJOj3oSO
 UFOU+pBO3KPoehAKXG1IL1sl1U1GxpTxujiWHY4=
X-Google-Smtp-Source: AKy350bpQdjCT7RwEX1iXrd8R8QdbYmYbdFSCnS0Ci6M0AH+3Q3HV+IatTE/dTjvSy5JCrz/Y7mh5g==
X-Received: by 2002:a05:600c:19c9:b0:3e1:e149:b67b with SMTP id
 u9-20020a05600c19c900b003e1e149b67bmr2277811wmq.18.1680712203916; 
 Wed, 05 Apr 2023 09:30:03 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b003ee8a1bc220sm2708891wms.1.2023.04.05.09.30.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:30:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 0/2] accel/kvm: Extract 'sysemu/kvm_irq.h' from
 'sysemu/kvm.h'
Date: Wed,  5 Apr 2023 18:29:59 +0200
Message-Id: <20230405163001.98573-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Posted individually because it is modifying a lot of files.

RFC: this might not be the best API cut, but "sysemu/kvm.h"
     is a mixed bag hard to sort...

Based-on: <20230405160454.97436-1-philmd@linaro.org>

Philippe Mathieu-Daudé (2):
  accel/kvm: Extract 'sysemu/kvm_irq.h' from 'sysemu/kvm.h'
  accel/kvm: Declare kvm_arch_irqchip_create() in 'sysemu/kvm_int.h'

 include/sysemu/kvm.h           |  88 -----------------------------
 include/sysemu/kvm_int.h       |  13 +++++
 include/sysemu/kvm_irq.h       | 100 +++++++++++++++++++++++++++++++++
 target/i386/kvm/kvm_i386.h     |   1 +
 accel/kvm/kvm-all.c            |   2 +
 accel/stubs/kvm-stub.c         |   1 +
 hw/arm/virt.c                  |   1 +
 hw/cpu/a15mpcore.c             |   1 +
 hw/hyperv/hyperv.c             |   1 +
 hw/i386/intel_iommu.c          |   1 +
 hw/i386/kvm/apic.c             |   1 +
 hw/i386/kvm/i8259.c            |   1 +
 hw/i386/kvm/ioapic.c           |   1 +
 hw/i386/kvmvapic.c             |   1 +
 hw/i386/pc.c                   |   1 +
 hw/i386/x86-iommu.c            |   1 +
 hw/intc/arm_gic.c              |   1 +
 hw/intc/arm_gic_common.c       |   1 +
 hw/intc/arm_gic_kvm.c          |   1 +
 hw/intc/arm_gicv3_common.c     |   1 +
 hw/intc/arm_gicv3_its_common.c |   1 +
 hw/intc/arm_gicv3_kvm.c        |   1 +
 hw/intc/ioapic.c               |   1 +
 hw/intc/openpic_kvm.c          |   1 +
 hw/intc/s390_flic_kvm.c        |   1 +
 hw/intc/spapr_xive_kvm.c       |   1 +
 hw/intc/xics.c                 |   1 +
 hw/intc/xics_kvm.c             |   1 +
 hw/misc/ivshmem.c              |   1 +
 hw/ppc/e500.c                  |   1 +
 hw/ppc/spapr_irq.c             |   1 +
 hw/remote/proxy.c              |   1 +
 hw/s390x/virtio-ccw.c          |   1 +
 hw/vfio/pci.c                  |   1 +
 hw/vfio/platform.c             |   1 +
 hw/virtio/virtio-pci.c         |   1 +
 target/arm/kvm.c               |   1 +
 target/i386/kvm/kvm.c          |   2 +
 target/i386/kvm/xen-emu.c      |   2 +
 target/i386/sev.c              |   1 +
 target/s390x/kvm/kvm.c         |   2 +
 41 files changed, 155 insertions(+), 88 deletions(-)
 create mode 100644 include/sysemu/kvm_irq.h

-- 
2.38.1


