Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC23189B5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:43:54 +0100 (CET)
Received: from localhost ([::1]:43590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAO1-0001LT-1l
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAALI-0008Rq-Vo
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:41:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAALG-0000ZL-PM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 06:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613043661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IVdu3GzWd45JuJCi/3MDfg93wQ6icBlPyxUQWgm9po=;
 b=bGqGZ29niS5hFIl8G/iAhQ+mosuLDrVzBzNJy7xFu+SGJ9bmk+388M4NJ2J4T22VRNVkMS
 QkAvIas6y3zk0dXhnfyujFoM1cqc0d1GVBH8eDvQkJ5evx2Ocx6DrRY+eKoAm9DmCIw58b
 6tzAgCvyRAOLmTBr69tRSnqRIxhytIo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-a9A_nDzOMXKycLOB9GufFg-1; Thu, 11 Feb 2021 06:41:00 -0500
X-MC-Unique: a9A_nDzOMXKycLOB9GufFg-1
Received: by mail-wm1-f70.google.com with SMTP id u15so3093821wmj.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 03:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3IVdu3GzWd45JuJCi/3MDfg93wQ6icBlPyxUQWgm9po=;
 b=XNEGmsVPx7O0/0NUfpoowerdK2lMcfAXbxR11K7G3fPfRWITVf4SiseNH9Ko/cq21X
 JKFPSb3vKEhGXjp1tpup3FYOxkMu8gd/+82xLX9bTM7jf746jeuxDztq9Jo6sXECvQZl
 psDuUWM3z9805dywnINxrgBtSAxhhrRfN64ygg+g6ifYFeSveefEw5qOGyMdrKBLs1Yg
 d2fVUFhsoriNkKoUMIYh0uiHlzisqGkInG3sowchINEv5g1v2SqB0IyXy1Ny059C4Ka8
 7qxutSBUgxy4YLb+9WD9H5eCEFrie7SCRytycsovD++iSYsYghK3v7lEtn7uvpmsOSvK
 niYw==
X-Gm-Message-State: AOAM5302+YMdjUscuiYfxjGXpIvnSiyHhIlaz1RGQSFIx10shSpud0TB
 T1MMcMjtCFtt1lNLKySc7W//ca8BoRWjgPxEbDraH+qi8RndlC5fqVRBQr9lO0oNgPyD3EnTFw1
 0HFznl7UXJFZk4mI=
X-Received: by 2002:a1c:2094:: with SMTP id g142mr4948719wmg.101.1613043658858; 
 Thu, 11 Feb 2021 03:40:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR0yz2rnziA+Z3Zg8lDnNe5zG436wrURNbpNtYHiBIZa5rpb9zoRLGgHSwZkuj5hPz91nRlA==
X-Received: by 2002:a1c:2094:: with SMTP id g142mr4948705wmg.101.1613043658718; 
 Thu, 11 Feb 2021 03:40:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b2sm4622036wrv.73.2021.02.11.03.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 03:40:58 -0800 (PST)
Subject: Re: [PULL 32/56] hw/block/nvme: split setup and register for namespace
To: Alexander Graf <agraf@csgraf.de>, Klaus Jensen <its@irrelevant.dk>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210209073101.548811-1-its@irrelevant.dk>
 <20210209073101.548811-33-its@irrelevant.dk>
 <20c3b649-b6c1-91ef-41cd-5c820a7f81cf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eff5e309-c932-d954-c2fe-da8cf62f98e2@redhat.com>
Date: Thu, 11 Feb 2021 12:40:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20c3b649-b6c1-91ef-41cd-5c820a7f81cf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 10:53 AM, Alexander Graf wrote:
> Hi Klaus,
> 
> On 09.02.21 08:30, Klaus Jensen wrote:
>> From: Minwoo Im <minwoo.im.dev@gmail.com>
>>
>> In NVMe, namespace is being attached to process I/O.  We register NVMe
>> namespace to a controller via nvme_register_namespace() during
>> nvme_ns_setup().  This is main reason of receiving NvmeCtrl object
>> instance to this function to map the namespace to a controller.
>>
>> To make namespace instance more independent, it should be split into two
>> parts: setup and register.  This patch split them into two differnt
>> parts, and finally nvme_ns_setup() does not have nothing to do with
>> NvmeCtrl instance at all.
>>
>> This patch is a former patch to introduce NVMe subsystem scheme to the
>> existing design especially for multi-path.  In that case, it should be
>> split into two to make namespace independent from a controller.
>>
>> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> 
> 
> In latest master, I can no longer access NVMe devices from edk2. Git
> bisect pointed me to this commit.
> 
> To reproduce:
> 
>   $ ./build/qemu-system-x86_64 -enable-kvm -pflash
> build/pc-bios/edk2-x86_64-code.fd -drive
> file=image.raw,if=none,id=d,snapshot=on -device nvme,serial=1234,drive=d
> -nographic -net none
> 
> You will see that before this commit, edk2 is able to enumerate the
> block device, while after this commit it does not find it.
> 
> 
> good:
> 
> Mapping table
>       FS0: Alias(s):HD1b:;BLK2:
>         �
> PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(1,GPT,7A866FF6-0A12-4911-A4ED-D0565BEB41A2,0x80,0x64000)
> 
>      BLK0: Alias(s):
>           PciRoot(0x0)/Pci(0x1,0x1)/Ata(0x0)
>      BLK1: Alias(s):
>         � PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)
>      BLK3: Alias(s):
>         �
> PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(2,GPT,F070566B-C58D-4F13-9B92-64F1794385E7,0x64080,0x40000)
> 
>      BLK4: Alias(s):
>         �
> PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(3,GPT,EDE86BE3-C64F-4ACB-B4AA-5E6C0135D335,0xA4080,0x315BF1B)

Good integration test for the emulated NVMe subsystem!

tests/acceptance/boot_linux_console.py should provide trivial template.

> 
> 
> 
> bad:
> 
> Mapping table
>      BLK0: Alias(s):
>           PciRoot(0x0)/Pci(0x1,0x1)/Ata(0x0)
> 
> 
> 
> Thanks,
> 
> Alex
> 
> 
> 


