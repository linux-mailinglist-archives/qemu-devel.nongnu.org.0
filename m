Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BA666504E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 01:16:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFOm2-0003KD-UR; Tue, 10 Jan 2023 19:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pFOlz-0003Jr-85; Tue, 10 Jan 2023 19:15:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pFOlw-0007IM-R5; Tue, 10 Jan 2023 19:15:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E7EBD7457E7;
 Wed, 11 Jan 2023 01:12:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B10E8745706; Wed, 11 Jan 2023 01:12:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AF6F0745720;
 Wed, 11 Jan 2023 01:12:53 +0100 (CET)
Date: Wed, 11 Jan 2023 01:12:53 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
Message-ID: <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
> On 04/01/2023 21:59, BALATON Zoltan wrote:
>
>> Setting emulated machine type with a property called "via" is
>> confusing users so deprecate the "via" option in favour of newly added
>> explicit machine types. The default via=cuda option is not a valid
>> config (no real Mac has this combination of hardware) so no machine
>> type could be defined for that therefore it is kept for backwards
>> compatibility with older QEMU versions for now but other options
>> resembling real machines are deprecated.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> I believe that people do use -M mac99,via=cuda to run some rare versions of 
> MacOS in QEMU (I think possibly OS X DP and Workgroup Server?), so we would 
> want to keep this option somewhere.

The idea is that after previous patches we now have machine types for all 
other via option values (that also match real Mac machines) other than 
via=cude but that is the default for mac99 so after the reprecation period 
when the via option is removed mac99 (which is the same as mac99,via=cuda) 
can remain for this use case (and for backward compatibility) until the 
other machines are fixed to not need this any more. So all via options are 
still available but as different machine types.

Regards,
BALATON Zoltan

>> ---
>>   hw/ppc/mac_newworld.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>> 
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index f07c37328b..adf185bd3a 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -169,6 +169,15 @@ static void ppc_core99_init(MachineState *machine)
>>           if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
>>               warn_report("mac99 with G5 CPU is deprecated, "
>>                           "use powermac7_3 instead");
>> +        } else {
>> +            if (core99_machine->via_config == CORE99_VIA_CONFIG_PMU) {
>> +                warn_report("mac99,via=pmu is deprecated, "
>> +                            "use powermac3_1 instead");
>> +            }
>> +            if (core99_machine->via_config == CORE99_VIA_CONFIG_PMU_ADB) {
>> +                warn_report("mac99,via=pmu-adb is deprecated, "
>> +                            "use powerbook3_2 instead");
>> +            }
>>           }
>>       }
>>       /* allocate RAM */
>
>
> ATB,
>
> Mark.
>
>

