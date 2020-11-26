Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F9C2C5DA4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 22:51:57 +0100 (CET)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPBD-00038h-VE
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 16:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9j-0001jL-Vj; Thu, 26 Nov 2020 16:50:24 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60506
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9h-0005jj-W3; Thu, 26 Nov 2020 16:50:23 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id 224CE390015A;
 Thu, 26 Nov 2020 22:50:18 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] hvf: Implement Apple Silicon Support
Date: Thu, 26 Nov 2020 22:50:09 +0100
Message-Id: <20201126215017.41156-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that Apple Silicon is widely available, people are obviously excited
to try and run virtualized workloads on them, such as Linux and Windows.

This patch set implements a rudimentary, first version to get the ball
going on that. With this applied, I can successfully run both Linux and
Windows as guests, albeit with a few caveats:

  * no WFI emulation, a vCPU always uses 100%
  * vtimer handling is a bit hacky
  * we handle most sysregs flying blindly, just returning 0
  * XHCI breaks in OVMF, works in Linux+Windows

Despite those drawbacks, it's still an exciting place to start playing
with the power of Apple Silicon.

Enjoy!

Alex

Alexander Graf (8):
  hvf: Add hypervisor entitlement to output binaries
  hvf: Move common code out
  arm: Set PSCI to 0.2 for HVF
  arm: Synchronize CPU on PSCI on
  hvf: Add Apple Silicon support
  hvf: Use OS provided vcpu kick function
  arm: Add Hypervisor.framework build target
  hw/arm/virt: Disable highmem when on hypervisor.framework

 MAINTAINERS                  |  14 +-
 accel/hvf/entitlements.plist |   8 +
 accel/hvf/hvf-all.c          |  56 ++++
 accel/hvf/hvf-cpus.c         | 484 +++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build        |   7 +
 accel/meson.build            |   1 +
 hw/arm/virt.c                |   9 +
 include/hw/core/cpu.h        |   3 +-
 include/sysemu/hvf_int.h     |  69 +++++
 meson.build                  |  39 ++-
 scripts/entitlement.sh       |  11 +
 target/arm/arm-powerctl.c    |   3 +
 target/arm/cpu.c             |   4 +
 target/arm/hvf/hvf.c         | 345 +++++++++++++++++++++++++
 target/arm/hvf/meson.build   |   3 +
 target/arm/meson.build       |   2 +
 target/i386/hvf/hvf-cpus.c   | 131 ----------
 target/i386/hvf/hvf-cpus.h   |  25 --
 target/i386/hvf/hvf-i386.h   |  48 +---
 target/i386/hvf/hvf.c        | 360 +-------------------------
 target/i386/hvf/meson.build  |   1 -
 target/i386/hvf/x86hvf.c     |  11 +-
 target/i386/hvf/x86hvf.h     |   2 -
 23 files changed, 1061 insertions(+), 575 deletions(-)
 create mode 100644 accel/hvf/entitlements.plist
 create mode 100644 accel/hvf/hvf-all.c
 create mode 100644 accel/hvf/hvf-cpus.c
 create mode 100644 accel/hvf/meson.build
 create mode 100644 include/sysemu/hvf_int.h
 create mode 100755 scripts/entitlement.sh
 create mode 100644 target/arm/hvf/hvf.c
 create mode 100644 target/arm/hvf/meson.build
 delete mode 100644 target/i386/hvf/hvf-cpus.c
 delete mode 100644 target/i386/hvf/hvf-cpus.h

-- 
2.24.3 (Apple Git-128)


