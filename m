Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164DB5256E8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 23:15:25 +0200 (CEST)
Received: from localhost ([::1]:43614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npG9b-0003vS-UL
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 17:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npG8c-0003GV-6C
 for qemu-devel@nongnu.org; Thu, 12 May 2022 17:14:22 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:40504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npG8a-00007B-1E
 for qemu-devel@nongnu.org; Thu, 12 May 2022 17:14:21 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id p3so5335353qvi.7
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Ulq/CIkdIADvDMPX0L/pnSCwpMK/R9UKPI9hb7z50Vc=;
 b=ehW7+QCa4kY0Hz6cRrKdL/9JyUieYB20LVR/awGoJFZm6o6goJ0phqa4Q2jr2jw8fI
 nQSsAPC0i1oP6X+kz2Oawwnx6XDu85/+fm3F6uKAt13dKUkPTWX2gl4WasVq73a1cC0l
 4FGwWfMXzs7h3tTTwIxU0hhCUPMoRvmTk4YHCVh1tvT5g0GkTjmvH4CtBm1BLje2UC9G
 OmP+HL7yD3BCRiFRgBgXnxWm4iOXWDcP2BRXF3nhNgEzKtNCnRAavf9krHQt2P9Vtpvf
 8EEe8uKpa+EDjlIoCTYs1kvbI/Tv40xWGrnSi08m1hVHETCShegMBfcG7o9T8cEdCbFm
 uxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ulq/CIkdIADvDMPX0L/pnSCwpMK/R9UKPI9hb7z50Vc=;
 b=yV58fWYa0wG+C4ntQ4p8pNDkq9qCCq10ZqnSedsjExZrG3+B8Pyt9rQnIw2/zlBgxx
 TMSKi+Pntx+H++eMCXyRVwS1VU5lTlF1HsFSF5X4L5L+LutBJFUZ31JpHnOifAxX40Vs
 yl1BV1L9kJHXg/oCo1BDsgRs486FpN8FeIDunqwV6CSOss76RRSHU29sQrVKWOzFmvUk
 is7X8jkIdvY0sGGUwYslMW4eZf0s3kdrsLbm3R8QctsqOSaL99AVKl5SctTnAcSdB+zF
 hIYk1vf7u8KyHVVp+ytOicNjBIndipYwQcbPT/R0jttd8ZqHucCdhh9k4RJJm9lUmC9N
 jwcQ==
X-Gm-Message-State: AOAM530p85toTeCQOXTery7hycxSIvf1rzbSJHPNQ4DXTCpZWROB+fhA
 zpGOktw9UOJqC4KEDwnX4boj7Q==
X-Google-Smtp-Source: ABdhPJwc7MOLDiVC6PEfEk+KiBQRg4KHS/a110AQEyt+6DLU1bxoh61NVHNeJJ2MjDyTjOjNkUGsRA==
X-Received: by 2002:ad4:458e:0:b0:456:3a36:13df with SMTP id
 x14-20020ad4458e000000b004563a3613dfmr1830390qvu.123.1652390058975; 
 Thu, 12 May 2022 14:14:18 -0700 (PDT)
Received: from ?IPV6:2607:fb90:2824:aae:bf4a:55ec:36c:afd1?
 ([2607:fb90:2824:aae:bf4a:55ec:36c:afd1])
 by smtp.gmail.com with ESMTPSA id
 a66-20020a37b145000000b0069fc13ce231sm316387qkf.98.2022.05.12.14.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 14:14:18 -0700 (PDT)
Message-ID: <f39c76f0-8018-2775-be9a-8302ddfeb624@linaro.org>
Date: Thu, 12 May 2022 14:14:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/27] Misc patches for 2022-05-12
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220512172505.1065394-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/12/22 10:24, Paolo Bonzini wrote:
> The following changes since commit ec11dc41eec5142b4776db1296972c6323ba5847:
> 
>    Merge tag 'pull-misc-2022-05-11' of git://repo.or.cz/qemu/armbru into staging (2022-05-11 09:00:26 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 333dbac358acc6cc174029263d633a22f66584b4:
> 
>    vmxcap: add tertiary execution controls (2022-05-12 14:23:19 +0200)
> 
> ----------------------------------------------------------------
> * small cleanups for pc-bios/optionrom Makefiles
> * checkpatch: fix g_malloc check
> * fix mremap() and RDMA detection
> * confine igd-passthrough-isa-bridge to Xen-enabled builds
> * cover PCI in arm-virt machine qtests
> * add -M boot and -M mem compound properties
> * bump SLIRP submodule
> * support CFI with system libslirp (>= 4.7)
> * clean up CoQueue wakeup functions
> * fix vhost-vsock regression
> * fix --disable-vnc compilation
> * other minor bugfixes

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Bernhard Beschow (2):
>        hw/xen/xen_pt: Confine igd-passthrough-isa-bridge to XEN
>        hw/xen/xen_pt: Resolve igd_passthrough_isa_bridge_create() indirection
> 
> Eric Auger (3):
>        tests/qtest/libqos/pci: Introduce pio_limit
>        tests/qtest/libqos: Skip hotplug tests if pci root bus is not hotpluggable
>        tests/qtest/libqos: Add generic pci host bridge in arm-virt machine
> 
> Juan Quintela (1):
>        meson: Make mremap() detecting works correctly
> 
> Kshitij Suri (1):
>        meson: link libpng independent of vnc
> 
> Paolo Bonzini (20):
>        pc-bios/optionrom: detect -fno-pie
>        pc-bios/optionrom: compile with -Wno-array-bounds
>        target/i386: do not consult nonexistent host leaves
>        checkpatch: fix g_malloc check
>        machine: use QAPI struct for boot configuration
>        machine: add boot compound property
>        machine: add mem compound property
>        machine: make memory-backend a link property
>        machine: move more memory validation to Machine object
>        slirp: bump submodule past 4.7 release
>        net: slirp: introduce a wrapper struct for QemuTimer
>        net: slirp: switch to slirp_new
>        net: slirp: add support for CFI-friendly timer API
>        net: slirp: allow CFI with libslirp >= 4.7
>        coroutine-lock: qemu_co_queue_next is a coroutine-only qemu_co_enter_next
>        coroutine-lock: introduce qemu_co_queue_enter_all
>        coroutine-lock: qemu_co_queue_restart_all is a coroutine-only qemu_co_enter_all
>        vhost-backend: do not depend on CONFIG_VHOST_VSOCK
>        vl: make machine type deprecation a warning
>        vmxcap: add tertiary execution controls
> 
>   block/io.c                            |   2 +-
>   configure                             |   1 -
>   hw/arm/nseries.c                      |   2 +-
>   hw/core/machine.c                     | 241 ++++++++++++++++++++++++++++++----
>   hw/core/numa.c                        |   2 +-
>   hw/hppa/machine.c                     |   6 +-
>   hw/i386/pc.c                          |   2 +-
>   hw/i386/pc_piix.c                     | 118 -----------------
>   hw/nvram/fw_cfg.c                     |  27 +---
>   hw/ppc/mac_newworld.c                 |   2 +-
>   hw/ppc/mac_oldworld.c                 |   2 +-
>   hw/ppc/prep.c                         |   2 +-
>   hw/ppc/spapr.c                        |   4 +-
>   hw/s390x/ipl.c                        |  20 +--
>   hw/sparc/sun4m.c                      |   9 +-
>   hw/sparc64/sun4u.c                    |   4 +-
>   hw/virtio/vhost-backend.c             |   4 -
>   hw/xen/xen_pt.c                       |  12 --
>   hw/xen/xen_pt.h                       |   2 +
>   hw/xen/xen_pt_graphics.c              | 122 +++++++++++++++++
>   include/hw/boards.h                   |   7 +-
>   include/hw/i386/pc.h                  |   1 -
>   include/qemu/coroutine.h              |  27 +++-
>   include/sysemu/sysemu.h               |   2 -
>   meson.build                           |  38 +++---
>   net/slirp.c                           |  85 ++++++++++--
>   pc-bios/optionrom/Makefile            |   4 +-
>   qapi/machine.json                     |  48 +++++++
>   scripts/checkpatch.pl                 |   4 +-
>   scripts/kvm/vmxcap                    |  17 +++
>   slirp                                 |   2 +-
>   softmmu/bootdevice.c                  |   3 +-
>   softmmu/globals.c                     |   2 -
>   softmmu/vl.c                          | 231 +++++++++-----------------------
>   target/i386/cpu.c                     |  41 +++++-
>   tests/qtest/e1000e-test.c             |   6 +
>   tests/qtest/libqos/arm-virt-machine.c |  19 ++-
>   tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++++++++
>   tests/qtest/libqos/generic-pcihost.h  |  54 ++++++++
>   tests/qtest/libqos/meson.build        |   1 +
>   tests/qtest/libqos/pci-pc.c           |   1 +
>   tests/qtest/libqos/pci-spapr.c        |   1 +
>   tests/qtest/libqos/pci.c              |  78 +++++++----
>   tests/qtest/libqos/pci.h              |   6 +-
>   tests/qtest/vhost-user-blk-test.c     |  10 ++
>   tests/qtest/virtio-blk-test.c         |   5 +
>   tests/qtest/virtio-net-test.c         |   5 +
>   tests/qtest/virtio-rng-test.c         |   5 +
>   ui/console.c                          |   2 +-
>   ui/meson.build                        |   3 +-
>   util/qemu-coroutine-lock.c            |  47 +++----
>   51 files changed, 1072 insertions(+), 498 deletions(-)
>   create mode 100644 tests/qtest/libqos/generic-pcihost.c
>   create mode 100644 tests/qtest/libqos/generic-pcihost.h


