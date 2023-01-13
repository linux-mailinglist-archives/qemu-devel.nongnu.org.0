Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADA668863
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 01:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG7up-0008Rt-1Z; Thu, 12 Jan 2023 19:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pG7um-0008Qz-VJ; Thu, 12 Jan 2023 19:27:24 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pG7ul-0008OY-0L; Thu, 12 Jan 2023 19:27:24 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 f88-20020a9d03e1000000b00684c4041ff1so1799004otf.8; 
 Thu, 12 Jan 2023 16:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=iETZ/ppT1I5S+FDAOeF6ilEfn66LFjmIhqXZeNfMOQo=;
 b=i9Gs07Too9OiCIpFoygg7wZYVoCJU5C0YhjpQu7bJ9yvaq870mjaKpeYDzVSPotzk5
 ow1YinMmit7F+gBuzHOjz+0V4MLJZY55q4AoQ6XHf8hmt7n7p07Bmmvuhqbj9I2VBen2
 xJiiyOptPi1fhINwtY6CSt4wRhS3uOfNvWob5vh4lBgFKzaTmvfTsGs9IwcxTYt12CYQ
 /Q0GF73ZfRStl3Yn9og9IZND4kEbbkPqV2vqbFrPj9uclXiUR1ag2ssLbrtYxP4mRmKA
 npXqJRyuqZMW5yrYqlbYhK5zK6IvP9bLeRh3s+Hmd9rgIxEzq/hCXdoB32w+ZzkG5zim
 my8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iETZ/ppT1I5S+FDAOeF6ilEfn66LFjmIhqXZeNfMOQo=;
 b=UNshriTJ2qSolNOJps7D0mN0U3WZGDW93/83fRMIblsZRyOdxYjcBbhpSmqIzSHQcr
 9cZQcrS7e2JOb4MvyYp3ImnA5FXqrXFeqb5n29MyVPsxdxCOjSwPA+8etWXdOWpA0g1o
 y2Don3WhDbXP2HLfjW2Ldmj4y2dNd3OR7bHcD+ZDyc2T5KPwsxET41mR73MPJhE3c7Bt
 YBQhQOv6Fj/xK4kxE1CshalKbvzpN04MStroD8hVzMzxuzVipZ90S0Br+6/MzWoXBZYy
 qaFBQFnyiuDyQ1Kd3XFVHV9aNrDxEQD8L6F22SN/gJlnOcwauh/LmyqsZVZDvfk0UAhj
 RQvw==
X-Gm-Message-State: AFqh2kpKzSbQvuQSnHkKJyO/R4EGzXrIWfiLwPhZIeR7pBwxLz7tBGrb
 KoaURwg38LQB8o9nGpiUGos=
X-Google-Smtp-Source: AMrXdXuLQjE1Djl4rb4iLWrQ/B9nfjKbjbCMs+IYHFztCHzs748rsNQI8FVNiSXoMreCawjrCVUxzA==
X-Received: by 2002:a05:6830:380c:b0:66e:73ae:547e with SMTP id
 bh12-20020a056830380c00b0066e73ae547emr46378578otb.1.1673569641196; 
 Thu, 12 Jan 2023 16:27:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a9d621a000000b0066ca9001e68sm9787394otj.5.2023.01.12.16.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 16:27:20 -0800 (PST)
Message-ID: <93ddcedd-d419-81ee-466b-a5285c45ed36@roeck-us.net>
Date: Thu, 12 Jan 2023 16:27:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <Y8AG21o/9/3eUMIg@cormorant.local>
 <Y8A2qdbDZPicuZfL@kbusch-mbp.dhcp.thefacebook.com>
 <Y8BHUzcbdQ/SFBY9@cormorant.local>
 <Y8BfJdTiHlaPdddR@kbusch-mbp.dhcp.thefacebook.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y8BfJdTiHlaPdddR@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.067, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/12/23 11:27, Keith Busch wrote:
> On Thu, Jan 12, 2023 at 06:45:55PM +0100, Klaus Jensen wrote:
>> On Jan 12 09:34, Keith Busch wrote:
>>> On Thu, Jan 12, 2023 at 02:10:51PM +0100, Klaus Jensen wrote:
>>>>
>>>> The pin-based interrupt logic in hw/nvme seems sound enough to me, so I
>>>> am wondering if there is something going on with the kernel driver (but
>>>> I certainly do not rule out that hw/nvme is at fault here, since
>>>> pin-based interrupts has also been a source of several issues in the
>>>> past).
>>>
>>> Does it work if you change the pci_irq_assert() back to pci_irq_pulse()?
>>> While probably not the "correct" thing to do, it has better results in
>>> my testing.
>>>
>>
>> A simple s/pci_irq_assert/pci_irq_pulse broke the device. However,
>>
>> 	diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
>> 	index 03760ddeae8c..0fc46dcb9ec4 100644
>> 	--- i/hw/nvme/ctrl.c
>> 	+++ w/hw/nvme/ctrl.c
>> 	@@ -477,6 +477,7 @@ static void nvme_irq_check(NvmeCtrl *n)
>> 		 return;
>> 	     }
>> 	     if (~intms & n->irq_status) {
>> 	+        pci_irq_deassert(&n->parent_obj);
>> 		 pci_irq_assert(&n->parent_obj);
>> 	     } else {
>> 		 pci_irq_deassert(&n->parent_obj);
>>
>>
>> seems to do the trick (pulse is the other way around, assert, then
>> deassert).
>>
>> Probably not the "correct" thing to do, but I'll take it since it seems
>> to fix it. On a simple boot loop I got the timeout about 1 out of 5. I'm
>> on ~20 runs now and have not encountered it.
>>
>> I'll see if I can set up a mips rootfs and test that. Guenter, what MIPS
>> machine/board(s) are you testing?
> 
> Could you try the below?
> 

This works as well: 50 iterations with no failures after applying the patch
below on top of qemu v7.2.0. Tested with qemu-system-mipsel.

Guenter

> ---
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 2c85de4700..521c3c80c1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -558,6 +558,20 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue *cq)
>       }
>   }
>   
> +static void nvme_irq_pulse(NvmeCtrl *n, NvmeCQueue *cq)
> +{
> +    if (!cq->irq_enabled) {
> +        return;
> +    }
> +
> +    if (msix_enabled(&(n->parent_obj))) {
> +        msix_notify(&(n->parent_obj), cq->vector);
> +        return;
> +    }
> +
> +    pci_irq_pulse(&n->parent_obj);
> +}
> +
>   static void nvme_req_clear(NvmeRequest *req)
>   {
>       req->ns = NULL;
> @@ -6917,6 +6931,12 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr, int val)
>               }
>   
>               nvme_irq_deassert(n, cq);
> +        } else {
> +            /*
> +             * Retrigger the irq just to make sure the host has no excuse for
> +             * not knowing there's more work to complete on this CQ.
> +             */
> +            nvme_irq_pulse(n, cq);
>           }
>       } else {
>           /* Submission queue doorbell write */
> --


