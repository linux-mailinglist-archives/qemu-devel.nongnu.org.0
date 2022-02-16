Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCBB4B8670
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:07:07 +0100 (CET)
Received: from localhost ([::1]:53922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKI9K-0004QS-AY
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKI1I-0006Ch-14
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:58:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKI0x-0002uJ-LO
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645009107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVT4ooLJ+r98/o/zYAV96eh6LeHFokyvwSnrVLhNQFA=;
 b=TAbjFjNVNw/rb7nsXc9MvG0d/v5uhIIYgV+s6Xw3gISPkimLRjXwcsI4Q+7urhGs4RJs7d
 f2E8Mr7i1UPx3vEQWew9E3m9Fw4tLpwvV8FqmjKMfHa54aig420iKFOrjcyOnNBTBscETn
 ymyPk+k0KlV0s35KwDSbrV/4gKTI3r8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-GBBAU4_mPwChXBIFopkCvg-1; Wed, 16 Feb 2022 05:58:25 -0500
X-MC-Unique: GBBAU4_mPwChXBIFopkCvg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l9-20020a05600c1d0900b0037be9e5f7e8so127699wms.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 02:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=AVT4ooLJ+r98/o/zYAV96eh6LeHFokyvwSnrVLhNQFA=;
 b=CSxojI25D2y5jRZWkmdUpqUFDGlpiBZIGPXFO4Wvm2lqR+1B6joCen4ISp8hjAE+CY
 f9indenz7Qsmw/i1OFSW7menXpihI95u7M/dyPLNi9oA3hkbO890z13/FH0NZ7dgRo4f
 EUIiIaSbDWW3V1EOFQBryJnAearI5EjHXBdlFX4q7Efmd1hIU2/HJjpeYU73yl6TFCMN
 KD6RJl04tX2Yb6bO4ztyKuzP6VRMmMjrej1238p/uhVfJf/jwHDhcBPIhK6f8YIS6VdY
 tLdtlTmpwTxtgaz6pjLCX29qCNL+RCPBHicXg5jNbWNyNxwEu/SVmR/bE1P37gCJ0RVK
 N9Sw==
X-Gm-Message-State: AOAM533MtXZB59aw988AYaRohHk5ellNie6yfPHYDscINEFb3Jy2Cf7c
 rFPq15FXmc/QQWQhGtXoICS03d+ExqVoaXA/nrkixMOuv3x6XkhIXL2lI/v4p4Da4RbVVu37WyZ
 WpcTIQpyxf9BalsQ=
X-Received: by 2002:a05:6000:1787:b0:1e7:aeac:eb00 with SMTP id
 e7-20020a056000178700b001e7aeaceb00mr1879774wrg.141.1645009104743; 
 Wed, 16 Feb 2022 02:58:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbMxNE1riWyA5ujKRlZBg1AZPMHs2kR0k0BRCr8/p/AznOPxqDQdYoMlIBKPyFfFMxisS4mQ==
X-Received: by 2002:a05:6000:1787:b0:1e7:aeac:eb00 with SMTP id
 e7-20020a056000178700b001e7aeaceb00mr1879749wrg.141.1645009104463; 
 Wed, 16 Feb 2022 02:58:24 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id t1sm42937137wre.45.2022.02.16.02.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:58:24 -0800 (PST)
Message-ID: <d291cc11-84d4-1f46-1b3d-1a804914989c@redhat.com>
Date: Wed, 16 Feb 2022 11:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
From: David Hildenbrand <david@redhat.com>
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
 <24fd99ab-d2b2-1c0c-7273-0321300cc5cc@redhat.com>
Organization: Red Hat
In-Reply-To: <24fd99ab-d2b2-1c0c-7273-0321300cc5cc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 10:57, David Hildenbrand wrote:
> On 15.02.22 21:27, David Miller wrote:
>> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
>> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
>> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
>>
>> Signed-off-by: David Miller <dmiller423@gmail.com>
>> ---
>>   tests/tcg/s390x/Makefile.target |  2 +-
>>   tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
>>   tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
>>   tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
>>   4 files changed, 130 insertions(+), 1 deletion(-)
>>   create mode 100644 tests/tcg/s390x/mie3-compl.c
>>   create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
>>   create mode 100644 tests/tcg/s390x/mie3-sel.c
>>
>> diff --git a/tests/tcg/s390x/Makefile.target 
>> b/tests/tcg/s390x/Makefile.target
>> index 1a7238b4eb..16b9d45307 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -1,6 +1,6 @@
>>   S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>   VPATH+=$(S390X_SRC)
>> -CFLAGS+=-march=zEC12 -m64
>> +CFLAGS+=-march=z15 -m64
>>   TESTS+=hello-s390x
>>   TESTS+=csst
>>   TESTS+=ipm
> 
> Your patch is missing the following hunk:
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 16b9d45307..54e67446aa 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -7,6 +7,9 @@ TESTS+=ipm
>  TESTS+=exrl-trt
>  TESTS+=exrl-trtr
>  TESTS+=pack
> +TESTS+=mie3-compl
> +TESTS+=mie3-mvcrl
> +TESTS+=mie3-sel
>  TESTS+=mvo
>  TESTS+=mvc
>  TESTS+=shift
> 
> 
> With debian11, I can build the tests. However, mie3-sel seems to have an issue:
> 
> 
>   TEST    mie3-compl on s390x
>   TEST    mie3-mvcrl on s390x
>   TEST    mie3-sel on s390x
> timeout: the monitored command dumped core
> make[3]: *** [../Makefile.target:156: run-mie3-sel] Error 132
> make[2]: *** [/home/dhildenb/git/qemu/tests/tcg/Makefile.qemu:102: run-guest-tests] Error 2
> make[1]: *** [/home/dhildenb/git/qemu/tests/Makefile.include:59: run-tcg-tests-s390x-linux-user] Error 2
> make[1]: Leaving directory '/home/dhildenb/git/qemu/build'
> make: *** [GNUmakefile:11: run-tcg-tests-s390x-linux-user] Error 2
> 
> qemu-s390x gets killed via
> 
> "Program terminated with signal SIGILL, Illegal instruction."
> 

Fault on my end, I forgot to copy the "SELECT HIGH" instruction when
manually applying each hunk.

With that, tests run fine under debian11.


-- 
Thanks,

David / dhildenb


