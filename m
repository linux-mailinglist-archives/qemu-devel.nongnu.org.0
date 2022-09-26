Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A155EA796
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:47:19 +0200 (CEST)
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocoS6-0005Wm-BQ
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKF-0001y5-0n
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKD-0005e7-0A
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id z6so10315991wrq.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=gCnfusu3BjpQePbKlJglN1S0tmOGdGMgTpCQYlDZ79M=;
 b=caSO6LcpzkdF8a+WkvEoytWnJTiux13XyafD2GYGFicK0xjFrC4ayQeu+9KkiAhj6E
 8dZaLsi5KPTIsoaDDfP7a/1b+K94Z5hgY/Qvti5op89xCjNSyYY2Y3ortVziTqFJXaIa
 ZsZp01UNSaA3cwSyiGqP+H1uAYtsq9LM3HHKvuYO9m6fUuUUJyPtoVSnP5z4l4UnfXu9
 gaAWVES2C9LL5i3SU6KqM8IkLPhZXzw8H2EiG0Ss4DeGM0peifnL+B5yJ7OAl9DEBL7k
 bAo5lPqMwIF2BWy00VFU5GCknnE5UYuQtX4tdD8bfI+l+dTXW8Q65WExnRKjyW0Nt8gI
 cixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=gCnfusu3BjpQePbKlJglN1S0tmOGdGMgTpCQYlDZ79M=;
 b=UKxtwtu02G00V60OXJez/9F1clh+9L6F2gOBpnIuc3rzRA53y5EecH2B9xrAH/sRb8
 p6vFkjalLXlBQmiWyUEUKG1s/6zP+HNe+/RZATHNSbsWrSwtMIZd2B4Lsau1Ah9eP8Jo
 ashtIpw//HI3+Ehed58OQ24KKOhDJear4SpO98xIt+XiQ/0b1/vWZn0SuNSPx99UmsUv
 VtF1yl719YfXMzT+daaqVBVYYS4s/tOb3mLvW9xAiukkDqSbNL3ZApIXliuXdWOI7KmJ
 6p+Iup1kFoSxGsL129W2sY/oITFasjKLpfPIMW0+g/4UBFU14PWIuG19MDMlSyXAxnrh
 8g8A==
X-Gm-Message-State: ACrzQf0ox6pk5ZItO0GjszsfuRFzlaWyGKmvZU/MV4K3gOpqxvD0uHnk
 i4HTRdih3knpjmsIWT62I0nyrQ==
X-Google-Smtp-Source: AMsMyM5zQyuilv88Ud/qRz3FgTD/fw3f59MHHVHGa58TJ9KoanPAubfp7NorPLK9fGTuuqzvC0E6yA==
X-Received: by 2002:a5d:64e5:0:b0:22a:3cae:93bf with SMTP id
 g5-20020a5d64e5000000b0022a3cae93bfmr13786257wri.323.1664199546728; 
 Mon, 26 Sep 2022 06:39:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x12-20020adfffcc000000b0022ac672654dsm14103341wrs.58.2022.09.26.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD0D41FFB7;
 Mon, 26 Sep 2022 14:39:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 00/11] gdbstub/next (MemTxAttrs and re-factoring)
Date: Mon, 26 Sep 2022 14:38:53 +0100
Message-Id: <20220926133904.3297263-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

This is v3 of the MexTxAttrs update alongside the current state of
gdbstub/next (as fixing current_cpu from gdbstub was the original
motivation).

Following feedback I've drastically simplified the first patch and
push the all the setting of requester_id to the per-arch tlb_fill and
get_phys_page_attrs_debug helpers to fill in correctly. There is also
a new patch to fix up HVF on Aarch64 which rely mostly on software
modelled devices.

The later re-factoring is unchanged having sailed through review
without any comments.

The following are left for review:

 - qtest: make read/write operation appear to be from CPU
 - target/arm: ensure HVF traps set appropriate MemTxAttrs
 - target/arm: enable tracking of CPU index in MemTxAttrs
 - hw: encode accessing CPU index in MemTxAttrs

Alex Bennée (11):
  hw: encode accessing CPU index in MemTxAttrs
  target/arm: enable tracking of CPU index in MemTxAttrs
  target/arm: ensure HVF traps set appropriate MemTxAttrs
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
 include/exec/memattrs.h        |  17 +++-
 include/qemu/accel.h           |  12 +++
 include/sysemu/accel-ops.h     |   7 ++
 include/sysemu/cpus.h          |   3 +
 include/sysemu/kvm.h           |  20 -----
 accel/accel-common.c           |  10 +++
 accel/kvm/kvm-accel-ops.c      |   9 ++
 accel/kvm/kvm-all.c            |  44 +++++-----
 accel/stubs/kvm-stub.c         |  16 ----
 accel/tcg/tcg-accel-ops.c      |  98 +++++++++++++++++++++
 accel/tcg/tcg-all.c            |  17 ++++
 gdbstub.c => gdbstub/gdbstub.c | 156 ++++-----------------------------
 gdbstub/softmmu.c              |  51 +++++++++++
 gdbstub/user.c                 |  68 ++++++++++++++
 hw/intc/arm_gic.c              |  39 +++++----
 hw/timer/arm_mptimer.c         |  25 +++---
 softmmu/cpus.c                 |   7 ++
 softmmu/qtest.c                |  26 +++---
 target/arm/hvf/hvf.c           |   4 +-
 target/arm/ptw.c               |   3 +
 MAINTAINERS                    |   2 +-
 gdbstub/meson.build            |   9 ++
 gdbstub/trace-events           |  29 ++++++
 trace-events                   |  28 ------
 29 files changed, 461 insertions(+), 272 deletions(-)
 create mode 100644 gdbstub/internals.h
 create mode 100644 gdbstub/trace.h
 rename gdbstub.c => gdbstub/gdbstub.c (95%)
 create mode 100644 gdbstub/softmmu.c
 create mode 100644 gdbstub/user.c
 create mode 100644 gdbstub/meson.build
 create mode 100644 gdbstub/trace-events

-- 
2.34.1


