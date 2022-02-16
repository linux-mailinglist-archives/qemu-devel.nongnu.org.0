Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561F4B8518
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:01:44 +0100 (CET)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKH83-0007GH-0i
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:01:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKGeK-0008Jy-9N
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKGeI-0001jn-GH
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645003857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuZYi1i20kHWaj4jmO+2bNcjv7KtU/u4TujFqu7bLB4=;
 b=IYPgbs2qMBLsi2YhFojN4D7FRq9R/CX4LWkEuu2m/pbCKiaGN58KZU0/4YSIwxXI4CB8kw
 6M2e6KRRE3agruwcTY3i25SZpmkauCYXRpYfwRiRUqh/oGfOq57fNRu7SWTSv8YAqDqTgd
 GzvJtHuUtY5EK8Dy756RKUQqccqTc5U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-CHTkEyPBMOGZ8Xc8w3idcA-1; Wed, 16 Feb 2022 04:30:56 -0500
X-MC-Unique: CHTkEyPBMOGZ8Xc8w3idcA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r8-20020a7bc088000000b0037bbf779d26so243579wmh.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iuZYi1i20kHWaj4jmO+2bNcjv7KtU/u4TujFqu7bLB4=;
 b=T5nsgIbBioTwerQd6mh27Hv9VLrzO2cFfZ8fBELtWaUlsUO1ZjwtK5hBrJRywAjZUT
 m06XHAISKzwkUfQlumP5vLkzMohdKOCNcQynQCc7TQZYG5PynU4hNXcN1K1BJxX1bopm
 5GhsLjDPNqHN2ugKKc8Knhm6F+fu5FBRxyuQJZGMT2a76efv0gg0KtOlRREQ00renpL8
 +XzFDIDVPkzGloYzuFee/GqhU/pzN3O0mHWx+yHv9TE5jYtT1Ammj3o5Dt5dSVU6kq3s
 /k6eIjFY+Plcf0haQ/vmpxvJLN+b4yPYTSkjBLTGlyTWP97tYzUmCHf1n0rmkgDn2NXV
 et/A==
X-Gm-Message-State: AOAM533EXIDGVSV++enJX9FjI3MW+NhiIYztkbdupqz9BcapJWalDSYj
 Wl+dEBN+kZEEpykFGZUn01igAghyZZFPLYAIhFQoY+dQ22uDsWqaBSUMoQM7ZmjmsH3XdmJ5ZGN
 LPDcF3MCgNOTINiw=
X-Received: by 2002:adf:cd05:0:b0:1e3:1387:c642 with SMTP id
 w5-20020adfcd05000000b001e31387c642mr1547018wrm.413.1645003855461; 
 Wed, 16 Feb 2022 01:30:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqbxCOCDcqnGhHesOxwA7sCbH0hG7aVVzwIDc4mhmr1udHZ9VNEcvUbHsXnTDU2t6YIpwNnQ==
X-Received: by 2002:adf:cd05:0:b0:1e3:1387:c642 with SMTP id
 w5-20020adfcd05000000b001e31387c642mr1546997wrm.413.1645003855156; 
 Wed, 16 Feb 2022 01:30:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c70b:600:4ff7:25c:5aad:2711?
 (p200300cbc70b06004ff7025c5aad2711.dip0.t-ipconnect.de.
 [2003:cb:c70b:600:4ff7:25c:5aad:2711])
 by smtp.gmail.com with ESMTPSA id h17sm15768668wrx.58.2022.02.16.01.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:30:54 -0800 (PST)
Message-ID: <12d23368-e51c-8d03-bc4a-35877d4920fc@redhat.com>
Date: Wed, 16 Feb 2022 10:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 3/3] s390x/tcg/tests: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, thuth@redhat.com
References: <b69367a6-7744-6dbf-c370-3019bd66965c@gmail.com>
 <65402899-e2ad-0a59-e77a-07f2f8ca4ff2@redhat.com>
 <30804e5d-74bd-b7be-7615-5d7c3690a902@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <30804e5d-74bd-b7be-7615-5d7c3690a902@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: pasic@linux.ibm.com, farman@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 10:28, Christian Borntraeger wrote:
> 
> 
> Am 16.02.22 um 10:17 schrieb David Hildenbrand:
>> On 15.02.22 21:27, David Miller wrote:
>>> tests/tcg/s390x/mie3-compl.c: [N]*K instructions
>>> tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
>>> tests/tcg/s390x/mie3-sel.c:  SELECT instruction
>>>
>>> Signed-off-by: David Miller <dmiller423@gmail.com>
>>> ---
>>>    tests/tcg/s390x/Makefile.target |  2 +-
>>>    tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
>>>    tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
>>>    tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
>>>    4 files changed, 130 insertions(+), 1 deletion(-)
>>>    create mode 100644 tests/tcg/s390x/mie3-compl.c
>>>    create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
>>>    create mode 100644 tests/tcg/s390x/mie3-sel.c
>>>
>>> diff --git a/tests/tcg/s390x/Makefile.target
>>> b/tests/tcg/s390x/Makefile.target
>>> index 1a7238b4eb..16b9d45307 100644
>>> --- a/tests/tcg/s390x/Makefile.target
>>> +++ b/tests/tcg/s390x/Makefile.target
>>> @@ -1,6 +1,6 @@
>>>    S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>>    VPATH+=$(S390X_SRC)
>>> -CFLAGS+=-march=zEC12 -m64
>>> +CFLAGS+=-march=z15 -m64
>>
>> Unfortunately, this makes our docker builds unhappy -- fail. I assume the
>> compiler in the container is outdated.
>>
>> $ make run-tcg-tests-s390x-linux-user
>> changing dir to build for make "run-tcg-tests-s390x-linux-user"...
>> make[1]: Entering directory '/home/dhildenb/git/qemu/build'
>>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
>>    BUILD   debian10
>>    BUILD   debian-s390x-cross
>>    BUILD   TCG tests for s390x-linux-user
>>    CHECK   debian10
>>    CHECK   debian-s390x-cross
>>    BUILD   s390x-linux-user guest-tests with docker qemu/debian-s390x-cross
>> s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'
>> s390x-linux-gnu-gcc: note: valid arguments to '-march=' are: arch10 arch11 arch12 arch3 arch5 arch6 arch7 arch8 arch9 g5 g6 native z10 z13 z14 z196 z9-109 z9-ec z900 z990 zEC12; did you mean 'z10'?
>>
>> Maybe debian11 could, work.
>>
>> @Thomas do you have any idea if we could get this to work with
>> '-march=z15' or should we work around that by manually encoding
>> the relevant instructions instead?
> 
> Yes, the problem is that binutils reject new mnemomics for older -march settings.
> The Linux kernel handles this by using
> .insn instead of the mnemonic. This will also allow to compile the testcase with older compilers/binutils.
> 
> So something like
> "ncrk  0, 3, 2" -> ".insn rrf,0xb9f50000,0,3,2,0"
> 

I tried

diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker
b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 9f2ab51eb0..10e70e0fe8 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -1,9 +1,9 @@
 #
 # Docker s390 cross-compiler target
 #
-# This docker target builds on the debian Stretch base image.
+# This docker target builds on the debian Bullseye base image.
 #
-FROM qemu/debian10
+FROM qemu/debian11

But some of the packages we need (including
gcc-multilib-s390x-linux-gnu) seem to be "held broken":

E: Unable to correct problems, you have held broken packages.

-- 
Thanks,

David / dhildenb


