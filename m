Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6720E43FBFA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 14:04:32 +0200 (CEST)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgQcZ-0002Io-A8
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 08:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgQZN-0008Rm-1Q
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:01:14 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgQZJ-0001Be-HQ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 08:01:12 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F03B6748F57;
 Fri, 29 Oct 2021 14:01:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CD725748F53; Fri, 29 Oct 2021 14:01:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CBC07748F4B;
 Fri, 29 Oct 2021 14:01:06 +0200 (CEST)
Date: Fri, 29 Oct 2021 14:01:06 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 02/23] hw/char/sh_serial: Use hw_error instead of
 fprintf and abort
In-Reply-To: <872302f8-76f1-4613-10af-9c61773e1f58@amsat.org>
Message-ID: <be86f2-38e6-2459-5bb3-5d12e31d9cb7@eik.bme.hu>
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <1ecc1748443a161ecb988aab6b89c68e5ae631ff.1635449225.git.balaton@eik.bme.hu>
 <872302f8-76f1-4613-10af-9c61773e1f58@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-754125932-1635508866=:48739"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-754125932-1635508866=:48739
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 29 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/28/21 21:27, BALATON Zoltan wrote:
>> It does the same with dumping some more state but avoids calling abort
>> directly and printing to stderr from the device model.
>
> hw_error() is unfortunately misnamed, it is meant for CPU code,
> and we want to get ride of it. What you probably want here is
> error_report() which also reports to the monitor.

OK, I'll drop the abort and make these qemu_log_mask UNIMP or GUEST_ERROR, 
have to check docs if these are valid or not otherwise.

Regards,
BALATON Zoltan

>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/char/sh_serial.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
>> index 1b1e6a6a04..dbefb51d71 100644
>> --- a/hw/char/sh_serial.c
>> +++ b/hw/char/sh_serial.c
>> @@ -26,6 +26,7 @@
>>   */
>>
>>  #include "qemu/osdep.h"
>> +#include "hw/hw.h"
>>  #include "hw/irq.h"
>>  #include "hw/sh4/sh.h"
>>  #include "chardev/char-fe.h"
>> @@ -200,9 +201,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
>>          }
>>      }
>>
>> -    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
>> -            HWADDR_PRIx "\n", offs);
>> -    abort();
>> +    hw_error("sh_serial: unsupported write to 0x%02"HWADDR_PRIx"\n", offs);
>>  }
>>
>>  static uint64_t sh_serial_read(void *opaque, hwaddr offs,
>> @@ -307,9 +306,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
>>  #endif
>>
>>      if (ret & ~((1 << 16) - 1)) {
>> -        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
>> -                HWADDR_PRIx "\n", offs);
>> -        abort();
>> +        hw_error("sh_serial: unsupported read from 0x%02"HWADDR_PRIx"\n", offs);
>>      }
>>
>>      return ret;
>>
>
>
--3866299591-754125932-1635508866=:48739--

