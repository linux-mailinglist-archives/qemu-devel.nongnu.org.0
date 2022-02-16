Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EE4B8B69
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 15:29:15 +0100 (CET)
Received: from localhost ([::1]:47304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKLIw-0006X7-Ex
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 09:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKLHn-0005np-CF
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:28:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKLHk-0004qR-2h
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 09:28:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645021678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xbBqFDRx0tu/gzrhQKVwarblQT2aHOtqrQ15z/jTVZ8=;
 b=HjdNjd+bawfJLOYXK6td9ZW26SlM4KTmnwsJRAD5ft/OwfXqRDfP0i1sDjbC71tDqJr+zv
 lZjMs5+qXCmrdHT10j9+LKAB9YatiROaxsKXgGHlQStd47x6dZX4asee2vzjOUq8cHo1rS
 JJnSzuIf6h4bj4EZ5s4pkiVNdV7Bidg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-aBUcG7TAPfSBeai-5h4xHA-1; Wed, 16 Feb 2022 09:27:57 -0500
X-MC-Unique: aBUcG7TAPfSBeai-5h4xHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a05600c210e00b0037bddd0562eso516741wml.1
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 06:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xbBqFDRx0tu/gzrhQKVwarblQT2aHOtqrQ15z/jTVZ8=;
 b=OlAqjSJDzEM+cUdl2aC6+OkgPkINASlpj6J2/h3Pha8nNYw24Ro/7E1B/T7tuB1EgB
 jRdsaHbFRkMkq2miyXX/fZYELRrbafwCXBj5E+DFy5DPb2+tNDMAYFsq31KoX/frfv7V
 skuzA6J9hWAL1Joytd3vIIm6f/08bHCfZicUhyMtbLuA1sRV3kOduAWHMJnm278CecOA
 mfjuqBZ2CT55sDqqLbDaPtb97T49ochHOWrVjJSA2pAMRSRu/dor/Q+dPaW7lwnD7tAe
 BLrV//nRryZUZ7QbZi+vH1kFZa7A7d46KZkjtxGXnwv0PTBcLHF/tcVHQ/GJqSdrRIyY
 objg==
X-Gm-Message-State: AOAM533TfKnnMgeikRbPeGE4jzyMfe08h7koTj+Y6gRAyN7OLzcssXpT
 9Kj9IZ4QRVzDC/txfCQ9/AhQqAhjHrHFJQ02/5rB1P8UA0+gn/7LZAvAmwll5nFCGA3JVI2hyoR
 URdSqt758DeVD2no=
X-Received: by 2002:a05:600c:12c8:b0:37c:af2a:5781 with SMTP id
 v8-20020a05600c12c800b0037caf2a5781mr1915625wmd.55.1645021676483; 
 Wed, 16 Feb 2022 06:27:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHnLbZeGgYYrho5u9PM/fBlW2RsyFmthHrWy3AUZJzyxXHNwkt1BXm3s8q8U+CFnP1AcGGgQ==
X-Received: by 2002:a05:600c:12c8:b0:37c:af2a:5781 with SMTP id
 v8-20020a05600c12c800b0037caf2a5781mr1915598wmd.55.1645021676226; 
 Wed, 16 Feb 2022 06:27:56 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id a9sm20456569wrg.53.2022.02.16.06.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:27:55 -0800 (PST)
Message-ID: <ba5b894e-5aba-054f-bd66-6bbf029fceeb@redhat.com>
Date: Wed, 16 Feb 2022 15:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
 <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com> <871r02dh8q.fsf@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <871r02dh8q.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: farman@linux.ibm.com, qemu-devel@nongnu.org, cohuck@redhat.com,
 richard.henderson@linaro.org, thuth@redhat.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 15:19, Alex Bennée wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 15.02.22 21:27, David Miller wrote:
>>> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
>>> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
>>> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
>>>
>>> Signed-off-by: David Miller <dmiller423@gmail.com>
>>> ---
>>>   tests/tcg/s390x/Makefile.target |  2 +-
>>>   tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
>>>   tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
>>>   tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
>>>   4 files changed, 130 insertions(+), 1 deletion(-)
>>>   create mode 100644 tests/tcg/s390x/mie3-compl.c
>>>   create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
>>>   create mode 100644 tests/tcg/s390x/mie3-sel.c
>>>
>>> diff --git a/tests/tcg/s390x/Makefile.target 
>>> b/tests/tcg/s390x/Makefile.target
>>> index 1a7238b4eb..16b9d45307 100644
>>> --- a/tests/tcg/s390x/Makefile.target
>>> +++ b/tests/tcg/s390x/Makefile.target
>>> @@ -1,6 +1,6 @@
>>>   S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>>   VPATH+=$(S390X_SRC)
>>> -CFLAGS+=-march=zEC12 -m64
>>> +CFLAGS+=-march=z15 -m64
>>
>> Unfortunately, this makes our docker builds unhappy -- fail. I assume the
>> compiler in the container is outdated.
>>
>> $ make run-tcg-tests-s390x-linux-user 
>> changing dir to build for make "run-tcg-tests-s390x-linux-user"...
>> make[1]: Entering directory '/home/dhildenb/git/qemu/build'
>>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
>>   BUILD   debian10
>>   BUILD   debian-s390x-cross
>>   BUILD   TCG tests for s390x-linux-user
>>   CHECK   debian10
>>   CHECK   debian-s390x-cross
>>   BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
>> s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'
>> s390x-linux-gnu-gcc: note: valid arguments to '-march=' are: arch10
>> arch11 arch12 arch3 arch5 arch6 arch7 arch8 arch9 g5 g6 native z10 z13
>> z14 z196 z9-109 z9-ec z900 z990 zEC12; did you mean 'z10'?
>>
>> Maybe debian11 could, work.
>>
>> @Thomas do you have any idea if we could get this to work with
>> '-march=z15' or should we work around that by manually encoding
>> the relevant instructions instead?
> 
> Yeah you'll need to update the docker container. The way it works is we
> always assume the docker based compilers have the compiler features
> needed to test something. tests/tcg/configure.sh does feature tests for
> compilers which are detected on the host filesystem (e.g. do we support
> SVE).
> 
> My last testing/next post:
> 
>   Subject: [PATCH  v1 00/11] testing/next (docker, lcitool, ci, tcg)
>   Date: Fri, 11 Feb 2022 16:02:58 +0000
>   Message-Id: <20220211160309.335014-1-alex.bennee@linaro.org>
> 
> converted the aarch64 container to debian11 with lci-tool. You should be
> able to do the same with the s390x one.
> 

I followed the upstream debain11 test-only aarch64 and powerpc example
and posted the s390x one that seems to work at:

https://lkml.kernel.org/r/20220216115102.206129-1-david@redhat.com

Hopefully that's what you had in mind as well. (I am not familiar with
lci-tool)

-- 
Thanks,

David / dhildenb


