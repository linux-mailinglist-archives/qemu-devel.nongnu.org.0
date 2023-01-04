Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCF65CF75
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 10:21:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCzwa-0004ih-4T; Wed, 04 Jan 2023 04:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCzwY-0004iV-6i
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCzwW-0006bI-5u
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672824014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVQuKPhYmaaQZTqXDtqQjW51Ra5K/2R5OeGVYC4DU/I=;
 b=B7Kh92LClXDyy1aKUXh+2YclWAqUQPJ9/8vbXTTPgEPL7Cc5tFHxL9V8Neruu4QKnDzCbm
 GG9fqRfCL9SVpHWeDNewd0JD+t0deOPOGy5a9p1FWDNJxmCUEPg+FA4D6qxTJY/y4m1EMb
 j4UZ/43ZrGwM/+NhfwqVsCgaP1IC2C8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-Th0JtaIGPeerI1pCwTDhgA-1; Wed, 04 Jan 2023 04:20:13 -0500
X-MC-Unique: Th0JtaIGPeerI1pCwTDhgA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c66-20020a1c3545000000b003d355c13229so21489123wma.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 01:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oVQuKPhYmaaQZTqXDtqQjW51Ra5K/2R5OeGVYC4DU/I=;
 b=ilD6K8ffHn1KyD9BL0wBaRS8axlIxGvTmrmFFb7A77kXE1eRNn3irYceAXqRZ1XzuR
 JSG1mobHmO0Akk8SuMV1ntNGAX7g87APRJkSiKW1lWhVrsrxkXJHA+aNtdomDSSHzW76
 TKusd0v838JkFq+iGOEk4pJ5qPPx/WuAkp4BIuqxBJEaxt5Nmk/Kn5Aqw1dw78RAQor+
 +YS7dACkDaMfm3Nf3+VHv0GTN2PZV0dad6hhnjyioWu/Y+D8PFwG+JvSpiLJ0NMezJua
 zx4XQ5ZAh5e/3Sev5oFWXu5/KMng45cjUN7R5elpjpjEk3ir4YyycX7q5j2oXNTMYeZ9
 Ah4Q==
X-Gm-Message-State: AFqh2kpLcYU8FL4sJhPwBqA77IhJXKrcKqonQfzH6Hpk77kJm3/p89DN
 G+xN0kXGCPLtHBjreB6W3Z/EjQuD31w92nZFDaAh5ztZy6SIxuHS0GgA7fmW1qdAEdE2Bzr74SQ
 3hsz6LGzFQx7oMGM=
X-Received: by 2002:a7b:c3d2:0:b0:3c6:e62e:2e72 with SMTP id
 t18-20020a7bc3d2000000b003c6e62e2e72mr33711232wmj.13.1672824012709; 
 Wed, 04 Jan 2023 01:20:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsI2CSPwk+bsckVRirTAZaoakv4D9TPtElB++kwHDhMtZS747As3VLpVGwsGNW+gjC+CicnJQ==
X-Received: by 2002:a7b:c3d2:0:b0:3c6:e62e:2e72 with SMTP id
 t18-20020a7bc3d2000000b003c6e62e2e72mr33711218wmj.13.1672824012488; 
 Wed, 04 Jan 2023 01:20:12 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c188700b003d9aa76dc6asm17937194wmp.0.2023.01.04.01.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:20:11 -0800 (PST)
Message-ID: <5f487941-0a4f-1f99-a281-8cf004c80662@redhat.com>
Date: Wed, 4 Jan 2023 10:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL v2 00/45] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/12/2022 23.39, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:
> 
>    Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20221222-1
> 
> for you to fetch changes up to 71a9bc59728a054036f3db7dd82dab8f8bd2baf9:
> 
>    hw/intc: sifive_plic: Fix the pending register range check (2022-12-22 08:36:30 +1000)
> 
> ----------------------------------------------------------------
> First RISC-V PR for QEMU 8.0
> 
> * Fix PMP propagation for tlb
> * Collection of bug fixes
> * Add the `FIELDx_1CLEAR()` macro
> * Bump the OpenTitan supported version
> * Add smstateen support
> * Support native debug icount trigger
> * Remove the redundant ipi-id property in the virt machine
> * Support cache-related PMU events in virtual mode
> * Add some missing PolarFire SoC io regions
> * Fix mret exception cause when no pmp rule is configured
> * Fix bug where disabling compressed instructions would crash QEMU
> * Add Zawrs ISA extension support
> * A range of code refactoring and cleanups
> 
> ----------------------------------------------------------------
> Anup Patel (1):
>        target/riscv: Typo fix in sstc() predicate
> 
> Atish Patra (1):
>        hw/riscv: virt: Remove the redundant ipi-id property
> 
> Bin Meng (20):
>        target/riscv: Add some comments for sstatus CSR in riscv_cpu_dump_state()
>        target/riscv: Fix mret exception cause when no pmp rule is configured
>        target/riscv: Simplify helper_sret() a little bit
>        target/riscv: Clear mstatus.MPRV when leaving M-mode for priv spec 1.12+
>        hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
>        hw/intc: Select MSI_NONBROKEN in RISC-V AIA interrupt controllers
>        hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
>        hw/riscv: Sort machines Kconfig options in alphabetical order
>        hw/riscv: spike: Remove misleading comments
>        hw/intc: sifive_plic: Drop PLICMode_H
>        hw/intc: sifive_plic: Improve robustness of the PLIC config parser
>        hw/intc: sifive_plic: Use error_setg() to propagate the error up via errp in sifive_plic_realize()
>        hw/intc: sifive_plic: Update "num-sources" property default value
>        hw/riscv: microchip_pfsoc: Fix the number of interrupt sources of PLIC
>        hw/riscv: sifive_e: Fix the number of interrupt sources of PLIC
>        hw/riscv: sifive_u: Avoid using magic number for "riscv, ndev"
>        hw/riscv: virt: Fix the value of "riscv, ndev" in the dtb
>        hw/intc: sifive_plic: Change "priority-base" to start from interrupt source 0
>        hw/riscv: opentitan: Drop "hartid-base" and "priority-base" initialization
>        hw/intc: sifive_plic: Fix the pending register range check
> 
> Christoph Muellner (1):
>        RISC-V: Add Zawrs ISA extension support
> 
> Conor Dooley (3):
>        hw/misc: pfsoc: add fabric clocks to ioscb
>        hw/riscv: pfsoc: add missing FICs as unimplemented
>        hw/{misc, riscv}: pfsoc: add system controller as unimplemented
> 
> Frédéric Pétrot (1):
>        hw/intc: sifive_plic: Renumber the S irqs for numa support
> 
> Jim Shu (2):
>        target/riscv: support cache-related PMU events in virtual mode
>        hw/intc: sifive_plic: fix out-of-bound access of source_priority array
> 
> LIU Zhiwei (5):
>        target/riscv: Fix PMP propagation for tlb
>        target/riscv: Add itrigger support when icount is not enabled
>        target/riscv: Add itrigger support when icount is enabled
>        target/riscv: Enable native debug itrigger
>        target/riscv: Add itrigger_enabled field to CPURISCVState
> 
> Mayuresh Chitale (3):
>        target/riscv: Add smstateen support
>        target/riscv: smstateen check for h/s/envcfg
>        target/riscv: generate virtual instruction exception
> 
> Richard Henderson (4):
>        tcg/riscv: Fix range matched by TCG_CT_CONST_M12
>        tcg/riscv: Fix reg overlap case in tcg_out_addsub2
>        tcg/riscv: Fix base register for user-only qemu_ld/st
>        target/riscv: Set pc_succ_insn for !rvc illegal insn
> 
> Wilfred Mallawa (4):
>        hw/registerfields: add `FIELDx_1CLEAR()` macro
>        hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
>        hw/riscv/opentitan: bump opentitan
>        hw/riscv/opentitan: add aon_timer base unimpl
> 
>   include/hw/intc/sifive_plic.h                  |   1 -
>   include/hw/misc/mchp_pfsoc_ioscb.h             |   4 +
>   include/hw/misc/mchp_pfsoc_sysreg.h            |   1 +
>   include/hw/registerfields.h                    |  22 ++
>   include/hw/riscv/microchip_pfsoc.h             |   7 +-
>   include/hw/riscv/opentitan.h                   |  10 +-
>   include/hw/riscv/shakti_c.h                    |   2 +-
>   include/hw/riscv/sifive_e.h                    |   9 +-
>   include/hw/riscv/sifive_u.h                    |   2 +-
>   include/hw/riscv/virt.h                        |   8 +-
>   target/riscv/cpu.h                             |  10 +
>   target/riscv/cpu_bits.h                        |  37 +++
>   target/riscv/debug.h                           |  13 +
>   target/riscv/helper.h                          |   2 +
>   target/riscv/pmp.h                             |   6 +-
>   target/riscv/insn32.decode                     |   4 +
>   hw/intc/sifive_plic.c                          |  66 +++--
>   hw/misc/mchp_pfsoc_ioscb.c                     |  78 ++++-
>   hw/misc/mchp_pfsoc_sysreg.c                    |  18 +-
>   hw/riscv/microchip_pfsoc.c                     | 121 ++++----
>   hw/riscv/opentitan.c                           |  26 +-
>   hw/riscv/sifive_u.c                            |   3 +-
>   hw/riscv/spike.c                               |   1 -
>   hw/riscv/virt.c                                |   7 +-
>   hw/ssi/ibex_spi_host.c                         |  21 +-

FYI, this seems to cause problems in the MSYS2 Cirrus-CI job:

  https://cirrus-ci.com/task/6444497832247296?logs=main#L2159

  Thomas


