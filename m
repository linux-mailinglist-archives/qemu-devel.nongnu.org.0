Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CCB31EC4D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:37:18 +0100 (CET)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmIn-0006sH-IO
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmFd-0004RS-1d; Thu, 18 Feb 2021 11:34:01 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmFa-0001bB-Vf; Thu, 18 Feb 2021 11:34:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id w4so4322065wmi.4;
 Thu, 18 Feb 2021 08:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o/7mkDL56wLB/FsxxnFPGbpFqQWURDjfXMCrXu9/xR8=;
 b=ZuahQco42N5Ow/UpDxkT4s74n6N3gJQO4DgmpdPTQFFGzmYCHFcov7AbLDiX5tb9i4
 8JATumDcP1Ra2ydOXVWMHLCcUK0fmEcQmKtZie18nh/CVPo2UxKftp36hVuLdvhYg3/L
 0bL5JmqShPtrep9SdVO7O+pg9H0yukPdHqvB1O+DT3ft3qijomLFoG8Pj5OkE/a7gzpB
 eE/3gGP+9RO7z4ycmiG1awWuPRo/ruqybbOUbMQazxwjKAITPxfRzjGWBDYFqxBhzA4i
 VWr7tS2vNBmzezzkgfMOS9HuYWpNRRthb/Zkhz8fM7JIUIrs2mf2vj6wzuxbtMiE4ph7
 YFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o/7mkDL56wLB/FsxxnFPGbpFqQWURDjfXMCrXu9/xR8=;
 b=i4BD8q2NaOQy6k6ceOR0bAQcieiBPuDulMH8SxqjuZyTxBQvuqdMylC22/MCTenaSe
 Yaqe/JoTtytdM8rqQGmOd6/LqWcnpWspyoxNBuZOTWoNcyIySHFhwRPaBH+wab2Cdc/J
 bU9Q4F8qT/aOfNOGI2YWMxk6Y80YbS5e+u/MpXaqOOZiq8I6OB9iCN3Qg4y8/zh0HWlF
 PHihYuPXkSbX4vEvL6Rs6oTbUoUI9mgyRhfj97o3e7XvoRBp5/8BmsfP8QQb8Xp/9ys3
 B7E9Eph0wSPDy42WuTMdQdz8PJ+B2yjNS1IlfCZnyg/2sHGv/Wk4jAC/5pmnrfuOi/T9
 lwUA==
X-Gm-Message-State: AOAM530GxJ6ejhPEOKyfdouE6be8XUrQP95JZ07ZGOK4PNfZvm3P1XhW
 LFPbqVHD3YdVxHyOYYZYieFSNCaVjJQ=
X-Google-Smtp-Source: ABdhPJye+oPJKm2oDyWHDm1FGGAIkl3XNtqAmrmzM5fsACgWM7r3lRi7U2QzfVjx0hPHeDRpIf6YJg==
X-Received: by 2002:a7b:cb4f:: with SMTP id v15mr4395231wmj.162.1613666036310; 
 Thu, 18 Feb 2021 08:33:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 13sm8333378wmj.11.2021.02.18.08.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:33:55 -0800 (PST)
Subject: Re: [PATCH v2 2/6] hw/sd: sdhci: Don't write to SDHC_SYSAD register
 when transfer is in progress
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dff0be18-6721-c1b4-e08c-138a26909b68@amsat.org>
Date: Thu, 18 Feb 2021 17:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-3-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
> Per "SD Host Controller Standard Specification Version 7.00"
> chapter 2.2.1 SDMA System Address Register:
> 
> This register can be accessed only if no transaction is executing
> (i.e., after a transaction has stopped).
> 
> With this fix, the following reproducer:
> 
> https://paste.debian.net/plain/1185137

The reproducer is not huge, so better bury it with the commit
description:

outl 0xcf8 0x80001010
outl 0xcfc 0xfbefff00
outl 0xcf8 0x80001001
outl 0xcfc 0x06000000
write 0xfbefff2c 0x1 0x05
write 0xfbefff0f 0x1 0x37
write 0xfbefff0a 0x1 0x01
write 0xfbefff0f 0x1 0x29
write 0xfbefff0f 0x1 0x02
write 0xfbefff0f 0x1 0x03
write 0xfbefff04 0x1 0x01
write 0xfbefff05 0x1 0x01
write 0xfbefff07 0x1 0x02
write 0xfbefff0c 0x1 0x33
write 0xfbefff0e 0x1 0x20
write 0xfbefff0f 0x1 0x00
write 0xfbefff2a 0x1 0x01
write 0xfbefff0c 0x1 0x00
write 0xfbefff03 0x1 0x00
write 0xfbefff05 0x1 0x00
write 0xfbefff2a 0x1 0x02
write 0xfbefff0c 0x1 0x32
write 0xfbefff01 0x1 0x01
write 0xfbefff02 0x1 0x01
write 0xfbefff03 0x1 0x01

> cannot be reproduced with the following QEMU command line:
> 
> $ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
>        -nodefaults -device sdhci-pci,sd-spec-version=3 \
>        -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
>        -device sd-card,drive=mydrive -qtest stdio

and even better add as qtest in tests/qtest/fuzz-sdhci-test.c :)

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
> ---
> 
> (no changes since v1)
> 
>  hw/sd/sdhci.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 1c5ab26..05cb281 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1122,15 +1122,17 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>  
>      switch (offset & ~0x3) {
>      case SDHC_SYSAD:
> -        s->sdmasysad = (s->sdmasysad & mask) | value;
> -        MASKED_WRITE(s->sdmasysad, mask, value);
> -        /* Writing to last byte of sdmasysad might trigger transfer */
> -        if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
> -                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
> -            if (s->trnmod & SDHC_TRNS_MULTI) {
> -                sdhci_sdma_transfer_multi_blocks(s);
> -            } else {
> -                sdhci_sdma_transfer_single_block(s);
> +        if (!TRANSFERRING_DATA(s->prnsts)) {
> +            s->sdmasysad = (s->sdmasysad & mask) | value;
> +            MASKED_WRITE(s->sdmasysad, mask, value);
> +            /* Writing to last byte of sdmasysad might trigger transfer */
> +            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
> +                SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
> +                if (s->trnmod & SDHC_TRNS_MULTI) {
> +                    sdhci_sdma_transfer_multi_blocks(s);
> +                } else {
> +                    sdhci_sdma_transfer_single_block(s);
> +                }

Can you add:

     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Transfer already in progress, can not update
SYSAD",
                       __func__);

>              }
>          }
>          break;
> 

