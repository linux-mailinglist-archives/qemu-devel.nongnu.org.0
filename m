Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF725FD8E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 17:52:18 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFJRJ-0003qy-4u
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 11:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kFJPj-0001kL-JH
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 11:50:39 -0400
Received: from mail.ispras.ru ([83.149.199.84]:37604)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kFJPh-00024y-BJ
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 11:50:39 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5DE5640A2059;
 Mon,  7 Sep 2020 15:41:47 +0000 (UTC)
Subject: Re: [PATCH v3 05/15] iotests: update snapshot test for new output
 format
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <159903454714.28509.7439453309116734374.stgit@pasha-ThinkPad-X280>
 <159903457617.28509.2649326029575134141.stgit@pasha-ThinkPad-X280>
 <87k0x5r4jg.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <1afbeab2-e363-9be3-a751-2692263e80d2@ispras.ru>
Date: Mon, 7 Sep 2020 18:41:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87k0x5r4jg.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 11:46:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.825,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, ehabkost@redhat.com,
 mtosatti@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com, mreitz@redhat.com,
 philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.2020 18:26, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
>> From: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
>>
>> This patch updates iotests that verify qemu monitor output.
>> New output format for snapshot listing include ICOUNT column.
> 
> I was curious if the monitor should still function during replay. In my
> setup:
> 
>    ./qemu-system-aarch64 -cpu cortex-a53 -display none -serial mon:stdio -machine virt -kernel zephyr.elf -net none -icount shift=6,align=off,sleep=off,rr=replay,rrfile=record.out -drive file=record.qcow2,if=none,snapshot,id=rr -s -S
>    *** Booting Zephyr OS build zephyr-v2.3.0-1183-ge5628ad0faf3  ***
>    Hello World! qemu_cortex_a53
>    qemu-system-aarch64: Missing character write event in the replay log

And what about -monitor stdio instead of -serial mon:stdio?

> 
> although technically the C-a shouldn't be a character that ever makes it
> to the guest.
> 
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   tests/qemu-iotests/267.out |   48 ++++++++++++++++++++++----------------------
>>   1 file changed, 24 insertions(+), 24 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/267.out b/tests/qemu-iotests/267.out
>> index 215902b3ad..27471ffae8 100644
>> --- a/tests/qemu-iotests/267.out
>> +++ b/tests/qemu-iotests/267.out
>> @@ -33,8 +33,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>> @@ -44,8 +44,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>> @@ -69,8 +69,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>> @@ -94,8 +94,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>> @@ -105,8 +105,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>> @@ -119,8 +119,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>> @@ -134,8 +134,8 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>> @@ -145,15 +145,15 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>>   Internal snapshots on overlay:
>>   Snapshot list:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> -1         snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +1         snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   Internal snapshots on backing file:
>>   
>>   === -blockdev with NBD server on the backing file ===
>> @@ -166,17 +166,17 @@ QEMU X.Y.Z monitor - type 'help' for more information
>>   (qemu) savevm snap0
>>   (qemu) info snapshots
>>   List of snapshots present on all disks:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> ---        snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +--        snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   (qemu) loadvm snap0
>>   (qemu) quit
>>   
>>   Internal snapshots on overlay:
>>   Snapshot list:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> -1         snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +1         snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   Internal snapshots on backing file:
>>   Snapshot list:
>> -ID        TAG                 VM SIZE                DATE       VM CLOCK
>> -1         snap0                  SIZE yyyy-mm-dd hh:mm:ss   00:00:00.000
>> +ID        TAG               VM SIZE                DATE     VM CLOCK     ICOUNT
>> +1         snap0                SIZE yyyy-mm-dd hh:mm:ss 00:00:00.000
>>   *** done
> 
> 


