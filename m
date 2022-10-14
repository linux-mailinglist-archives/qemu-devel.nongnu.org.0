Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B75FE6E5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 04:20:02 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojAIr-0007KG-9k
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 22:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1ojAG2-0000Mt-JL
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 22:17:08 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:57256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org>)
 id 1ojAG0-0001f9-CO
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 22:17:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3151B821B1;
 Fri, 14 Oct 2022 02:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F463C433C1;
 Fri, 14 Oct 2022 02:16:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HKXf0efy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665713817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UozHOOqgUp4IDCtdjjfmapK2reFqiinqbzbHAugEEBM=;
 b=HKXf0efyzy+Ur5j9m9JrsBfqPq2iyabAx+4YBZbXDmdp2w9YvZnuLCRSVexWHNu/pjZdtr
 3xoTVzJiOY8UPpcnsJwynNJkXpYEmrGnqwPVZD8daq6f+V186AD8NexIIlAbYwGHhSUI51
 i9kW8O3No7qeOZb3DbvGn5dd7Erd2Mc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c594cef2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 14 Oct 2022 02:16:57 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3 0/8] rerandomize RNG seeds on reboot and handle
 record&replay
Date: Thu, 13 Oct 2022 20:16:45 -0600
Message-Id: <20221014021653.1461512-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=NTzD=2P=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the system reboots, the rng seed that QEMU passes should be
re-randomized, so that the new boot gets a new seed. This series wires
that up for FDT.

Then, since the record&replay subsystem makes use of reset as well, we
add a new reset cause for record&replay, so that we can avoid
re-randomizing in these cases.

Jason A. Donenfeld (8):
  reset: allow registering handlers that aren't called by snapshot
    loading
  x86: do not re-randomize RNG seed on snapshot load
  device-tree: add re-randomization helper function
  arm: re-randomize rng-seed on reboot
  riscv: re-randomize rng-seed on reboot
  openrisc: re-randomize rng-seed on reboot
  rx: re-randomize rng-seed on reboot
  mips: re-randomize rng-seed on reboot

 hw/arm/aspeed.c              |  4 ++--
 hw/arm/boot.c                |  2 ++
 hw/arm/mps2-tz.c             |  4 ++--
 hw/core/reset.c              | 15 ++++++++++++++-
 hw/hppa/machine.c            |  4 ++--
 hw/i386/microvm.c            |  4 ++--
 hw/i386/pc.c                 |  6 +++---
 hw/i386/x86.c                |  2 +-
 hw/mips/boston.c             |  3 +++
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
 qapi/run-state.json          |  4 +++-
 softmmu/device_tree.c        | 21 +++++++++++++++++++++
 softmmu/runstate.c           |  4 ++--
 23 files changed, 89 insertions(+), 27 deletions(-)

-- 
2.37.3


