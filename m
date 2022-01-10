Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED713489023
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 07:22:30 +0100 (CET)
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6o4Z-0006Iy-5j
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 01:22:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6nyX-0001FK-OV; Mon, 10 Jan 2022 01:16:13 -0500
Received: from [2607:f8b0:4864:20::136] (port=33305
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6nyW-000250-53; Mon, 10 Jan 2022 01:16:13 -0500
Received: by mail-il1-x136.google.com with SMTP id o20so3984211ill.0;
 Sun, 09 Jan 2022 22:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tc0B9g2KemGmqfVVJCIKZIsthvvsmzRcETbZ/7lZXTc=;
 b=K/qgw4P3KpjlQkN5Ms3hcM1WtcCrdDP8ySp/yoZICvUmnDraI61lE29KVfdYEHIsdl
 MyKH1yt7GvqlBtqoYaD4mYurQqf/iPqQAAh9b+Q3jlmnvEIQbciLYwwzuePVVz+Wfzao
 FJpDHKgGmhmChjN8I+GK7KE/ll4gEnhGx3e0MC9yMPttHpi30SrFeEvZbENd780ZTDlE
 if0/NnPM7H0p2RyY8P2gj2QgejLQfgme/QlZxdt3k16aiapn09F8N10X/M3VZHbbb1uO
 3+639yqwwXPcbDydBD0CBBo4dbwvvJeNX8FGDEEwYcktrNkKE9eYXLAdDgQnoH6LXDqc
 mPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tc0B9g2KemGmqfVVJCIKZIsthvvsmzRcETbZ/7lZXTc=;
 b=eARLGXOsKgZ5RCTSHOnk2EGv/nbdzbqo3AEkHtkhl3iEkhI91JM2AqMnyfWhHMkpgL
 gyFFp6rbcJr16211k02UJrBIBsgZYCb6fuPGDFToIXMSGgCrRjIIhUSlXYPFElSN4Cu3
 2skBR4mYXLQxzS5i6g9mcnAKy8HAbJoEa0neMoQCW7NxKES9Fz4+kOgzx12fb+0HSVZY
 LN8iJOj3C/YazcOjJDNaxlgiJL1p9ZztAuCqjJ7QKM5zf4Tipk6FIrTF2j+sZ4PxDOjZ
 FJBwa3EEXvvj8SJj4c0Yit3PG5jSN4lHoQVXKrEEvoYtxPLlQKVsc3SB8ca5s0oRnT2c
 YCrQ==
X-Gm-Message-State: AOAM533YGo3fNjnOALIhHkEzsSwOh4qlj3EE8n2hQ+gIyZSKRywpWrYE
 iTDkndL4kAaCNAKjtQC8oxVnN/mXe/8gdQyNATA=
X-Google-Smtp-Source: ABdhPJz9KOKhMLUKTZATczIePvS1cIyyhCvDX9iyJsUUTAIP6EuOO8qW0md2WU7dRzaO6JKmL6Fg+NW+hD8r67UzJOc=
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr33371072ilu.290.1641795370694; 
 Sun, 09 Jan 2022 22:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220110061321.4040589-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 16:15:44 +1000
Message-ID: <CAKmqyKMwUUpHpWanceX8anb+cSiOhxwWoG+bTMtm5XRGsT7FzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: opentitan: fixup plic stride len
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, wilfred.mallawa@wdc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 4:13 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> The following change was made to rectify incorrectly set stride length
> on the PLIC. Where it should be 32bit and not 24bit (0x18). This was
> discovered whilst attempting to fix a bug where a timer_interrupt was
> not serviced on TockOS-OpenTitan.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index c531450b9f..5144845567 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -160,7 +160,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>      qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
> -    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
> +    qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
>      qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_DEV_PLIC].size);
> --
> 2.34.1
>

