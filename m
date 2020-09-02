Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3008D25B0EB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 18:12:49 +0200 (CEST)
Received: from localhost ([::1]:37346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDVNQ-0007iz-1X
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 12:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDVMe-0007FD-RG; Wed, 02 Sep 2020 12:12:00 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDVMc-0001Nq-70; Wed, 02 Sep 2020 12:12:00 -0400
Received: by mail-wr1-x442.google.com with SMTP id g4so10557wrs.5;
 Wed, 02 Sep 2020 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZQ1zJeOs50Sd7bH0Eawzo8mqNG8mASF5eHwM9Dgq690=;
 b=sj0pl481jTPeL9g+25b4VJU6/CCX+DaV89z0Rfg0XXPgAJ1GaPHdg9yMUpzUavJj+a
 6VlPl4utrgRuJRlnOorfbWBo1c9ElqBpe9MefRuX2lI9E/SxuykAEqpzUL8SkjmkeGBk
 /WzP3YWni7b+NuhWpZM3mIdkakAg6mElGNZDhojFsWDyByPnKTtnqVkaVwzBi32dg8aM
 IP7UF2+lOasUD9Y8RNMZ8Yj1oi8HK5GTkBu8xrle1WfzhmrvbEwDaawabTcWjM1h3B+v
 0dpPnkfGPXexurg4JrY4b13F7QgqdHsjhUvSSkJvR+2CvJNSd+/LfXI3YN+u7j441Zvh
 dXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQ1zJeOs50Sd7bH0Eawzo8mqNG8mASF5eHwM9Dgq690=;
 b=ePHP1PGf8Xe8BqR8WD55nHxGZGtSLSnOqhM+U3hrwnFAjPFwejdUPfKg4LryoDMrc8
 AzNRLKCuWhE8964De2biSF78N3bWNY8Huc6vqveCLdafAreuQxoVVPBp07oSQTx+82Kn
 c0GCUeKSivWcSgxiGjV1YT7a7rjykPOHu33aOWFqUhoZ/nzpezOs8blblSBuCL+na37x
 J39TCc7QjATXiRXEXxjMI9RTcNyMOZtqA0IF8yiAXy7qjoJs60+fc02MVyo2eeZGDWDy
 KZ3Wieda5vXbPL98Xbdebgxeqjx8DYVvaaT5CAF4/aqJ1HYiNQhCq8fA6IJFhhkTU0CU
 n4kA==
X-Gm-Message-State: AOAM531qXlHuHJqFfXQVi6KXHwyHIJOgFAJDF/vuNEdoJ677EopIk4Cu
 u0Irw3qY3SYefAslvUPfAIM=
X-Google-Smtp-Source: ABdhPJxw5ICwrUAd1clXogiET1dBBBHXZQkJNqU2im4icMZJ6z3DgZBdbzV5ySduVxPt3KOgCpWwhw==
X-Received: by 2002:adf:c3cc:: with SMTP id d12mr8041456wrg.399.1599063116311; 
 Wed, 02 Sep 2020 09:11:56 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id c6sm235417wrr.15.2020.09.02.09.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 09:11:55 -0700 (PDT)
Subject: Re: [PATCH] sd: sdhci: check data_count is within fifo_buffer
To: P J P <ppandit@redhat.com>
References: <20200827115336.1851276-1-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6337568d-e443-7107-9dcc-ab3ea2296525@amsat.org>
Date: Wed, 2 Sep 2020 18:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827115336.1851276-1-ppandit@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.324,
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
Cc: Ruhr-University <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad,

On 8/27/20 1:53 PM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While doing multi block SDMA, transfer block size may exceed
> the 's->fifo_buffer[s->buf_maxsz]' size. It may leave the
> current element pointer 's->data_count' pointing out of bounds.
> Leading the subsequent DMA r/w operation to OOB access issue.
> Add check to avoid it.
> 
>  -> https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Fsdhci_oob_write1
>  ==1459837==ERROR: AddressSanitizer: heap-buffer-overflow
>  WRITE of size 54722048 at 0x61500001e280 thread T3
>     #0  __interceptor_memcpy (/lib64/libasan.so.6+0x3a71d)
>     #1  flatview_read_continue ../exec.c:3245
>     #2  flatview_read ../exec.c:3278
>     #3  address_space_read_full ../exec.c:3291
>     #4  address_space_rw ../exec.c:3319
>     #5  dma_memory_rw_relaxed ../include/sysemu/dma.h:87
>     #6  dma_memory_rw ../include/sysemu/dma.h:110
>     #7  dma_memory_read ../include/sysemu/dma.h:116
>     #8  sdhci_sdma_transfer_multi_blocks ../hw/sd/sdhci.c:629
>     #9  sdhci_write ../hw/sd/sdhci.c:1097
>     #10 memory_region_write_accessor ../softmmu/memory.c:483
>     ...
> 
> Reported-by: Ruhr-University <bugs-syssec@rub.de>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/sd/sdhci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 1785d7e1f7..155e25ceee 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -604,6 +604,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>                      s->blkcnt--;
>                  }
>              }
> +            if (s->data_count <= begin || s->data_count > s->buf_maxsz) {
> +                break;
> +            }

Thanks for your patch. Note however this kind of security fix hides
the bug in the model, furthermore it makes the model behaves differently
that the real hardware (which we aim to model).

Can you replace by an assert() call instead? Since this should never
happen.

I posted a different fix for this problem (fixing the model bug):
https://www.mail-archive.com/qemu-devel@nongnu.org/msg735715.html
(you already reviewed it, thank you - I still comment it for the
other reviewers).

Regards,

Phil.

>              dma_memory_write(s->dma_as, s->sdmasysad,
>                               &s->fifo_buffer[begin], s->data_count - begin);
>              s->sdmasysad += s->data_count - begin;
> @@ -626,6 +629,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>                  s->data_count = block_size;
>                  boundary_count -= block_size - begin;
>              }
> +            if (s->data_count <= begin || s->data_count > s->buf_maxsz) {
> +                break;
> +            }
>              dma_memory_read(s->dma_as, s->sdmasysad,
>                              &s->fifo_buffer[begin], s->data_count - begin);
>              s->sdmasysad += s->data_count - begin;
> 

