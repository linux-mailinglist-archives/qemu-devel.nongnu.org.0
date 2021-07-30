Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B173DB786
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:03:19 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QIP-0002qK-Uo
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF7-0008RB-Bx
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF5-0002UM-Fj
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id l18so10787215wrv.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bHiSoeuFrsS6WC3ByExBznHtGsC2xBGNMaeOYhtuafE=;
 b=arzVjWtirbjNPupFkxVlHuWo9k8Xk1/s9Fc11Xg7wbmzY+1+i7dWZ88t4I/iu3s1LC
 9CtTtAQs92dE8BNXmZ2/sFKYInxZ1hJimgjZ5SBO17amUPvvDD1Q82446/WwPqrSElRe
 6Dy4ADGRnSTylxHQAvOc3vybU+ZNBUH+UbB4bYiDzvI+ggFnIyKFXF8ZvKCpG/gTacxc
 ESVAN+HfKo20IPlSQh5waYzKgATDAlOP7kTdZQE+OJdGxO2MX8Fux55HIiPgSyeUbOzh
 iuizRJezxpoboETzM+VBRc6b0UvbK0jDgjQDDwGCkbZVs1dHBzR7fWuTBt7R+X3fg4Ny
 pBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bHiSoeuFrsS6WC3ByExBznHtGsC2xBGNMaeOYhtuafE=;
 b=WdwuMMMpyOZ5mW5WnLuHbMSYBHu0kw2tzbdMnBB0WBnceMPmrDQEHcPrABnKPHm44u
 p0tng1dvF18CsguHV+7mTJRG3iiJNYG0Rfwblb7ECjgVxqbvpwsSC22yU3Rmdz3F+gl6
 gSfjoI6tDHzTyrANJprDwntvTBa5LO8Gl0Co36PtuZxz7WJiotsmMfG2IElckZ5Q0Rvz
 PvrStyPtIkMW5zmqovEzc3+kphVdbqaQ+iYAkEJ0ziZnqEpcTgQSWViQuCtz5VuQia2L
 X1iS7VbKXYn9Bp6Zt4qGUo/TxhEhQqs7/+xBsXlCTijpMzJHXyqQGLI8tBYNfo0uhxJ6
 NO+w==
X-Gm-Message-State: AOAM533Oa5HeHvCCYGKHf2X5HGRWNd7dEcpCWcL8f0uKNQW2HfzbwyNf
 3piqH9EUBwUepb2ZqR1nE4FLzjmz9Vjl7w==
X-Google-Smtp-Source: ABdhPJzTvmwjvYFoJiI3VxMS6CaLH7GdoIMXiiSf0W7zMV6pVF9HAYGVR6IrcbNJp2jHEshG1Sna0w==
X-Received: by 2002:adf:ce06:: with SMTP id p6mr2393020wrn.171.1627642790127; 
 Fri, 30 Jul 2021 03:59:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/8] softmmu: Clean up arch_init.c
Date: Fri, 30 Jul 2021 11:59:39 +0100
Message-Id: <20210730105947.28215-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset does some cleanups of arch_init.c.  The bit I started
out caring about was getting rid of the TARGET_* ifdef ladder (in
patch 4 we make meson.build define QEMU_ARCH in config-target.h
instead) -- this kind of ifdef ladder is nasty because it's always
another place in the code that needs updating when we add or remove a
target.  I think this was one of the last remaining "every single
arch touches this" ones.  The rest of the patchset is stuff I noticed
when I started looking at what else arch_init.c was doing.

The graphic_width/height/depth target-specific defaults that
arch_init.c does also look like they could use cleanup.  My guess is
that we should instead have a per-machine default graphics
width/height/depth.  But that's a separate thing and more work than I
felt like doing this morning :-)

-- PMM

Peter Maydell (8):
  softmmu: Use accel_find("xen") instead of xen_available()
  monitor: Use accel_find("kvm") instead of kvm_available()
  softmmu/arch_init.c: Trim down include list
  meson.build: Define QEMU_ARCH in config-target.h
  arch_init.h: Add QEMU_ARCH_HEXAGON
  arch_init.h: Move QEMU_ARCH_VIRTIO_* to qdev-monitor.c
  arch_init.h: Don't include arch_init.h unnecessarily
  stubs: Remove unused arch_type.c stub

 meson.build                |  2 ++
 include/sysemu/arch_init.h | 15 +--------
 blockdev.c                 |  1 -
 hw/i386/pc.c               |  1 -
 hw/i386/pc_piix.c          |  1 -
 hw/i386/pc_q35.c           |  1 -
 hw/mips/jazz.c             |  1 -
 hw/mips/malta.c            |  1 -
 hw/ppc/prep.c              |  1 -
 hw/riscv/sifive_e.c        |  1 -
 hw/riscv/sifive_u.c        |  1 -
 hw/riscv/spike.c           |  1 -
 hw/riscv/virt.c            |  1 -
 monitor/qmp-cmds.c         |  3 +-
 softmmu/arch_init.c        | 66 --------------------------------------
 softmmu/qdev-monitor.c     |  9 ++++++
 softmmu/vl.c               |  6 ++--
 stubs/arch_type.c          |  4 ---
 target/ppc/cpu_init.c      |  1 -
 target/s390x/cpu-sysemu.c  |  1 -
 stubs/meson.build          |  1 -
 21 files changed, 16 insertions(+), 103 deletions(-)
 delete mode 100644 stubs/arch_type.c

-- 
2.20.1


