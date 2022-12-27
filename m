Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B7656D77
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pADt6-0001nV-9v; Tue, 27 Dec 2022 12:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADt5-0001nL-Aa
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:37:15 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pADt3-0000vQ-KR
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:37:14 -0500
Received: by mail-oi1-x236.google.com with SMTP id j130so7315434oif.4
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DaI+Vqtpwt5YJgJss6nbBFL/ah2SLIBJ0GBfTlGkfAM=;
 b=iLPcnuSI0GxbcEuWUva+z8t6WzOE+RPsBorOI4SDqfzA42EWZsUXPRcns8DuxVhp7X
 gzPJ8ohCz5x0fVXvbAIqB+OoexXpLqaVPJNM45tJl+J77bo+PmJ8VPvT2+mam3QdYcm1
 4do75osIAKVTkKEoM0kk1i1aaXsthPX3dx4DCo//xI1CroD4odkxiPY6umtpjzGrPLlr
 CPZ9DdQa6yUJC4r0l/du5HysZ10ykX2LXgjfcKsU78iJXx3tw5IRqEMoqZ3QJnmmYg+S
 RB4BvAlew9Mw3I+kEYOS1wLD8lYNjc9/b3u/rqL8tVl8YBaBMEP7corhf0dt1L5GmP2w
 LMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DaI+Vqtpwt5YJgJss6nbBFL/ah2SLIBJ0GBfTlGkfAM=;
 b=Kk84hFAyDs9nIopNavqUfDVZMqyxIYLiEwTFwdPIuCv8xhUnw68oseL7bHmpZg6DFA
 aCIri+4c/Qjn5bjBuERECj5FWOXUdY5s+06BYfUxGqO5ANmp/DRW3FeTPWITPhdfZUSH
 vyOHHZdcx4Wp8Mr8GWuhyxoRboyzWq/2pAcoW0J5qvgImCoLtl0Zj7I0Qv3rgNcCRNNC
 UMkjyCTL8cDDvPG2kFd8i0SbaqqWIbD7oyiRaJ/r/TRkkZj5Mia+K1+Cab5K2aXFqJvd
 FU0xClvvHV8bG1DeygOPd8j0PnS3Gj36ofHBZSXJ5QsYm/8p4a2PdQxK9WcwIouQTPna
 hRVg==
X-Gm-Message-State: AFqh2koZCJjWxSmFPfthoz3wAooJWkIu/J/mxrOdbfiMgoecho0dIuFL
 DZ/PWgkbSvQb8gvJlnDDhdYiCg==
X-Google-Smtp-Source: AMrXdXv/Sd9WmsOUgfM3JvkCbPNsiQ2wZ+XxHEj56dCJWjnyiUQP6v8rYpZxMle5MVkvYJhVPNFMjw==
X-Received: by 2002:a05:6808:d52:b0:35e:d286:231a with SMTP id
 w18-20020a0568080d5200b0035ed286231amr11341747oik.22.1672162632086; 
 Tue, 27 Dec 2022 09:37:12 -0800 (PST)
Received: from [192.168.68.107] ([177.102.70.162])
 by smtp.gmail.com with ESMTPSA id
 d125-20020acab483000000b0035a921f2093sm6028075oif.20.2022.12.27.09.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 09:37:11 -0800 (PST)
Message-ID: <2cd2e26a-a57b-faea-8d07-cf64a630bdf7@ventanamicro.com>
Date: Tue, 27 Dec 2022 14:37:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 07/12] hw/char: riscv_htif: Support console output via
 proxy syscall
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-8-bmeng@tinylab.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20221227064812.1903326-8-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
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
> At present the HTIF proxy syscall is unsupported. On RV32, only
> device 0 is supported so there is no console device for RV32.
> The only way to implement console funtionality on RV32 is to
> support the SYS_WRITE syscall.
>
> With this commit, the Spike machine is able to boot the 32-bit
> OpenSBI generic image.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>
>   hw/char/riscv_htif.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 3bb0a37a3e..1477fc0090 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -48,6 +48,9 @@
>   #define HTIF_CONSOLE_CMD_GETC   0
>   #define HTIF_CONSOLE_CMD_PUTC   1
>   
> +/* PK system call number */
> +#define PK_SYS_WRITE            64
> +
>   static uint64_t fromhost_addr, tohost_addr;
>   static int address_symbol_set;
>   
> @@ -165,7 +168,19 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>                   int exit_code = payload >> 1;
>                   exit(exit_code);
>               } else {
> -                qemu_log_mask(LOG_UNIMP, "pk syscall proxy not supported\n");
> +                uint64_t syscall[8];
> +                cpu_physical_memory_read(payload, syscall, sizeof(syscall));
> +                if (syscall[0] == PK_SYS_WRITE &&
> +                    syscall[1] == HTIF_DEV_CONSOLE &&
> +                    syscall[3] == HTIF_CONSOLE_CMD_PUTC) {
> +                    uint8_t ch;
> +                    cpu_physical_memory_read(syscall[2], &ch, 1);
> +                    qemu_chr_fe_write(&s->chr, &ch, 1);
> +                    resp = 0x100 | (uint8_t)payload;
> +                } else {
> +                    qemu_log_mask(LOG_UNIMP,
> +                                  "pk syscall proxy not supported\n");
> +                }
>               }
>           } else {
>               qemu_log("HTIF device %d: unknown command\n", device);


