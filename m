Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80516309B62
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 11:44:26 +0100 (CET)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ADR-0000kn-JL
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 05:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ACE-0008UL-FC; Sun, 31 Jan 2021 05:43:10 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ACC-0001Ol-RR; Sun, 31 Jan 2021 05:43:10 -0500
Received: by mail-wr1-x433.google.com with SMTP id g10so13405512wrx.1;
 Sun, 31 Jan 2021 02:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QxB7I+r8+V4xA23p+DNTd+vmCSZ/WgkR+HXPJJCiVFg=;
 b=kKco8a5xVmIoRQNh4Gaz1exxGF39CTNEQsqic2Z85/xjkyaDO1+41bGtQef0/WCAZC
 2JCvt0sKU2I/LxtmuHMQuSNnjjFel29+sTL0iHUEqw1RGJxVjokMX0VkfAJySfXKFeKu
 O97iIPqFQcGWzk3myqJnXn5p1iS8ccmqH8aLDxZ/93K5ryPChR6Nk6WRmCvk1pOXzXyW
 cnqq1Oezyce0CGjyCHdt2JfT8yu6r96V9A8FMNKZHbHnN4A4WKqP4fGxEcgouWUAb0sn
 2g4/013DKuGlonFz1OkBFna7vaIgP8m4kKNP3CgPlLwc9difVZxw0f05PuOQYZ+Z9BcH
 FN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxB7I+r8+V4xA23p+DNTd+vmCSZ/WgkR+HXPJJCiVFg=;
 b=MkdSwTkkY4qsQnZ68VhVaFa431gdSNKwLeb64CUfA768+Im8Pr/jXRsbMS1JO0mOZs
 4lz8XNldD4EFWLm6OPZzM79NWp2B78hNc/KmEjxkYA4OYyriAOwDxl5m61vQ1G8P0dAD
 PPXoh9d8XBC7zZ1Wvn9PnKaEbHKCStg93l3qMGgJ/BpchTMJkC4H99fCvJIJosXhUtxk
 FAvV0KAYYs8vUlieJWY4yxPrzQzo3SF4gFQuP1v+Oi8h6JaJPvzFTtoThlRGVohyc3nv
 8D8WnS5HLnRy5UbnIGntheyHz+HZ6+ztlQc/iZIhtf4oSKG3/31E39Fk6ukqfR0Q3Q2Y
 cRAA==
X-Gm-Message-State: AOAM530lxXlqDfFjNkFksrgxs3rvFhbo6Q+BU7IE/6Ft4dy8X7xuyop0
 zChe0uUEu/7Kg43xkqKswMs=
X-Google-Smtp-Source: ABdhPJxf15RYUCFfHcDBrg+oru1D4DK/U6JAuNFA1H4N61utPKYmCHXCAn18f5Dvpb9FjtjRjt/DHA==
X-Received: by 2002:adf:9523:: with SMTP id 32mr13561898wrs.361.1612089786157; 
 Sun, 31 Jan 2021 02:43:06 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m12sm17978586wmc.10.2021.01.31.02.43.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 02:43:05 -0800 (PST)
Subject: Re: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
To: qemu-devel@nongnu.org
References: <20210131103401.217160-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
Date: Sun, 31 Jan 2021 11:43:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131103401.217160-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, Prasad J Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 11:34 AM, Philippe Mathieu-Daudé wrote:
> Per the ARM Generic Interrupt Controller Architecture specification
> (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
> not 10:
> 
>   - 4.3 Distributor register descriptions
>   - 4.3.15 Software Generated Interrupt Register, GICD_SG
> 
>     - Table 4-21 GICD_SGIR bit assignments
> 
>     The Interrupt ID of the SGI to forward to the specified CPU
>     interfaces. The value of this field is the Interrupt ID, in
>     the range 0-15, for example a value of 0b0011 specifies
>     Interrupt ID 3.
> 
> Correct the irq mask to fix an undefined behavior (which eventually
> lead to a heap-buffer-overflow, see [Buglink]):
> 
>    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
>    [I 1612088147.116987] OPENED
>   [R +0.278293] writel 0x8000f00 0xff4affb0
>   ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
>   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 9ee6e8bb853 ("ARMv7 support.")
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913916

Also:
Buglink: https://bugs.launchpad.net/qemu/+bug/1913917

> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Isnt it worth a CVE to help distributions track backports?
> ---
>  hw/intc/arm_gic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index af41e2fb448..75316329516 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1476,7 +1476,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
>          int target_cpu;
>  
>          cpu = gic_get_current_cpu(s);
> -        irq = value & 0x3ff;
> +        irq = value & 0xf;
>          switch ((value >> 24) & 3) {
>          case 0:
>              mask = (value >> 16) & ALL_CPU_MASK;
> 

