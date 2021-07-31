Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F533DC7C1
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 20:45:07 +0200 (CEST)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9tym-0004Ys-SS
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 14:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m9txb-0003sp-K7
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 14:43:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m9txZ-0002fb-CX
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 14:43:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so8509304wmb.5
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 11:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3oqaGgVERfT8adkQP817tF15p83b0ST8muO0/4MdSHs=;
 b=EJSGPxoOPApTy5VzHOSgKOZxQwc7ByZND+NZCJOu6lBerzNUq24DGEi+U4Eo1mUcR6
 Q/Go1Sfxie+TTSfBocXFv/EFozcArIZg5lmtSb6UrY0mIvPQ9YmkqhIAMh7ZVM+8Y4LM
 t9NvB1XXkxqJ7IHYxZ8nEjrvMkipui4fA6jxWy47Zalya3KbgdE8dTCQDNJNOU9clw9A
 XfG65cJtyGaV+W4Fkct4Kqi0jNXGFacboubXMD8RgpdNQ4Kh9j65yuc7IZZgszf7YEZx
 SAsrD79RP1L7gorQAC9e2EzKpG7KwfEV9F38i3k9ku1GMCgW/qUNIVHKAlw4ZK49mMPG
 44CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3oqaGgVERfT8adkQP817tF15p83b0ST8muO0/4MdSHs=;
 b=hsatzJwmo9uiMQPoN7ZQAxI3XPvRruQvhIZUC8xAQSQmCQIxzh0KO5zRYXjt5Po7cg
 3NmwqI04OQwgw+GBG0cuBt+4o8NH2MZAGmlhfZ9T5lNywYwJ1zmWqp9eP+S21Ry8moUZ
 DWK7Kd48lDq2Ky4sari/UhM1I+LiuS/Z21tNEnEfPG0MLW5XS0xBR1Kh2tLNJXgcjOiX
 euBfqJmzc9BDFs4aUoSEsXdT9fHVJ6wXuHBNeg9Ai1N3I5Sy1bp9Enx8+vJGaLTFP1Vp
 4k8RjJ/FT6ucIJVAjs/MZ+LjyCUTeX51gGVUSBeTfzi/nSalcD+GOz+ozEPzFOGRwROP
 BMXQ==
X-Gm-Message-State: AOAM5331UtUDP4nfmDcEvJbD6Z+vryrRAQDjUJz73DgeWCSfuOJSuprf
 wCs2DQqQvQxw2zaw4dGdwPKezQ==
X-Google-Smtp-Source: ABdhPJwohyAjppCsN+90EOwslvD7tbps8rXFtW+4U6Ev/icXJYt5BW5WG5utKS2p1pVXjTEK4yXcxw==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr9088124wmk.89.1627757017449;
 Sat, 31 Jul 2021 11:43:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm5423803wmj.8.2021.07.31.11.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 11:43:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F8611FF96;
 Sat, 31 Jul 2021 19:43:18 +0100 (BST)
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: "make check-acceptance" takes way too long
Date: Sat, 31 Jul 2021 19:41:03 +0100
In-reply-to: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
Message-ID: <87sfzuwchl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> "make check-acceptance" takes way way too long. I just did a run
> on an arm-and-aarch64-targets-only debug build and it took over
> half an hour, and this despite it skipping or cancelling 26 out
> of 58 tests!
>
> I think that ~10 minutes runtime is reasonable. 30 is not;
> ideally no individual test would take more than a minute or so.
>
> Output saying where the time went. The first two tests take
> more than 10 minutes *each*. I think a good start would be to find
> a way of testing what they're testing that is less heavyweight.
>
>  (01/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gi=
cv2:
> PASS (629.74 s)
>  (02/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gi=
cv3:
> PASS (628.75 s)
>  (03/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm:
> CANCEL: kvm accelerator does not seem to be available (1.18 s)

For these tests which purport to exercise the various GIC configurations
I think we would be much better served by running kvm-unit-tests which
at least try and exercise all the features rather than rely on the side
effect of booting an entire OS.

>  (04/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aar=
ch64_virt:
> PASS (3.53 s)
>  (05/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aar=
ch64_xlnx_versal_virt:
> PASS (41.13 s)
>  (06/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_virt:
> PASS (5.22 s)
>  (07/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_emcraft_sf2:
> PASS (18.88 s)
>  (08/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_raspi2_uart0:
> PASS (11.30 s)
>  (09/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_raspi2_initrd:
> PASS (22.66 s)
>  (10/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_exynos4210_initrd:
> PASS (31.89 s)
>  (11/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_cubieboard_initrd:
> PASS (27.86 s)
>  (12/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_cubieboard_sata:
> PASS (27.19 s)
>  (13/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_quanta_gsj:
> SKIP: Test might timeout
>  (14/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_quanta_gsj_initrd:
> PASS (22.53 s)
>  (15/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_orangepi:
> PASS (4.86 s)
>  (16/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_orangepi_initrd:
> PASS (39.85 s)
>  (17/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_orangepi_sd:
> PASS (53.57 s)
>  (18/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_orangepi_bionic_20_08:
> SKIP: storage limited
>  (19/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_orangepi_uboot_netbsd9:
> SKIP: storage limited
>  (20/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aar=
ch64_raspi3_atf:
> PASS (1.50 s)
>  (21/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_vexpressa9:
> PASS (10.74 s)
>  (22/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_ast2400_palmetto_openbmc_v2_9_0:
> PASS (39.43 s)
>  (23/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_ast2500_romulus_openbmc_v2_9_0:
> PASS (54.01 s)
>  (24/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm=
_ast2600_debian:
> PASS (40.60 s)
>  (25/58) tests/acceptance/boot_xen.py:BootXen.test_arm64_xen_411_and_dom0:
> PASS (20.22 s)
>  (26/58) tests/acceptance/boot_xen.py:BootXen.test_arm64_xen_414_and_dom0:
> PASS (17.37 s)
>  (27/58) tests/acceptance/boot_xen.py:BootXen.test_arm64_xen_415_and_dom0:
> PASS (23.82 s)
>  (28/58) tests/acceptance/empty_cpu_model.py:EmptyCPUModel.test:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (29/58) tests/acceptance/info_usernet.py:InfoUsernet.test_hostfwd:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (30/58) tests/acceptance/machine_arm_canona1100.py:CanonA1100Machine.tes=
t_arm_canona1100:
> PASS (0.20 s)
>  (31/58) tests/acceptance/machine_arm_integratorcp.py:IntegratorMachine.t=
est_integratorcp_console:
> SKIP: untrusted code
>  (32/58) tests/acceptance/machine_arm_integratorcp.py:IntegratorMachine.t=
est_framebuffer_tux_logo:
> SKIP: Python NumPy not installed
>  (33/58) tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n800:
> SKIP: untrusted code
>  (34/58) tests/acceptance/machine_arm_n8x0.py:N8x0Machine.test_n810:
> SKIP: untrusted code
>  (35/58) tests/acceptance/migration.py:Migration.test_migration_with_tcp_=
localhost:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (36/58) tests/acceptance/migration.py:Migration.test_migration_with_unix:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (37/58) tests/acceptance/migration.py:Migration.test_migration_with_exec:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (38/58) tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_=
aarch64:
> CANCEL: kvm accelerator does not seem to be available (0.06 s)
>  (39/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch6=
4_virt:
> PASS (19.59 s)
>  (40/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_vi=
rt:
> PASS (28.73 s)
>  (41/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_cu=
bieboard_initrd:
> PASS (52.00 s)
>  (42/58) tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_ve=
xpressa9:
> PASS (25.69 s)
>  (43/58) tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.t=
est_aarch64_virt:
> PASS (2.16 s)
>  (44/58) tests/acceptance/smmu.py:SMMU.test_smmu_noril: CANCEL: kvm
> accelerator does not seem to be available (0.90 s)
>  (45/58) tests/acceptance/smmu.py:SMMU.test_smmu_noril_passthrough:
> CANCEL: kvm accelerator does not seem to be available (0.70 s)
>  (46/58) tests/acceptance/smmu.py:SMMU.test_smmu_noril_nostrict:
> CANCEL: kvm accelerator does not seem to be available (1.02 s)
>  (47/58) tests/acceptance/smmu.py:SMMU.test_smmu_ril: CANCEL: kvm
> accelerator does not seem to be available (0.68 s)
>  (48/58) tests/acceptance/smmu.py:SMMU.test_smmu_ril_passthrough:
> CANCEL: kvm accelerator does not seem to be available (0.98 s)
>  (49/58) tests/acceptance/smmu.py:SMMU.test_smmu_ril_nostrict: CANCEL:
> kvm accelerator does not seem to be available (1.00 s)
>  (50/58) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_=
virt_insn:
> PASS (12.19 s)
>  (51/58) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_=
virt_insn_icount:
> PASS (12.35 s)
>  (52/58) tests/acceptance/tcg_plugins.py:PluginKernelNormal.test_aarch64_=
virt_mem_icount:
> PASS (10.21 s)
>  (53/58) tests/acceptance/version.py:Version.test_qmp_human_info_version:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (54/58) tests/acceptance/virtio_check_params.py:VirtioMaxSegSettingsChec=
k.test_machine_types:
> SKIP: break multi-arch CI
>  (55/58) tests/acceptance/vnc.py:Vnc.test_no_vnc: CANCEL: No QEMU
> binary defined or found in the build tree (0.00 s)
>  (56/58) tests/acceptance/vnc.py:Vnc.test_no_vnc_change_password:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (57/58) tests/acceptance/vnc.py:Vnc.test_change_password_requires_a_pass=
word:
> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>  (58/58) tests/acceptance/vnc.py:Vnc.test_change_password: CANCEL: No
> QEMU binary defined or found in the build tree (0.00 s)
> RESULTS    : PASS 32 | ERROR 0 | FAIL 0 | SKIP 8 | WARN 0 | INTERRUPT
> 0 | CANCEL 18
> JOB TIME   : 1967.44 s
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

