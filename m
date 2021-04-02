Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B6353060
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 22:44:30 +0200 (CEST)
Received: from localhost ([::1]:34604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSQeb-0002Rh-94
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 16:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lSQMd-0003oR-EP
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 16:25:55 -0400
Received: from 13thmonkey.org ([80.100.255.32]:59796
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lSQMa-000553-0F
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 16:25:55 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 35728C139C5; Fri,  2 Apr 2021 22:25:49 +0200 (CEST)
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/4] Implements the NetBSD Virtual Machine Monitor
 accelerator
Date: Fri,  2 Apr 2021 22:25:31 +0200
Message-Id: <20210402202535.11550-1-reinoud@NetBSD.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NetBSD team has implemented its new hypervisor called NVMM. It has been
included since NetBSD 9.0 and has been in use now for quite some time. NVMM
adds user-mode capabilities to create and manage virtual machines, configure
memory mappings for guest machines, and create and control execution of
virtual processors.

With this new API we are now able to bring our hypervisor to the QEMU
community! The following patches implement the NetBSD Virtual Machine Monitor
accelerator (NVMM) for QEMU on NetBSD 9.0 and newer hosts.

When compiling QEMU for x86_64 it will autodetect nvmm and will compile the
accelerator for use if found. At runtime using the '-accel nvmm' should see a
significant performance improvement over emulation, much like when using 'hax'
on NetBSD.

The documentation for this new API is visible at https://man.netbsd.org under
the libnvmm(3) and nvmm(4) pages.

NVMM was designed and implemented by Maxime Villard <max@m00nbsd.net>

Thank you for your feedback.

Refrences:
https://m00nbsd.net/4e0798b7f2620c965d0dd9d6a7a2f296.html


Test plan:

1. Download a NetBSD 9.1 release:
http://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/amd64/installation/cdrom/boot.iso

2. Install it natively on a not too old x86_64 hardware (Intel or AMD).

There is no support for nested virtualization in NVMM.

3. Setup the system.

 export PKG_PATH=http://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/amd64/9.0/All/
 pkg_add git gmake python37 glib2 bison pkgconf pixman
 
Install mozilla-rootcerts and follow post-install instructions.

 pkg_add mozilla-rootcerts

More information: https://wiki.qemu.org/Hosts/BSD#NetBSD

4. Build qemu

 mkdir build
 cd build
 ../configure --python=python3.7
 gmake
 gmake check

5. Test

 qemu -accel nvmm ...

History:
v6 -> v7:
 - Remove small patches from pkgsrc that krept in
 - Enhance the possible race on exit fix
 - update the build system to only link the nvmm library for targets that
   support NVMM
v5 -> v6:
 - Ported to updated Qemu 6.0 build system, reshuffeling and refactoring
 - Improved auto detection
 - Added support for improved NVMM interface fixing feedback on the use of
   signals
v4 -> v5:
 - Mainly cosmetic
 - Automatic detection
v3 -> v4:
 - Correct build warning by adding a missing include
 - Do not set R8-R16 registers unless TARGET_X86_64
v2 -> v3:
 - Register nvmm in targetos NetBSD check
 - Stop including hw/boards.h
 - Rephrase old code comments (remove XXX)
v1 -> v2:
 - Included the testing plan as requested by Philippe Mathieu-Daude
 - Formatting nit fix in qemu-options.hx
 - Document NVMM in the accel section of qemu-options.hx


Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>
Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>


Reinoud Zandijk (4):
  Add NVMM accelerator: configure and build logic
  Add NVMM accelerator: x86 CPU support
  Add NVMM accelerator: acceleration enlightenments
  Add NVMM Accelerator: add maintainers for NetBSD/NVMM

 MAINTAINERS                       |   11 +
 accel/Kconfig                     |    3 +
 configure                         |    8 +-
 include/sysemu/hw_accel.h         |    1 +
 include/sysemu/nvmm.h             |   26 +
 meson.build                       |   14 +
 meson_options.txt                 |    2 +
 qemu-options.hx                   |    8 +-
 target/i386/helper.c              |    2 +-
 target/i386/meson.build           |    1 +
 target/i386/nvmm/meson.build      |   10 +
 target/i386/nvmm/nvmm-accel-ops.c |  111 +++
 target/i386/nvmm/nvmm-accel-ops.h |   24 +
 target/i386/nvmm/nvmm-all.c       | 1226 +++++++++++++++++++++++++++++
 14 files changed, 1441 insertions(+), 6 deletions(-)
 create mode 100644 include/sysemu/nvmm.h
 create mode 100644 target/i386/nvmm/meson.build
 create mode 100644 target/i386/nvmm/nvmm-accel-ops.c
 create mode 100644 target/i386/nvmm/nvmm-accel-ops.h
 create mode 100644 target/i386/nvmm/nvmm-all.c

-- 
2.29.2


