Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA854671A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 15:08:49 +0200 (CEST)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzeNc-0004qa-11
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 09:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nze9M-0000Mc-LD
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:54:06 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nze9K-0001my-Mm
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:54:04 -0400
Received: by mail-io1-xd2c.google.com with SMTP id r5so4139780iod.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 05:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eIzZZGkAb2lXHcM2OKG8WBUJ/kV5x98tbU2L+d00OAg=;
 b=UPemq8+kt2usJ8lPaP5lxoVMmOwJ4S3bQHvdNxkqi0TuWdsqiWVpK9E1oAa8T9Rd8+
 XG7uAXPfvgAjmAfhs1HU6aT5JAPWR5MRyHJZKC1ZJx45wz2SrpOPjoR+P/Z3c9f6BJvC
 9Qfks8jXVVr9jvN9bZT0m6tRoLkF5WzHf6WNRQP+uWeacYshZs/KZQmE2TS2wbYvuxRG
 hjB5jD31C6LkHavL3nhDDSNhJKYNM2qvz9JGg0yaOJXZcSILm/XjOLDumi2nglrz1rY+
 KZNt9MZ6rNMusdqlIANnQIM2DFIIOgSUb3yKIvLRu32MEq4eJpnuuQb3lrYjow6kAh/t
 4P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eIzZZGkAb2lXHcM2OKG8WBUJ/kV5x98tbU2L+d00OAg=;
 b=EwEJz+5bns+tHmvZUFbtcVFCKmmzt5RIIzUgXupNjihnFpHcZ5vP/+htfZUwdZgDBp
 fI26Ho6OaYhFhkt18YSJ/8BLpGQnDLDs6TV4PDPLpn+s70deT8LfHoRaA1OCL+1F6UM2
 cvvIXDWoDwCLpS4eHOVQPCfRmtYQ2v9GwzDs9u8ZYNRqNrIgihKryTV9fc9B47eQzmGw
 DUEhdMwiSOuWnSwMPJQaXFk/7eLOyXkkm0G7f5iOBWk33ZrY+VXazgdZylZt7ap5lTpq
 2MxirbTSnZe88HDvI7HlP9VHoT985gP4Lrymcz2CBvAA7Urma0MsDaxrfZ2OP/kIq0j/
 +UUg==
X-Gm-Message-State: AOAM532PqID+tzzzwvA8aioTNPs0Jb99+o7Fm5r8nZgeUbzgIBQGs+Mt
 mQSo+f1q8s2qHePBLQwGzm8/lQ==
X-Google-Smtp-Source: ABdhPJyZ2PddBqxUz8CKDgTINEbVRoc35Cdt0nSP3LL4jXl1PJl5Nv1L//WhI0DOipsRhN6TMDBgLw==
X-Received: by 2002:a05:6638:1a94:b0:332:1c4:6e4c with SMTP id
 ce20-20020a0566381a9400b0033201c46e4cmr4548968jab.163.1654865641173; 
 Fri, 10 Jun 2022 05:54:01 -0700 (PDT)
Received: from ?IPV6:2607:fb90:b7e0:4183:cfae:3a33:430a:abce?
 ([2607:fb90:b7e0:4183:cfae:3a33:430a:abce])
 by smtp.gmail.com with ESMTPSA id
 bo22-20020a056638439600b003315c30100bsm10548232jab.7.2022.06.10.05.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 05:53:59 -0700 (PDT)
Message-ID: <21e13a73-079a-bd5c-e45c-d63fbdbd9c31@linaro.org>
Date: Fri, 10 Jun 2022 05:53:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/25] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
References: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220610042655.2021686-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
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

On 6/9/22 21:26, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 9cc1bf1ebca550f8d90f967ccd2b6d2e00e81387:
> 
>    Merge tag 'pull-xen-20220609' of https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging (2022-06-09 08:25:17 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220610
> 
> for you to fetch changes up to 07314158f6aa4d2589520c194a7531b9364a8d54:
> 
>    target/riscv: trans_rvv: Avoid assert for RV32 and e64 (2022-06-10 09:42:12 +1000)
> 
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 7.1
> 
> * Update MAINTAINERS
> * Add support for Zmmul extension
> * Fixup FDT errors when supplying device tree from the command line for virt machine
> * Avoid overflowing the addr_config buffer in the SiFive PLIC
> * Support -device loader addresses above 2GB
> * Correctly wake from WFI on VS-level external interrupts
> * Fixes for RV128 support
> * Support Vector extension tail agnostic setting elements' bits to all 1s
> * Don't expose the CPU properties on named CPUs
> * Fix vector extension assert for RV32

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alistair Francis (4):
>        MAINTAINERS: Cover hw/core/uboot_image.h within Generic Loader section
>        hw/intc: sifive_plic: Avoid overflowing the addr_config buffer
>        target/riscv: Don't expose the CPU properties on names CPUs
>        target/riscv: trans_rvv: Avoid assert for RV32 and e64
> 
> Andrew Bresticker (1):
>        target/riscv: Wake on VS-level external interrupts
> 
> Atish Patra (1):
>        hw/riscv: virt: Generate fw_cfg DT node correctly
> 
> Frédéric Pétrot (1):
>        target/riscv/debug.c: keep experimental rv128 support working
> 
> Jamie Iles (1):
>        hw/core/loader: return image sizes as ssize_t
> 
> Weiwei Li (1):
>        target/riscv: add support for zmmul extension v0.1
> 
> eopXD (16):
>        target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
>        target/riscv: rvv: Prune redundant access_type parameter passed
>        target/riscv: rvv: Rename ambiguous esz
>        target/riscv: rvv: Early exit when vstart >= vl
>        target/riscv: rvv: Add tail agnostic for vv instructions
>        target/riscv: rvv: Add tail agnostic for vector load / store instructions
>        target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
>        target/riscv: rvv: Add tail agnostic for vector integer shift instructions
>        target/riscv: rvv: Add tail agnostic for vector integer comparison instructions
>        target/riscv: rvv: Add tail agnostic for vector integer merge and move instructions
>        target/riscv: rvv: Add tail agnostic for vector fix-point arithmetic instructions
>        target/riscv: rvv: Add tail agnostic for vector floating-point instructions
>        target/riscv: rvv: Add tail agnostic for vector reduction instructions
>        target/riscv: rvv: Add tail agnostic for vector mask instructions
>        target/riscv: rvv: Add tail agnostic for vector permutation instructions
>        target/riscv: rvv: Add option 'rvv_ta_all_1s' to enable optional tail agnostic behavior
> 
>   include/hw/loader.h                     |   55 +-
>   target/riscv/cpu.h                      |    4 +
>   target/riscv/internals.h                |    6 +-
>   hw/arm/armv7m.c                         |    2 +-
>   hw/arm/boot.c                           |    8 +-
>   hw/core/generic-loader.c                |    2 +-
>   hw/core/loader.c                        |   81 +-
>   hw/i386/x86.c                           |    2 +-
>   hw/intc/sifive_plic.c                   |   19 +-
>   hw/riscv/boot.c                         |    5 +-
>   hw/riscv/virt.c                         |   28 +-
>   target/riscv/cpu.c                      |   68 +-
>   target/riscv/cpu_helper.c               |    4 +-
>   target/riscv/debug.c                    |    2 +
>   target/riscv/translate.c                |    4 +
>   target/riscv/vector_helper.c            | 1588 +++++++++++++++++++------------
>   target/riscv/insn_trans/trans_rvm.c.inc |   18 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  106 ++-
>   MAINTAINERS                             |    1 +
>   19 files changed, 1244 insertions(+), 759 deletions(-)
> 


