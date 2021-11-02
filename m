Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0043C4429C5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:45:15 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpPv-00021C-4l
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNO-00067j-0o
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNM-0007Us-5S
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id s13so24874635wrb.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dm3GqT3SJZPWPjw3h3+2ovZPrJeMfeOd8aivOZrdKOs=;
 b=Xy95j9MxeIxADm3/il6AsDwW3hX4lk/GjqHKzpm9KNAny8c3XJNOvX7wRCXdWOwiBP
 K3Tu8inbsDkfOPzBWYBU8fTXl3jc1Bg6uVQGK/FC+JlxfSsm5+aLiBTPHwLLo8uN0LIv
 Z+8gAc+A8rgoyxtxGNBGU6aAYVUPVBNkGZTvlwWwC3FkzmpSevNB5aoSR8NAdEgbkaBg
 084S7tFXhHUChkIk1gbJd+tZIowaIEsnQ5bmPOtj7WUUReJs2GY3eazSxBipNlehzkPQ
 DVKh4lV0i9lzy1dXbJrPYLs8itT6KPvwzvoKE7WOafjpeBxcbCcm/bxTUGsCC8mU35T7
 2uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Dm3GqT3SJZPWPjw3h3+2ovZPrJeMfeOd8aivOZrdKOs=;
 b=Igds1Q/wWGOrffL6YZk4FJ4giybj2xsUBPFhpmwHe3qqOozo8hZjg12NSoSXphvS+s
 OG4Nn/JPQgn16xu8GTvMPrj5DnlzW3IAejZ9ixzNhTL/5dG75FQQZOfqshnQ9znQDPIC
 KNtEebRUtdWaskUkCfFvKOcDn8maY7CDkXl5T4rzQknQXzvdEkgucfbOa3zS1ar1sNTu
 qKvmD+lUMLY9+Ts21MEMOs/GF23gMTWButAz8DxtidWtj8AcVLhL7TxNTZqZAJ0WLJOz
 Htbfijxr92RePW0tvoGG4gBjz/4othnFAQq7FVJYe7ydWa05w7dBbJtYs1oVeBPAs5VE
 aNhQ==
X-Gm-Message-State: AOAM530zbs+q1Rdmq4OJm4mIkfhPmUCSjziXweXJmwNT22Z24GVpbVw+
 rVa80c4dadceFi/YDOzL/HOy+CwCgWc=
X-Google-Smtp-Source: ABdhPJyv30tH3/nPkLz8EgtdLCYZyhiSeurTQnsmxMAKrqskted6DhhXgPWhYDZTsrRzndNPFTMN7g==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr20124195wru.388.1635842554470; 
 Tue, 02 Nov 2021 01:42:34 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i3sm2154514wmq.18.2021.11.02.01.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 01:42:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] tests/acceptance: Add bFLT loader linux-user test
Date: Tue,  2 Nov 2021 09:42:26 +0100
Message-Id: <20211102084232.2965062-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v4:=0D
- rebased=0D
- addressed Willian review comments=0D
=0D
Since v3:=0D
- rebased=0D
- addressed Wainer review comments from v2=0D
- rename avocado_qemu.Test -> QemuSystemTest=0D
=0D
Since v2:=0D
- rebased tests/acceptance/avocado_qemu/__init__.py patches=0D
- extract has_cmd() from virtiofs_submounts.py=0D
- check cpio availability with has_cmd()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  tests/acceptance: Extract QemuBaseTest from Test=0D
  tests/acceptance: Make pick_default_qemu_bin() more generic=0D
  tests/acceptance: Introduce QemuUserTest base class=0D
  tests/acceptance: Share useful helpers from virtiofs_submounts test=0D
  tests/acceptance: Add bFLT loader linux-user test=0D
  tests/acceptance: Rename avocado_qemu.Test -> QemuSystemTest=0D
=0D
 docs/devel/testing.rst                       |   8 +-=0D
 tests/acceptance/avocado_qemu/__init__.py    | 161 ++++++++++++++-----=0D
 tests/acceptance/boot_linux_console.py       |   4 +-=0D
 tests/acceptance/cpu_queries.py              |   4 +-=0D
 tests/acceptance/empty_cpu_model.py          |   4 +-=0D
 tests/acceptance/info_usernet.py             |   4 +-=0D
 tests/acceptance/linux_initrd.py             |   4 +-=0D
 tests/acceptance/linux_ssh_mips_malta.py     |   5 +-=0D
 tests/acceptance/load_bflt.py                |  54 +++++++=0D
 tests/acceptance/machine_arm_canona1100.py   |   4 +-=0D
 tests/acceptance/machine_arm_integratorcp.py |   4 +-=0D
 tests/acceptance/machine_arm_n8x0.py         |   4 +-=0D
 tests/acceptance/machine_avr6.py             |   4 +-=0D
 tests/acceptance/machine_m68k_nextcube.py    |   4 +-=0D
 tests/acceptance/machine_microblaze.py       |   4 +-=0D
 tests/acceptance/machine_mips_fuloong2e.py   |   4 +-=0D
 tests/acceptance/machine_mips_loongson3v.py  |   4 +-=0D
 tests/acceptance/machine_mips_malta.py       |   4 +-=0D
 tests/acceptance/machine_rx_gdbsim.py        |   4 +-=0D
 tests/acceptance/machine_s390_ccw_virtio.py  |   4 +-=0D
 tests/acceptance/machine_sparc_leon3.py      |   4 +-=0D
 tests/acceptance/migration.py                |   4 +-=0D
 tests/acceptance/multiprocess.py             |   4 +-=0D
 tests/acceptance/pc_cpu_hotplug_props.py     |   4 +-=0D
 tests/acceptance/ppc_405.py                  |   4 +-=0D
 tests/acceptance/ppc_bamboo.py               |   4 +-=0D
 tests/acceptance/ppc_mpc8544ds.py            |   4 +-=0D
 tests/acceptance/ppc_prep_40p.py             |   4 +-=0D
 tests/acceptance/ppc_pseries.py              |   4 +-=0D
 tests/acceptance/ppc_virtex_ml507.py         |   4 +-=0D
 tests/acceptance/version.py                  |   4 +-=0D
 tests/acceptance/virtio-gpu.py               |   4 +-=0D
 tests/acceptance/virtio_check_params.py      |   4 +-=0D
 tests/acceptance/virtio_version.py           |   4 +-=0D
 tests/acceptance/virtiofs_submounts.py       |  59 +------=0D
 tests/acceptance/vnc.py                      |   4 +-=0D
 tests/acceptance/x86_cpu_model_versions.py   |   4 +-=0D
 37 files changed, 248 insertions(+), 167 deletions(-)=0D
 create mode 100644 tests/acceptance/load_bflt.py=0D
=0D
-- =0D
2.31.1=0D
=0D

