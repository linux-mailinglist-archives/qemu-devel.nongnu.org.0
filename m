Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F99697D23
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHm8-0000eR-Jq; Wed, 15 Feb 2023 08:24:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHm5-0000Vu-Jy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:24:41 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHm4-0005iW-26
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:24:41 -0500
Received: by mail-wr1-x434.google.com with SMTP id y1so19155167wru.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yiZlosEBkr+8oj6Izjo4DAcpmzxY/yeq9wPI4erWw0g=;
 b=c5uEX1j5p5cny3McXE1NNyEm5PyOo+r7DIvE0n8Rkg+Yfgj0jIWoN8XKs3FXRWrOsr
 5SNeNb5jJKeBAl0zzZ59bIwz+MsHrXYO9pu3BWy2otHFapeVQ/CW0T/XD5kHw7oYP/fj
 Y61UPZFewwWN8YwQYFlIIP/Mxuu6DW6ZvP4DKE3jsYX0XRUIWLHYMqs0nIawIH/mCQMj
 w6Xp2rRkeYqh80s2hRjI5IFZkigIBkHFiV+AXAhVEDYll+T7Pg5SbJoJeMoyOY8I8NJW
 L9oD7T2LvfD6z/iG6iJIbC7q2+r/aKVycSy7JnJcFocPqQZBQRFmrNH131GPPQsJu35a
 Ljvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yiZlosEBkr+8oj6Izjo4DAcpmzxY/yeq9wPI4erWw0g=;
 b=R6wa4LMJAjcZCIIDS0mgnI43xt0AUyrToygRR8bkSS2DIG0kDHgzDsi6/1FbokiIjF
 Bkmpf3ZmTzG1mYxKfzX5fOnDLz0O79pr4wEbM+i1e+DrH7r8ArkJMm8PEiORWWFeRIFB
 SzXvngtp0bFXFmgthb+AP21KkQUxcsA4Alha1QC2HY3GEa6QfImkdHz9PIX2iggSh1VJ
 e+DUv1P3Lg4x1C27kOezd7kmkkptHDleRMAqOTRLhkEm5oBb5ZVbhK6yZz9tPhJL1lF3
 iy2LXozTPQw44S+oi68d0YGngynOAnBb8J+7MKc2HXV2ZSFon6lAfsOsm5nS/1fCEOmc
 ztXg==
X-Gm-Message-State: AO0yUKXpt2jROcBql12ZI6ZZQGM7t0hBhuGTFi8Rpgg2/SGk1GNTLzOp
 f3jZ+a9q+0IUXte4DKU0KqtaMQ==
X-Google-Smtp-Source: AK7set+5EG/W4w+oOCo0CRYE2lhq1ANLqWUvM+b4OFvo4NphI3cC5iQLqZAYDYMtGWAg3sOWd5hQiw==
X-Received: by 2002:a5d:68c8:0:b0:2c0:dcb7:91bc with SMTP id
 p8-20020a5d68c8000000b002c0dcb791bcmr1273751wrw.46.1676467478577; 
 Wed, 15 Feb 2023 05:24:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adfefc2000000b002c553e061fdsm9145301wrp.112.2023.02.15.05.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:24:38 -0800 (PST)
Date: Wed, 15 Feb 2023 14:24:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 09/10] hw/riscv/virt.c: Initialize the ACPI tables
Message-ID: <20230215132437.ibksma3khjoukimg@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-10-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 13, 2023 at 08:10:37PM +0530, Sunil V L wrote:
> When the "acpi=on", ACPI tables need to be added. Detect the option
> and initialize the ACPI tables.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  hw/riscv/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5017ba62ec..43c201c8cf 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1316,6 +1316,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      if (kvm_enabled()) {
>          riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
>      }
> +
> +    if (virt_is_acpi_enabled(s)) {
> +        virt_acpi_setup(s);
> +    }
>  }
>  
>  static void virt_machine_init(MachineState *machine)
> -- 
> 2.34.1
> 

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

