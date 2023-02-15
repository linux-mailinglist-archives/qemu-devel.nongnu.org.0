Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A5697D22
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:25:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHly-00007o-9W; Wed, 15 Feb 2023 08:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlv-0008WD-TJ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:24:31 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHlu-0005fM-Ac
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:24:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id co8so15387333wrb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+8G33dE5kjr/4fB8GUe3JsgHX9jljk5aLDoqp3BrSCc=;
 b=h6Gjq8lQFGuoRDLodNyvPT/3g6ouoPjYcO1g6H/bqod7uwvVNGCakyxCz6RYDtVYSf
 hhN8JEPzSHbXqr9lTZUuqUGQRn1mV3vkbAM0TpgmbVJ7fdMBA+1ZijLZ5pdZE8JtrQVW
 B0lXt6UbD9Asl5SBQjXFEqZxvXOHQg1AZOgHvO0bQnthJk4TgG1fZ93E4EKJ6mchxiEm
 msnXr9rsGrR/El1Z0BDOt+B/+kVWBrqKnMzD5JuZ5DWmT2w8UE1b3UMZmjcVEFPeDg2S
 wYNCLm1qO/LHPj1xSIPg0PMyHB9CCDMHxbUOAmfWET2zuvmrXuNEiEMZEHBGxrpGmNgc
 ehKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8G33dE5kjr/4fB8GUe3JsgHX9jljk5aLDoqp3BrSCc=;
 b=HEAIUMKuW6JKciFuJnglSvWbJbcMx+I8qcsCf/hLMFKA5HpqTMgMH1+EvMiY7/0qSg
 SrWigGXIx44+aoeTp3k35wOd2DMLR/0it/5wH2pfQJgK4Q1xqsXer+W5OzvrTEkWAoge
 J54bMfQAO5MoSui58eISdK89BF7HS8D18oKK+5B2dLZVuy83Uk4K9BiZNoishD80tSse
 pV5kT70Wf3r2p3gErOmwGnGDDUutCcgizfnSevA210ukMyBcacomdy4XakregqL4iNjk
 l2duVYtpoQ6LoAhhtVlPAgMFPFXjubfuVnaPOpvq7thafQ4/dvBHjuH1WJRckGkQdAFI
 9IZQ==
X-Gm-Message-State: AO0yUKWf2h6u8zsNaeZQcSVFVtOmzo82Km7qIsmqPGJ9VwWaqDqcfmyw
 kHOb9ge9ZJsUZySdEkOaHMzWNA==
X-Google-Smtp-Source: AK7set9VRyvOxtdI0wCGOrpyagu2jxaV8dtmJzDj59r7gPDkaUcYlZpqtQQ44K8hPO9DYS9DtZpmbw==
X-Received: by 2002:a5d:5082:0:b0:2c5:4d68:5511 with SMTP id
 a2-20020a5d5082000000b002c54d685511mr1623760wrt.48.1676467465656; 
 Wed, 15 Feb 2023 05:24:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a5d6102000000b002be5bdbe40csm15540835wrt.27.2023.02.15.05.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:24:25 -0800 (PST)
Date: Wed, 15 Feb 2023 14:24:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V2 08/10] hw/riscv/Kconfig: virt: Enable ACPI config option
Message-ID: <20230215132424.e4vtxjkq2bpffbw2@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-9-sunilvl@ventanamicro.com>
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

On Mon, Feb 13, 2023 at 08:10:36PM +0530, Sunil V L wrote:
> Enable ACPI related config option to build ACPI subsystem
> for virt machine.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 4550b3b938..6528ebfa3a 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -44,6 +44,7 @@ config RISCV_VIRT
>      select VIRTIO_MMIO
>      select FW_CFG_DMA
>      select PLATFORM_BUS
> +    select ACPI
>  
>  config SHAKTI_C
>      bool
> -- 
> 2.34.1
>

This could probably squashed together with the previous patch.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

