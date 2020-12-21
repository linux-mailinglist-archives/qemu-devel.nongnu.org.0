Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67CE2DFB5B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 12:08:14 +0100 (CET)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krJ2z-0002eR-SS
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 06:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krJ1a-00029T-7Z
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:06:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:51414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krJ1X-0005Zc-Or
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 06:06:45 -0500
From: Huacai Chen <chenhuacai@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH V19 0/5] mips: Add Loongson-3 machine support
Date: Mon, 21 Dec 2020 19:05:33 +0800
Message-Id: <20201221110538.3186646-1-chenhuacai@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Loongson-3 CPU family include Loongson-3A R1/R2/R3/R4 and Loongson-3B
R1/R2. Loongson-3A R1 is the oldest and its ISA is the smallest, while
Loongson-3A R4 is the newest and its ISA is almost the superset of all
others. To reduce complexity, in QEMU we just define two CPU types:

1, "Loongson-3A1000" CPU which is corresponding to Loongson-3A R1. It is
   suitable for TCG because Loongson-3A R1 has fewest ASE.
2, "Loongson-3A4000" CPU which is corresponding to Loongson-3A R4. It is
   suitable for KVM because Loongson-3A R4 has the VZ ASE.

Loongson-3 lacks English documents. I've tried to translated them with
translate.google.com, and the machine translated documents (together
with their original Chinese versions) are available here.

Loongson-3A R1 (Loongson-3A1000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A1000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P1.pdf (Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A1000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A1000_processor_user_manual_P2.pdf (Chinese Version)

Loongson-3A R2 (Loongson-3A2000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A2000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A2000_user1.pdf (Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A2000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A2000_user2.pdf (Chinese Version)

Loongson-3A R3 (Loongson-3A3000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A3000_p1.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual1.pdf (Chinese Version)
User Manual Part 2:
http://ftp.godson.ac.cn/lemote/3A3000_p2.pdf
http://ftp.godson.ac.cn/lemote/Loongson3A3000_3B3000usermanual2.pdf (Chinese Version)

Loongson-3A R4 (Loongson-3A4000)
User Manual Part 1:
http://ftp.godson.ac.cn/lemote/3A4000_p1.pdf
http://ftp.godson.ac.cn/lemote/3A4000user.pdf (Chinese Version)
User Manual Part 2:
I'm sorry that it is unavailable now.

And human-translated documents (W.I.P) are available here now:
https://github.com/loongson-community/docs/tree/master/English-translation-of-Loongson-manual

Both KVM and TCG are available now!

We now already have a full functional Linux kernel (based on Linux-5.4.x
LTS) here:

https://github.com/chenhuacai/linux

Of course the upstream kernel is also usable (the kvm host side and
guest side have both been upstream in Linux-5.9):

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

How to use QEMU/Loongson-3?
1, Download kernel source from the above URL;
2, Build a kernel with arch/mips/configs/loongson3_{def,hpc}config;
3, Boot a Loongson-3A4000 host with this kernel (for KVM mode);
4, Build QEMU-master with this patchset;
5, modprobe kvm (only necessary for KVM mode);
6, Use QEMU with TCG:
       qemu-system-mips64el -M loongson3-virt,accel=tcg -cpu Loongson-3A1000 -kernel <path_to_kernel> -append ...
   Use QEMU with KVM:
       qemu-system-mips64el -M loongson3-virt,accel=kvm -cpu Loongson-3A4000 -kernel <path_to_kernel> -append ...

   The "-cpu" parameter is optional here and QEMU will use the correct type for TCG/KVM automatically.

V1 -> V2:
1, Add a cover letter;
2, Improve CPU definitions;
3, Remove LS7A-related things (Use GPEX instead);
4, Add a description of how to run QEMU/Loongson-3.

V2 -> V3:
1, Fix all possible checkpatch.pl errors and warnings.

V3 -> V4:
1, Sync code with upstream;
2, Remove merged patches;
3, Fix build failure without CONFIG_KVM;
4, Add Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>.

V4 -> V5:
1, Improve coding style;
2, Remove merged patches;
3, Rename machine name from "loongson3" to "loongson3-virt";
4, Rework the "loongson3-virt" machine to drop any ISA things;
5, Rework "hw/mips: Implement the kvm_type() hook in MachineClass";
6, Add Jiaxun Yang as a reviewer of Loongson-3.

V5 -> V6:
1, Fix license preamble;
2, Improve commit messages;
3, Add hw/intc/loongson_liointc.c to MAINTAINERS;
4, Fix all possible checkpatch.pl errors and warnings.

V7 and V8 have only one patch (machine definition) with some minor improvements.

V8 -> V9:
1, Update KVM type definition from kernel;
2, Fix PageMask with variable page size for TCG;
3, Add TCG support (add Loongson-EXT instructions).

V9 -> V10:
1, Split fw_cfg to a separate patch;
2, Split boot parameters definition to a local header;
3, Update MIPS machine documentation;
4, Many other improvements suggested by Philippe Mathieu-Daudé.

V10 -> V11:
1, Fix some typos;
2, Add Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>.

V11 -> V12:
1, Split boot parameter helpers to loongson3_bootp.c;
2, Support both BE and LE host (Loongson guests are always LE).

V12 -> V13:
1, Sync code with upstream;
2, Re-enable KVM support for MIPS in meson;

V13 -> V14:
1, Remove merged patches;
2, Split boot parameter helpers to a separate patch;
3, Many other improvements suggested by Philippe Mathieu-Daudé.

V14 -> V15:
1, Remove merged patches;
2, Fix malta breakage caused by variable page size;
3, Add unaligned access support for Loongson-3's TCG mode;
4, Many other improvements suggested by Philippe Mathieu-Daudé.

V15 -> V16:
1, Remove some unused code;
2, Add Reviewed-by: Richard Henderson <richard.henderson@linaro.org>.

V16 -> V17:
1, Remove merged patches;
2, Rework Loongson LIOINTC;
3, Fix update_pagemask() for MIPS R6; 
4, Add Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>.

V17 -> V18:
1, Remove merged patches;
2, Sync code with upstream;
3, Many improvements suggested by Philippe Mathieu-Daudé.

V18 -> V19:
1, Add related files to MAINTAINERS;
2, Some improvements suggested by Jiaxun Yang.

Huacai Chen and Jiaxun Yang (5):
 hw/intc: Rework Loongson LIOINTC
 hw/mips: Implement fw_cfg_arch_key_name()
 hw/mips: Add Loongson-3 boot parameter helpers
 hw/mips: Add Loongson-3 machine support
 docs/system: Update MIPS machine documentation

Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
---
 MAINTAINERS                                  |   3 +
 default-configs/devices/mips64el-softmmu.mak |   1 +
 docs/system/target-mips.rst                  |  10 +
 hw/intc/loongson_liointc.c                   |  36 +-
 hw/mips/Kconfig                              |  11 +
 hw/mips/fw_cfg.c                             |  35 ++
 hw/mips/fw_cfg.h                             |  19 +
 hw/mips/loongson3_bootp.c                    | 151 +++++++
 hw/mips/loongson3_bootp.h                    | 241 +++++++++++
 hw/mips/loongson3_virt.c                     | 621 +++++++++++++++++++++++++++
 hw/mips/meson.build                          |   3 +-
 include/hw/intc/loongson_liointc.h           |  22 +
 12 files changed, 1132 insertions(+), 21 deletions(-)
 create mode 100644 hw/mips/fw_cfg.c
 create mode 100644 hw/mips/fw_cfg.h
 create mode 100644 hw/mips/loongson3_bootp.c
 create mode 100644 hw/mips/loongson3_bootp.h
 create mode 100644 hw/mips/loongson3_virt.c
 create mode 100644 include/hw/intc/loongson_liointc.h
--
2.7.0

