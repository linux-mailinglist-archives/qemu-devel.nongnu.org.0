Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040403F4688
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:19:26 +0200 (CEST)
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5Az-0000H2-3x
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI59R-0007pN-8k; Mon, 23 Aug 2021 04:17:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI59P-0006Az-N8; Mon, 23 Aug 2021 04:17:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id e5so8413452wrp.8;
 Mon, 23 Aug 2021 01:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HYUJDP9yQYyEkdl6waq2l9A/E5ben0d9BvzkTQ8q64c=;
 b=nXFNYLrqpBiVNBPCU98lE03zjFyHn2jlGlbfp9kWkAT+jXx8hlsGQ3uf/Pub2ubz62
 PLX+e2S22B24OE2Kc/DLe50uW4g5nhR8UHUJiinXaWwFxH2dBKMBmvfZaav+qDyV/0dY
 lGiCOaRkkdp4vdbHlE/rp9daTe1byr2bvidJKf905wne/jJWeE0rId1lwN6MhTbVsVvR
 BM6JFREAZucgyeb9zFl57lzM1LUdksfyNe9RDi4ZhyOX0geFLEyP2liyA2c25iyAaQMF
 21J9b3GTa3561MnkWvAy5RpYfZwWqv51WAIVtf8eL/A/7XncRKRfK5lj1462ZIhTetMO
 1TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HYUJDP9yQYyEkdl6waq2l9A/E5ben0d9BvzkTQ8q64c=;
 b=oOwi+F6K9T+Hiu+i3M/Ezv32GcfCc/uJ3ac0ULo9b/g4J+J72ey0Uvl+PrDATs0ona
 Ks6ckivrvapjra+1xoS+8XFV7krsAJhB3z78mUO5/F66j+E90+tj5gMLyh1h5q+pePbK
 dyiEpxXx+FJN4nLsFi/ubJKeCQW5I38nUwcoO7ljvUmHghRtux7zahcPK/GpXvIV5+Dp
 I874sZFVeh0XwPfjk2JtevoZQiv3LBXqdHY8FaQrxqk6RSN2LjQglsLyoDvLtJrblS0b
 8FNAABXH0E59ebo74SuJ6jY6ha/appmmVPKTKruSPcfX3OCIy3WUWlPKVAE6r4gAsqpd
 Ig4A==
X-Gm-Message-State: AOAM533OlMHgF8H1f7rIi5VhuQgVZKJzArho8GAiVB0AvBfwRACm4Ywk
 lL2uJY9qQbDyQ1gIs26JyK9iozndiBo=
X-Google-Smtp-Source: ABdhPJxvMrh+HkyP14vb6dRymYNxr+F6e25Y4I10ZG1YkRJs56Gu9UYcnpf4wtMrD2L70YwSX4cEtw==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr12114259wrx.183.1629706665170; 
 Mon, 23 Aug 2021 01:17:45 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z19sm20902669wma.0.2021.08.23.01.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 01:17:44 -0700 (PDT)
Subject: Re: [PATCH 3/3] hw/char: cadence_uart: Move clock/reset check to
 uart_can_receive()
To: Bin Meng <bmeng.cn@gmail.com>, Damien Hedde <damien.hedde@greensocs.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3482fda3-b9fa-7b85-dd4c-d09e71f186a5@amsat.org>
Date: Mon, 23 Aug 2021 10:17:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823020813.25192-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.959,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 4:08 AM, Bin Meng wrote:
> Currently the clock/reset check is done in uart_receive(), but we
> can move the check to uart_can_receive() which is earlier.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
>  hw/char/cadence_uart.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 154be34992..7326445385 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -235,6 +235,12 @@ static void uart_parameters_setup(CadenceUARTState *s)
>  static int uart_can_receive(void *opaque)
>  {
>      CadenceUARTState *s = opaque;
> +
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return 0;
> +    }
> +
>      int ret = MAX(CADENCE_UART_RX_FIFO_SIZE, CADENCE_UART_TX_FIFO_SIZE);
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>  
> @@ -358,11 +364,6 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
>      CadenceUARTState *s = opaque;
>      uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
>  
> -    /* ignore characters when unclocked or in reset */
> -    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> -        return;
> -    }
> -
>      if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
>          uart_write_rx_fifo(opaque, buf, size);
>      }
> 

Almost the same I just sent in patch #2 (minor you declare variables
mid-scope). Drop #2 and use that (or untested snippet) directly instead.

