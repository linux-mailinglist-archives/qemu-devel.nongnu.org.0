Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D54B7008
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:11:13 +0100 (CET)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0Q3-0007lY-VX
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:11:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nK0Or-0006ss-D9
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:09:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nK0On-0007Du-UN
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644941391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAFrEfHyjUaeJSFLO+knla5NBMrmoBhERGUno+z4YXE=;
 b=EjyfsP/2xVku+UwyATwPIMhWa/D2PSRVDrRD6ZiFftxvXIMdjHJQBCM2ZMUB1vCASTP1Au
 iktIENYJlGADKjnT3CLA7560vBTwTbC/Bs/Y13WVZGwH7Kdg+i79Ud9NX6GusQROHypGN3
 8fwEbzwuVbe/l3YAxhSxKV4Mmxk9OB0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-thmTKs4eMACQoCdCV_3QCA-1; Tue, 15 Feb 2022 11:09:50 -0500
X-MC-Unique: thmTKs4eMACQoCdCV_3QCA-1
Received: by mail-wr1-f71.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so8541950wrg.19
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 08:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZAFrEfHyjUaeJSFLO+knla5NBMrmoBhERGUno+z4YXE=;
 b=odk4tBZqwd28Lmg1/e7BpoYchLz7eOouR6GeiKKLF7RB38dulFWlFgZYZudrpujvu6
 OPIfjK1quzaTCDPdfFaaUP7Ek41aDkOoC8F5PdloRCdYcv4v4GhqJNRC0UtGmPqqgsar
 XRCYyNroaAAjkkHvcig4CKM1p7NLstrJMg8jL3mJJ1UZIZonNws9LXCHgnRAIR1hqcHg
 DVekEn8y6yKI6jI4d0JWURmRhbNh9Ld4HZaw4DNF2IODTNIZGr0Asxxo/ccf3fXYtWLK
 M9okXSuxtdm9VM3j2fMPDeF4s/T7yXylCOtyktzi3dTRrHxx8i+kBCQd2iSAYiRfJ7Dc
 Texw==
X-Gm-Message-State: AOAM532MIN4/fH1RH0TMwMNtuNEG8gB+55Dljh6jmk/Ewmt0IBv8EWk9
 +h3k6qWOODIa5gl56ZNAgVOMJn/jK0kEAFeBAKIT7q73DPxUwoOJ5SNsOm/0wQQkyEZzyHFaBgR
 pWZHzeOMJ9mmLdh8=
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr3738757wrr.454.1644941388930; 
 Tue, 15 Feb 2022 08:09:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpvXIDIzHeyf0IJG9a5uvxfIrxmUCTeVCoW0qcSaoLfO6PBYDXuAJJFDOLA0+8y7r+mTzPDw==
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr3738730wrr.454.1644941388609; 
 Tue, 15 Feb 2022 08:09:48 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id i15sm20002405wmq.23.2022.02.15.08.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 08:09:48 -0800 (PST)
Message-ID: <2cd49c37-8774-89e4-977c-6de3fee5c0ab@redhat.com>
Date: Tue, 15 Feb 2022 17:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
 <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
 <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
 <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
 <80372081-ca28-7566-9fa7-6e6820a7b37f@redhat.com>
 <20220211161410.sbxfy7tf7patm25i@redhat.com>
 <e5d38a7d-93a2-beb9-c621-838c8ed43231@redhat.com>
 <804188e2-6426-6fe2-f8c3-70316e5c7c44@redhat.com>
 <Yguv4PfwuoUE/Kio@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yguv4PfwuoUE/Kio@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/2022 14.51, Daniel P. Berrangé wrote:
> On Tue, Feb 15, 2022 at 02:28:24PM +0100, Thomas Huth wrote:
>> On 11/02/2022 17.48, Thomas Huth wrote:
>>> On 11/02/2022 17.14, Eric Blake wrote:
>>>> On Tue, Feb 08, 2022 at 03:52:19PM +0100, Thomas Huth wrote:
>>>>>>> The current code with $SED has been introduced almost three years
>>>>>>> ago already...
>>>>>>>
>>>>>>>>     Can’t we just do `alias sed=gsed`?
>>>>>>>
>>>>>>> Maybe ... but let's ask Philippe and Kevin first, who Signed-off
>>>>>>> commit bde36af1ab4f476 that introduced the current way with $SED:
>>>>>>> What's your opinion about this?
>>>>>>
>>>>>> This commit was to have check-block working on the OpenBSD VM image.
>>>>>
>>>>> Sure. The question was whether using an alias as suggested by Hanna would be
>>>>> nicer instead of using $SED ?
>>>>
>>>> Scripting with aliases becomes a nightmare to debug, since it is
>>>> relatively uncommon.  In particular, in bash, you have to explicitly
>>>> opt in to using aliases (contrary to POSIX sh where aliases are
>>>> available to scripts at startup).
>>>
>>> shopt -s expand_aliases
>>> ... as I just learnt the hard way ;-)
>>>
>>>> Using $SED everywhere may require
>>>> more hunting, but it is more obvious when reading a test that "oh
>>>> yeah, I might be using extensions that the default 'sed' can't
>>>> support" than a script that blindly uses 'sed' and depends on it
>>>> aliasing to a more-capable sed at a distance.
>>>>
>>>> The other question is how many GNU sed features are we actually
>>>> depending on?  Which tests break if we have BSD sed or busybox sed?
>>>> Can we rewrite those sed scripts to avoid GNU extensions?  But
>>>> auditing for s/sed/$SED/ seems easier than auditing for which
>>>> non-portable sed extensions we depend on.
>>>
>>> The most obvious part are the filter functions in common.filter - we're
>>> using "-r" here that is not part of the POSIX sed as far as I can see.
>>
>> Now that I stepped through the list, the other major part that is failing on
>> non-GNU seds are the statements that use "\r" or "\n" or "\e" to replace
>> special characters. That seems to be a non-POSIX extension, too.
>>
>> But for running with Alpine, there is also the additional problems that the
>> libc uses slightly different error strings, e.g. "I/O error" instead of
>> "Input/output error", see e.g.:
>>
>>   https://gitlab.com/thuth/qemu/-/jobs/2094869856
>>
>> Maybe it could be fixed with some extensions to the filters, but I'm not
>> sure whether we really want to go down that road...?
> 
> AFAIK, errno strings are not standardized by POSIX, so I presume this
> problem will apply to running I/O tests on any non-Linux system too.
> 
> With this in mind I think we should consider what a portable solution
> looks like. We can't simply match the Alpine strings and turn them
> into GLibC strings, as that does nothing to help portability on *BSD,
> macOS, Windows, etc.
Luckily, the strings did not cause that much problems on *BSDs and macOS 
yet... Most of the current set of tests works fine there. It's really just 
that libc from Alpine that is causing this trouble...

  Thomas


