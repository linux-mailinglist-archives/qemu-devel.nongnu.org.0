Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29B4B8538
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:06:57 +0100 (CET)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHD6-0007LD-Pi
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:06:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKGqC-0007wA-P3
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:43:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKGqB-0004NV-8U
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645004594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5RUxtV8kYPYtKpWlA2vLDqX2MvulDXrbWMZ/1CUmwHk=;
 b=Qch1pzNQazkHQYn5ZTL5JaiFsQZKqJVvBgZ6Q7wpRJaRNcLsYBCGQ+4ACHi54jH11WB/vO
 tIjIctcv4Pl8Qz1kzfQ9E9eprLv7hkcJbsg485vyQtomUgbQl6CRxJnL3Vo3eRYUYCMeKp
 sZEeRQm5qTtdpWFzdilXj+njwGTGIDg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-lbhFMO_4OTaONQKvaLHXIA-1; Wed, 16 Feb 2022 04:43:08 -0500
X-MC-Unique: lbhFMO_4OTaONQKvaLHXIA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so866455wrg.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5RUxtV8kYPYtKpWlA2vLDqX2MvulDXrbWMZ/1CUmwHk=;
 b=N6f2OfZaLRfBAoGDtU4Fp1JGv9s5VIik9a7T1lFn2hQM60fj9fgizE/lR9h5pBvOvG
 gVYm6Lhwgbxzg7ZhrGjst6LD8RaKsUivSHEfawGuOczjyPABh0seqOWnzOm3L82xzQua
 gg52NRjvQ2PMajqP5kiZu1bEY65tr9LpWNWXpRgpQCw4qyDDFAqL8Hijwkb0+yZgMJAt
 vQEwZ1egx4u75wxu8VKzA98vC2RA1Z9bCef0C2ojvCTLlsXH8chZuCPRKsiwiHRAiLju
 vSqRL0G9Y/6GuftBKyKPckr/34iDujfWvaibtWPE6HhhumP1w0eMtktNyX9DzssCeEKj
 phXw==
X-Gm-Message-State: AOAM531H1aXs54QcuSH3JPYjSw6nWQ94ukhrNknAj52kMdxRUZOgieUQ
 +JXPIJK5jRFsbVxCYN7iKS8v9aOjeyqyoD2KzJIxaJhobZEye49YIfirv7xhODzrezoTV2EJF+V
 SoKtzP4Ccxwztcdg=
X-Received: by 2002:a5d:5701:0:b0:1e4:ab98:74c5 with SMTP id
 a1-20020a5d5701000000b001e4ab9874c5mr1573204wrv.704.1645004587004; 
 Wed, 16 Feb 2022 01:43:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOqdakfBi7JawTA5I1d6SwF9XXbO9iPKCSHcjP5cQSPKTiWd9WHvmKL0Np8M1acbCMeZe3gw==
X-Received: by 2002:a5d:5701:0:b0:1e4:ab98:74c5 with SMTP id
 a1-20020a5d5701000000b001e4ab9874c5mr1573178wrv.704.1645004586713; 
 Wed, 16 Feb 2022 01:43:06 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o20sm17115531wmq.21.2022.02.16.01.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:43:06 -0800 (PST)
Message-ID: <79af3435-0cbc-9c27-f29e-8aa2d5175c65@redhat.com>
Date: Wed, 16 Feb 2022 10:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: David Hildenbrand <david@redhat.com>, David Miller
 <dmiller423@gmail.com>, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
 <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: farman@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 10.17, David Hildenbrand wrote:
> On 15.02.22 21:27, David Miller wrote:
...
>> diff --git a/tests/tcg/s390x/Makefile.target
>> b/tests/tcg/s390x/Makefile.target
>> index 1a7238b4eb..16b9d45307 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -1,6 +1,6 @@
>>    S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>    VPATH+=$(S390X_SRC)
>> -CFLAGS+=-march=zEC12 -m64
>> +CFLAGS+=-march=z15 -m64
> 
> Unfortunately, this makes our docker builds unhappy -- fail. I assume the
> compiler in the container is outdated.
> 
> $ make run-tcg-tests-s390x-linux-user
> changing dir to build for make "run-tcg-tests-s390x-linux-user"...
> make[1]: Entering directory '/home/dhildenb/git/qemu/build'
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
>    BUILD   debian10
>    BUILD   debian-s390x-cross
>    BUILD   TCG tests for s390x-linux-user
>    CHECK   debian10
>    CHECK   debian-s390x-cross
>    BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
> s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'
> s390x-linux-gnu-gcc: note: valid arguments to '-march=' are: arch10 arch11 arch12 arch3 arch5 arch6 arch7 arch8 arch9 g5 g6 native z10 z13 z14 z196 z9-109 z9-ec z900 z990 zEC12; did you mean 'z10'?
> 
> Maybe debian11 could, work.
> 
> @Thomas do you have any idea if we could get this to work with
> '-march=z15' or should we work around that by manually encoding
> the relevant instructions instead?

I'm not an expert when it comes to containers, but I think you could try to 
update to debian11 in tests/docker/dockerfiles/debian-s390x-cross.docker and 
in ./.gitlab-ci.d/container-cross.yml ... if that does not work, it's maybe 
better to manually encode the instructions.

  Thomas


