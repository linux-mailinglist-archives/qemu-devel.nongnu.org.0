Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E531EDFD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:09:09 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnjg-00014N-LQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCngl-0007MJ-2u; Thu, 18 Feb 2021 13:06:07 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCngj-0000d0-Dp; Thu, 18 Feb 2021 13:06:06 -0500
Received: by mail-wr1-x42b.google.com with SMTP id f7so2821971wrt.12;
 Thu, 18 Feb 2021 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IICxDKHkTP6azwYJp8zcAIjbjq9bX7UsJ5EUAjWg8F4=;
 b=ZWqxVfePn84d9b2lFWm1rKbbKPWhdt/4nFfC0AQRUfS4tmh7HHQSWkgxybCA40QFY3
 6xfgJN9nxYGiww7LX11dAt1yz9WHG+rYSFrXHMZQuPj2ybFC72mwi54f1XWq5T97P9gp
 RK9X+hmf0b9uRP78B4Du5yveL7bFtEU+BrQVSo0Ey7f0KvuDYBF98ETd30ShGLiSP0Fo
 DkoEQqBiKEt3vfLHPwW3O/k/+hBMEhD9ReMdmb+MffXpzfkJbxfGMxwPA5fV6ClRfWvx
 bKEoN4LR4cj0+7NFJR6Z0XCvrteXDTcyG27KqGL7/Iiv9K45PR0LkFI7/S5tggTAsgrX
 8h+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IICxDKHkTP6azwYJp8zcAIjbjq9bX7UsJ5EUAjWg8F4=;
 b=fXDQme5sklIEndJY7/RDl/nnHIGMSlldKh38+ozu1ew6Tlegg7xNBBwQ7WFrEikXib
 mMkk2ekrfI95c8ER9ZXumcEtjKgQKsuQX1/q59MuUKUtyqhMFe/ueXlco6iQP731UfE5
 9Ja6tneSK16u6Hgau8DFYBuYN91wquU/BopEqybopeQkCnzBcqUWmaUwM0jGFLTGOv9L
 iQj03/wx+SHfiCHIoRYwxdRjOT/rdIFV9DDkwcx+KCN/TBjt0ZNX4r0LZ/e5WZ/w/72Z
 I9I2sQn2DZ/bpON486Y25tXhED5wNoydsDpd/dwKi36rteEQa+3SaZZhqTi6P6WZ5xFx
 UB8Q==
X-Gm-Message-State: AOAM5312njXQW8FjLI+IsQ7qSiKKjOvgP7YhVoTm8Ut5uyLtQr3lP7CL
 +9Ggg1U/oWgYjc/FMVCtqDYwHw9py80=
X-Google-Smtp-Source: ABdhPJyFwQB0H4zn3NTFKNrci5Y+1A3I0n6oUsIv6mNaxVN3PfB4dl6Sl/I58mf2C39YCsBj7nMZbA==
X-Received: by 2002:adf:f089:: with SMTP id n9mr5603062wro.98.1613671562500;
 Thu, 18 Feb 2021 10:06:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l15sm8623662wmh.21.2021.02.18.10.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 10:06:02 -0800 (PST)
Subject: Re: [PATCH v2 6/6] hw/sd: sdhci: Reset the data pointer of
 s->fifo_buffer[] when a different block size is programmed
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-7-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d68d2a11-707f-5640-052d-3ae017fc4771@amsat.org>
Date: Thu, 18 Feb 2021 19:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-7-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Hi Bin,

On 2/16/21 4:46 AM, Bin Meng wrote:
> If the block size is programmed to a different value from the
> previous one, reset the data pointer of s->fifo_buffer[] so that
> s->fifo_buffer[] can be filled in using the new block size in
> the next transfer.
> 
> With this fix, the following reproducer:
> 
> outl 0xcf8 0x80001010
> outl 0xcfc 0xe0000000
> outl 0xcf8 0x80001001
> outl 0xcfc 0x06000000
> write 0xe000002c 0x1 0x05
> write 0xe0000005 0x1 0x02
> write 0xe0000007 0x1 0x01
> write 0xe0000028 0x1 0x10
> write 0x0 0x1 0x23
> write 0x2 0x1 0x08
> write 0xe000000c 0x1 0x01
> write 0xe000000e 0x1 0x20
> write 0xe000000f 0x1 0x00
> write 0xe000000c 0x1 0x32
> write 0xe0000004 0x2 0x0200
> write 0xe0000028 0x1 0x00
> write 0xe0000003 0x1 0x40
> 
> cannot be reproduced with the following QEMU command line:
> 
> $ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
>       -nodefaults -device sdhci-pci,sd-spec-version=3 \
>       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
>       -device sd-card,drive=mydrive -qtest stdio
> 
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
> 
> ---
> 
> Changes in v2:
> - new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a different block size is programmed
> 
>  hw/sd/sdhci.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index d0c8e29..5b86781 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1140,6 +1140,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>          break;
>      case SDHC_BLKSIZE:
>          if (!TRANSFERRING_DATA(s->prnsts)) {
> +            uint16_t blksize = s->blksize;
> +
>              MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
>              MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
>  
> @@ -1151,6 +1153,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>  
>                  s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
>              }
> +
> +            /*
> +             * If the block size is programmed to a different value from
> +             * the previous one, reset the data pointer of s->fifo_buffer[]
> +             * so that s->fifo_buffer[] can be filled in using the new block
> +             * size in the next transfer.
> +             */
> +            if (blksize != s->blksize) {
> +                s->data_count = 0;

I doubt the hardware works that way. Shouldn't we reset the FIFO
each time BLKSIZE is accessed, regardless of its previous value?

> +            }
>          }
>  
>          break;
> 

