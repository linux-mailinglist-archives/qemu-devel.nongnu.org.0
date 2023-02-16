Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD507699449
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdKh-0002gR-4t; Thu, 16 Feb 2023 07:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKO-0002dJ-1Z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKM-0007z3-AV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bu23so1661838wrb.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yGqtHyWNpk4JgfDYgeUJwDwc4J1LJaE/TAF4Khed5eI=;
 b=pP9PtTFwqWBEITP2sMQCCrbr4I5ffrIGMuJ4lDFXem/rpo2Vjx88vHu0f2WXAKA8T2
 9C244q1trUO8EQmEcICOBWuHf1cUwv7RL2cZ0lfGqSPG9EvIwqcpZprtuv+9sAvvXbci
 QePWg5wPT5mEaBC/tsVXaeU5BsMORnCvegSNZiKqZHvDXxM4CrzFoqP8O865/t/2wdAp
 9TCIbhWYd573yrffLm0AuXNyLSKjDZ2eL4Vu2CNFsmeMo0beGq7vgpkUIp60IA+u7NHb
 5T0fFJlys2q6yNo/mN/X60E0RzZBqM6M+7/N8/hXJ+1N4B43NQokQlyH01KF7C7mhB/E
 xuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yGqtHyWNpk4JgfDYgeUJwDwc4J1LJaE/TAF4Khed5eI=;
 b=ZUZ0witNe6FLSgNEH95BzswYLUV0gfP/81r0IV+bJV/Ky9dglIbVPaiaM6pHoorwlp
 AmtEkfXYY6CgNke2uQjuoS06ewTrIyVJi4zQXIHvwC6ZDv0ok18RklSLu6azRH2fIHMs
 mz9KhS5RJ02H8XVurz7c1kK+WBAR+VbfQ7f6hC+RI83feMrMkXHxo8MUwjSj6Qe6phgP
 hJTIVR3I6EV/OwY2//POykEyvE+RDExWIYN8mprgx9b51/P6V+AViw4VhZTgC6+1aUhZ
 xrnMZjg7ly3nygyr7cNlTJjuNsMmck7rQ3TsEmNFIYQZTl2faVp71Ury4dKIkKNmcBss
 Bf9g==
X-Gm-Message-State: AO0yUKVrIFzQxMNtC9TC6XVpOeBjS7TkKod7X1K4sPkR65mZROEVZvVC
 wNJracSkKlRVGvJGUkitnnVpsjqCbVMQfCZo
X-Google-Smtp-Source: AK7set+sfNc8DuV8qZMbWQRvkBk1qQuom735CmW8ENqEYqFR1GwOtdERg89J8oUeeCFkV9eWeFBBWQ==
X-Received: by 2002:adf:f203:0:b0:2c5:5870:b589 with SMTP id
 p3-20020adff203000000b002c55870b589mr5691036wro.14.1676550326157; 
 Thu, 16 Feb 2023 04:25:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a5d46c1000000b002c57384dfe0sm1368992wrs.113.2023.02.16.04.25.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 04:25:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] bulk: Have object_child_foreach() take Error* and return
 boolean
Date: Thu, 16 Feb 2023 13:25:19 +0100
Message-Id: <20230216122524.67212-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

The objective of this series is to allow object_child_foreach()
and object_child_foreach_recursive() propagate Error to their
callers.
Instead of adding temporary helpers with the new prototype, and
converting per subsystem, a bulk conversion is done as a single
patch... The changes aren't mechanical, but quite obvious.

Philippe Mathieu-Daudé (5):
  hw/nmi: Have nmi_monitor_handler() return a boolean indicating error
  spapr/ddw: Remove confuse return value in spapr_phb_get_free_liobn()
  bulk: Have object_child_foreach() take Error* and return boolean
  hw/nmi: Simplify nmi_monitor_handle() and do_nmi()
  hw/ppc/pnv_bmc: Simplify pnv_bmc_find()

 chardev/char-mux.c              |  6 ++--
 chardev/char.c                  |  6 ++--
 gdbstub/gdbstub.c               |  8 +++---
 hw/acpi/cxl.c                   |  7 +++--
 hw/acpi/viot.c                  |  6 ++--
 hw/arm/boot.c                   |  6 ++--
 hw/arm/virt-acpi-build.c        |  8 +++---
 hw/core/machine-qmp-cmds.c      | 18 ++++++------
 hw/core/nmi.c                   | 44 +++++------------------------
 hw/core/qdev.c                  |  8 ++++--
 hw/core/sysbus.c                | 10 +++----
 hw/cpu/cluster.c                |  7 +++--
 hw/display/virtio-gpu-udmabuf.c |  7 +++--
 hw/hppa/machine.c               |  3 +-
 hw/i386/acpi-build.c            | 16 +++++------
 hw/i386/intel_iommu.c           |  7 +++--
 hw/i386/pc.c                    | 13 ++++-----
 hw/i386/sgx.c                   |  7 ++---
 hw/i386/x86.c                   |  3 +-
 hw/intc/m68k_irqc.c             |  4 ++-
 hw/m68k/q800.c                  |  4 ++-
 hw/mem/memory-device.c          | 25 ++++++++---------
 hw/mem/pc-dimm.c                |  8 +++---
 hw/misc/macio/gpio.c            |  4 ++-
 hw/misc/mos6522.c               |  6 ++--
 hw/ppc/pnv.c                    | 18 ++++++------
 hw/ppc/pnv_bmc.c                | 28 ++++++++----------
 hw/ppc/pnv_xscom.c              |  6 ++--
 hw/ppc/spapr.c                  |  3 +-
 hw/ppc/spapr_pci.c              | 50 ++++++++++++++++-----------------
 hw/ppc/spapr_rtas_ddw.c         | 17 ++++++-----
 hw/rdma/vmw/pvrdma_main.c       |  7 +++--
 hw/s390x/s390-virtio-ccw.c      |  4 ++-
 hw/virtio/virtio-balloon.c      |  7 ++---
 include/hw/nmi.h                |  3 +-
 include/qom/object.h            | 28 ++++++++++--------
 iothread.c                      |  8 +++---
 monitor/hmp-cmds.c              |  6 ++--
 qom/object.c                    | 36 ++++++++++++------------
 qom/qom-hmp-cmds.c              |  7 +++--
 scsi/pr-manager.c               |  8 +++---
 softmmu/physmem.c               | 13 +++++----
 softmmu/qdev-monitor.c          |  9 +++---
 tests/qtest/fuzz/generic_fuzz.c |  6 ++--
 ui/dbus-chardev.c               | 14 ++++-----
 util/nvdimm-utils.c             |  8 +++---
 46 files changed, 256 insertions(+), 271 deletions(-)

-- 
2.38.1


