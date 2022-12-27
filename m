Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD5656D6D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:33:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADoc-0005TR-J8; Tue, 27 Dec 2022 12:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADoK-0005On-Da
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:32:35 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADoI-0008Ts-Gu
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:32:20 -0500
Received: by mail-oi1-x235.google.com with SMTP id c133so12972451oif.1
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6H4d6jwF7s26857WjqVrNeqXmVZSnZx1pB6upoqmVus=;
 b=axE4uTZIfHIt9Vh2dg8HZMuB6JsUwz4u5W/16avO0CTbgTtn6J4YBhC0oE3ytjjMsB
 aj8ys0R/P0nKaR3e+z3M2r2QG2Ww80987fzvZpgpU17RNDzTGT8NJxWcqLtMSxTnJ0Oy
 2IpbrWZIRieDhmUf5M40lj2nKseVB1GK5Bpup798GFtYhYjuZKzNYz56iyrkPk3qMHG9
 7UhcPUngxLCKV53k9u7nPTYj9qo8HEqpRnfuVE6SJoP8c19RK+0ZvJ8fgtO0dE3lYn8D
 fVCAbxZ7W/SERLCsx/LrFfTqej/WGGkkA7LIQjt59OGD0zEo40T77bu9hDV4zRlsLpy7
 rJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6H4d6jwF7s26857WjqVrNeqXmVZSnZx1pB6upoqmVus=;
 b=1Tj7syJx36JW8EonNSt9hiR9a7SPrRMDBi+LEfXTm+7s33tBLuq6AvrcQ4EaeiguiU
 eP9IDzEj4OQ5Vw0FRMNZHRq3DnVaLKt7A9dcnQd73JKql5plTZcW1hcLD7KkQIBqniJe
 f/KysKw2sT1icfdE2OPgSLBDjctb7bkj6iw/N2kWQd5TKJF3WWdFF2EQcgPAyPKgmj2P
 X/wTNhdUD8kq3NplPL97hicSy4YOiWlfPJcIGfI8RDm5lqyqjppD53pKwwbLF/dmPAYh
 wbjOzBBd2ehYtmg0uMV0NI4eIufo+FrpNNwFOcwcetafh9dYbCXKRZ0yNOASpeSdsfpK
 PUbg==
X-Gm-Message-State: AFqh2kr3E19PpBOmZonKHJ2k3RwM58nJN2Btyw3/ENRNlx1gSMw6KI4w
 P47DrZoXvltM+/N23KW1sjg+C4m9FVHTahq4
X-Google-Smtp-Source: AMrXdXvPcZ1NdLi/E15ebRBXCC/Y7FqnBTv000O06bb+LCIwBwJQrsukJY7yqpxwo2XPHBkcqEWdEw==
X-Received: by 2002:aca:2807:0:b0:360:ea80:a9ae with SMTP id
 7-20020aca2807000000b00360ea80a9aemr14609259oix.24.1672162337234; 
 Tue, 27 Dec 2022 09:32:17 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a0568301dae00b006708a6274afsm6841393oti.25.2022.12.27.09.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:32:16 -0800 (PST)
Message-ID: <0912b356-7a8c-d677-a039-d432e10f1a53@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:32:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 04/12] hw/char: riscv_htif: Use conventional 's' for
 HTIFState
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-5-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-5-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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



On 12/27/22 03:48, Bin Meng wrote:
> QEMU source codes tend to use 's' to represent the hardware state.
> Let's use it for HTIFState.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   hw/char/riscv_htif.c | 64 ++++++++++++++++++++++----------------------
>   1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index e7e319ca1d..f28976b110 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -85,7 +85,7 @@ static int htif_can_recv(void *opaque)
>    */
>   static void htif_recv(void *opaque, const uint8_t *buf, int size)
>   {
> -    HTIFState *htifstate = opaque;
> +    HTIFState *s = opaque;
>   
>       if (size != 1) {
>           return;
> @@ -97,10 +97,10 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
>        *        will drop characters
>        */
>   
> -    uint64_t val_written = htifstate->pending_read;
> +    uint64_t val_written = s->pending_read;
>       uint64_t resp = 0x100 | *buf;
>   
> -    htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
>   }
>   
>   /*
> @@ -142,7 +142,7 @@ static int htif_be_change(void *opaque)
>    * For RV32, the tohost register is zero-extended, so only device=0 and
>    * command=0 (i.e. HTIF syscalls/exit codes) are supported.
>    */
> -static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
> +static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>   {
>       uint8_t device = val_written >> HTIF_DEV_SHIFT;
>       uint8_t cmd = val_written >> HTIF_CMD_SHIFT;
> @@ -174,11 +174,11 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>           /* HTIF Console */
>           if (cmd == HTIF_CONSOLE_CMD_GETC) {
>               /* this should be a queue, but not yet implemented as such */
> -            htifstate->pending_read = val_written;
> -            htifstate->env->mtohost = 0; /* clear to indicate we read */
> +            s->pending_read = val_written;
> +            s->env->mtohost = 0; /* clear to indicate we read */
>               return;
>           } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
> -            qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
> +            qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
>               resp = 0x100 | (uint8_t)payload;
>           } else {
>               qemu_log("HTIF device %d: unknown command\n", device);
> @@ -194,31 +194,31 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>        * With this code disabled, qemu works with bbl priv v1.9.1 and v1.10.
>        * HTIF needs protocol documentation and a more complete state machine.
>        *
> -     *  while (!htifstate->fromhost_inprogress &&
> -     *      htifstate->env->mfromhost != 0x0) {
> +     *  while (!s->fromhost_inprogress &&
> +     *      s->env->mfromhost != 0x0) {
>        *  }
>        */
> -    htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> -    htifstate->env->mtohost = 0; /* clear to indicate we read */
> +    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->env->mtohost = 0; /* clear to indicate we read */
>   }
>   
> -#define TOHOST_OFFSET1 (htifstate->tohost_offset)
> -#define TOHOST_OFFSET2 (htifstate->tohost_offset + 4)
> -#define FROMHOST_OFFSET1 (htifstate->fromhost_offset)
> -#define FROMHOST_OFFSET2 (htifstate->fromhost_offset + 4)
> +#define TOHOST_OFFSET1      (s->tohost_offset)
> +#define TOHOST_OFFSET2      (s->tohost_offset + 4)
> +#define FROMHOST_OFFSET1    (s->fromhost_offset)
> +#define FROMHOST_OFFSET2    (s->fromhost_offset + 4)
>   
>   /* CPU wants to read an HTIF register */
>   static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    HTIFState *htifstate = opaque;
> +    HTIFState *s = opaque;
>       if (addr == TOHOST_OFFSET1) {
> -        return htifstate->env->mtohost & 0xFFFFFFFF;
> +        return s->env->mtohost & 0xFFFFFFFF;
>       } else if (addr == TOHOST_OFFSET2) {
> -        return (htifstate->env->mtohost >> 32) & 0xFFFFFFFF;
> +        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
>       } else if (addr == FROMHOST_OFFSET1) {
> -        return htifstate->env->mfromhost & 0xFFFFFFFF;
> +        return s->env->mfromhost & 0xFFFFFFFF;
>       } else if (addr == FROMHOST_OFFSET2) {
> -        return (htifstate->env->mfromhost >> 32) & 0xFFFFFFFF;
> +        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
>       } else {
>           qemu_log("Invalid htif read: address %016" PRIx64 "\n",
>               (uint64_t)addr);
> @@ -230,25 +230,25 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>   static void htif_mm_write(void *opaque, hwaddr addr,
>                             uint64_t value, unsigned size)
>   {
> -    HTIFState *htifstate = opaque;
> +    HTIFState *s = opaque;
>       if (addr == TOHOST_OFFSET1) {
> -        if (htifstate->env->mtohost == 0x0) {
> -            htifstate->allow_tohost = 1;
> -            htifstate->env->mtohost = value & 0xFFFFFFFF;
> +        if (s->env->mtohost == 0x0) {
> +            s->allow_tohost = 1;
> +            s->env->mtohost = value & 0xFFFFFFFF;
>           } else {
> -            htifstate->allow_tohost = 0;
> +            s->allow_tohost = 0;
>           }
>       } else if (addr == TOHOST_OFFSET2) {
> -        if (htifstate->allow_tohost) {
> -            htifstate->env->mtohost |= value << 32;
> -            htif_handle_tohost_write(htifstate, htifstate->env->mtohost);
> +        if (s->allow_tohost) {
> +            s->env->mtohost |= value << 32;
> +            htif_handle_tohost_write(s, s->env->mtohost);
>           }
>       } else if (addr == FROMHOST_OFFSET1) {
> -        htifstate->fromhost_inprogress = 1;
> -        htifstate->env->mfromhost = value & 0xFFFFFFFF;
> +        s->fromhost_inprogress = 1;
> +        s->env->mfromhost = value & 0xFFFFFFFF;
>       } else if (addr == FROMHOST_OFFSET2) {
> -        htifstate->env->mfromhost |= value << 32;
> -        htifstate->fromhost_inprogress = 0;
> +        s->env->mfromhost |= value << 32;
> +        s->fromhost_inprogress = 0;
>       } else {
>           qemu_log("Invalid htif write: address %016" PRIx64 "\n",
>               (uint64_t)addr);


