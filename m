Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62A6697D1D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHlX-0008RO-0T; Wed, 15 Feb 2023 08:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlV-0008R4-8Z
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:24:05 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlT-0005dj-Hh
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:24:04 -0500
Received: by mail-wr1-x431.google.com with SMTP id m10so10217397wrn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mqPc8AytlXNsKR7etzLKAjM93QRl+g6WGs1zRmxWT5c=;
 b=LzALQyReD7dlO8MfOKsyCzpBGIr92KiG6l4QHsBiej3aT3mjzifBqsSVFXvOq8e2Ag
 NoMsAiRl+JUVbTrK+2vI2urXqPwu9i2QXTjL0dbhhRy+DeU+IdjM+mOzvY6StzNfLVlS
 GE+l4e5nNwbBqijuDD4gKA1APvFXcxuB7AZd5QTAa5E6Hu1YEL7pJnDmsi2PheezP8en
 3CQtf+qtZSBdvphkIZ6JYao04lcbq6NlQ/w3aX5NJtTvebN4wTMTtHuRHGwx1ebdqXDq
 o5OD9ofi19apNpoge68E9CliPRO5Kq3Q0Z2KM4Iw8x13B9iXhuQKLCUG5lOgxwWk/ut2
 c7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqPc8AytlXNsKR7etzLKAjM93QRl+g6WGs1zRmxWT5c=;
 b=VJHmDM9akASplWyDB8TwrT+vEHTfKzWxJ6WgKzcjwyRebE0M3kePE+ZGApd/D8AZ3b
 XXyV/SEZ3GqnP74DnV1wFP8Ng6j4IvrwBazV8bllxTYU22CnTUYT/rWTonB7vJwlUMH8
 WXeunsm++jq1X+oyJbBooc4xcdsnkukThX1UR8h5BSJDd7Sr53wLq/m1+NgPcaD+QvbU
 sLxCOGoAESoqbMrU9xWF2B16wgBLY9HLk7d22n1kzq7yPEN+Dnidp9Sel/o6F3nrd4Uz
 fAmKwCc2N/jByTV0zQcF/1N2pteLPXwPIYus5qubSdvQ/3QhnT022Rq7jAb1SDOysMQq
 y/sA==
X-Gm-Message-State: AO0yUKUnDcMYTz8YqVnLWMVoNk4a1Opr3m6tSPxtT+MHFHhXiEVH64xf
 buC4nHOCZBr5O7FyQDtxasN3WQ==
X-Google-Smtp-Source: AK7set9DH/deerxOzeSvl5a8jh+Z+LCerW8KPasMFC5XzuCCApykGrXbxZ6kn7hpI4ohoL2CnmsxPA==
X-Received: by 2002:adf:e651:0:b0:2c5:5b0e:6ee9 with SMTP id
 b17-20020adfe651000000b002c55b0e6ee9mr1825279wrn.39.1676467441964; 
 Wed, 15 Feb 2023 05:24:01 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a056000100900b002c5598c14acsm7069838wrx.6.2023.02.15.05.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:24:01 -0800 (PST)
Date: Wed, 15 Feb 2023 14:24:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 07/10] hw/riscv: meson.build: Build virt-acpi-build.c
Message-ID: <20230215132400.p4dcrjzwxi6mlljz@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-8-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-8-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x431.google.com
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

On Mon, Feb 13, 2023 at 08:10:35PM +0530, Sunil V L wrote:
> ACPI functions are defined in new file virt-acpi-build.c. Enable
> it to be built as part of virt machine if CONFIG_ACPI is set.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>  hw/riscv/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index ab6cae57ea..2f7ee81be3 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
>  riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
>  riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
>  riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
> +riscv_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
>  
>  hw_arch += {'riscv': riscv_ss}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

