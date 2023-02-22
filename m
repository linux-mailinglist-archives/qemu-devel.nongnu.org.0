Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2B69F959
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:53:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUsMw-0007F0-0V; Wed, 22 Feb 2023 11:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUsMt-0007EV-VB
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:53:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUsMs-0007PN-7b
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677084801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZi34RurTHFS1H+3zfXqjfxNBNedNKj1BxNCE0WUf8M=;
 b=UXiyaVJslMef4ECzaZEjHe48X2JNqemAKT4GoEsIbRzVxJ3G/o0res3B+9ERZJXaF3nqF2
 gB/rHfASnSs7ICgSt5Iap4SVZCI6OdFBkAA9x0ofpFZ4ykCBBZ56OdNX/UnvZ0AO/VieAE
 icaf0HCDVb8EArPEEJ/ZQSxi6oBlQzk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-Akh9EvfOMjWQFhQxDetHbQ-1; Wed, 22 Feb 2023 11:53:19 -0500
X-MC-Unique: Akh9EvfOMjWQFhQxDetHbQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 cz22-20020a0564021cb600b004a245f58006so12082829edb.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QZi34RurTHFS1H+3zfXqjfxNBNedNKj1BxNCE0WUf8M=;
 b=bE7O3eJFU5c1Ob+R6TZcew0XoYbpyiFAjd0CM4XeFN2ZXfK+X8fDMysrxY0WjuFMDt
 PYwPJfQY5QvaiohgQwXhtg6y7YJYFj3HCRZyarPUofVALIbffmPx985QSbJmxlRbNDD9
 n5YWRJ+1Z67uiMs/d6gZTRFX/4dF4kqEaP5YdCFhyupgYtiHkoTeciOzSg97CFojjo6o
 1Wi696SsKbPMTUP4Utli8yX+ssxDPpVsh6heL1ucpXQ8l9F69Cs91EFRP/4mbI+OmRtQ
 0JcYsj7gXGQRLX0yhaKuKjtkBySYFNMAF3nnLYfrmqNcB0aCNkxwD67HOYlgsP0bU3rb
 SCQQ==
X-Gm-Message-State: AO0yUKVLLkIsZ7WKAaeethvBnGMcKnZZY9hfF+kehwwNAt/4h6TS9Mq1
 Wyox120aPDgLJRjmKCbi55jdyzxH5k/kP5NZ2tOrsYzOVg88ke4fxA1b1m6tcytHtskKWCyDhZr
 81fclKAXmIbLkEew=
X-Received: by 2002:a17:906:10d8:b0:8b1:2dd3:cb45 with SMTP id
 v24-20020a17090610d800b008b12dd3cb45mr16620184ejv.42.1677084798415; 
 Wed, 22 Feb 2023 08:53:18 -0800 (PST)
X-Google-Smtp-Source: AK7set8UqHnXlYVxCzdVdt37PNpApgyOCyQ2JHFapoCVgxU3y+NQlHbmEJ2llLJ21KHsNzKHPGaEOg==
X-Received: by 2002:a17:906:10d8:b0:8b1:2dd3:cb45 with SMTP id
 v24-20020a17090610d800b008b12dd3cb45mr16620165ejv.42.1677084798142; 
 Wed, 22 Feb 2023 08:53:18 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a170906260700b008b8ae79a72bsm6524827ejc.135.2023.02.22.08.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:53:17 -0800 (PST)
Message-ID: <45976b88-b7b7-f502-b7e1-998a7d413921@redhat.com>
Date: Wed, 22 Feb 2023 17:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/10] meson: prefer 'sphinx-build' to 'sphinx-build-3'
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org,
 thuth@redhat.com, alex.bennee@linaro.org, berrange@redhat.com
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-4-pbonzini@redhat.com> <87cz61ll9j.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87cz61ll9j.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/22/23 17:26, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> From: John Snow <jsnow@redhat.com>
>>
>> Once upon a time, "sphinx-build" on certain RPM platforms invoked
>> specifically a Python 2.x version, while "sphinx-build-3" was a distro
>> shim for the Python 3.x version.
>>
>> These days, none of our supported platforms utilize a 2.x version, so it
>> should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
>> which will prefer pip/venv installed versions of sphinx if they're
>> available.
>>
>> This adds an extremely convenient ability to test document building
>> ability in QEMU across multiple versions of Sphinx for the purposes of
>> compatibility testing.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Message-Id: <20230221012456.2607692-6-jsnow@redhat.com>
> 
> Accident?

No but I can remove it.

>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   docs/meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/docs/meson.build b/docs/meson.build
>> index 9136fed3b730..906034f9a87f 100644
>> --- a/docs/meson.build
>> +++ b/docs/meson.build
>> @@ -1,5 +1,5 @@
>>   if get_option('sphinx_build') == ''
>> -  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
>> +  sphinx_build = find_program(['sphinx-build', 'sphinx-build-3'],
>>                                 required: get_option('docs'))
>>   else
>>     sphinx_build = find_program(get_option('sphinx_build'),
> 
> In review of the original "[PATCH v3 5/6] meson: prefer 'sphinx-build'
> to 'sphinx-build-3'", I challenged the check for sphinx-build-3.

I missed your message from this morning.  I can remove this.

Paolo


