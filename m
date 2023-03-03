Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A16AA4CA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:53:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYEGI-0007v2-Rc; Fri, 03 Mar 2023 17:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pYEGG-0007ud-7O; Fri, 03 Mar 2023 17:52:24 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pYEGE-00062a-2g; Fri, 03 Mar 2023 17:52:23 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pYEFv-00027Z-GM; Fri, 03 Mar 2023 23:52:03 +0100
Message-ID: <c699bca1-194f-d35e-eb22-7f77e92be605@maciej.szmigiero.name>
Date: Fri, 3 Mar 2023 23:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, pl-PL
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 kraxel@redhat.com
References: <20230120122633.84983-1-kwolf@redhat.com>
 <20230120122633.84983-4-kwolf@redhat.com>
 <be61e573-1713-472c-899e-ac51b8a22345@kaod.org> <Y+IN+xWlJUl6I2u9@redhat.com>
 <d09135a0-8ca7-d8af-bcf9-677e839b9d17@kaod.org> <Y+JIlj5BxP6vDFjG@redhat.com>
 <5fb3fd72-3bd8-4895-62dd-2d504188faf2@kaod.org>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PULL 03/38] pflash: Only read non-zero parts of backend image
In-Reply-To: <5fb3fd72-3bd8-4895-62dd-2d504188faf2@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8.02.2023 12:19, Cédric Le Goater wrote:
> On 2/7/23 13:48, Kevin Wolf wrote:
>> Am 07.02.2023 um 10:19 hat Cédric Le Goater geschrieben:
>>> On 2/7/23 09:38, Kevin Wolf wrote:
>>>> Am 06.02.2023 um 16:54 hat Cédric Le Goater geschrieben:
>>>>> On 1/20/23 13:25, Kevin Wolf wrote:
>>>>>> From: Xiang Zheng <zhengxiang9@huawei.com>
>>>>>>
>>>>>> Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
>>>>>> when using persistent UEFI variables on virt board. Actually we only use
>>>>>> a very small(non-zero) part of the memory while the rest significant
>>>>>> large(zero) part of memory is wasted.
>>>>>>
>>>>>> So this patch checks the block status and only writes the non-zero part
>>>>>> into memory. This requires pflash devices to use sparse files for
>>>>>> backends.
>>>>>>
>>>>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>>>>>
>>>>>> [ kraxel: rebased to latest master ]
>>>>>>
>>>>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>>>>> Message-Id: <20221220084246.1984871-1-kraxel@redhat.com>
>>>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>>>> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>>>>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>>>>
>>>>> This newly merged patch introduces a "regression" when booting an Aspeed
>>>>> machine. The following extra m25p80 patch (not yet merged) is required
>>>>> for the issue to show:
>>>>>
>>>>>     https://lore.kernel.org/qemu-devel/20221115151000.2080833-1-clg@kaod.org/
>>>>>
>>>>> U-Boot fails to find the filesystem in that case.
>>>>>
>>>>> It can be easily reproduced with the witherspoon-bmc machine and seems
>>>>> to be related to the use of a UBI filesystem. Other Aspeed machines not
>>>>> using UBI are not impacted.
>>>>>
>>>>> Here is a tentative fix. I don't know enough the block layer to explain
>>>>> what is happening :/
>>>>
>>>> I was puzzled for a moment, but...
>>>>
>>>>> @@ -39,7 +39,7 @@ static int blk_pread_nonzeroes(BlockBack
>>>>>                return ret;
>>>>>            }
>>>>>            if (!(ret & BDRV_BLOCK_ZERO)) {
>>>>> -            ret = bdrv_pread(bs->file, offset, bytes,
>>>>
>>>> 'bs->file' rather than 'bs' really looks wrong. I think replacing that
>>>> would already fix the bug you're seeing.
>>>>
>>>> Just to be sure, how did you configure the block backend? bs->file would
>>>> happen to work more or less with raw over file-posix (which is probably
>>>> what Gerd tested), but I think it breaks with anything else.
>>>
>>> The command is  :
>>>
>>>    $ qemu-system-arm -M witherspoon-bmc -net user \
>>>     -drive file=/path/to/file.mtd,format=raw,if=mtd \
>>>     -nographic -serial mon:stdio -snapshot
>>>
>>> If I remove '-snapshot', all works fine.
>>
>> Ok, that makes sense then. -snapshot creates a temporary qcow2 overlay,
>> and then what your guest sees with bs->file is not the virtual disk
>> content of the qcow2 image, but the qcow2 file itself.
> 
> yes. Same symptom with pflash devices, TCG and KVM. The guest hangs with -snapshot.
> 
> C.
> 
> qemu-system-aarch64 -M virt -smp 2 -cpu max -accel tcg,thread=multi -nographic -m 2G -drive if=pflash,format=raw,file=/usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.raw,readonly=on -drive if=pflash,format=raw,file=rhel9-varstore.img -device virtio-net,netdev=net0,bus=pcie.0,addr=0x3 -netdev user,id=net0 -drive file=rhel9-arm64.qcow2,if=none,id=disk,format=qcow2,cache=none -device virtio-blk-device,drive=disk -serial mon:stdio -snapshot
> 
> 
> 

+1 here for QEMU + KVM/x86: OVMF CODE file fails to load (is all zeroes)
with either "-snapshot" QEMU command line option or even with just "snapshot=on"
setting enabled on pflash0.

Reverting this patch seems to fix the issue.

Thanks,
Maciej


