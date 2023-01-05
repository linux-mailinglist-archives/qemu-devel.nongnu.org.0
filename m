Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BF65EA47
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOvF-0007yM-TN; Thu, 05 Jan 2023 07:00:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDOv8-0007wV-Qw; Thu, 05 Jan 2023 07:00:30 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pDOv6-0000AA-GM; Thu, 05 Jan 2023 07:00:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 91A6C74900C;
 Thu,  5 Jan 2023 12:58:08 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 57ED9748131; Thu,  5 Jan 2023 12:58:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 56A8D746307;
 Thu,  5 Jan 2023 12:58:08 +0100 (CET)
Date: Thu, 5 Jan 2023 12:58:08 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v7 5/7] mac_newworld: Deprecate mac99 with G5 CPU
In-Reply-To: <521f5a40-1268-7286-8597-dca3869a2055@linaro.org>
Message-ID: <534e4b68-50d6-6673-83b2-b3948cd9f5df@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <a5147317122bb760b1184cf73829fc6fce61e611.1672868854.git.balaton@eik.bme.hu>
 <521f5a40-1268-7286-8597-dca3869a2055@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-722283210-1672919888=:63209"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-722283210-1672919888=:63209
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 5 Jan 2023, Philippe Mathieu-Daudé wrote:
> On 4/1/23 22:59, BALATON Zoltan wrote:
>> Besides resolving the confusing behaviour mentioned in previous commit
>> this might also allow unifying qemu-system-ppc and qemu-system-ppc64
>> in the future.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_newworld.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>> 
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index 3f5d1ec097..f07c37328b 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -165,6 +165,12 @@ static void ppc_core99_init(MachineState *machine)
>>           qemu_register_reset(ppc_core99_reset, cpu);
>>       }
>>   +    if (object_property_find(OBJECT(machine), "via")) {
>> +        if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
>> +            warn_report("mac99 with G5 CPU is deprecated, "
>> +                        "use powermac7_3 instead");
>
> "mac99 machine with G5 CPU is deprecated, prefer the powermac7_3 machine 
> instead"?

I don't mind what the text is but this seems unnecessarily long where my 
version conveys the message in a more concise way. But if others prefer 
something else I'm OK to change it as you like. I expect these last 
patches may need to be repartitioned so I'm waiting for review to see 
what's preferred.

Regards,
BALATON Zoltan

>> +        }
>> +    }
>>       /* allocate RAM */
>>       if (machine->ram_size > 2 * GiB) {
>>           error_report("RAM size more than 2 GiB is not supported");
>
>
>
--3866299591-722283210-1672919888=:63209--

