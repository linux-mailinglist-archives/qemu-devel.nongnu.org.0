Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1369775B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSCBh-0005eW-S8; Wed, 15 Feb 2023 02:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSCBZ-0005dj-Bf
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:26:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSCBX-0001OS-Ss
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676445994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zdcbz2Y6J4MKcMBUo3Cg36/nALRfiLoC1AAKuL+99c=;
 b=Kad92rxYrvreW7mZ6n8I9+Me530lTDmpSrFAfioZjQtGrQ3gKp0lXqp4lm1dl9T1q6Bnvj
 MDAyFhZVq7E9de2a9S9wsEIa343vL9x215IzQ+IElTkDew5175BEvYsWKd4Yh3GqaOpqbE
 0WXwg4pdYMSBLFBNAdCD9yLwDsvR0b4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-Rqz7IhnOMz2LSz4l6rN-Pw-1; Wed, 15 Feb 2023 02:26:33 -0500
X-MC-Unique: Rqz7IhnOMz2LSz4l6rN-Pw-1
Received: by mail-qt1-f197.google.com with SMTP id
 i5-20020ac813c5000000b003b86b748aadso10780537qtj.14
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 23:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/zdcbz2Y6J4MKcMBUo3Cg36/nALRfiLoC1AAKuL+99c=;
 b=Qnx40R87/67JnwN8hVeILrKNb4LH7KPPwHodecccJ3r38ExTgVm5O1/AM1YAavx+EK
 QqQTjqnFNAuMjhXwMMxcqCEXsEtsKPrZxSRJOT9PSz37nT3lAvr0Z5fUl9OmvF5F4BkZ
 K8V/0PVHRqVz6qeXPlrqtLQZ5Ow2KEPkK1jq9di1pLdD/gZc91Ofva1uzhbDnzMsrvYu
 BX7wIaBrNhe2gzOWJ+qboCCLJ6/xk0OhBWK0Ut9UMJ7Uzp++WmY7sdwC+YnOnt9dE36P
 N8R7/XPK8LXN7EcJ77o7r82A+f59py3nM+xsFN8dLZVWK6kSk2Et1K8zrXVw42Y+nfiK
 +ENQ==
X-Gm-Message-State: AO0yUKXN8NJFpfEgoPlhO31bYefHysk7wFlkJSfBD4xw/n/6hCGzNqIh
 WRN+lRg07klEeBqTuD513joXo4kgSaOHUjh4m+Encdnz1nDxb+pWpvH+OY+m0WDv4SMV7kruWGk
 G7nsxeQBL9G/imv0=
X-Received: by 2002:a05:622a:164a:b0:3b8:2e92:94e7 with SMTP id
 y10-20020a05622a164a00b003b82e9294e7mr1858591qtj.44.1676445992734; 
 Tue, 14 Feb 2023 23:26:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8NZQ5dD1Pa0a+xg/kq2YImhlGgwlM0R0bpoEZCsyTIOk8WJ2gDzj6oXs6IJFid+p2XXn52Sw==
X-Received: by 2002:a05:622a:164a:b0:3b8:2e92:94e7 with SMTP id
 y10-20020a05622a164a00b003b82e9294e7mr1858569qtj.44.1676445992450; 
 Tue, 14 Feb 2023 23:26:32 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-79.web.vodafone.de.
 [109.43.176.79]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac84102000000b003b62bc6cd1csm12733076qtl.82.2023.02.14.23.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 23:26:31 -0800 (PST)
Message-ID: <0f7d28f5-03ff-3a39-d308-de8ff696616e@redhat.com>
Date: Wed, 15 Feb 2023 08:26:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] target/s390x/arch_dump: Simplify memory allocation in
 s390x_write_elf64_notes()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 frankja@linux.ibm.com
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230215054834.726355-1-thuth@redhat.com>
 <a8cc2a89-c34e-986b-eaa0-317db14228f8@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a8cc2a89-c34e-986b-eaa0-317db14228f8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 15/02/2023 08.10, Philippe Mathieu-Daudé wrote:
> On 15/2/23 06:48, Thomas Huth wrote:
>> We are not on a hot path here, so there is no real need for the logic
>> here with the split heap and stack space allocation. Simplify it by
>> always allocating memory from the heap.
>>
>> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Based-on: <20230214141056.680969-1-thuth@redhat.com>
>>
>>   target/s390x/arch_dump.c | 20 ++++++--------------
>>   1 file changed, 6 insertions(+), 14 deletions(-)
>>
>> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
>> index a7c44ba49d..84e17effda 100644
>> --- a/target/s390x/arch_dump.c
>> +++ b/target/s390x/arch_dump.c
>> @@ -227,25 +227,23 @@ static int s390x_write_elf64_notes(const char 
>> *note_name,
>>                                          DumpState *s,
>>                                          const NoteFuncDesc *funcs)
>>   {
>> -    Note note, *notep;
>> +    g_autofree Note *notep = NULL;
>>       const NoteFuncDesc *nf;
>> -    int note_size, content_size;
>> +    int note_size, prev_size = 0, content_size;
> 
> We can start with:
> 
>    prev_size = sizeof(Note);
> 
> If this goes thru your tree, feel free to modify without respining.

But then I'd also need to initialize notep above differently, don't I?
And if I've got it right, this function sometimes also deals with chunks 
that are smaller, so I think it's cleaner if we start with zero instead of 
sizeof(Note).

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

  Thomas


