Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A7469894C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSSCG-0007ix-9W; Wed, 15 Feb 2023 19:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSSC7-0007dy-3N; Wed, 15 Feb 2023 19:32:15 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSSC4-00085n-Ru; Wed, 15 Feb 2023 19:32:14 -0500
Received: by mail-ej1-x634.google.com with SMTP id jg8so1284067ejc.6;
 Wed, 15 Feb 2023 16:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1yVXs5qZoc5oavgFa6w8jWbrv12yoIcOIPLNqIcmrq4=;
 b=WZJzE9NnXFMTmCkotPqTJU01gqYwddz7OIXqb28uW4IwjJ27Xceq9FsykrcwlJCNvZ
 09SDP0jV83E1/8N3zLCTiwVP2Ih2qIMgSF9ECZPunLa29OtE5DZWXxLnHKMKvPaTQajG
 92AqffcSPHNAxmt6DNGN2KlMREsKadx9fSwqZKOlL+vxI4j0qh0gEEN9tca7g4OLu9Y6
 Ep6j/wtpyi52Eb3F1Nzgg3xhmsciln3PqFoMLofN8WyvPUNVIBT6+04wfbemkhvOj8+n
 F1LATDQumEtffdSNyfhLR4LAGmn0mGomtZi9abZ31pQtYR6YboZMNuO3hg1bPgebzd0i
 wtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1yVXs5qZoc5oavgFa6w8jWbrv12yoIcOIPLNqIcmrq4=;
 b=ylU8lKKW5A0GB4/WNUVO+PZaTIHdp4Y/lnluAZ3v8pbHYFL+hsO+SZpBMeQe4U3XNa
 J7SA2TzKzOmixHJVRYmjNxnOchWMyV5wgsUDUu/9OXTXh15OdoGns9wbwG1mJ330n29l
 hcmA/LdyEq7SCRLgX8wg4R8ljNe8+K0nkcQ7uV3Cq6DeBVTrDXV+0hhpB56CqApgSRKT
 FIMlTYCAXLlO2p11dA1dmnfU+70BZwBsBH6tVQhDHEUIDUPBcfoInfJXEdIGdxEatbO8
 VkP2FJkpmKI/HIUIjCw17j/Vp2jS9UIpqoswOPOgRuRQLCw680XAN0OSnpbyO/KqlcCs
 DJww==
X-Gm-Message-State: AO0yUKX5ZP96Npc3mCoswyAoV3sXYRWM2648AhEfKTfa/GWkK4YHjZCD
 +e14X5uJ/BBipVJHRYP8qCGf7Cg9qTavNoENDvs=
X-Google-Smtp-Source: AK7set+JXxv4/oQrdWKKx/MaSTMqQKpMxT5+MrS3jmsVKAJzVhuGPQkRdmFZApzTIOX+fbOPxM6/3UobsM6OT4Te7GE=
X-Received: by 2002:a17:907:3d91:b0:8af:2e89:83df with SMTP id
 he17-20020a1709073d9100b008af2e8983dfmr309656ejc.6.1676507529474; Wed, 15 Feb
 2023 16:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
 <20230215185726.691759-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230215185726.691759-3-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Feb 2023 08:31:58 +0800
Message-ID: <CAEUhbmUDfwPQPO++Jquvs4KhgkTjQfpi1woKzDXKXAQYcG2RKg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] target/riscv: always allow write_misa() to write
 MISA
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Feb 16, 2023 at 2:58 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> At this moment, and apparently since ever, we have no way of enabling
> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
> the nuts and bolts that handles how to properly write this CSR, has
> always been a no-op as well because write_misa() will always exit
> earlier.
>
> This seems to be benign in the majority of cases. Booting an Ubuntu
> 'virt' guest and logging all the calls to 'write_misa' shows that no
> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
> RISC-V extensions after the machine is powered on, seems to be a niche
> use.
>
> Regardless, the spec says that MISA is a WARL read-write CSR, and gating
> the writes in the register doesn't make sense. OS and applications
> should be wary of the consequences when writing it, but the write itself
> must always be allowed.
>
> Remove the RISCV_FEATURE_MISA verification at the start of write_misa(),
> removing RISCV_FEATURE_MISA altogether since there will be no more
> callers of this enum.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h | 1 -
>  target/riscv/csr.c | 5 -----
>  2 files changed, 6 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

