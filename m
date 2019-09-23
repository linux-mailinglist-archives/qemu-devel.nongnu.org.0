Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B515BB74A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:56:58 +0200 (CEST)
Received: from localhost ([::1]:57672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCPlp-0000W2-FA
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCPjX-00076y-PW
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCPjW-0003qi-Kz
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:54:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46304)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iCPjW-0003qP-CL
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:54:34 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F8B2757CC
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 14:54:33 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id 32so4926741wrk.15
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 07:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zP/jlV1v/3MhIk9YH7uyR0if4+SvbBKgh10XpUaUcqw=;
 b=qKJjCNmuOVQOf/eYTiMVuLNvyKcx71e170fYFTfgnY6PlX/8Q6Ib6LbkofDK5dNeSa
 XU93Vf5BaKtb95/4YGzbSY9z7veYdrJJ63OfaBGs3JpbNvOYdPTTM0rGIjJOa607yHHt
 LZYeZAtMykw3ldhys9QAjsa8XTBpnLQhfxzeYjYXyJpqbu9kb9reJfH1hczkCtRxNDMF
 WaBKGQh1B/AnkoXpOiGLpskF7uBnXliNLZpPH3SWhBFMvhYZB0Rrp/PIKgKGVkrsDf69
 Yh+1zQwL5coIKYqrHlZpn5sGj2iE1e4Bsdi27iz0ZacOw8T+Z//CzWuqYeKZhpnF86OT
 5Pjw==
X-Gm-Message-State: APjAAAV8JPxzzrodCd7ZwQyiQQkhRSD9YN/l9CvAMWxUH6gUGc0nhuXy
 x42rmX/b57kuDdhTb5BdFsYhLMYdicGATw2NLfaYNBecAw3DcgvZLRz9rtcl5gt4n5GClpj+vqH
 0L57GXSDhlx1WJiY=
X-Received: by 2002:adf:f78a:: with SMTP id q10mr21763719wrp.276.1569250472238; 
 Mon, 23 Sep 2019 07:54:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJYBhinpCcpvtj/FGmej5hv+YchOC8OLDy6gVP3cELq0hJmgD/R+cGcWqWE+gkiTYupXQDUQ==
X-Received: by 2002:adf:f78a:: with SMTP id q10mr21763707wrp.276.1569250472071; 
 Mon, 23 Sep 2019 07:54:32 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id n2sm9808489wmc.1.2019.09.23.07.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 07:54:31 -0700 (PDT)
Subject: Re: [PATCH] hw/ptimer: Assert next_event is newer than last_event
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190921101703.17935-1-philmd@redhat.com>
 <CAFEAcA8RfAPuV9LfL3c01KU+sCtAcWkHsLR7e-4QNJVcniq7Cg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ec6ddb30-6ae4-a3fb-e97c-58758df65650@redhat.com>
Date: Mon, 23 Sep 2019 16:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8RfAPuV9LfL3c01KU+sCtAcWkHsLR7e-4QNJVcniq7Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/19 4:40 PM, Peter Maydell wrote:
> On Sat, 21 Sep 2019 at 11:17, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>>
>> If the period is too big, the 'delta * period' product result
>> might overflow, resulting in a negative number, then the
>> next_event ends before the last_event. This is buggy, as there
>> is no forward progress. Assert this can not happen.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  hw/core/ptimer.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index d58e2dfdb0..88085d4c81 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -125,6 +125,9 @@ static void ptimer_reload(ptimer_state *s, int del=
ta_adjust)
>>
>>      s->last_event =3D s->next_event;
>>      s->next_event =3D s->last_event + delta * period;
>> +    /* Verify forward progress */
>> +    g_assert(s->next_event > s->last_event);
>> +
>>      if (period_frac) {
>>          s->next_event +=3D ((int64_t)period_frac * delta) >> 32;
>>      }
>> --
>=20
> Can this only happen if a QEMU timer model using the ptimer
> code has a bug, or is it guest-triggerable for some of our
> timer models?

I hit this running a raspi4 guest, I had incorrectly initialized a clock
using the core cpu frequency, while I had to use the APB one (in my
case, core_cpu_freq / 2). The guest use a high value to configure a slow
timer, which in my buggy case made QEMU hang in hard way to debug.

So yes, it seems guest-triggerable if the implementation is broken.
Using assert() is OK for broken implementation, right?
Or should we audit all ptimer calls?

Regards,

Phil.

