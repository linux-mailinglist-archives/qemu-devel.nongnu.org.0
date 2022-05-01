Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96D516686
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 19:12:03 +0200 (CEST)
Received: from localhost ([::1]:44282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlD74-0006kr-DB
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 13:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1nlD5T-0005sv-QY
 for qemu-devel@nongnu.org; Sun, 01 May 2022 13:10:23 -0400
Received: from mail.csgraf.de ([85.25.223.15]:34524 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1nlD5R-00013s-T9
 for qemu-devel@nongnu.org; Sun, 01 May 2022 13:10:23 -0400
Received: from [192.168.106.118]
 (dynamic-095-115-014-159.95.115.pool.telefonica.de [95.115.14.159])
 by csgraf.de (Postfix) with ESMTPSA id E493760800D2;
 Sun,  1 May 2022 19:10:16 +0200 (CEST)
Message-ID: <935c4caa-ae3a-f95c-e6ad-f4a28ea84047@csgraf.de>
Date: Sun, 1 May 2022 19:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v10] isa-applesmc: provide OSK forwarding on Apple hosts
Content-Language: en-US
From: Alexander Graf <agraf@csgraf.de>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20220429191827.8917-1-yaroshchuk2000@gmail.com>
 <585d36f3-6cd1-622e-0c4f-0f919141fbe8@csgraf.de>
In-Reply-To: <585d36f3-6cd1-622e-0c4f-0f919141fbe8@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, phil@philjordan.eu, t0rr3sp3dr0@gmail.com,
 rene@exactcode.de, ehabkost@redhat.com, marcel.a@redhat.com,
 jan.kiszka@siemens.com, laurent@vivier.eu, alistair.francis@xilinx.com,
 r.bolshakov@yadro.com, afaerber@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, gsomlo@gmail.com, marcandre.lureau@redhat.com,
 armbru@redhat.com, chetan4windows@gmail.com, imammedo@redhat.com,
 suse@csgraf.de, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 01.05.22 19:06, Alexander Graf wrote:
> Hey Vladislav,
>
> On 29.04.22 21:18, Vladislav Yaroshchuk wrote:
>> On Apple hosts we can read AppleSMC OSK key directly from host's
>> SMC and forward this value to QEMU Guest.
>>
>> New 'hostosk' property is added:
>> * `-device isa-applesmc,hostosk=on`
>> The property is set to 'on' by default for machine version > 7.0
>>
>> Apple licence allows use and run up to two additional copies
>> or instances of macOS operating system within virtual operating system
>> environments on each Apple-branded computer that is already running
>> the Apple Software, for purposes of:
>>   * software development
>>   * testing during software development
>>   * using macOS Server
>>   * personal, non-commercial use
>>
>> Guest macOS requires AppleSMC with correct OSK. The most legal
>> way to pass it to the Guest is to forward the key from host SMC
>> without any value exposion.
>>
>> Based on 
>> https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
>>
>> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>> ---
>>   hw/core/machine.c  |   4 +-
>>   hw/misc/applesmc.c | 125 +++++++++++++++++++++++++++++++++++++++++++--
>>   2 files changed, 125 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index cb9bbc844d..7f4a27406a 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -37,7 +37,9 @@
>>   #include "hw/virtio/virtio.h"
>>   #include "hw/virtio/virtio-pci.h"
>>   -GlobalProperty hw_compat_7_0[] = {};
>> +GlobalProperty hw_compat_7_0[] = {
>> +    { "isa-applesmc", "hostosk", "off" }
>> +};
>>   const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>>     GlobalProperty hw_compat_6_2[] = {
>> diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
>> index 81cd6b6423..8672c9d56e 100644
>> --- a/hw/misc/applesmc.c
>> +++ b/hw/misc/applesmc.c
>> @@ -37,6 +37,11 @@
>>   #include "qemu/module.h"
>>   #include "qemu/timer.h"
>>   #include "qom/object.h"
>> +#include "qapi/error.h"
>> +
>> +#if defined(__APPLE__) && defined(__MACH__)
>> +#include <IOKit/IOKitLib.h>
>> +#endif
>>     /* #define DEBUG_SMC */
>>   @@ -80,7 +85,7 @@ enum {
>>   #define smc_debug(...) do { } while (0)
>>   #endif
>>   -static char default_osk[64] = "This is a dummy key. Enter the real 
>> key "
>> +static char default_osk[65] = "This is a dummy key. Enter the real 
>> key "
>
>
> This is only necessary if we run strlen() on the default_osk. Do we 
> have to?


Ugh, just after sending reply I realized why we need to: We make osk 
available as object property, which means anyone who would read it from 
outside would run out of bounds.

Can you please make the bit that bumps default_osk to 65 bytes a 
separate patch that we can apply immediately? It's a long standing, 
existing bug.


Thanks!

Alex



