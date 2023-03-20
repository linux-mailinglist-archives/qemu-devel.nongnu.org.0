Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124C96C1A0C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:43:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHeV-0004am-1d; Mon, 20 Mar 2023 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peHeS-0004aH-Jw
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peHeR-0002ah-0U
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679326941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrJtzWEgtJj0fEoqH3dl8GWOrxc7wVKtpUdlU44CorE=;
 b=a4ilCvDyPSCLuUrO+Y3MSDyXB9IBKR6Xi1XWmUKDerO4cLckF2ndgrT7JYY+sEBM5ZI8lI
 aF5C/5+oU958ZhkwaTE19QkO5wuXsNTajbLP8uB2v2qhgu8ecUZmr7SMLWwzMvbXm4sWZ0
 +S4yp5vv+bbiOPxI6wpHD9Dip1Dr/ko=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-GcFO4ESMNs-07NG6c4xqRw-1; Mon, 20 Mar 2023 11:42:20 -0400
X-MC-Unique: GcFO4ESMNs-07NG6c4xqRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 e5-20020a05600c4e4500b003edc5824521so3185220wmq.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679326939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JrJtzWEgtJj0fEoqH3dl8GWOrxc7wVKtpUdlU44CorE=;
 b=a1PJ/U75viuTkv+yVb4HjmxCko1hqnilQaOZ+ymgAcoPVx1t6mCHMB6pKYedVJWmA/
 bra4H37xESarSnPg8BlRQ2kp2NFaoWymniNVRhd8ujTASXZbyWnx0/6wLA9e0WFI7i3t
 TbHc1Z5qU7Gg0kIaPA7oiby3Ohz/xXtzAc2i+FKXUGP9TboLeJHD2cr8Q3NZhxwNUcBH
 kcRS9+l8im5yG6/nif7enTEcTe7zzxX2wDLPryPBA87yw2pdvcWW21z1kmNx+6Lwghdk
 Ccc9FHk8fpsNUcbmPW0c09ESukzJhUfdIeV35vMRGcFjHvBJJ/jiM8/smic9sYX9RmoO
 DZ5Q==
X-Gm-Message-State: AO0yUKUtThV4Qa4kp4IxJAYoQrYQkaFR3yzcUJ7s6RV7pCU4oQB3A6Cf
 hCofPiiBKqMu4XQKimJT5x9Fxm7DTF+0UUva1bUzUiR8kUoEtdOCfkEC3YcZ7IUS9W+P/mm4h8O
 zQZ8zG4QunoOj5fs=
X-Received: by 2002:adf:ecc4:0:b0:2cf:e3e3:5b01 with SMTP id
 s4-20020adfecc4000000b002cfe3e35b01mr13156475wro.56.1679326939204; 
 Mon, 20 Mar 2023 08:42:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set/ixN/uKM6XZZmNXdci3Ejl4FaXQJAIeyuD8+FKOO4gi0RyefdikTg9NBeRwzm4HHFkgTNckg==
X-Received: by 2002:adf:ecc4:0:b0:2cf:e3e3:5b01 with SMTP id
 s4-20020adfecc4000000b002cfe3e35b01mr13156454wro.56.1679326938932; 
 Mon, 20 Mar 2023 08:42:18 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002cfefa50a8esm9135538wri.98.2023.03.20.08.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:42:18 -0700 (PDT)
Message-ID: <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
Date: Mon, 20 Mar 2023 16:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/1] util/async-teardown: wire up
 query-command-line-options
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
 <20230320131648.61728-2-imbrenda@linux.ibm.com> <87v8ivmocr.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87v8ivmocr.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 20/03/2023 16.31, Markus Armbruster wrote:
> Claudio Imbrenda <imbrenda@linux.ibm.com> writes:
> 
>> The recently introduced -async-teardown commandline option was not
>> wired up properly and did not show up in the output of the QMP command
>> query-command-line-options. This means that libvirt will have no way to
>> discover whether the feature is supported.
> 
> There was nothing improper in its wiring.  The issue is that
> query-command-line-options is junk.  See my recent post
> 
>      Subject: query-command-line-options (was: [PATCH 1/7] qemu: capabilities: Introduce QEMU_CAPS_MACHINE_ACPI)
>      Date: Tue, 07 Mar 2023 10:40:23 +0100
>      Message-ID: <87jzzsc320.fsf_-_@pond.sub.org>
> 
>> This patch fixes the issue by correctly wiring up the commandline
>> option so that it appears in the output of query-command-line-options.
>>
>> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
>> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
>> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
>> ---
>>   util/async-teardown.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/util/async-teardown.c b/util/async-teardown.c
>> index 62cdeb0f20..c9b9a3cdb2 100644
>> --- a/util/async-teardown.c
>> +++ b/util/async-teardown.c
>> @@ -12,6 +12,9 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include "qemu/config-file.h"
>> +#include "qemu/option.h"
>> +#include "qemu/module.h"
>>   #include <dirent.h>
>>   #include <sys/prctl.h>
>>   #include <sched.h>
>> @@ -144,3 +147,17 @@ void init_async_teardown(void)
>>       clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
>>       sigprocmask(SIG_SETMASK, &old_signals, NULL);
>>   }
>> +
>> +static QemuOptsList qemu_async_teardown_opts = {
>> +    .name = "async-teardown",
>> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_async_teardown_opts.head),
>> +    .desc = {
>> +        { /* end of list */ }
>> +    },
>> +};
>> +
>> +static void register_async_teardown(void)
>> +{
>> +    qemu_add_opts(&qemu_async_teardown_opts);
>> +}
>> +opts_init(register_async_teardown);
> 
> Now it *is* improperly wired up :)
> 
> You're defining new QemuOpts config group "async-teardown" with
> arbitrary option parameters, but don't actually use it for parsing or
> recording the option.  I figure because you can't: there is no option
> argument to parse and record, which is what QemuOpts is designed to do.
> 
> If you need the feature to be visible in query-command-line-options, you
> should make it an option parameter (a KEY, not a GROUP), preferably of
> an existing group / option.

Would it make sense to add it e.g. to "-action" instead, i.e. something like 
"-action teardown=async" ?

  Thomas


