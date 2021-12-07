Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183E46BF46
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:28:32 +0100 (CET)
Received: from localhost ([::1]:52286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mucOM-0003RD-2n
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:28:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mucIl-0000qU-0R; Tue, 07 Dec 2021 10:22:45 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:38434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mucIi-0003tJ-Hc; Tue, 07 Dec 2021 10:22:42 -0500
Received: from [172.17.10.6] (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 95CF020775;
 Tue,  7 Dec 2021 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1638890557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZln2ofkr667x6NISN7c0eyLVh+IKfX1mdZvTd63O4w=;
 b=jopfEHUYKrGMvTf6EJ30VZ6YYMLw/NoN9dNqoQWDVmyCUU55Fqs6kcoyKETkgqpHP2c+yY
 qudsj1mXkZ33zXs9sn2rzAUKNGI3jb3IwS3+DKVkBuwgDu9XKR0f6eUMZXXlDL5wt3tRSO
 gANAMbPqtkiNUM5qtfS23ikz4vLP6TM=
Message-ID: <1e3878bd-bcc5-3278-7401-52d5af6dc4fd@greensocs.com>
Date: Tue, 7 Dec 2021 16:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Content-Language: en-US-large
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: shashi.mallela@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/7/21 15:21, Peter Maydell wrote:
> On Tue, 7 Dec 2021 at 09:44, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> According to the "Arm Generic Interrupt Controller Architecture
>> Specification GIC architecture version 3 and 4" (version G: page 345
>> for aarch64 or 509 for aarch32):
>> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
>> ICH_HCR.EOIcount is non-zero.
>>
>> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
>> wrongly set and MISR value was wrong.
>>
>> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
>> the maintenance interrupt was constantly fired. It happens since patch
>> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
>> which fixed another bug about maintenance interrupt (most significant
>> bits of misr, including this one, were ignored in the interrupt trigger).
>>
>> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>> The gic doc is available here:
>> https://developer.arm.com/documentation/ihi0069/g
>>
>> v2: identical resend because subject screw-up (sorry)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I won't try to put this into 6.2 unless you have a common guest
> that runs into this bug.
> 
> thanks
> -- PMM
> 

I don't know if this fit into "common guest" but my use case is:

 > ./build/qemu-system-aarch64 \
 >     -machine virt,virtualization=on,gic-version=3,highmem=off  \
 >     -cpu max -m size=4G -smp cpus=8 -nographic  \
 >     -kernel hypvm.elf   \
 >     -device loader,file=Image,addr=0x41080000  \
 >     -device loader,file=virt_512M.dtb,addr=0x44200000

where Image is a buildroot compiled kernel and hypvm.elf is an 
hypervisor from qualcomm (https://github.com/quic/gunyah-hypervisor).

It boots fine on v6.0 or v6.1 but hangs on master.

It's the same hypervisor Brian is talking about.

Thanks,
Damien

