Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE45ED80C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:41:40 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSdP-0000b3-UF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRZ4-0001Jb-AV
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:33:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRZ1-0002cb-Fl
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664350382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4j+gySH6yIqsb29C2H2Ao8B9frLe3QjIxFOpVcbH4Y=;
 b=QFcD/K2+x+Um43uFdqJgRWVqnofcl/ZJcJOng+0Z86QxnivNYEgX5tgnyqEmptvR05LzBF
 AnLlExTlqfpFlkcL2ZF/atKiGKTn3IfPFadU9g7U2oAFhMt22YGVBD28hUPgxeGTByHsPz
 UV/a/6wM6F76xPFQtN8XTfyc29dYucc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-6sgiygauP1qFHkXYAB4LQw-1; Wed, 28 Sep 2022 03:33:01 -0400
X-MC-Unique: 6sgiygauP1qFHkXYAB4LQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r23-20020adfb1d7000000b002286358a916so2698459wra.3
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 00:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=p4j+gySH6yIqsb29C2H2Ao8B9frLe3QjIxFOpVcbH4Y=;
 b=sTcqBjtsCrw71BrgsD9tBqAPmzJodaanB1HDzkOLPLd2hq5zFcAw52snGX/23X8fPy
 qsnHB2Yo7xpDs0bU4CSm+eHMsS1EheXc+tKUsJD47RVcbgGXisEFM946XB7VxijYhtGz
 CptZ7UPpKKW9dkWHAKuEit8l/ljhBF5Xs9gj467cNqZme9Qj5T32IUL7pwGnXvW8hSTx
 8S27iyNGT7MV0Lq/MiYNVseGbcOIwG6m0nL5A6/2Kj0MPcXsasqgewFLlUnQ0sG4yoYM
 fWJznvzyUyG0BSeCGZEcmqWNO+5CzCHcg4PeF0uMP+ZdC03mzizX2UliZ+hpGRtlZ9UE
 X0Ug==
X-Gm-Message-State: ACrzQf0L6vKlWDvda+rOlf6utXjc1mYY35kCHgveepJPHmSys2PAuIlB
 TkViiGtzWWhG4ZlKmpdYWRRzFzbNM5+W/x/uRdf7Srk/dINQgBd3OEUb3txuQFJ3AGcG6nrgwsB
 W1WiJTnHJSozhLZQ=
X-Received: by 2002:a05:6000:1a45:b0:22c:bdbe:28e4 with SMTP id
 t5-20020a0560001a4500b0022cbdbe28e4mr4841827wry.1.1664350380292; 
 Wed, 28 Sep 2022 00:33:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5X3tnKHKvqWHjm4tRLvJXr3HXZRpVggNJTSsJFrPvPyHAFwy7B5NX+hvpvCJvvRW1XFOc3Zw==
X-Received: by 2002:a05:6000:1a45:b0:22c:bdbe:28e4 with SMTP id
 t5-20020a0560001a4500b0022cbdbe28e4mr4841809wry.1.1664350380075; 
 Wed, 28 Sep 2022 00:33:00 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 bg33-20020a05600c3ca100b003a5f4fccd4asm952234wmb.35.2022.09.28.00.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 00:32:59 -0700 (PDT)
Message-ID: <28f3d1b1-f17f-e5b3-99aa-772fef2a9d94@redhat.com>
Date: Wed, 28 Sep 2022 09:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-11-ani@anisinha.ca>
 <CAFn=p-b_uVDib7qFcy=6fsMCGrcY8hQ89ZsQAfQMuHO26WM1dg@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121220420.1824593@anisinha-lenovo>
 <YxdG4LISpDFvBr0k@redhat.com> <20220927172212-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 10/11] pytest: add pytest to the meson build system
In-Reply-To: <20220927172212-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 23.26, Michael S. Tsirkin wrote:
> On Tue, Sep 06, 2022 at 02:10:56PM +0100, Daniel P. Berrangé wrote:
>> On Tue, Jul 12, 2022 at 12:22:10PM +0530, Ani Sinha wrote:
>>>
>>>
>>> On Mon, 11 Jul 2022, John Snow wrote:
>>>
>>>> On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
>>>>>
>>>>> Integrate the pytest framework with the meson build system. This will make meson
>>>>> run all the pytests under the pytest directory.
>>>>>
>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>>> ---
>>>>>   tests/Makefile.include   |  4 +++-
>>>>>   tests/meson.build        |  1 +
>>>>>   tests/pytest/meson.build | 49 ++++++++++++++++++++++++++++++++++++++++
>>>>>   3 files changed, 53 insertions(+), 1 deletion(-)
>>>>>   create mode 100644 tests/pytest/meson.build
>>>>>
>>>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>>>> index 3accb83b13..40755a6bd1 100644
>>>>> --- a/tests/Makefile.include
>>>>> +++ b/tests/Makefile.include
>>>>> @@ -3,12 +3,14 @@
>>>>>   .PHONY: check-help
>>>>>   check-help:
>>>>>          @echo "Regression testing targets:"
>>>>> -       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
>>>>> +       @echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest, pytest and decodetree tests"
>>>>
>>>> Does this mean that "make check" *requires* an internet connection?
>>>
>>> No. My test will be skipped if it is unable to download the artifacts it
>>> requires due to lack of Internet connectivity.
>>
>> That's not the only concern, there are also people who have metered
>> internet connections, or whose connections are slow and thus have
>> long download times. Any test that downloads should be opt-in only.
>>
>>
>> With regards,
>> Daniel
> 
> <rant>
> This is why I wanted git submodules. A well understood decentralized
> model. Now we are reinventing them badly.

I don't see much of a difference here with submodules with regards to 
Daniel's concerns: If you clone the QEMU repo with a good internet 
connection, you also don't get the submodules by default. If you then move 
to a bad internet connection or offline and the build system tries to pull 
in the submodule, you've also lost.
OTOH, with downloads, you can also make sure to have all downloads cached 
while you're still on the good internet connection. The cache should 
continue working if you're then moving offline.

> I asked on the maintainers summit what issues people have with
> submodules, no one volunteered any information.

You know my position already 
(https://lore.kernel.org/qemu-devel/d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com/), 
so at least I did not feel the need to repeat that again (and we were pretty 
short in time anyway).

  Thomas


