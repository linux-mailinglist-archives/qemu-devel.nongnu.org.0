Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D131EC3E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:31:41 +0100 (CET)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmDL-0001LN-OK
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCm7q-0005aw-0L; Thu, 18 Feb 2021 11:25:58 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCm7o-0006MY-BQ; Thu, 18 Feb 2021 11:25:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so3658768wry.2;
 Thu, 18 Feb 2021 08:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PTK2JQEoIqPfEOv06pcQDq0CzYsJPHfcnHh715ApiLs=;
 b=L0FBuB3LLiIsaCzmIWsK9nfteVF+5SkrRlTRyHqpVssCUoWAy5EI0OYPm6/FrDg1vO
 Lgbe/asM6mFowSD68IkDjWe5Q204xsqHGUsK9fXNOZwcCqrXa/YJllQR0YkfUsfsi6lE
 jUNeGQcRPH6fQk38g+a/npjc8hdoCUzqRr0u4ca6Zj5Ow8IwMt9hlwWh1XRrHUNVgb4l
 9kz0DMsaDd758F9WZpFHgJNO8/a9r9FXza2ne0heARDstBwzRVNYkThhPOhd9CODtv4w
 rbd6bGGQJrmAnPRenyPv0EhO7AJex782ZiEbhvriHjFhdOsFpL4NE3yapOuVLQPr7pgG
 9lUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PTK2JQEoIqPfEOv06pcQDq0CzYsJPHfcnHh715ApiLs=;
 b=KHhh2zsTtJ7CZA/DXQp1cFkPqkNiRuU/avwhN0Vz6pzH3e68vaD2FASS8v2hIoIInA
 PqCmj1sUzbNmzQsBkP/hGlyzle21CVRtjPmJOU8/C3XUKZsdRCIURk7iebK9hE++FP6x
 H28VfxhExEwnU13eQ8IWBbzbZqkn3FU0wjXn7BMgBEAk4YR4LbLqnWCLWXZ0rW/KrHbD
 tYmO2NkfkwBIefNImHPPVJZ4Ud02/q1l09Qr7Lhw6GVWWwwSOHHg8WcUhLd6/JQpzHG5
 0zVy16JVI8sP3VGA7wxgmyzSs31/0zlTl5Jf3N2jb+3gkuCBlYG76ZZNRiNJPKz+STJ+
 dBOw==
X-Gm-Message-State: AOAM530d3/cGAs12y3cvUwx5H/wFrYSsd54skoX6hpe0mbiB4cme20kc
 KiGwFSBq8oJubMZPobrp6X65hpSbTVQ=
X-Google-Smtp-Source: ABdhPJxeltf2CBUzAFhw5wdEB9YxgNV8g3YJjrpN9jcWun04qvtgEDWLJa5IgbvrraDI0uBazEbB2g==
X-Received: by 2002:a5d:570a:: with SMTP id a10mr5272265wrv.70.1613665553859; 
 Thu, 18 Feb 2021 08:25:53 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm8792137wmh.2.2021.02.18.08.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:25:53 -0800 (PST)
Subject: Re: [PATCH v2 1/6] hw/sd: sdhci: Don't transfer any data when command
 time out
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-2-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4312d31e-d533-74e8-c4d4-107faf785dee@amsat.org>
Date: Thu, 18 Feb 2021 17:25:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-2-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:46 AM, Bin Meng wrote:
> At the end of sdhci_send_command(), it starts a data transfer if the
> command register indicates data is associated. But the data transfer
> should only be initiated when the command execution has succeeded.
> 
> With this fix, the following reproducer:
> 
> outl 0xcf8 0x80001810
> outl 0xcfc 0xe1068000
> outl 0xcf8 0x80001804
> outw 0xcfc 0x7
> write 0xe106802c 0x1 0x0f
> write 0xe1068004 0xc 0x2801d10101fffffbff28a384
> write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
> write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
> write 0xe1068003 0x1 0xfe
> 
> cannot be reproduced with the following QEMU command line:
> 
> $ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
>       -device sdhci-pci,sd-spec-version=3 \
>       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
>       -device sd-card,drive=mydrive \
>       -monitor none -serial none -qtest stdio

Can you directly add the reproducer in tests/qtest/fuzz-sdhci-test.c
instead, similarly to tests/qtest/fuzz-test.c?

> Cc: qemu-stable@nongnu.org
> Fixes: CVE-2020-17380
> Fixes: CVE-2020-25085
> Fixes: CVE-2021-3409
> Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
> Reported-by: Muhammad Ramdhan
> Reported-by: Sergej Schumilo (Ruhr-University Bochum)
> Reported-by: Simon Wrner (Ruhr-University Bochum)
> Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> 
> (no changes since v1)
> 
>  hw/sd/sdhci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 8ffa539..1c5ab26 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -326,6 +326,7 @@ static void sdhci_send_command(SDHCIState *s)
>      SDRequest request;
>      uint8_t response[16];
>      int rlen;
> +    bool timeout = false;
>  
>      s->errintsts = 0;
>      s->acmd12errsts = 0;
> @@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
>              trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
>                                     s->rspreg[1], s->rspreg[0]);
>          } else {
> +            timeout = true;
>              trace_sdhci_error("timeout waiting for command response");
>              if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
>                  s->errintsts |= SDHC_EIS_CMDTIMEOUT;
> @@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
>  
>      sdhci_update_irq(s);
>  
> -    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
> +    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {

No need to add 'timeout':

       if ((s->errintsts & SDHC_EIS_CMDTIMEOUT)
               && s->blksize
               && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {

>          s->data_count = 0;
>          sdhci_data_transfer(s);
>      }
> 

