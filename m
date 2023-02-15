Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6180697D54
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:29:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHqC-0004s7-Ka; Wed, 15 Feb 2023 08:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHq6-0004iR-4x
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:28:50 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSHq4-0001oT-8Q
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:28:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id h16so19128896wrz.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RgjdNrGN20/tF99YpbNi+PvCmEt0lTWDvcRUmNlZGYU=;
 b=Q37uAPat4nXwBevtO622bC2lbdq+2kig5av+s1xEfvrluvvehEzW0lJlgLRjSU/gVS
 0g0nbXE453KWchLxocoZtsx6jDxV+6m4XTn/yTNnNOQyDhcofr6S2XDw8m0Z/LUjCfVx
 /mEaoHRxJq9qggtqyMijHRZBSiUl3v7fzDn0NSUO+ldy6MuxhWBG2cuv/2OApgYJ3vY2
 PK0N40Ta55bnMhBH4Au+qRTKSa+5NswpZGNAHNaAYZo4fHkKRDIHdxKIF5auDJMNz6Tt
 Sqbv4LU8Z25Q8SrK2NuPq3bNxR458dY5Vz1VHA0UX1vXOzTHFbIhAGFY3mDkFw3b2KAu
 b7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgjdNrGN20/tF99YpbNi+PvCmEt0lTWDvcRUmNlZGYU=;
 b=rjnRd7fkyIqcaEDHCkIJgtHQ5/mKKh8kyErhZ+O/+DaoYivp9VJBnnjOWyKZzbROqT
 RD+S7jqGMsCAaUI0KCnSFZ/13EF1iu1hv2AAJqFh0tuVW/iGVLTHF+tehZtDRyHue85f
 yzJU59NOnIZ0QWSGK7iD6EzSMG6INMRF9EVA9y8Ba1XIjmcgXWw2mvAoJv613Dhhwwi7
 Gsunf/w/JiKFQZhRaXRXE/O2WRhEOKHSJAgSII0Uq2IXLXU+Ygvi9AgZK7IOXfjc7/UD
 n5QMS/X2gMrQK7wXWyABVGoxccBsQv6awHTnxzBW2OJN1FDhZ1qv04+Ad/dGFmfWRz5m
 OECg==
X-Gm-Message-State: AO0yUKUJIvwHXksMHypVDMzDzVxyU3oU4MX2byraPK8GU/v8MUSfMInH
 faQtv+MyDrzknOLWPxQG+FuTNw==
X-Google-Smtp-Source: AK7set8QUbUj/nE6L8WnjHe6NgZjzWNh6KmAjlizx8NpM/S8mP8kaQW3lK+sLBWIak4qSUqkTIF34Q==
X-Received: by 2002:adf:e452:0:b0:2c5:594a:a4f0 with SMTP id
 t18-20020adfe452000000b002c5594aa4f0mr1772668wrm.58.1676467726453; 
 Wed, 15 Feb 2023 05:28:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6252000000b002c3dc4131f5sm15807943wrv.18.2023.02.15.05.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:28:46 -0800 (PST)
Date: Wed, 15 Feb 2023 14:28:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: Re: [PATCH V2 10/10] MAINTAINERS: Add entry for RISC-V ACPI
Message-ID: <20230215132845.nv7km7z7vfm5jqzg@orel>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-11-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213144038.2547584-11-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x430.google.com
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

On Mon, Feb 13, 2023 at 08:10:38PM +0530, Sunil V L wrote:
> RISC-V ACPI related functionality for virt machine is added in
> virt-acpi-build.c. Add the maintainer entry.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 847bc7f131..7fb0f1052d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1003,6 +1003,12 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/virt-acpi-build.c
>  
> +RISC-V ACPI Subsystem
> +M: Sunil V L <sunilvl@ventanamicro.com>
> +L: qemu-riscv@nongnu.org
> +S: Maintained
> +F: hw/riscv/virt-acpi-build.c
> +
>  STM32F100
>  M: Alexandre Iooss <erdnaxe@crans.org>
>  L: qemu-arm@nongnu.org
> -- 
> 2.34.1
>

Please move the ARM ACPI entry down under the main ACPI entry and then
add the RISC-V one there too.

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

