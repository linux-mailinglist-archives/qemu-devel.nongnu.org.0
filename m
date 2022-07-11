Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E356D6FD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 09:44:23 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAo5e-0000pG-M2
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 03:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oAo3s-0007jx-2P
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:42:32 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:42565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oAo3p-0008H8-Cg
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:42:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.55])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7AB1522E23;
 Mon, 11 Jul 2022 07:42:18 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 11 Jul
 2022 09:42:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003fb69b91b-da0c-49e8-bd9d-aa09d26149f0,
 B4A626E929F7F6A388BA3F96B07B1F4CEE71A9BF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <af1b3289-a9ff-b417-e2dd-ae9801f2c74a@kaod.org>
Date: Mon, 11 Jul 2022 09:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
 <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
 <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
 <1d2cd44f-fd61-4693-ecc0-f71c80131005@ilande.co.uk>
 <6b5e0e42-973d-19de-4979-7db06941ea19@kaod.org>
 <13b65b0e-716f-a6e0-fd63-c1e7cfe2a63c@kaod.org>
 <c08df33f-f6e8-67bb-9159-190a0b9a2dd5@ilande.co.uk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c08df33f-f6e8-67bb-9159-190a0b9a2dd5@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9006b647-5695-4778-a9d6-45efc268865e
X-Ovh-Tracer-Id: 15301542687817370592
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejvddguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedugfevvdeiheevffffgfelkeehieduveejleehkeffvdevjeejtdettdejheeknecuffhomhgrihhnpehfrghtrghlrdhnohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/22 09:37, Mark Cave-Ayland wrote:
> On 06/07/2022 08:45, Cédric Le Goater wrote:
> 
>> On 7/5/22 08:57, Cédric Le Goater wrote:
>>> On 7/5/22 08:51, Mark Cave-Ayland wrote:
>>>> On 04/07/2022 18:34, Cédric Le Goater wrote:
>>>>
>>>>> On 7/2/22 15:34, Daniel Henrique Barboza wrote:
>>>>>>
>>>>>>
>>>>>> On 7/2/22 03:24, Cédric Le Goater wrote:
>>>>>>> On 6/30/22 21:42, Daniel Henrique Barboza wrote:
>>>>>>>> The function can't just return 0 whether an error happened and call it a
>>>>>>>> day. We must provide a way of letting callers know if the zero return is
>>>>>>>> legitimate or due to an error.
>>>>>>>>
>>>>>>>> Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
>>>>>>>> with an appropriate error, if one occurs. Callers are then free to pass
>>>>>>>> an Error pointer and handle it.
>>>>>>>>
>>>>>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>>>>>> ---
>>>>>>>>   target/ppc/kvm.c | 16 +++++++++-------
>>>>>>>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>>>>>> index 109823136d..bc17437097 100644
>>>>>>>> --- a/target/ppc/kvm.c
>>>>>>>> +++ b/target/ppc/kvm.c
>>>>>>>> @@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>>>>>>>>   /*
>>>>>>>>    * Read a CPU node property from the host device tree that's a single
>>>>>>>> - * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
>>>>>>>> - * (can't find or open the property, or doesn't understand the format)
>>>>>>>> + * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
>>>>>>>> + * wrong (can't find or open the property, or doesn't understand the
>>>>>>>> + * format)
>>>>>>>>    */
>>>>>>>> -static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>>>>>> +static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>>>>>>>   {
>>>>>>>>       char buf[PATH_MAX], *tmp;
>>>>>>>>       uint64_t val;
>>>>>>>>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
>>>>>>>> +        error_setg(errp, "Failed to read CPU property %s", propname);
>>>>>>>>           return 0;
>>>>>>>>       }
>>>>>>>> @@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>>>>>>   uint64_t kvmppc_get_clockfreq(void)
>>>>>>>>   {
>>>>>>>> -    return kvmppc_read_int_cpu_dt("clock-frequency");
>>>>>>>> +    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
>>>>>>>
>>>>>>>
>>>>>>> This should be fatal. no ?
>>>>>>
>>>>>>
>>>>>> I'm not sure. I went under the assumption that there might be some weird
>>>>>> condition where 'clock-frequency' might be missing from the DT, and this
>>>>>> is why we're not exiting out immediately.
>>>>>>
>>>>>> That said, the advantage of turning this into fatal is that we won't need
>>>>>> all the other patches that handles error on this function. We're going to
>>>>>> assume that if 'clock-frequency' is missing then we can't boot. I'm okay
>>>>>> with that.
>>>>>
>>>>> I think so. Some machines behave badly when 'clock-frequency' is bogus,
>>>>> division by zero, no console, etc. We could check easily with pseries
>>>>> which is the only KVM PPC platform.
>>>>
>>>> Well not quite true ;)  I haven't tested it during the last release cycle, but the Mac machines were still working fine to boot OS X with KVM-PR on my G4 Mac Mini last time I checked.
>>>
>>> Oh. Sorry. and I still have access to a real G5 running the latest debian.
>>> I should give it a try one day.
>>
>> I gave KVM a try on a :
>>
>>      cpu        : PPC970MP, altivec supported
>>      clock    : 2000.000000MHz
>>      revision    : 1.0 (pvr 0044 0100)
>>      processor    : 1
>>      cpu        : PPC970MP, altivec supported
>>      clock    : 2000.000000MHz
>>      revision    : 1.0 (pvr 0044 0100)
>>      timebase    : 33333333
>>      platform    : PowerMac
>>      model    : PowerMac11,2
>>      machine    : PowerMac11,2
>>      motherboard    : PowerMac11,2 MacRISC4 Power Macintosh
>>      detected as    : 337 (PowerMac G5 Dual Core)
>>      pmac flags    : 00000000
>>      L2 cache    : 1024K unified
>>      pmac-generation    : NewWorld
>>
>> running debian with kernel 5.18.0-2-powerpc64. With the installed QEMU 7.0.0,
>>
>>      qemu-system-ppc64 -M mac99 -cpu host -accel kvm ...
>>
>> doesn't go very far. Program exception is quickly reached and host says:
>>
>>      [56450.118422] Couldn't emulate instruction 0x00000000 (op 0 xop 0)
>>      [56450.119060] kvmppc_exit_pr_progint: emulation at 100 failed (00000000)
>>
>> Anything special I should know ?
> 
> As I don't have access to a G5 I've never tried that, however the qemu-system-ppc64 mac99 is wired differently to the qemu-system-ppc mac99 machine so I wouldn't be surprised if something is broken there.
> 
> My normal test for MacOS is something like:
> 
>     qemu-system-ppc -M mac99 -accel kvm -hda macos104.img
> 
> Can you try qemu-system-ppc and see if it is any better? If not then I can fire up the G4 and get the git hashes for my last known working configuration.

Same issue with 32bit.

Thanks,

C.


