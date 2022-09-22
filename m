Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82DC5E6669
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:05:20 +0200 (CEST)
Received: from localhost ([::1]:37406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNlP-00075m-GK
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNew-0001EA-9m
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:38 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNeu-0000v5-Gw
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id n15so9071172wrq.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fJPef0+d8KnIqOgWHzhMLoi0gj7iFSR6z8ZevEFYEc4=;
 b=rQZTIhmUNq+1icbn1YSf01Ud2EjKyCV9U4cIOQzTXof48twPeb0qBee1nS89AZhiAS
 sOHI7eQzAHkXxc5szvgPmzFp8vxZyojrf8e46qDIMuTm49aMbMM8OYpOefmWvn3T7yZX
 PQk6MOC2qshBsuIK9akYkXMMYNXUcbyiKqlfzMmdg/0dA/5bLJPc4y7j4k+1YZ7rlMp1
 TrBKgwsyUkzLUsy+dXj06qkl9cDGTW0mpfXAC+qrTTsGSA+IcJWZHF2s6ZAWyscu35/1
 /gUVMSz5t41Yw6uh6Ye3dhkkuknd2NM5ZPoUjTEBhh0hHytnqawOkwAEbcLiUXEQYQs9
 0N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fJPef0+d8KnIqOgWHzhMLoi0gj7iFSR6z8ZevEFYEc4=;
 b=YHiLZtwU5O7+XBumt46V9I4k2mAwZBbn3+sRGYe10HpGDiGtULzaOHsdT5eGuLpGT+
 13J33fkrzdFMPe+4XA8vc1nVBHgXKGJ6VvNQDJf5q6VKRQ0+M0iEdOl+QYyqIKjM19uN
 qI06c+WTJr34XFB6wbSMgPGhwAyCMD23rnmz1Xlezmk1yYrSi9bEhxbxOLVt9SOvUaAV
 ZoCPEPEaZoY74mLH49JLOULyQMqJwDYz9qS/0a8vyuLOF3f6aUUgAEez5FNqC03TSzmP
 8ln0wNQc5ZHnltzrp0MfN7CNb/NJT2ATYexlQtdEDkyL4etRYBjAvAxsJim+gYSpvLGc
 UJhQ==
X-Gm-Message-State: ACrzQf17Y4pBz/wOKCzKVChRzzN61NTBc2hGWkHR2ayp0Kb6u5Q/eoVE
 DtxQbEvpCD2Znld2gjPrLd8n0Q==
X-Google-Smtp-Source: AMsMyM4XqIpzUFLXPyoLtM0Wzd9yARL1F3fWk7IcH+/mCgJlWkEg3iD4+kAGGUVtIgceRJulT4rxOg==
X-Received: by 2002:adf:f4cf:0:b0:228:63bd:da33 with SMTP id
 h15-20020adff4cf000000b0022863bdda33mr2323236wrp.181.1663858713391; 
 Thu, 22 Sep 2022 07:58:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a1c4c05000000b003b5054c6f87sm1524827wmf.21.2022.09.22.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:58:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 503291FFB7;
 Thu, 22 Sep 2022 15:58:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/9] MemTxAttrs cpu_index and gdbstub/next
Date: Thu, 22 Sep 2022 15:58:23 +0100
Message-Id: <20220922145832.1934429-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v2 of the MexTxAttrs update alongside the current state of
gdbstub/next (as fixing current_cpu from gdbstub was the original
motivation). This includes a little re-factoring to split of the
growing gdbstub.c core into smaller discreet units. The first aim of
the re-factoring it to remove the kvm specific hacks in gdbstub and
replace it with accelerator operations. This will help with enabling
debug support on more accelerators by keeping things well partitioned.

Please review.

Alex Bennée (9):
  hw: encode accessing CPU index in MemTxAttrs
  qtest: make read/write operation appear to be from CPU
  hw/intc/gic: use MxTxAttrs to divine accessing CPU
  hw/timer: convert mptimer access to attrs to derive cpu index
  configure: move detected gdb to TCG's config-host.mak
  gdbstub: move into its own sub directory
  gdbstub: move sstep flags probing into AccelClass
  gdbstub: move breakpoint logic to accel ops
  gdbstub: move guest debug support check to ops

 configure                      |   7 ++
 meson.build                    |   4 +-
 accel/kvm/kvm-cpus.h           |   4 +
 gdbstub/internals.h            |  17 ++++
 gdbstub/trace.h                |   1 +
 include/exec/memattrs.h        |   8 ++
 include/qemu/accel.h           |  12 +++
 include/sysemu/accel-ops.h     |   7 ++
 include/sysemu/cpus.h          |   3 +
 include/sysemu/kvm.h           |  20 -----
 accel/accel-common.c           |  10 +++
 accel/kvm/kvm-accel-ops.c      |   9 ++
 accel/kvm/kvm-all.c            |  44 +++++-----
 accel/stubs/kvm-stub.c         |  16 ----
 accel/tcg/cputlb.c             |  22 +++--
 accel/tcg/tcg-accel-ops.c      |  98 +++++++++++++++++++++
 accel/tcg/tcg-all.c            |  17 ++++
 gdbstub.c => gdbstub/gdbstub.c | 156 ++++-----------------------------
 gdbstub/softmmu.c              |  51 +++++++++++
 gdbstub/user.c                 |  68 ++++++++++++++
 hw/core/cpu-sysemu.c           |  17 +++-
 hw/intc/arm_gic.c              |  39 +++++----
 hw/timer/arm_mptimer.c         |  25 +++---
 softmmu/cpus.c                 |   7 ++
 softmmu/qtest.c                |  26 +++---
 MAINTAINERS                    |   2 +-
 gdbstub/meson.build            |   9 ++
 gdbstub/trace-events           |  29 ++++++
 trace-events                   |  28 ------
 29 files changed, 477 insertions(+), 279 deletions(-)
 create mode 100644 gdbstub/internals.h
 create mode 100644 gdbstub/trace.h
 rename gdbstub.c => gdbstub/gdbstub.c (95%)
 create mode 100644 gdbstub/softmmu.c
 create mode 100644 gdbstub/user.c
 create mode 100644 gdbstub/meson.build
 create mode 100644 gdbstub/trace-events

-- 
2.34.1


