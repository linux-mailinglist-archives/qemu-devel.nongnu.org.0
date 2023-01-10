Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67268663AFA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 09:28:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9gK-000112-KK; Tue, 10 Jan 2023 03:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pdel@pdel-mbp.localdomain>)
 id 1pF9fz-0000z8-LS
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:08:10 -0500
Received: from [163.114.132.7] (helo=pdel-mbp.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pdel@pdel-mbp.localdomain>) id 1pF9fw-0000Ce-Sx
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:08:06 -0500
Received: by pdel-mbp.localdomain (Postfix, from userid 501)
 id 2ECBCE17559; Tue, 10 Jan 2023 00:07:57 -0800 (PST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, philmd@linaro.org,
 wainersm@redhat.com, qemu-devel@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH v4 0/1] python/machine: Fix AF_UNIX path too long
Date: Tue, 10 Jan 2023 00:07:55 -0800
Message-Id: <20230110080756.38271-1-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 163.114.132.7 (failed)
Received-SPF: none client-ip=163.114.132.7;
 envelope-from=pdel@pdel-mbp.localdomain; helo=pdel-mbp.localdomain
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v1: https://lore.kernel.org/qemu-devel/20220705214659.73369-1-peter@pjd.dev/
v2: https://lore.kernel.org/qemu-devel/20220716173434.17183-1-peter@pjd.dev/
v3:
    - Changed QEMUMachine._name to f"{id(self):x}". Suggestion was to do
      f"{id(self):02x}", but the id's look like they are probably just the
      object address (8-byte pointer), so the "02" had no effect.
    - Changed QMP socket name suffix from "-monitor.sock" to ".qmp".
    - Changed console socket name suffix from "-console.sock" to ".con".
v4:
	- Just resending v3 after rebasing from a long time ago

I tried to run `make check-avocado` before sending again, but it looks like
there is some other issue. Probably related to the python version I have (I
have like 5 different Python versions installed on my work laptop).

Thanks,
Peter

$ make check-avocado
changing dir to build for /Library/Developer/CommandLineTools/usr/bin/make "check-avocado"...
  GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
  VENV    /Users/pdel/qemu/build/tests/venv
  VENVPIP install -e /Users/pdel/qemu/python/
  VENVPIP install -r /Users/pdel/qemu/tests/requirements.txt
  MKDIR   /Users/pdel/qemu/build/tests/results
  AVOCADO Downloading avocado tests VM image for aarch64
The image was downloaded:
Provider Version Architecture File
fedora   31      aarch64      /Users/pdel/avocado/data/cache/by_location/4f156e531446a679cbfe13caef8b7c9f9f79aafa/Fedora-C
loud-Base-31-1.9.aarch64.qcow2
  AVOCADO tests/avocado
Fetching asset from tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
Fetching asset from tests/avocado/boot_xen.py:BootXen.test_arm64_xen_411_and_dom0
Fetching asset from tests/avocado/boot_xen.py:BootXen.test_arm64_xen_414_and_dom0
Fetching asset from tests/avocado/boot_xen.py:BootXen.test_arm64_xen_415_and_dom0
Fetching asset from tests/avocado/machine_aarch64_virt.py:Aarch64VirtMachine.test_alpine_virt_tcg_gic_max
Fetching asset from tests/avocado/machine_aarch64_virt.py:Aarch64VirtMachine.test_aarch64_virt
Fetching asset from tests/avocado/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
Fetching asset from tests/avocado/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
JOB ID     : 18a949ed9150e22d6ecea69b99ede1ded17233f4
JOB LOG    : /Users/pdel/qemu/build/tests/results/job-2023-01-10T00.03-18a949e/job.log

Avocado crashed: TypeError: cannot pickle '_thread.RLock' object

Peter Delevoryas (1):
  python/machine: Fix AF_UNIX path too long on macOS

 python/qemu/machine/machine.py         | 6 +++---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.39.0


