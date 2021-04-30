Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75836FE0F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 17:51:33 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVQR-0007aZ-1R
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 11:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVNI-0006jU-NO
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:48:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVNE-00009c-EN
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 11:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619797691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+x/qTPdW3YLPmwHvuPmRKO/hohfXbBaE1IyjrzUmUK4=;
 b=ELOoQBU56MLVUUOCmFRPtgkhMl0UFf4s1Dh22G6Rlpfb00L1yQhTZEsaUoCfmeFMBEuaTB
 iCv9MAnRr8OX3WNTORmglu8BOnsqlGNmSQbNDX+Ii8ge75BCnx0r95ojkh+F6HsIq2awhX
 R3sz9+AA67c3PI8A+DBvsd+OgQ/LWF8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-COBuiVhgMbmtTWxnIFpd9w-1; Fri, 30 Apr 2021 11:48:08 -0400
X-MC-Unique: COBuiVhgMbmtTWxnIFpd9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c205-20020a1c9ad60000b02901477e6d427bso589651wme.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+x/qTPdW3YLPmwHvuPmRKO/hohfXbBaE1IyjrzUmUK4=;
 b=lM3CUc9Unro8A4QjhjLKQ7s9ESwZ6mv8aYwGnbuiMHUmINiVq5qmkSgefhTkDBm3JT
 U99YhKtb9+BvKfswtP5/CHSeNxziK92uNh4qTzHtEODiZEy9/+F4MyQuUziGPLEAbZku
 FVFnxwvED+zvn8XIW976q9CSPjck5GAOLB4n9TMlsslMmsmXCuzHTfR7BsoPckelA5O8
 /y2sVw0jXyCPJOD4vFfrdWzygk/jepBdvKiPJ0MLc+5xO3FS7w5bC8wm1v4oSAESMev2
 hw8MovVVXeJi0u1uYChhfWahIDJUbkBcez1OQBvsVMwFSxgu7YHnW6L+D8KwHU2adp7L
 QqqA==
X-Gm-Message-State: AOAM533Yleqe84C5kIBU8+vYnNlH1IHw0gGZKnBYGg9kY3hMJz8h/y5G
 48ru9LM+/W2V090A/GiXNVFT+A6y1t5a+ONMcskVodwv2eAZDc1tgWWMPbeHfIU0Ggx5ubrcz9L
 L7aWjam9YS1LvkiU=
X-Received: by 2002:a1c:c5:: with SMTP id 188mr3383736wma.5.1619797687484;
 Fri, 30 Apr 2021 08:48:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMkS9AbSkmqvF2CBhomjcPA4ZtwsJg0ML1NaJ1q0lv/j7cs5DP8T99Liw9Lf8uh3ePMkbAYw==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr3383708wma.5.1619797687230;
 Fri, 30 Apr 2021 08:48:07 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id j13sm2615429wrw.93.2021.04.30.08.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 08:48:06 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test build-independent
 from accelerator
To: Markus Armbruster <armbru@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
 <87lf91ir1m.fsf@dusky.pond.sub.org>
 <1de6b3f8-7d7c-9280-4cd3-633a19dd9b8e@redhat.com>
 <874kfprzrw.fsf@dusky.pond.sub.org>
 <603c7934-ea16-baf8-9ae5-ab221db345c7@redhat.com>
 <87zgxgnvtv.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <32bc66bc-1ccf-c146-52ac-83c7b4913930@redhat.com>
Date: Fri, 30 Apr 2021 17:48:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgxgnvtv.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 8:13 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>> On 4/29/21 3:22 PM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>>>> Now than we can probe if the TCG accelerator is available
>>>>>> at runtime with a QMP command, do it once at the beginning
>>>>>> and only register the tests we can run.
>>>>>> We can then replace the #ifdef'ry by a runtime check.
>>>>>>
>>>>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>
>>>>> Please read the last remark first.  The other ones are detail; feel free
>>>>> to skip them until we're done with the last one.
>>>>>
>>>>>> ---
>>>>>>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>>>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>>>> +    tcg_accel_available = qtest_has_accel("tcg");
>>>>>> +
>>>>>
>>>>> When does tcg_accel_available differ from defined(CONFIG_TCG)?
>>>>
>>>> qtest_has_accel("tcg") is a runtime check, while defined(CONFIG_TCG)
>>>> is build-time.
>>>
>>> Let me rephrase my question: under what conditions can the values of
>>> qtest_has_accel("tcg") and defined(CONFIG_TCG) differ?
>>
>> They are currently the same, so this patch is a no-op. *But* it
>> allows us to remove the global dependence on CONFIG_TCG in the
>> Meson machinery (see the last commit in this series).
>>
>> Is that missing part of the commit description?
>>
>> "This will allow us to remove the global CONFIG_TCG dependency
>> in our Meson machinery in a pair of commits."?
> 
> Do you mean "in the next two commits"?

Yes.

> Please also note that the probing at run-time always gives the same
> result as the compile-time check it replaces.
> 
> I don't understand what exactly the conversion to probing enables and
> how, but I believe I don't have to.

This series is removing some limitations in qtests to help Claudio work:

x86: https://www.mail-archive.com/qemu-devel@nongnu.org/msg793885.html
arm: https://www.mail-archive.com/qemu-devel@nongnu.org/msg799328.html
s390x: https://www.mail-archive.com/qemu-devel@nongnu.org/msg800254.html

which allow building with different sets of accelerators (and more).

Claudio/Paolo could better explain :)


What I like from feature tested at runtime is we can run qtests using
older binaries, binaries built with different configure flags, or the
binaries installed by the distribution.

Thanks,

Phil.


