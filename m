Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A98446511
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:36:49 +0100 (CET)
Received: from localhost ([::1]:53508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0Kl-0004s4-VI
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0IR-0002UI-Bj
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0IO-0006Rs-6d
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:22 -0400
Received: by mail-wr1-x431.google.com with SMTP id u1so14030348wru.13
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zN/UykyrlnCTmhU0qGRmezqaSHTsWtjZojq/qlAJTKU=;
 b=f2/52HYq5n4Cp2PcfodNFTzqYmGxtm3dOCoMtRIOMA5+q7UzWBIe94BCKk9cxsRa2V
 DiUGcu4eLcH2iHs4nN7VXO9sLY9towqyOLbPPcpdhxpwQCr3XYMIwNywptWqark1k4pJ
 OuNJXPhc9X68ReD8hqvw9U0PNntOjih9g8vUbAD29FhsEpxGpW83X+NYVevlVUSOa+oE
 tPbf9MSMdkjn36un03+SUKUfwJ4Of4Ac+HIcilyPB6v8Nzf8M2Z9uc+RXN3dRHnd7LBS
 pyRf7eO3FC3xr+LESqOmmCkct8lxcjbgXKY5cbGcueERrw5dJCiSvFhjTN+U+Ip0vKLc
 JqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zN/UykyrlnCTmhU0qGRmezqaSHTsWtjZojq/qlAJTKU=;
 b=hXh+9NK4l6NG8o2Ke0Nh3JTxoSo+EYxUNDcaqy4m0oUaGEQZEF0mVFTcmCrQ1i2za2
 H7Xtej4vf1EOacODaRzdcRPUHZ300ClkzCJAeucPKEjaawh5pHAX+7cBNgw7TidRUHUn
 orjg3gsbdBFXy5utbh/TdPtBTNX0ZUN2dhZVnMhy1efnwb2AfR2P5Z3W899RL6RDlb+H
 37aPLZvTA9LkgvCDIJzuyOfhSKZw97vSv8ccKgc7ghjpgWaLa+ti507H6C7oXZefA/j9
 Tds2oB1YmyYIufwCQtrNCJmnCCi5gVY/ipW7kfS3gYVIF6L4y2WL+c4BLBnxm53Y8oz1
 bBeA==
X-Gm-Message-State: AOAM5303F90ahymOS/SQrMcSJaQiK4GR+Aq9/SUN0gfymj5frClz3lwd
 9RVybCL5RXYQFrpCE6YPVNz+LDJ62Qo=
X-Google-Smtp-Source: ABdhPJyhOGQ8A1PDAyJYr1aT5EeN2I8RaClN1z1apgBpFb5BbFABVLhXSDeEyE+GnfYEOgqjeVr/wg==
X-Received: by 2002:a5d:5144:: with SMTP id u4mr66756830wrt.91.1636122858445; 
 Fri, 05 Nov 2021 07:34:18 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm1365960wri.74.2021.11.05.07.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:34:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/6] tests/acceptance: Add bFLT loader linux-user test
Date: Fri,  5 Nov 2021 15:34:10 +0100
Message-Id: <20211105143416.148332-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v5:=0D
- rebased on Willian's "rename tests acceptance to tests avocado" [*]=0D
=0D
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
[*] https://lore.kernel.org/qemu-devel/20211103211404.79953-2-willianr@redh=
at.com/=0D
Based-on: <20211103211404.79953-2-willianr@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  tests/acceptance: Extract QemuBaseTest from Test=0D
  tests/acceptance: Make pick_default_qemu_bin() more generic=0D
  tests/acceptance: Introduce QemuUserTest base class=0D
  tests/acceptance: Share useful helpers from virtiofs_submounts test=0D
  tests/acceptance: Add bFLT loader linux-user test=0D
  tests/acceptance: Rename avocado_qemu.Test -> QemuSystemTest=0D
=0D
 docs/devel/testing.rst                    |   8 +-=0D
 tests/avocado/avocado_qemu/__init__.py    | 161 ++++++++++++++++------=0D
 tests/avocado/boot_linux_console.py       |   4 +-=0D
 tests/avocado/cpu_queries.py              |   4 +-=0D
 tests/avocado/empty_cpu_model.py          |   4 +-=0D
 tests/avocado/info_usernet.py             |   4 +-=0D
 tests/avocado/linux_initrd.py             |   4 +-=0D
 tests/avocado/linux_ssh_mips_malta.py     |   5 +-=0D
 tests/avocado/load_bflt.py                |  54 ++++++++=0D
 tests/avocado/machine_arm_canona1100.py   |   4 +-=0D
 tests/avocado/machine_arm_integratorcp.py |   4 +-=0D
 tests/avocado/machine_arm_n8x0.py         |   4 +-=0D
 tests/avocado/machine_avr6.py             |   4 +-=0D
 tests/avocado/machine_m68k_nextcube.py    |   4 +-=0D
 tests/avocado/machine_microblaze.py       |   4 +-=0D
 tests/avocado/machine_mips_fuloong2e.py   |   4 +-=0D
 tests/avocado/machine_mips_loongson3v.py  |   4 +-=0D
 tests/avocado/machine_mips_malta.py       |   4 +-=0D
 tests/avocado/machine_rx_gdbsim.py        |   4 +-=0D
 tests/avocado/machine_s390_ccw_virtio.py  |   4 +-=0D
 tests/avocado/machine_sparc_leon3.py      |   4 +-=0D
 tests/avocado/migration.py                |   4 +-=0D
 tests/avocado/multiprocess.py             |   4 +-=0D
 tests/avocado/pc_cpu_hotplug_props.py     |   4 +-=0D
 tests/avocado/ppc_405.py                  |   4 +-=0D
 tests/avocado/ppc_bamboo.py               |   4 +-=0D
 tests/avocado/ppc_mpc8544ds.py            |   4 +-=0D
 tests/avocado/ppc_prep_40p.py             |   4 +-=0D
 tests/avocado/ppc_pseries.py              |   4 +-=0D
 tests/avocado/ppc_virtex_ml507.py         |   4 +-=0D
 tests/avocado/version.py                  |   4 +-=0D
 tests/avocado/virtio-gpu.py               |   4 +-=0D
 tests/avocado/virtio_check_params.py      |   4 +-=0D
 tests/avocado/virtio_version.py           |   4 +-=0D
 tests/avocado/virtiofs_submounts.py       |  59 +-------=0D
 tests/avocado/vnc.py                      |   4 +-=0D
 tests/avocado/x86_cpu_model_versions.py   |   4 +-=0D
 37 files changed, 248 insertions(+), 167 deletions(-)=0D
 create mode 100644 tests/avocado/load_bflt.py=0D
=0D
-- =0D
2.31.1=0D
=0D

