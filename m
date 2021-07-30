Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616BE3DBBD8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:14:28 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UDT-0002JE-FB
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UCH-0001Ak-Vk
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:13:14 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UCF-0005vI-Qh
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:13:13 -0400
Received: by mail-ej1-x631.google.com with SMTP id o5so17427199ejy.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=u9J/jkmHlplZ0BrcLiictXYZ+BVFaU2YEhtoQ2pzsn0=;
 b=u7eNetBIe3NwhgvuQsj4NGU+64vBc1EXAj/dilWF0xc8WOQIsN2d8uII0ldeUCtSPj
 gTZIhvmr4ATFiyPhULbRcO0hsL6FdFVEmsyTjDU/7wcUscCoXRIWuz/k48YuhgYEhQPd
 Fj9uXEpRgy2qUiv302K4eMTnn7vVRTgrcs2YVcVON4mz0UAdh/dr9ioOLvW5DMNF06e8
 fI/T+ncEp7YJrbsWlb2i/DsVvi850iinqEXx7MlGAieDRDl2ICWy33rInxdTCnAB5Tfv
 4RxydMZa0fwe5vGodzFh438R1Bbzrxl1DrhgfeEPa4pekakdB7dk1PueDsHyxD9nhVnK
 AhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=u9J/jkmHlplZ0BrcLiictXYZ+BVFaU2YEhtoQ2pzsn0=;
 b=owq3twWY2PylJpLnIm02cxRX2gUrp5UILYAF8dWUkxoVcJPojPQ6CR9KMNeh8t0uBJ
 evUUXewHMO4wT8bZ0+QtetQ+mm5dEEXVWZHTAMuUzQeF/JLyEbT5gEi8GlMXnCY3y9Dh
 9O/TCTO5oyRDbNcZ78qqP1KGCq1DTnIdd8YpvzbwU3BFJDps51Fq2WGa458hS2TeiWpa
 synGz2DanSmF6Js5zDwQXe61ayrN6JhdmJyIMRLZRfISZBmbjscEhhPFNakQLbEDQkXo
 0/lFcZsPNLNc1k8YsdUSa5vjYpNeFZ/f0MSK//xlQeK0nxUroNJWhM/b5g4WD+PoOy9N
 lkOA==
X-Gm-Message-State: AOAM530VWa0gtmOb8ZbL/BFWqLe9f72QeZVLNM0qZkPDY5zDCUmaAAJq
 xmGOOlkVJV1Jo1NzNwa9fi+wNJoi77s7uJzrgPJTzx/F39JNag==
X-Google-Smtp-Source: ABdhPJx8jiWxPXxjlNHXcEtxpqKDuivc7cvk4nIy8Dn4jaF86Kv2Co0ZvtV4lHatk4KCg9uLxEiQoTotG/XTZQnbntM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr2947755ejy.407.1627657990306; 
 Fri, 30 Jul 2021 08:13:10 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Jul 2021 16:12:27 +0100
Message-ID: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
Subject: "make check-acceptance" takes way too long
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"make check-acceptance" takes way way too long. I just did a run
on an arm-and-aarch64-targets-only debug build and it took over
half an hour, and this despite it skipping or cancelling 26 out
of 58 tests!

I think that ~10 minutes runtime is reasonable. 30 is not;
ideally no individual test would take more than a minute or so.

Output saying where the time went. The first two tests take
more than 10 minutes *each*. I think a good start would be to find
a way of testing what they're testing that is less heavyweight.

 (01/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
PASS (629.74 s)
 (02/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
PASS (628.75 s)
 (03/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm:
CANCEL: kvm accelerator does not seem to be available (1.18 s)
 (04/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aarch64_virt:
PASS (3.53 s)
 (05/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aarch64_xlnx_versal_virt:
PASS (41.13 s)
 (06/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_virt:
PASS (5.22 s)
 (07/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2:
PASS (18.88 s)
 (08/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_uart0:
PASS (11.30 s)
 (09/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd:
PASS (22.66 s)
 (10/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_exynos4210_initrd:
PASS (31.89 s)
 (11/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_initrd:
PASS (27.86 s)
 (12/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_sata:
PASS (27.19 s)
 (13/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_quanta_gsj:
SKIP: Test might timeout
 (14/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_quanta_gsj_initrd:
PASS (22.53 s)
 (15/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
PASS (4.86 s)
 (16/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
PASS (39.85 s)
 (17/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
PASS (53.57 s)
 (18/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
SKIP: storage limited
 (19/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
SKIP: storage limited
 (20/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf:
PASS (1.50 s)
 (21/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_vexpressa9:
PASS (10.74 s)
 (22/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast2400_palmetto_openbmc_v2_9_0:
PASS (39.43 s)
 (23/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast2500_romulus_openbmc_v2_9_0:
PASS (54.01 s)
 (24/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_ast2600_debian:
PASS (40.60 s)
 (25/58) tests/acceptance/boot_xen.py:BootXen.test_arm64_xen_411_and_dom0:
PASS (20.22 s)
 (26/58) tests/acceptance/boot_xen.py:BootXen.test_arm64_xen_414_and_dom0:
PASS (17.37 s)
 (27/58) tests/acceptance/boot_xen.py:BootXen.test_arm64_xen_415_and_dom0:
PASS (23.82 s)
 (28/58) tests/acceptance/empty_cpu_model.py:EmptyCPUModel.test:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (29/58) tests/acceptance/info_usernet.py:InfoUsernet.test_hostfwd:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (30/58) tests/acceptance/machine_arm_canona1100.py:CanonA1100Machine.test_arm_canona1100:
PASS (0.20 s)
 (31/58) tests/acceptance/machine_arm_integratorcp.py:IntegratorMachine.test_integratorcp_console:
SKIP: untrusted code
 (32/58) tests/acceptance/machine_arm_integratorcp.py:IntegratorMachine.test_framebuffer_tux_logo:
SKIP: Python NumPy not installed
 (33/58) tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n800:
SKIP: untrusted code
 (34/58) tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810:
SKIP: untrusted code
 (35/58) tests/acceptance/migration.py:Migration.test_migration_with_tcp_localhost:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (36/58) tests/acceptance/migration.py:Migration.test_migration_with_unix:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (37/58) tests/acceptance/migration.py:Migration.test_migration_with_exec:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (38/58) tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_aarch64:
CANCEL: kvm accelerator does not seem to be available (0.06 s)
 (39/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt:
PASS (19.59 s)
 (40/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_virt:
PASS (28.73 s)
 (41/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_cubieboard_initrd:
PASS (52.00 s)
 (42/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_vexpressa9:
PASS (25.69 s)
 (43/58) tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt:
PASS (2.16 s)
 (44/58) tests/acceptance/smmu.py:SMMU.test_smmu_noril: CANCEL: kvm
accelerator does not seem to be available (0.90 s)
 (45/58) tests/acceptance/smmu.py:SMMU.test_smmu_noril_passthrough:
CANCEL: kvm accelerator does not seem to be available (0.70 s)
 (46/58) tests/acceptance/smmu.py:SMMU.test_smmu_noril_nostrict:
CANCEL: kvm accelerator does not seem to be available (1.02 s)
 (47/58) tests/acceptance/smmu.py:SMMU.test_smmu_ril: CANCEL: kvm
accelerator does not seem to be available (0.68 s)
 (48/58) tests/acceptance/smmu.py:SMMU.test_smmu_ril_passthrough:
CANCEL: kvm accelerator does not seem to be available (0.98 s)
 (49/58) tests/acceptance/smmu.py:SMMU.test_smmu_ril_nostrict: CANCEL:
kvm accelerator does not seem to be available (1.00 s)
 (50/58) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_insn:
PASS (12.19 s)
 (51/58) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_insn_icount:
PASS (12.35 s)
 (52/58) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_mem_icount:
PASS (10.21 s)
 (53/58) tests/acceptance/version.py:Version.test_qmp_human_info_version:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (54/58) tests/acceptance/virtio_check_params.py:VirtioMaxSegSettingsCheck.test_machine_types:
SKIP: break multi-arch CI
 (55/58) tests/acceptance/vnc.py:Vnc.test_no_vnc: CANCEL: No QEMU
binary defined or found in the build tree (0.00 s)
 (56/58) tests/acceptance/vnc.py:Vnc.test_no_vnc_change_password:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (57/58) tests/acceptance/vnc.py:Vnc.test_change_password_requires_a_password:
CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
 (58/58) tests/acceptance/vnc.py:Vnc.test_change_password: CANCEL: No
QEMU binary defined or found in the build tree (0.00 s)
RESULTS    : PASS 32 | ERROR 0 | FAIL 0 | SKIP 8 | WARN 0 | INTERRUPT
0 | CANCEL 18
JOB TIME   : 1967.44 s

thanks
-- PMM

