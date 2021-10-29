Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829C43F6EB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:05:11 +0200 (CEST)
Received: from localhost ([::1]:59238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgL0m-0004XF-J0
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgKwh-00030f-VH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgKw1-0005Yf-BF
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635487211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCR3O9Vr26iHxG/DIzz7Q3259kvAwwm1hE4mC0xIVAI=;
 b=iERWCLdFOI3xEw/OM9zlBi0ZLl2FJdd46n3MBLxRUjmeVtqelZG/X2tinNyKUABGzFsB5v
 sCSozcDMA+NmeC8/MUWsV7agj0x0pw62y/ZZH5S/i88HBrbNaxJ1IiJdlW2uznXq2Hv66V
 TU7pkTzHvuf6jlL7nUuLGQDRQub55qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-WpWcMhLoNGm3eA7-C47vmw-1; Fri, 29 Oct 2021 02:00:04 -0400
X-MC-Unique: WpWcMhLoNGm3eA7-C47vmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BEF01005E4D;
 Fri, 29 Oct 2021 06:00:03 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E9861853C;
 Fri, 29 Oct 2021 06:00:01 +0000 (UTC)
Subject: Re: [PATCH v4 02/23] hw/char/sh_serial: Use hw_error instead of
 fprintf and abort
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <1ecc1748443a161ecb988aab6b89c68e5ae631ff.1635449225.git.balaton@eik.bme.hu>
 <872302f8-76f1-4613-10af-9c61773e1f58@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <63f46aa0-3fb9-b77d-f784-530547ef8318@redhat.com>
Date: Fri, 29 Oct 2021 08:00:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <872302f8-76f1-4613-10af-9c61773e1f58@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/10/2021 07.38, Philippe Mathieu-Daudé wrote:
> On 10/28/21 21:27, BALATON Zoltan wrote:
>> It does the same with dumping some more state but avoids calling abort
>> directly and printing to stderr from the device model.
> 
> hw_error() is unfortunately misnamed, it is meant for CPU code,
> and we want to get ride of it. What you probably want here is
> error_report() which also reports to the monitor.

Looking at the text of the messages, maybe it would be even better to use 
qemu_log_mask(LOG_UNIMP, ...) or qemu_log_mask(LOG_GUEST_ERROR, ...) ?

  Thomas


>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/char/sh_serial.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
>> index 1b1e6a6a04..dbefb51d71 100644
>> --- a/hw/char/sh_serial.c
>> +++ b/hw/char/sh_serial.c
>> @@ -26,6 +26,7 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include "hw/hw.h"
>>   #include "hw/irq.h"
>>   #include "hw/sh4/sh.h"
>>   #include "chardev/char-fe.h"
>> @@ -200,9 +201,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
>>           }
>>       }
>>   
>> -    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
>> -            HWADDR_PRIx "\n", offs);
>> -    abort();
>> +    hw_error("sh_serial: unsupported write to 0x%02"HWADDR_PRIx"\n", offs);
>>   }
>>   
>>   static uint64_t sh_serial_read(void *opaque, hwaddr offs,
>> @@ -307,9 +306,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
>>   #endif
>>   
>>       if (ret & ~((1 << 16) - 1)) {
>> -        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
>> -                HWADDR_PRIx "\n", offs);
>> -        abort();
>> +        hw_error("sh_serial: unsupported read from 0x%02"HWADDR_PRIx"\n", offs);
>>       }
>>   
>>       return ret;
>>
> 


