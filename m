Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A8382BF9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:21:54 +0200 (CEST)
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licFt-0007lO-49
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqN-000399-A9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqL-0002gP-NK
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id r12so6099511wrp.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Z6fvptqBpZrV8gp2ZZ4WjCOns5hPBTZUW/Lp/nebSo=;
 b=eJCOIXwa3mZhVgYGru3yV1gTDO27B7U0leHRzLxx2eN/qm4/eaSLDVZSAE7wLzWVYl
 JGLXWkwBrt4aK8FGN9gv0UjwpE5x3f3GC0QdhqUvY7vXaKR6DoUooOZa2KKJ5enXgdYt
 BVdCh9f0EHGsXNZzzejIpy5u+YTqDHcXsWG/DGcMQftksgbyQlhdV5vuxuVSzLY2iQK2
 rP3RP6QxgCqt18LsSgXWh5tkEbMIj4/mAL0VPgXcoTEkCpNCQCM1bs9u5h2fUDE9FEkt
 Hac+lWbZ9y8P5c0fT+3xjbe/pvUvN624zSlpXUGJEQ8m0d3j9qGmLSIGCl+gV8hhY7rc
 N/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0Z6fvptqBpZrV8gp2ZZ4WjCOns5hPBTZUW/Lp/nebSo=;
 b=epRuM1it9eaDLSv55vS6hIWkeItn9FS83ctvHShfa+ud4EKBWRrpVfOSyIkFk+xCSa
 g6Onsni5yA/2Uwb3n1uNUzhNOBX567AK0lWFA1HxjCKeTRpic1g/ixlkwlZy3qN7yx5f
 AIENAouKW6VU4jhF48jW41BKdvL3NBxSjIPDTGA7qD53+rZ1k71ELngzBEUpWvIFyGmv
 UpQzwBxrh0BCrVcyCCZXMG0JY/x3ELyxd2s1EU/goxW9TcxGG7qPS50jgCENucGrLFfc
 out2mT3Bv2FfCKe8ivyjGdE6RAqLtYVuHE8nuy/2WRyfJAHiS4NX1rSdqnOZuPwsCCa8
 6WUA==
X-Gm-Message-State: AOAM533K8fhcJ4Sto9IxdKZD298q5/bhxpR1iVhvVlW/pqwVvfLvTPUW
 QMW2CHD4YzBx6K/cks+2D385qsRU8UObAQ==
X-Google-Smtp-Source: ABdhPJy6o/BS7XjGk/BpZaR5sfl4fmfEKE8Li27Sm9b7ctSsNb344TqrjeTq3GsYQ44WdHXy9EiWIg==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr75084457wrs.33.1621252527861; 
 Mon, 17 May 2021 04:55:27 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n6sm6725472wmq.34.2021.05.17.04.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:55:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/15] softmmu: Make various objects target agnostic
Date: Mon, 17 May 2021 13:55:10 +0200
Message-Id: <20210517115525.1088693-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Few changes to speed up builds, removing 330 objects.=0D
=0D
RFC because of:=0D
- accel hax/whpx changes=0D
- sysemu/memory_mapping target_ulong -> hwaddr=0D
which i'm not sure of the impacts.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (15):=0D
  accel/kvm: Add more stubs=0D
  accel/whpx: Simplify #ifdef'ry=0D
  accel/hax: Simplify #ifdef'ry=0D
  accel: Only use TCG when building user-mode emulation=0D
  accel/kvm: Simplify user-mode #ifdef'ry=0D
  hw/acpi/memory_hotplug: Remove unused 'hw/acpi/pc-hotplug.h' header=0D
  softmmu/globals: Remove unused 'hw/i386/*' headers=0D
  softmmu/cpu-timers: Remove unused 'exec/exec-all.h' header=0D
  softmmu/runstate: Clean headers=0D
  exec/gdbstub: Make gdb_exit() / gdb_set_stop_cpu() target agnostic=0D
  exec/cpu: Make address_space_init/reloading_memory_map target agnostic=0D
  sysemu/kvm: Make kvm_on_sigbus() / kvm_on_sigbus_vcpu() target=0D
    agnostic=0D
  sysemu/memory_mapping: Become target-agnostic=0D
  softmmu/cpus: Extract QMP command handlers to cpus-qmp.c=0D
  softmmu: Build target-agnostic objects once=0D
=0D
 include/exec/cpu-common.h       |  23 +++++++=0D
 include/exec/exec-all.h         |  25 -------=0D
 include/exec/gdbstub.h          |  23 ++++---=0D
 include/sysemu/hax.h            |  14 +---=0D
 include/sysemu/kvm.h            |   6 +-=0D
 include/sysemu/memory_mapping.h |   3 +-=0D
 include/sysemu/whpx.h           |  15 +----=0D
 accel/stubs/hax-stub.c          |   5 ++=0D
 accel/stubs/kvm-stub.c          |  11 +--=0D
 accel/stubs/whpx-stub.c         |  21 ++++++=0D
 hw/acpi/memory_hotplug.c        |   1 -=0D
 softmmu/cpu-timers.c            |   1 -=0D
 softmmu/cpus-qmp.c              | 115 ++++++++++++++++++++++++++++++++=0D
 softmmu/cpus.c                  |  89 ------------------------=0D
 softmmu/globals.c               |   2 -=0D
 softmmu/memory_mapping.c        |   1 +=0D
 softmmu/runstate.c              |   2 +-=0D
 target/i386/hax/hax-all.c       |   2 +-=0D
 target/i386/whpx/whpx-all.c     |   2 +-=0D
 MAINTAINERS                     |   1 +=0D
 accel/meson.build               |  10 +--=0D
 accel/stubs/meson.build         |   1 +=0D
 softmmu/meson.build             |  25 +++----=0D
 23 files changed, 213 insertions(+), 185 deletions(-)=0D
 create mode 100644 accel/stubs/whpx-stub.c=0D
 create mode 100644 softmmu/cpus-qmp.c=0D
=0D
-- =0D
2.26.3=0D
=0D

