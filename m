Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A024405EB
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:53:16 +0200 (CEST)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbgR-0004wF-CR
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbTU-0000Jg-UB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:39:52 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgbTS-0002pp-1Y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:39:52 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 46311748F4B;
 Sat, 30 Oct 2021 01:39:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 200B9746333; Sat, 30 Oct 2021 01:39:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1E8267462D3;
 Sat, 30 Oct 2021 01:39:48 +0200 (CEST)
Date: Sat, 30 Oct 2021 01:39:48 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 30/30] hw/timer/sh_timer: Remove use of hw_error
In-Reply-To: <1c4ec639-c727-e750-6d13-3cfa7fbef6dd@amsat.org>
Message-ID: <05dc851-13cf-4fa6-bb99-713bd87ebe82@eik.bme.hu>
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <f818dc3dd2ac8c3b3d53067f316a716d7f9683d8.1635541329.git.balaton@eik.bme.hu>
 <1c4ec639-c727-e750-6d13-3cfa7fbef6dd@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-110878667-1635550788=:5796"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-110878667-1635550788=:5796
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 30 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/29/21 23:02, BALATON Zoltan wrote:
>> The hw_error function calls abort and is not meant to be used by
>> devices. Use qemu_log_mask instead to log and ignore invalid accesses.
>> Also fix format strings to allow dropping type casts of hwaddr and use
>> __func__ instead of hard coding function name in the message which
>> were wrong in two cases.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/timer/sh_timer.c | 40 +++++++++++++++++++++++++---------------
>>  1 file changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
>> index a6445092e4..8a586f2c4a 100644
>> --- a/hw/timer/sh_timer.c
>> +++ b/hw/timer/sh_timer.c
>> @@ -10,7 +10,7 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "exec/memory.h"
>> -#include "hw/hw.h"
>> +#include "qemu/log.h"
>>  #include "hw/irq.h"
>>  #include "hw/sh4/sh.h"
>>  #include "hw/timer/tmu012.h"
>> @@ -75,11 +75,10 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
>>          if (s->feat & TIMER_FEAT_CAPT) {
>>              return s->tcpr;
>>          }
>> -        /* fall through */
>> -    default:
>> -        hw_error("sh_timer_read: Bad offset %x\n", (int)offset);
>> -        return 0;
>>      }
>> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
>> +                  __func__, offset);
>> +    return 0;
>
> Note, keeping the default case allow to refactor for single return,
> so it is easier to add trace event.
>
> Anyhow,
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

It's easy enough to change back if adding a trace point in the future so 
for now I'd leave it at the end outside the if as in this patch. This 
could be revisited when QOM-ifying it in the future, don't think it's a 
big deal.

Regards,
BALATON Zoltan
--3866299591-110878667-1635550788=:5796--

