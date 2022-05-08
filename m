Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A061A51EC82
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:32:18 +0200 (CEST)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndGz-0001RD-Nx
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nndF6-0000bc-O3; Sun, 08 May 2022 05:30:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nndF2-0008KT-L6; Sun, 08 May 2022 05:30:18 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nndE0-0009uX-H8; Sun, 08 May 2022 10:29:16 +0100
Message-ID: <ded319eb-3a1d-b8d0-f8c3-a7c047cdf306@ilande.co.uk>
Date: Sun, 8 May 2022 10:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: muriloo@linux.ibm.com, qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <56cae01e-7944-8775-e3a2-3071c18f2da1@linux.ibm.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <56cae01e-7944-8775-e3a2-3071c18f2da1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/05/2022 00:44, Murilo Opsfelder Araújo wrote:

> On 5/2/22 06:43, Mark Cave-Ayland wrote:
>> On 30/04/2022 00:31, Murilo Opsfelder Araujo wrote:
>>
>>> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
>>>
>>>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): 
>>> undefined reference to `hmp_info_via'
>>>      clang-13: error: linker command failed with exit code 1 (use -v to see 
>>> invocation)
>>>
>>> Add CONFIG_MOS6522 check for hmp_info_via in hmp-commands-info.hx to fix
>>> such linking error.
>>>
>>> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
>>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>>> ---
>>>   hmp-commands-info.hx | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>>> index adfa085a9b..9ad784dd9f 100644
>>> --- a/hmp-commands-info.hx
>>> +++ b/hmp-commands-info.hx
>>> @@ -881,6 +881,7 @@ SRST
>>>   ERST
>>>   #if defined(TARGET_M68K) || defined(TARGET_PPC)
>>> +#if defined(CONFIG_MOS6522)
>>>       {
>>>           .name         = "via",
>>>           .args_type    = "",
>>> @@ -889,6 +890,7 @@ ERST
>>>           .cmd          = hmp_info_via,
>>>       },
>>>   #endif
>>> +#endif
>>>   SRST
>>>     ``info via``
>>
>> Hmmm. The patch in its proposed form isn't correct, since device CONFIG_* defines 
>> aren't declared when processing hmp-commands-info.hx. This was something that was 
>> discovered and discussed in the original thread for which the current workaround is 
>> to use the per-target TARGET_* defines instead.
> 
> I've sent a v2 of this patch that addresses this, i.e.: the CONFIG_* options are 
> available in hmp-commands-info.hx:
> 
>      https://lore.kernel.org/qemu-devel/20220506011632.183257-1-muriloo@linux.ibm.com/
> 
> I hope it can resolve the build issue in the short-term.
> I'd appreciate if you or anyone on this thread could review it.
> 
> Thank you, Mark, for the discussion and knowledge sharing!

No worries. I suspect there must be a reason why this wasn't suggested when I 
submitted the original patch, but that knowledge would clearly lie with the HMP and 
QMP maintainers.


ATB,

Mark.

