Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E91697DC4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:46:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSI6Z-0006oZ-FK; Wed, 15 Feb 2023 08:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSI6V-0006o0-Tm
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:45:49 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSI6S-0005Jy-Kk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:45:46 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so19196440wrv.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n/ThfzrDgUjYqaRx1XhiYCOiTgFfI1QiyNBakl4gOMQ=;
 b=A+OKPdvlTaw5XRL8fbYPKH3bMorBDFlYSLRqkDrwR5QK3BLUnK/1QAUWdJoNxIWGq7
 KnUdmWLQoaoe6nfYjUTbud4h4y9+/YCqdKv/bmZb1lb2Kco8Ie7ommTifjkw/Uv+Q3RA
 ahJbxF/lIb+eD8V0ON6Ss76/byMkqwOeSKXKwZLcgS8zz7eyp5E5hYufYPLnAWehCFum
 st14UK5boX94rNg97KkiNXvjiUSbh9SPSzPc0Ystxodd7FApXpLCVVAGhBV+YTeREGj4
 ijnVVZ92ALzfD8JQ7B6Glq9Vq16/CiV+yyyB7wHOJr5n8Qe7fLfwQCkEjzm3VZeJ5ish
 SH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/ThfzrDgUjYqaRx1XhiYCOiTgFfI1QiyNBakl4gOMQ=;
 b=KGKemw0NIPSgUgeoAZG9kroI8qlf/Sgf/kfuVyFrYQ2lkLpSoTq0OPq5WRngI5e+m7
 U64FuDkzUaRitaXg2LpOuISzbr25XMGgRk+g/HEIVncSt8cylLJk18Idu/8mpCPNH39a
 dO10GeQXZhA/yxBbD9Ui9aRf+x6NnFE2VeRU+5Ekae2uIxlhQVICA0K39TmVeSKO1Rc7
 L9T+vHLGQw7CEvbJz0tZP7GxFxigIE+SeBSSNvVfbz3bvrK/PYAl1vrn0KIZDFw9sY/p
 aFBuA6sm7rTfYMLbxEsHwtiqLMGvUFkRwpW2xD0G04H7IAWZ3gBIJl+qSjiZYZwpKiPJ
 9cRA==
X-Gm-Message-State: AO0yUKUQltwWVsq3kQK0LJfWnlKgSXqO7gfHksF2TND+TZgnJ/EFYqKJ
 bkBQxlcXy4v72zZm8Ia+P9psyA==
X-Google-Smtp-Source: AK7set9CT59qWEZX1lbfuv2qYv/kiZGz7DX2mfh25u4pB2SXC0NtsuV8aOA5466GHAXinbui3xRQKg==
X-Received: by 2002:adf:dd0a:0:b0:2bf:d937:3589 with SMTP id
 a10-20020adfdd0a000000b002bfd9373589mr2099936wrm.14.1676468742742; 
 Wed, 15 Feb 2023 05:45:42 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4d84000000b002c5621263e3sm4584083wru.19.2023.02.15.05.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:45:42 -0800 (PST)
Date: Wed, 15 Feb 2023 14:45:41 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2 00/11] enable write_misa() and RISCV_FEATURE_* cleanups
Message-ID: <20230215134541.hxaspacyttcytod5@orel>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Feb 14, 2023 at 04:23:45PM -0300, Daniel Henrique Barboza wrote:
> Hi,
> 
> This new version contains suggestions made by Weiwei Li in v1. Most
> notable change is patch 4 from v1, moving up to patch 2 now,  to allow
> the riscv_cpu_cfg() helper to be used in the MISA CSR patch.
> 
> 
> Changes in v2:
> - former patch 4 moved to patch 2
> - patch 3 (former 2):
>   - use riscv_cpu_cfg()
> - patch 9:
>   - remove the uneeded RISCVCPUConfig and access mmu via
>     cpu_cfg->cfg.mmu
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg02780.html
> 
> Daniel Henrique Barboza (11):
>   target/riscv: do not mask unsupported QEMU extensions in write_misa()
>   target/riscv: introduce riscv_cpu_cfg()
>   target/riscv: allow users to actually write the MISA CSR
>   target/riscv: remove RISCV_FEATURE_MISA
>   target/riscv: remove RISCV_FEATURE_DEBUG
>   target/riscv/cpu.c: error out if EPMP is enabled without PMP
>   target/riscv: remove RISCV_FEATURE_EPMP
>   target/riscv: remove RISCV_FEATURE_PMP
>   hw/riscv/virt.c: do not use RISCV_FEATURE_MMU in
>     create_fdt_socket_cpus()
>   target/riscv: remove RISCV_FEATURE_MMU
>   target/riscv/cpu: remove CPUArchState::features and friends
> 
>  hw/riscv/virt.c           |  7 ++++---
>  target/riscv/cpu.c        | 20 +++++---------------
>  target/riscv/cpu.h        | 29 ++++++-----------------------
>  target/riscv/cpu_helper.c |  6 +++---
>  target/riscv/csr.c        | 15 ++++++---------
>  target/riscv/machine.c    | 11 ++++-------
>  target/riscv/monitor.c    |  2 +-
>  target/riscv/op_helper.c  |  2 +-
>  target/riscv/pmp.c        |  8 ++++----
>  9 files changed, 34 insertions(+), 66 deletions(-)
> 
> -- 
> 2.39.1
> 
>

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

