Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E59A656D6A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADlB-00035G-2U; Tue, 27 Dec 2022 12:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADl8-00034s-VR
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:29:03 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADl6-0007p1-VQ
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:29:02 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 v62-20020a4a7c41000000b004a0a214dfbaso2307197ooc.9
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcAkJL5qYE/2cNZU97cnt8nTBKi8NNhp8feEZIQdJhs=;
 b=mtj/kCCpjzcE1sCSUWgc2i/oQpep0QpcNLIyvzIWZFuOwveMnaEg+VwSTUEwoIoSZD
 YRf88XI5/BghIzlJCNWO5h9b5GQLL+B6BVMz7aJi33aaYICnXPwZlLKbn+EjDMJ7C1+n
 pzVRFEPo6pfIN7JRej5OhlWkxf8UA/shcEacCJf2UfL7qNMiHv91DUoIB/hcc1DTURUt
 VM4/wxbw2G2f3OdpI0WhOHI5EdOCssZ2X1fXp3GClcEZAInOHDFgOMH7OC8mv4XeIm/w
 Pm4jcz20xPJwPt8BRUKuINWhayJdBx8agMXOi/o+/OEe5Xot0xzQZomGUWMH8ALw1Dz2
 Vqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcAkJL5qYE/2cNZU97cnt8nTBKi8NNhp8feEZIQdJhs=;
 b=pMlxXnfaxWM2xFmva7qqF/HdB+y3XAoL+JbakqoBkVPKBx5v2P8RxAn5d7Ay1DQDhM
 njYs9cPI/A9sM+wr+PbnGr/X7LjXQX4gP2Sj8SwaFw1ZjHVNILJUR4e/mFXYOtxZwLsS
 WeuCiPTJ/KuyLvNXu/g+GEmPSzSFrE493utxQIC+rpeabOnCVa4v/pLGq0aLTafZMz/Q
 AXrl9gs1/IJt5bNREokkCm8rfiK3LhEMgdvfxE6tDaLPnF7DD+ZtKutNaQKqLI/JV7//
 K4/Tm9PiglPXfthpcOhYeWTllDXq1E2Ipk494pWBU2mChTDcvf30oPQJQbMl/gQfCQlC
 paFw==
X-Gm-Message-State: AFqh2kp3RNomI5tipXAPnrqyLj2A68+HGY9EbnEV6GczGH97xZshON2r
 uXKKDrp6oHf4hANHUOofwFlddA==
X-Google-Smtp-Source: AMrXdXvG89H0UhQfg+VOScgc+WEbegRhLH7awKApcyZYYB7D8FRsGn97dadizygQuKoEaNwKLtMhkw==
X-Received: by 2002:a4a:d0d0:0:b0:4ce:7fda:dc5b with SMTP id
 u16-20020a4ad0d0000000b004ce7fdadc5bmr5432337oor.8.1672162139500; 
 Tue, 27 Dec 2022 09:28:59 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a4a9c0c000000b004a09df5a1dbsm5561920ooj.8.2022.12.27.09.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:28:59 -0800 (PST)
Message-ID: <ae088461-663a-0a08-e34d-79f4a2a2c80e@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:28:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/12] hw/char: riscv_htif: Avoid using magic numbers
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-2-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-2-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc34.google.com
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
> The Spike HTIF is poorly documented. The only relevant info we can
> get from the internet is from Andrew Waterman at [1].
>
> Add a comment block before htif_handle_tohost_write() to explain
> the tohost register format, and use meaningful macros intead of
s/intead/instead

> magic numbers in the codes.
>
> While we are here, corret 2 multi-line comment blocks that have

s/corret/correct


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> wrong format.
>
> Link: https://github.com/riscv-software-src/riscv-isa-sim/issues/364 [1]
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   hw/char/riscv_htif.c | 72 ++++++++++++++++++++++++++++++++------------
>   1 file changed, 52 insertions(+), 20 deletions(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 6577f0e640..088556bb04 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -38,6 +38,16 @@
>           }                                                                      \
>       } while (0)
>   
> +#define HTIF_DEV_SHIFT          56
> +#define HTIF_CMD_SHIFT          48
> +
> +#define HTIF_DEV_SYSTEM         0
> +#define HTIF_DEV_CONSOLE        1
> +
> +#define HTIF_SYSTEM_CMD_SYSCALL 0
> +#define HTIF_CONSOLE_CMD_GETC   0
> +#define HTIF_CONSOLE_CMD_PUTC   1
> +
>   static uint64_t fromhost_addr, tohost_addr;
>   static int address_symbol_set;
>   
> @@ -81,9 +91,11 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
>           return;
>       }
>   
> -    /* TODO - we need to check whether mfromhost is zero which indicates
> -              the device is ready to receive. The current implementation
> -              will drop characters */
> +    /*
> +     * TODO - we need to check whether mfromhost is zero which indicates
> +     *        the device is ready to receive. The current implementation
> +     *        will drop characters
> +     */
>   
>       uint64_t val_written = htifstate->pending_read;
>       uint64_t resp = 0x100 | *buf;
> @@ -110,10 +122,30 @@ static int htif_be_change(void *opaque)
>       return 0;
>   }
>   
> +/*
> + * See below the tohost register format.
> + *
> + * Bits 63:56 indicate the "device".
> + * Bits 55:48 indicate the "command".
> + *
> + * Device 0 is the syscall device, which is used to emulate Unixy syscalls.
> + * It only implements command 0, which has two subfunctions:
> + * - If bit 0 is clear, then bits 47:0 represent a pointer to a struct
> + *   describing the syscall.
> + * - If bit 1 is set, then bits 47:1 represent an exit code, with a zero
> + *   value indicating success and other values indicating failure.
> + *
> + * Device 1 is the blocking character device.
> + * - Command 0 reads a character
> + * - Command 1 writes a character from the 8 LSBs of tohost
> + *
> + * For RV32, the tohost register is zero-extended, so only device=0 and
> + * command=0 (i.e. HTIF syscalls/exit codes) are supported.
> + */
>   static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>   {
> -    uint8_t device = val_written >> 56;
> -    uint8_t cmd = val_written >> 48;
> +    uint8_t device = val_written >> HTIF_DEV_SHIFT;
> +    uint8_t cmd = val_written >> HTIF_CMD_SHIFT;
>       uint64_t payload = val_written & 0xFFFFFFFFFFFFULL;
>       int resp = 0;
>   
> @@ -125,9 +157,9 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>        * 0: riscv-tests Pass/Fail Reporting Only (no syscall proxy)
>        * 1: Console
>        */
> -    if (unlikely(device == 0x0)) {
> +    if (unlikely(device == HTIF_DEV_SYSTEM)) {
>           /* frontend syscall handler, shutdown and exit code support */
> -        if (cmd == 0x0) {
> +        if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
>               if (payload & 0x1) {
>                   /* exit code */
>                   int exit_code = payload >> 1;
> @@ -138,14 +170,14 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>           } else {
>               qemu_log("HTIF device %d: unknown command\n", device);
>           }
> -    } else if (likely(device == 0x1)) {
> +    } else if (likely(device == HTIF_DEV_CONSOLE)) {
>           /* HTIF Console */
> -        if (cmd == 0x0) {
> +        if (cmd == HTIF_CONSOLE_CMD_GETC) {
>               /* this should be a queue, but not yet implemented as such */
>               htifstate->pending_read = val_written;
>               htifstate->env->mtohost = 0; /* clear to indicate we read */
>               return;
> -        } else if (cmd == 0x1) {
> +        } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
>               qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
>               resp = 0x100 | (uint8_t)payload;
>           } else {
> @@ -157,15 +189,15 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>               " payload: %016" PRIx64, device, cmd, payload & 0xFF, payload);
>       }
>       /*
> -     * - latest bbl does not set fromhost to 0 if there is a value in tohost
> -     * - with this code enabled, qemu hangs waiting for fromhost to go to 0
> -     * - with this code disabled, qemu works with bbl priv v1.9.1 and v1.10
> -     * - HTIF needs protocol documentation and a more complete state machine
> -
> -        while (!htifstate->fromhost_inprogress &&
> -            htifstate->env->mfromhost != 0x0) {
> -        }
> -    */
> +     * Latest bbl does not set fromhost to 0 if there is a value in tohost.
> +     * With this code enabled, qemu hangs waiting for fromhost to go to 0.
> +     * With this code disabled, qemu works with bbl priv v1.9.1 and v1.10.
> +     * HTIF needs protocol documentation and a more complete state machine.
> +     *
> +     *  while (!htifstate->fromhost_inprogress &&
> +     *      htifstate->env->mfromhost != 0x0) {
> +     *  }
> +     */
>       htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
>       htifstate->env->mtohost = 0; /* clear to indicate we read */
>   }
> @@ -196,7 +228,7 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>   
>   /* CPU wrote to an HTIF register */
>   static void htif_mm_write(void *opaque, hwaddr addr,
> -                            uint64_t value, unsigned size)
> +                          uint64_t value, unsigned size)
>   {
>       HTIFState *htifstate = opaque;
>       if (addr == TOHOST_OFFSET1) {


