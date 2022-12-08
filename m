Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D1F6477D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 22:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3OGW-0003Nj-R8; Thu, 08 Dec 2022 16:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3OGD-0003Kh-3K
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 16:17:06 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p3OG9-00072k-Oo
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 16:16:52 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso3305432fac.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 13:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=f5QAMfEb5MdTWtPGoc4SIpAdAZSgBjuWw2FmCUtBADw=;
 b=V4wVOXZuv1F7nK1G7X7x7N2sGOqQ5EETFgmuDWBke+QPbJ3c1rhyU2rOpjPSuANFwu
 Z+XUUQQMZvTB0AeNlmYsBFDHoaO0+s22Xm0U3Er3bhA4BS0AZtuAobwoRIbzFMAUNHua
 2cx4wxcgbCN78fr57e1P18bJ0i1cKeT/7pn+BjRonQ77d1CQQqaq8cpmIzVJ64HSEMy+
 lyR1qGRSvDdNlMpJ+AcGZG/d6bdFXgsj2cKRvREHdimIgVUDVn9n0S9TnG+TtiVB7rR5
 LwEvjMh0fA5GRC7YJpBjQPCBvhmkUPzF6BD9LK8Gs7xC3vcuNJWw24e7QldKBDL8gWry
 RZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f5QAMfEb5MdTWtPGoc4SIpAdAZSgBjuWw2FmCUtBADw=;
 b=yOWM7VCib3RWHc92s2HVBOQ7nzUwsmOUFstGeUVxcNb7n1iA9RW0ozjIzuBfvNIvCL
 g9TDTt9w7rE0gCLYPuBrRl0biWYJPke7cWUaU2/J8pIsGcVU6ib75ASSLELyrrUl9gnt
 m5DiYiw+z+SA3kIKrSDLlGi0vpikJmrWC8SVvOYosiWJLuxrm6ZKub9mc0sv3D8669VS
 ccjYr5UO5hskgNR7e+OXwQEVSYOhD+EH7Wcfr65OxDE2eU1jU+XvaA/q/v76hioYQh5U
 lDALZmtlgBz2a/By5eHOSmvVY9W3tzQrAEeS4m1v6x3FZRsJ9YmJoay0pR+ixuNc5ptY
 bXFA==
X-Gm-Message-State: ANoB5pkYfboB0gwtGoB4mgIGHaANFqO/P2FJoq6Lp3f36V7BWQQP4SsI
 KouPmsEip4pO3FODt3ntgGE=
X-Google-Smtp-Source: AA0mqf7BdqA9eT7lV9+c8/XICrPMAd0kRi/mRgktb9NWKLeznlwIGOdN/dA775Su+GIfACNXMB1Ibw==
X-Received: by 2002:a05:6871:4609:b0:143:882a:9a6 with SMTP id
 nf9-20020a056871460900b00143882a09a6mr30852410oab.219.1670534208042; 
 Thu, 08 Dec 2022 13:16:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 ay19-20020a056808301300b00354b0850fb6sm11154392oib.33.2022.12.08.13.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 13:16:47 -0800 (PST)
Message-ID: <9f72765e-0d2d-84dc-1365-60770559eb75@roeck-us.net>
Date: Thu, 8 Dec 2022 13:16:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
To: Keith Busch <keith.busch@gmail.com>
Cc: Klaus Jensen <its@irrelevant.dk>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net> <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local> <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
 <CAOSXXT40pBgP-ObMwK3d_=yRmQC8AH_mXrNJhb2XqdDMr8-uzg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAOSXXT40pBgP-ObMwK3d_=yRmQC8AH_mXrNJhb2XqdDMr8-uzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.229, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.266,
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

On 12/8/22 12:28, Keith Busch wrote:
> When the request times out, the kernel should be printing the command ID. What does that say? The driver thinks the 0 is invalid, so I'm just curious what value it's expecting.
> 

After some time I see the following.

...
[   88.071197] nvme nvme0: invalid id 0 completed on queue 1
[   88.071514] could not locate request for tag 0x0
[   88.071802] nvme nvme0: invalid id 0 completed on queue 1
[   88.072135] could not locate request for tag 0x0
[   88.072426] nvme nvme0: invalid id 0 completed on queue 1
[   88.072720] could not locate request for tag 0x0
[   88.073007] nvme nvme0: invalid id 0 completed on queue 1
[   88.073343] nvme nvme0: request 0x50 genctr mismatch (got 0x0 expected 0x1)
[   88.073774] nvme nvme0: invalid id 80 completed on queue 1
[   88.074127] nvme nvme0: request 0x4f genctr mismatch (got 0x0 expected 0x1)
[   88.074556] nvme nvme0: invalid id 79 completed on queue 1
[   88.074903] nvme nvme0: request 0x4e genctr mismatch (got 0x0 expected 0x1)
[   88.075318] nvme nvme0: invalid id 78 completed on queue 1
[   88.075803] nvme nvme0: request 0x45 genctr mismatch (got 0x0 expected 0x1)
[   88.076239] nvme nvme0: invalid id 69 completed on queue 1
[   88.076585] nvme nvme0: request 0x46 genctr mismatch (got 0x0 expected 0x1)
[   88.076990] nvme nvme0: invalid id 70 completed on queue 1
[   88.077314] nvme nvme0: request 0x47 genctr mismatch (got 0x0 expected 0x1)
[   88.077744] nvme nvme0: invalid id 71 completed on queue 1
[   88.078064] nvme nvme0: request 0x48 genctr mismatch (got 0x0 expected 0x1)
[   88.078465] nvme nvme0: invalid id 72 completed on queue 1
[   88.078792] nvme nvme0: request 0x49 genctr mismatch (got 0x0 expected 0x1)
[   88.079190] nvme nvme0: invalid id 73 completed on queue 1
[   88.079522] nvme nvme0: request 0x4a genctr mismatch (got 0x0 expected 0x1)
[   88.079918] nvme nvme0: invalid id 74 completed on queue 1
[   88.080243] nvme nvme0: request 0x4b genctr mismatch (got 0x0 expected 0x1)
[   88.080630] nvme nvme0: invalid id 75 completed on queue 1
[   88.080963] nvme nvme0: request 0x4c genctr mismatch (got 0x0 expected 0x1)
[   88.081361] nvme nvme0: invalid id 76 completed on queue 1
[   88.081687] nvme nvme0: request 0x4d genctr mismatch (got 0x0 expected 0x1)
[   88.082081] nvme nvme0: invalid id 77 completed on queue 1
[   89.061345] irq 9: nobody cared (try booting with the "irqpoll" option)
[   89.061794] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.1.0-rc8+ #1
[   89.062220] Call Trace:
[   89.062383] [<0000000000eb7518>] __report_bad_irq+0x38/0xb4
[   89.062685] [<00000000004e6e58>] note_interrupt+0x318/0x380
[   89.063000] [<00000000004e2f00>] handle_irq_event+0x80/0xc0
[   89.063296] [<00000000004e7e10>] handle_fasteoi_irq+0x90/0x220
[   89.063631] [<00000000004e18e8>] generic_handle_irq+0x28/0x40
[   89.063946] [<0000000000ede2ec>] handler_irq+0xac/0x100
[   89.064255] [<00000000004274b0>] sys_call_table+0x760/0x970
[   89.064578] [<0000000000eb2ee0>] ffs+0x0/0x18
[   89.064848] [<000000000042be0c>] do_softirq_own_stack+0x2c/0x40
[   89.065195] [<000000000046fd50>] __irq_exit_rcu+0xf0/0x140
[   89.065520] [<0000000000470744>] irq_exit+0x4/0x40
[   89.065830] [<0000000000ede3c4>] timer_interrupt+0x84/0xc0
[   89.066184] [<00000000004274f8>] sys_call_table+0x7a8/0x970
[   89.066546] [<00000000008f75e0>] blk_mq_do_dispatch_sched+0xa0/0x380
[   89.066940] [<00000000008f7ad4>] __blk_mq_sched_dispatch_requests+0x94/0x160
[   89.067359] [<00000000008f7bfc>] blk_mq_sched_dispatch_requests+0x3c/0x80
[   89.067774] handlers:
[   89.067952] [<(____ptrval____)>] nvme_irq
[   89.068254] [<(____ptrval____)>] nvme_irq
[   89.068538] Disabling IRQ #9
[   89.069837] random: crng init done
[   89.183077] could not locate request for tag 0x0
[   89.183475] nvme nvme0: invalid id 0 completed on queue 1
[   89.183824] could not locate request for tag 0x0
...
[   89.766750] nvme nvme0: invalid id 0 completed on queue 1
[   89.767076] could not locate request for tag 0x0
[   89.767361] nvme nvme0: invalid id 0 completed on queue 1
[   89.767701] nvme nvme0: request 0x4d genctr mismatch (got 0x0 expected 0x1)
[   89.768114] nvme nvme0: invalid id 77 completed on queue 1
[   89.768455] nvme nvme0: request 0x4c genctr mismatch (got 0x0 expected 0x1)
[   89.768876] nvme nvme0: invalid id 76 completed on queue 1
[   89.769215] nvme nvme0: request 0x4b genctr mismatch (got 0x0 expected 0x1)
[   89.769630] nvme nvme0: invalid id 75 completed on queue 1
[   89.769991] nvme nvme0: request 0x4a genctr mismatch (got 0x0 expected 0x1)
[   89.770409] nvme nvme0: invalid id 74 completed on queue 1
[   89.770750] nvme nvme0: request 0x49 genctr mismatch (got 0x0 expected 0x1)
[   89.771171] nvme nvme0: invalid id 73 completed on queue 1
[   89.771513] nvme nvme0: request 0x48 genctr mismatch (got 0x0 expected 0x1)
[   89.771934] nvme nvme0: invalid id 72 completed on queue 1
[   89.772286] nvme nvme0: request 0x47 genctr mismatch (got 0x0 expected 0x1)
[   89.772707] nvme nvme0: invalid id 71 completed on queue 1
[   89.773048] nvme nvme0: request 0x46 genctr mismatch (got 0x0 expected 0x1)
[   89.773478] nvme nvme0: invalid id 70 completed on queue 1
[   89.773958] nvme nvme0: request 0x51 genctr mismatch (got 0x0 expected 0x1)
[   89.774393] nvme nvme0: invalid id 81 completed on queue 1
[   89.774740] nvme nvme0: request 0x50 genctr mismatch (got 0x0 expected 0x1)
[   89.775163] nvme nvme0: invalid id 80 completed on queue 1
[   89.775514] nvme nvme0: request 0x4f genctr mismatch (got 0x0 expected 0x1)
[   89.775902] nvme nvme0: invalid id 79 completed on queue 1
[   89.776239] nvme nvme0: request 0x4e genctr mismatch (got 0x0 expected 0x1)
[   89.776649] nvme nvme0: invalid id 78 completed on queue 1
[   89.782920] could not locate request for tag 0x0


Does that help ? If not I can add some additional log messages.

Guenter

> On Thu, Dec 8, 2022, 8:13 PM Guenter Roeck <linux@roeck-us.net <mailto:linux@roeck-us.net>> wrote:
> 
>     On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
>      > >
>      > > A cq head doorbell mmio is skipped... And it is not the fault of the
>      > > kernel. The kernel is in it's good right to skip the mmio since the cq
>      > > eventidx is not properly updated.
>      > >
>      > > Adding that and it boots properly on riscv. But I'm perplexed as to why
>      > > this didnt show up on our regularly tested platforms.
>      > >
>      > > Gonna try to get this in for 7.2!
>      >
>      > I see another problem with sparc64.
>      >
>      > [    5.261508] could not locate request for tag 0x0
>      > [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
>      >
>      > That is seen repeatedly until the request times out. I'll test with
>      > your patch to see if it resolves this problem as well, and will bisect
>      > otherwise.
>      >
>     The second problem is unrelated to the doorbell problem.
>     It is first seen in qemu v7.1. I'll try to bisect.
> 
>     Guenter
> 


