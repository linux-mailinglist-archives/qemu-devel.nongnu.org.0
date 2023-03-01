Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9380F6A6D65
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:51:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMqn-0004vm-BV; Wed, 01 Mar 2023 08:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXMqT-0004hx-Eb
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXMqP-00027U-88
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:50:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677678606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARl01kO4NQHL5LufhXit3RCoBBsu55tMIA+2UZWr3wE=;
 b=hLrB8fbie+YeLsilVON9j7iH1yYvTiR3Ho5A90uK3pRuDoukkKGgbLmk1YpuHNS2S7AGxI
 +GlOE0pSkrWxgH3UjVHAdQPV2KLmXU4293Mn2TsnmTCghX10ZCcF3lG0Gg7+8zZ8On4EHy
 A14W+yZEFD9jUH2EIKzhmpiNK0Wgd4s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-LSmzB-gwMsKoHLyenzpLXg-1; Wed, 01 Mar 2023 08:50:05 -0500
X-MC-Unique: LSmzB-gwMsKoHLyenzpLXg-1
Received: by mail-wm1-f70.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso4585176wmb.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 05:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ARl01kO4NQHL5LufhXit3RCoBBsu55tMIA+2UZWr3wE=;
 b=G4g+JD5OfGxcrPsF1fSGGVuhzc9/8kvKJPFByztHCon8FKG17ts9aa13vn2ZI9tSyv
 YLJeD27x2Lkn5faNiHqqg9cqPMQ7L2UgWDz/dzSuFUM6Io6wL3qXlPwDqBI19m6YdMfU
 elTSZ6yphdXHYmUmXDi15WuS58zo12ppZNKFFaTE9AMZYmu/xAsbx7RbJ/w8P7hWWkD+
 DYFTL5GXQLX8obtZElhXP4yL7m9o8uCt7OZqGEQgvSCTBleHR2+pBv+htwF2Pyf2qVgJ
 EWBmgxq6CQY4/yKc/nDYeGrHOHFkj0HZAIdnajwdGQoj4dBlDCu1AKAFFJ4ZH+Y/SUKN
 F4jw==
X-Gm-Message-State: AO0yUKUTxhzN2bIPVShdBSNnGyPu9XqlG6b33qCz5opJxpfyy4FMosgp
 nO7jenmCSs0g14Sq9n4f1pKWpy8J8qFqp8TTsGev1tql8zadhca9lOD/gXMB504ND7udelfICoG
 8dJoO2Y8BC6mNhPE=
X-Received: by 2002:a05:600c:1817:b0:3da:28a9:a900 with SMTP id
 n23-20020a05600c181700b003da28a9a900mr5151733wmp.41.1677678604165; 
 Wed, 01 Mar 2023 05:50:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8pk+gTU7wYAnKNyCeZoF54qWzmkFH6siNuegXs+qMe3cxGtg2WKCsAtCauBrTZUkYsYyujmg==
X-Received: by 2002:a05:600c:1817:b0:3da:28a9:a900 with SMTP id
 n23-20020a05600c181700b003da28a9a900mr5151715wmp.41.1677678603817; 
 Wed, 01 Mar 2023 05:50:03 -0800 (PST)
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com.
 [80.187.122.219]) by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003dd1bd66e0dsm15663143wml.3.2023.03.01.05.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 05:50:03 -0800 (PST)
Message-ID: <eae501c0-ae00-e357-e04d-d34832c5a85e@redhat.com>
Date: Wed, 1 Mar 2023 14:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
 <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com> <87v8jkk37n.fsf@suse.de>
 <87o7pck2o7.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87o7pck2o7.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01/03/2023 14.43, Fabiano Rosas wrote:
> Fabiano Rosas <farosas@suse.de> writes:
> 
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> On 28/02/2023 20.26, Fabiano Rosas wrote:
>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>> host.
>>>>
>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>
>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>> test cases if TCG and KVM are missing.
>>>>
>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>> ---
>>> ...
>>>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>>>> index 3aef3a97a9..45490f5931 100644
>>>> --- a/tests/qtest/boot-serial-test.c
>>>> +++ b/tests/qtest/boot-serial-test.c
>>>> @@ -17,6 +17,9 @@
>>>>    #include "libqtest.h"
>>>>    #include "libqos/libqos-spapr.h"
>>>>    
>>>> +static bool has_tcg;
>>>> +static bool has_kvm;
>>>
>>> Any special reason for putting these here instead of making them local
>>> variables in the main() function?
>>>
>>
>> Yes, Phillipe was doing work in the same file and I put it here to
>> minimize conflicts.
>>
>> https://lore.kernel.org/r/20230119145838.41835-5-philmd@linaro.org
>>
>>>>    static const uint8_t bios_avr[] = {
>>>>        0x88, 0xe0,             /* ldi r24, 0x08   */
>>>>        0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
>>>> @@ -285,6 +288,13 @@ int main(int argc, char *argv[])
>>>>        const char *arch = qtest_get_arch();
>>>>        int i;
>>>>    
>>>> +    has_tcg = qtest_has_accel("tcg");
>>>> +    has_kvm = qtest_has_accel("kvm");
>>>> +
>>>> +    if (!has_tcg && !has_kvm) {
>>>> +        return 0;
>>>> +    }
>>>> +
>>>>        g_test_init(&argc, &argv, NULL);
>>>
>>> Could you please put the new code below the g_test_init() ?
>>> Just to avoid the problem that has been reported here:
>>>
>>>    https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08331.html
>>>
>>
>> I could, but I don't understand why we need this. What does having
>> "code" before g_test_init() causes? Should I move the qtest_get_arch()
>> that's already there as well?
> 
> Oh, the issue is the early return? I guess it makes sense.

Yes, as far as I've undrestood the issue: If we call a function that starts 
a QEMU subprocess (like qtest_has_device() or qtest_has_accel()), then this 
could spoil the output since the TAP version from g_test_init() should come 
first.

qtest_get_arch() is not a problem, since it does not start a QEMU subprocess.

  Thomas



