Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C56FB12F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:17:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0fv-0000qz-RL; Mon, 08 May 2023 09:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw0fa-0000eI-Q5
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pw0fY-00025b-Qh
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHET0hEwBwUxeUXA04/u8ZwpFt3drMNCzI/PQuY0v+g=;
 b=SKjEKXwIb5MgCUXci5EP/MR/P0hKZ4nt3aBc2QGMd/vJFNKH2zq7RPVjjg0GEIHMxE0ilw
 dgWo5RMHjFNdaqkzOCP2MmjyBO2Bajnry+fKPjGyT5uxHHSxz2OwvRAc+0yQMiWpwrNXJh
 g2eDLQNoi7KNt/FRSOsUvFx4BR5D8FU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-EaHgGaf-N--vJC0RYBf4sA-1; Mon, 08 May 2023 09:12:43 -0400
X-MC-Unique: EaHgGaf-N--vJC0RYBf4sA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so781959f8f.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 06:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683551562; x=1686143562;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wHET0hEwBwUxeUXA04/u8ZwpFt3drMNCzI/PQuY0v+g=;
 b=M05wm3pPmAKdq1p5p8Bjbgoa9RAI4IXINlT67yHjJwc7jiwr1yAKdF3qYyGHdiXoDK
 RZiX+80MszZ+6bR9U7IuIGWlobZnwlmQ/L2qhK+ZG9mhfD44xhvB/29HfxMZnQGq832j
 DV82MBHu+BE+Gtzt1rvWAduKryU/O3cXSqIgMlQKEUr5WEoBvbstKF+Qc/PwtLawmrUl
 G9FlN4kDZ2xxG8QVHO0CNGvzfkesaSmdgPVz7AnAUHO299Zt42bMqr7eV9JW8lVhHvi+
 A0fhIdNE1M5XNMGGiZQLgPPTAAo40xwZrOvHl94IbpC4+0luTDWAVNblkiuIbH8dpdXS
 HFVQ==
X-Gm-Message-State: AC+VfDzgnPSo/CqvUeuV5FPxM8iB9NegRFAd7LQOXkcSbhxkp8uDD53t
 3N3WMfXLg3KK/Znlm0P+DS5K3fH3kt7Lp7iiMsjjI6gIWy4CQMtCzlYqEl3n4ypdXod42RzhgUR
 K2GCmfnSuzTXgkNo=
X-Received: by 2002:a5d:63c8:0:b0:306:2b56:d268 with SMTP id
 c8-20020a5d63c8000000b003062b56d268mr6758174wrw.15.1683551562751; 
 Mon, 08 May 2023 06:12:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Gk3Rl9LG3fg1okV5K4vkVN6ftZfZ6Tp1j5i5lG6/2FSsMAgVRx8mlLGuDQX8Lsq+T7BSz0Q==
X-Received: by 2002:a5d:63c8:0:b0:306:2b56:d268 with SMTP id
 c8-20020a5d63c8000000b003062b56d268mr6758162wrw.15.1683551562414; 
 Mon, 08 May 2023 06:12:42 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 o1-20020a5d6701000000b003063a1cdaf2sm11341993wru.48.2023.05.08.06.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:12:41 -0700 (PDT)
Message-ID: <faa1c6e0-abc2-f108-cc25-2b2cf71bd3d0@redhat.com>
Date: Mon, 8 May 2023 15:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, Alexander Bulekov <alxndr@bu.edu>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, maobibo@loongson.cn,
 Tianrui Zhao <zhaotianrui@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230427211013.2994127-1-alxndr@bu.edu>
 <20230427211013.2994127-2-alxndr@bu.edu> <ZEt/3RwtL/jePTTv@redhat.com>
 <828514c6-44f0-32f0-1eb1-a49f21617585@redhat.com>
 <20230428091159.haydefdtq4m6z2tz@mozz.bu.edu>
 <b151ecf7-0544-86ac-a182-1112a4dd7dca@redhat.com>
 <c01a2b87-27be-e92a-3a5b-d561eadbc516@loongson.cn>
 <981cdcd7-7326-08f0-9882-e66840175205@redhat.com>
 <c4919eb6-74f1-7699-f924-6917cdf435bb@loongson.cn>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
In-Reply-To: <c4919eb6-74f1-7699-f924-6917cdf435bb@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08/05/2023 15.03, Song Gao wrote:
> Hi, Thomas
> 
> 在 2023/5/8 下午5:33, Thomas Huth 写道:
>> On 06/05/2023 11.25, Song Gao wrote:
>>>   Hi Alexander
>>>
>>> 在 2023/4/28 下午5:14, Thomas Huth 写道:
>>>> On 28/04/2023 11.11, Alexander Bulekov wrote:
>>>>> On 230428 1015, Thomas Huth wrote:
>>>>>> On 28/04/2023 10.12, Daniel P. Berrangé wrote:
>>>>>>> On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
>>>>>>>> Add a flag to the DeviceState, when a device is engaged in 
>>>>>>>> PIO/MMIO/DMA.
...
>>> This patch causes the loongarch virtual machine to fail to start the 
>>> slave cpu.
>>>
>>>      ./build/qemu-system-loongarch64 -machine virt -m 8G -cpu la464 \
>>>               -smp 4 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd 
>>> ramdisk   \
>>>                 -serial stdio   -monitor 
>>> telnet:localhost:4495,server,nowait  \
>>>                 -append "root=/dev/ram rdinit=/sbin/init 
>>> console=ttyS0,115200"   --nographic
>>>
>>>
>>> ....
>>> qemu-system-loongarch64: warning: Blocked re-entrant IO on MemoryRegion: 
>>> loongarch_ipi_iocsr at addr: 0x24
>>
>> Oh, another spot that needs special handling ... I see Alexander already 
>> sent a patch (thanks!), but anyway, this is a good indication that we're 
>> missing some test coverage in the CI.
>>
>> Are there any loongarch kernel images available for public download 
>> somewhere? If so, we really should add an avocado regression test for this 
>> - since as far as I can see, we don't have any  tests for loongarch in 
>> tests/avocado yet?
>>
> we can get  some binarys  at:
> https://github.com/yangxiaojuan-loongson/qemu-binary
 >
> I'm not sure that avacodo testing can be done using just the kernel.
> 
> Is a full loongarch system required?

No, you don't need a full distro installation, just a kernel with ramdisk 
(which is also available there) is good enough for a basic test, e.g. just 
check whether the kernel boots to a certain point is good enough to provide 
a basic sanity test. If you then can also get even into a shell (of the 
ramdisk), you can check some additional stuff in the sysfs or "dmesg" 
output, see for example tests/avocado/machine_s390_ccw_virtio.py which does 
such checks with a kernel and initrd on s390x.

  Thomas


