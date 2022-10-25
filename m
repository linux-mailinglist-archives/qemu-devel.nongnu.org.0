Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E452660BFFD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 02:45:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on82u-00036T-Su; Mon, 24 Oct 2022 20:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82p-00026M-Rg
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:43:51 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on82l-0005Bx-UN
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:43:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AF46616B6;
 Tue, 25 Oct 2022 00:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC25BC433D6;
 Tue, 25 Oct 2022 00:43:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="astp6b/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666658614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cNXUXUYQc+f1dsO6VsbuIyRHnhSMQJEo5F2e4ogh6ZM=;
 b=astp6b/xhDOehrfq2QBkpB9GCIFe1+g678CzdqtO67ktjQsLf1PesJy0JFIvkri/+zARCT
 WpXB9j3477XbOOAYR2DS7xxGEelNtSzsPOinILlGKqofZuDdDWlWFtuCeBdsoOiHJRN3Dd
 h9POppg6sxm2f19EeBtkteaYhdzmu9o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c3a4af9c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 00:43:33 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v4 00/11] rerandomize RNG seeds on reboot and handle
 record&replay
Date: Tue, 25 Oct 2022 02:43:16 +0200
Message-Id: <20221025004327.568476-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When the system reboots, the rng seed that QEMU passes should be
re-randomized, so that the new boot gets a new seed. This series wires
that up for FDT.

Then, since the record&replay subsystem makes use of reset as well, we
add a new reset cause for record&replay, so that we can avoid
re-randomizing in these cases.

Version 4 prevents the new reset type from leaking over QAPI, documents
this alongside which version it was introduced, and adds mips and m68k
machine types to the queue.

Jason A. Donenfeld (11):
  reset: allow registering handlers that aren't called by snapshot
    loading
  device-tree: add re-randomization helper function
  x86: do not re-randomize RNG seed on snapshot load
  arm: re-randomize rng-seed on reboot
  riscv: re-randomize rng-seed on reboot
  m68k/virt: do not re-randomize RNG seed on snapshot load
  m68k/q800: do not re-randomize RNG seed on snapshot load
  mips/boston: re-randomize rng-seed on reboot
  mips/malta: pass RNG seed via env var and re-randomize on reboot
  openrisc: re-randomize rng-seed on reboot
  rx: re-randomize rng-seed on reboot

 hw/arm/aspeed.c              |  4 ++--
 hw/arm/boot.c                |  2 ++
 hw/arm/mps2-tz.c             |  4 ++--
 hw/core/reset.c              | 15 ++++++++++++++-
 hw/hppa/machine.c            |  4 ++--
 hw/i386/microvm.c            |  4 ++--
 hw/i386/pc.c                 |  6 +++---
 hw/i386/x86.c                |  2 +-
 hw/m68k/q800.c               | 33 +++++++++++++--------------------
 hw/m68k/virt.c               | 20 +++++++++++---------
 hw/mips/boston.c             |  3 +++
 hw/mips/malta.c              | 25 +++++++++++++++++++++++++
 hw/openrisc/boot.c           |  3 +++
 hw/ppc/pegasos2.c            |  4 ++--
 hw/ppc/pnv.c                 |  4 ++--
 hw/ppc/spapr.c               |  4 ++--
 hw/riscv/boot.c              |  3 +++
 hw/rx/rx-gdbsim.c            |  3 +++
 hw/s390x/s390-virtio-ccw.c   |  4 ++--
 include/hw/boards.h          |  2 +-
 include/sysemu/device_tree.h |  9 +++++++++
 include/sysemu/reset.h       |  5 ++++-
 migration/savevm.c           |  2 +-
 qapi/run-state.json          |  5 ++++-
 softmmu/device_tree.c        | 21 +++++++++++++++++++++
 softmmu/runstate.c           | 11 ++++++++---
 26 files changed, 145 insertions(+), 57 deletions(-)

-- 
2.38.1


