Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4741E5EC739
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:07:56 +0200 (CEST)
Received: from localhost ([::1]:35504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCBf-0002fr-B7
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMk-00055j-2n
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMb-0005y1-Mq
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id t4so6622847wmj.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=DNQdc2CN9RIgiY1bN+dNPSFGQk+lMtFZ1fdzbbkaeKQ=;
 b=rmbzQQJ8D+zk9EE/dET/RLfrHMHtl8ASt1sYFJTJoXLiWLgI6rxpCW4si/O0aCABFD
 qk5f/H2GwuKESwEwnkdYwue44ok9PawiQ/WdnAIkx9uGRnFdsXpWdR43E4V5zqPA77yt
 L7DRV7IDHnOC/L/56sqmi/EuIDfjKDcUMecgl7Eon0FgfHiC6bARE1oV113ZQvS0yM1Y
 +JuxvjpIpTnG3zy1iDcivoglbvGzQZa/tYHB/SVrrpeBYiu24MyUJozlOPpu3JxUCAG8
 ew0DPI56/YNgP7Mf2qchNcft1Ik9T5R+Hsygp4xbO1oz2GWSMg8D3Z5vEXR6WCS/Vrd+
 OSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=DNQdc2CN9RIgiY1bN+dNPSFGQk+lMtFZ1fdzbbkaeKQ=;
 b=K8jiJxU24D2JyV1+MvdMLMwg7NdREDAUP03Ydk7P9q1n/BJuvEQ6C22c9TW81ZScpr
 D8GArDsXBk6vZt5ZDoULX9ENANICYfY7uP7ZYbzkurFENFZEMIdVHj12TI7cKw/uT/4x
 5OP+jkzeuBBbE1GxL1JPZhN9ZZmYb1UeVBOkdiCAEdjUG1/vJg9mLAukgX7QnY81/KvD
 /gPpri/7PfkwcKsZ1OdfdoPSVHqaG//77AuFBl1UyQdLPpT68JE4cOWScYoWMAat2CHV
 98MCNPB1iXSTjH4x0FtxJ4Ta0Kw0VHeFXCWU+zo2KR+GK3h7ZqFOCSVePLSVS/vrqWf0
 QY4w==
X-Gm-Message-State: ACrzQf1hS3nFKNfwkYIFy3UMDifmWPyU2DQmOi059ebBOc3/1xSeKFAp
 BWcmc8mThDt4MLAKDBcatH2Jvg==
X-Google-Smtp-Source: AMsMyM5MK8N0rFSxhHIuKBzZMJDIpjNnScbHyTuEgjRZqyS10UrA8ZLC+mSW9pqt2vfYtuInS+Dd3w==
X-Received: by 2002:a7b:cb56:0:b0:3b3:4ad8:9e31 with SMTP id
 v22-20020a7bcb56000000b003b34ad89e31mr2877209wmj.87.1664288106608; 
 Tue, 27 Sep 2022 07:15:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfce02000000b00226dba960b4sm1983684wrn.3.2022.09.27.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E95D11FFB7;
 Tue, 27 Sep 2022 15:15:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 00/15] gdbstub/next (MemTxAttrs, re-factoring)
Date: Tue, 27 Sep 2022 15:14:49 +0100
Message-Id: <20220927141504.3886314-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Following feedback on the MemTxAttrs updates we now:

  - move unspecified to requester_type
  - document a machine specific decoding of requester_id
  - update the existing users
  - update HVF/KVM/m-profile/page-walking access functions
  - fail with MEMTX_ACCESS_ERROR if non-CPU accesses GIC

I suspect this will be my last run at this for a while so if it is
still wanting I'll split off the re-factoring work for a PR so it is
not held up. The following still need review:

 - accel/kvm: move kvm_update_guest_debug to inline stub
 - qtest: make read/write operation appear to be from CPU
 - target/arm: ensure m-profile helpers set appropriate MemTxAttrs
 - target/arm: ensure ptw accesses set appropriate MemTxAttrs
 - target/arm: ensure KVM traps set appropriate MemTxAttrs
 - target/arm: ensure HVF traps set appropriate MemTxAttrs
 - target/arm: ensure TCG IO accesses set appropriate MemTxAttrs
 - hw: encode accessing CPU index in MemTxAttrs


Alex Bennée (15):
  hw: encode accessing CPU index in MemTxAttrs
  target/arm: ensure TCG IO accesses set appropriate MemTxAttrs
  target/arm: ensure HVF traps set appropriate MemTxAttrs
  target/arm: ensure KVM traps set appropriate MemTxAttrs
  target/arm: ensure ptw accesses set appropriate MemTxAttrs
  target/arm: ensure m-profile helpers set appropriate MemTxAttrs
  qtest: make read/write operation appear to be from CPU
  hw/intc/gic: use MxTxAttrs to divine accessing CPU
  hw/timer: convert mptimer access to attrs to derive cpu index
  configure: move detected gdb to TCG's config-host.mak
  gdbstub: move into its own sub directory
  gdbstub: move sstep flags probing into AccelClass
  gdbstub: move breakpoint logic to accel ops
  gdbstub: move guest debug support check to ops
  accel/kvm: move kvm_update_guest_debug to inline stub

 configure                      |   7 ++
 meson.build                    |   4 +-
 accel/kvm/kvm-cpus.h           |   4 +
 gdbstub/internals.h            |  17 ++++
 gdbstub/trace.h                |   1 +
 include/exec/memattrs.h        |  39 ++++++--
 include/qemu/accel.h           |  12 +++
 include/sysemu/accel-ops.h     |   7 ++
 include/sysemu/cpus.h          |   3 +
 include/sysemu/kvm.h           |  36 +++----
 accel/accel-common.c           |  10 ++
 accel/kvm/kvm-accel-ops.c      |   9 ++
 accel/kvm/kvm-all.c            |  48 ++++-----
 accel/stubs/kvm-stub.c         |  21 ----
 accel/tcg/tcg-accel-ops.c      |  98 +++++++++++++++++++
 accel/tcg/tcg-all.c            |  17 ++++
 gdbstub.c => gdbstub/gdbstub.c | 156 +++--------------------------
 gdbstub/softmmu.c              |  51 ++++++++++
 gdbstub/user.c                 |  68 +++++++++++++
 hw/i386/amd_iommu.c            |   3 +-
 hw/i386/intel_iommu.c          |   2 +-
 hw/intc/arm_gic.c              | 174 ++++++++++++++++++++++-----------
 hw/misc/tz-mpc.c               |   2 +-
 hw/misc/tz-msc.c               |   8 +-
 hw/pci/pci.c                   |   7 +-
 hw/timer/arm_mptimer.c         |  25 ++---
 softmmu/cpus.c                 |   7 ++
 softmmu/qtest.c                |  26 ++---
 target/arm/hvf/hvf.c           |   4 +-
 target/arm/kvm.c               |  12 ++-
 target/arm/m_helper.c          |  12 +--
 target/arm/ptw.c               |   7 +-
 MAINTAINERS                    |   2 +-
 gdbstub/meson.build            |   9 ++
 gdbstub/trace-events           |  29 ++++++
 trace-events                   |  28 ------
 36 files changed, 615 insertions(+), 350 deletions(-)
 create mode 100644 gdbstub/internals.h
 create mode 100644 gdbstub/trace.h
 rename gdbstub.c => gdbstub/gdbstub.c (95%)
 create mode 100644 gdbstub/softmmu.c
 create mode 100644 gdbstub/user.c
 create mode 100644 gdbstub/meson.build
 create mode 100644 gdbstub/trace-events

-- 
2.34.1


