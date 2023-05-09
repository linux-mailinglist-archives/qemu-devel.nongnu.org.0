Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAAD6FBCEC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 04:14:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwCrA-00027H-Qe; Mon, 08 May 2023 22:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pwCr8-000278-Cp
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:13:34 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pwCr5-0008Qp-LD
 for qemu-devel@nongnu.org; Mon, 08 May 2023 22:13:33 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8BxRPA9rFlk49IGAA--.11385S3;
 Tue, 09 May 2023 10:13:17 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxLL46rFlk2QdSAA--.16351S3; 
 Tue, 09 May 2023 10:13:14 +0800 (CST)
Subject: Re: [PATCH v10 1/8] memory: prevent dma-reentracy issues
To: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
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
 <faa1c6e0-abc2-f108-cc25-2b2cf71bd3d0@redhat.com>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <8bb27e02-7295-626c-8f28-2d6c9d796d1b@loongson.cn>
Date: Tue, 9 May 2023 10:13:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <faa1c6e0-abc2-f108-cc25-2b2cf71bd3d0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxLL46rFlk2QdSAA--.16351S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxur18JrWfZw18tr1kCFy3urg_yoW5Gr48pr
 WFyFyYkrWkJF4kAr4kt348WryYyr1xG34UWFn8JF1rJFWqvr1Y9r47Xw1jgF9rtw48CF1j
 vFW0qa4fZ3WUXw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
 ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4
 xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8w
 CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
 6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64
 vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_
 Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
 vEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.802,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



在 2023/5/8 下午9:12, Thomas Huth 写道:
> On 08/05/2023 15.03, Song Gao wrote:
>> Hi, Thomas
>>
>> 在 2023/5/8 下午5:33, Thomas Huth 写道:
>>> On 06/05/2023 11.25, Song Gao wrote:
>>>>   Hi Alexander
>>>>
>>>> 在 2023/4/28 下午5:14, Thomas Huth 写道:
>>>>> On 28/04/2023 11.11, Alexander Bulekov wrote:
>>>>>> On 230428 1015, Thomas Huth wrote:
>>>>>>> On 28/04/2023 10.12, Daniel P. Berrangé wrote:
>>>>>>>> On Thu, Apr 27, 2023 at 05:10:06PM -0400, Alexander Bulekov wrote:
>>>>>>>>> Add a flag to the DeviceState, when a device is engaged in 
>>>>>>>>> PIO/MMIO/DMA.
> ...
>>>> This patch causes the loongarch virtual machine to fail to start 
>>>> the slave cpu.
>>>>
>>>>      ./build/qemu-system-loongarch64 -machine virt -m 8G -cpu la464 \
>>>>               -smp 4 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd 
>>>> ramdisk   \
>>>>                 -serial stdio   -monitor 
>>>> telnet:localhost:4495,server,nowait  \
>>>>                 -append "root=/dev/ram rdinit=/sbin/init 
>>>> console=ttyS0,115200"   --nographic
>>>>
>>>>
>>>> ....
>>>> qemu-system-loongarch64: warning: Blocked re-entrant IO on 
>>>> MemoryRegion: loongarch_ipi_iocsr at addr: 0x24
>>>
>>> Oh, another spot that needs special handling ... I see Alexander 
>>> already sent a patch (thanks!), but anyway, this is a good 
>>> indication that we're missing some test coverage in the CI.
>>>
>>> Are there any loongarch kernel images available for public download 
>>> somewhere? If so, we really should add an avocado regression test 
>>> for this - since as far as I can see, we don't have any  tests for 
>>> loongarch in tests/avocado yet?
>>>
>> we can get  some binarys  at:
>> https://github.com/yangxiaojuan-loongson/qemu-binary
> >
>> I'm not sure that avacodo testing can be done using just the kernel.
>>
>> Is a full loongarch system required?
>
> No, you don't need a full distro installation, just a kernel with 
> ramdisk (which is also available there) is good enough for a basic 
> test, e.g. just check whether the kernel boots to a certain point is 
> good enough to provide a basic sanity test. If you then can also get 
> even into a shell (of the ramdisk), you can check some additional 
> stuff in the sysfs or "dmesg" output, see for example 
> tests/avocado/machine_s390_ccw_virtio.py which does such checks with a 
> kernel and initrd on s390x.
>
Thanks for you suggestion .

We will add a loongarch basic test  on tests/avacode.

Thanks.
Song Gao


