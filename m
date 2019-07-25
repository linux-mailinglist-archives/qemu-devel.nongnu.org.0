Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF2749EB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 11:33:25 +0200 (CEST)
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqa7o-0005M9-Dp
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 05:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39217)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hqa7a-0004wY-1d
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hqa7Z-000564-47
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:33:09 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56033)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hqa7Y-00055Y-Tu
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 05:33:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id a15so44308658wmj.5
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 02:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s9kUVq2QWX71DgyVWDtBifSoLCi7JYp4N+lyjfN+SAY=;
 b=fem13oyJLcIgFESHVmrs6SX4coYikmvbmzMjb0lqODzXQZsGZ2Xyx7VPjSNrdPiPZR
 vEn2CHr2KbvmPM6cldtEl4OkeASL33WEE+7I/3ywpUPAsweAgMQn5+RjcsiRRsJRsVjq
 9XHXIiXeD6gjj7nLenR4V9aaB3Y5xhQSlXBtFZAuEf+rgvnDLY8nqQPWsLUTZiuUaWUO
 jD3rmBeTSGiC70Ayoidn2zmvEZlM3OPf/PjpD+6kLvm9R897KL8T47umwhMGlVkrqd3D
 PslPZ6wPfD8Ed/RhtKuj6FuoriPw4hpaWsULfmoh9mXZkIdwyqkYO/L28CMc4r03eMBD
 LCRQ==
X-Gm-Message-State: APjAAAXXhuBYMpvmikY0VwYi720BNCZq+IEBYWwfRnWe/2haAIl3AyVG
 /N4bTLvNA86LMP0uTV5XjIZJSg==
X-Google-Smtp-Source: APXvYqzzHVtll42Y/EfF7Kkr1FcAL67lJTuMjv7WWhev07s2ukPck+g7biSca1trnXtWbg2xVtj1Kg==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr79032114wmc.19.1564047187772; 
 Thu, 25 Jul 2019 02:33:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:cc23:f353:392:d2ee?
 ([2001:b07:6468:f312:cc23:f353:392:d2ee])
 by smtp.gmail.com with ESMTPSA id i66sm78715637wmi.11.2019.07.25.02.33.06
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 02:33:07 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, "Oleinik, Alexander" <alxndr@bu.edu>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190725032321.12721-1-alxndr@bu.edu>
 <20190725032321.12721-8-alxndr@bu.edu>
 <cbe08ddf-4552-3603-4d2c-49ea4282a47e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1f9d7f79-b314-fcac-a61b-cc50cb658c74@redhat.com>
Date: Thu, 25 Jul 2019 11:33:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cbe08ddf-4552-3603-4d2c-49ea4282a47e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [RFC 07/19] fuzz: Modify libqtest to directly
 invoke qtest.c
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
Cc: Laurent Vivier <lvivier@redhat.com>, "bsd@redhat.com" <bsd@redhat.com>,
 "superirishdonkey@gmail.com" <superirishdonkey@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/07/19 11:04, Thomas Huth wrote:
>> @@ -797,6 +832,9 @@ char *qtest_hmp(QTestState *s, const char *fmt, ...)
>>  
>>  const char *qtest_get_arch(void)
>>  {
>> +#ifdef CONFIG_FUZZ
>> +    return "i386";
>> +#endif
> 
> Hard-coding "i386" is quite ugly ... it's ok for an RFC patch, but I
> think this should be fixed in the final version of the patches. Maybe
> you could use TARGET_NAME instead?

Yes, TARGET_NAME is the one.  Also I would just split the file in two:
the common bits that are used for both libqtest and fuzz in one file, so
the libqtest and fuzz "drivers" can be in completely separate file
without #ifdefs.

Paolo

> 
>>      const char *qemu = qtest_qemu_binary();
>>      const char *end = strrchr(qemu, '/');
>>  
>> @@ -1339,3 +1377,16 @@ void qmp_assert_error_class(QDict *rsp, const char *class)
>>  
>>      qobject_unref(rsp);
>>  }
>> +#ifdef CONFIG_FUZZ
>> +void qtest_clear_rxbuf(QTestState *s){
> 
> For functions, the curly brace should start on a new line.
> 
>> +    g_string_set_size(recv_str,0);
>> +}
> 
>  Thomas
> 


