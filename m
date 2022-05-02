Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AB516D1C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 11:12:48 +0200 (CEST)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlS6p-00014S-Al
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 05:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlS4J-0000Ar-FW
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlS4F-0002ij-K9
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651482606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KspkaPueYED0tbF8zj9q2bHC70mELMawWh7bdKmevUA=;
 b=WtXAL6NbGoi3wXdDOWYijqApiGWglilO+KQvj1S9kmqp+5XCPWE9pRsfsfth9OxfNlcUGq
 EnkdfCs5bmJ7keY6HusFiSlhno4+o48R/c/q1+Mz25u83H1rdKcDBF0QC0gnWVopvCNpoW
 rrNWvpRE3I6/iPHnSnfj2C1lg1jRbsw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-JsmgnGx8Pm-0n2JwTGT-Cg-1; Mon, 02 May 2022 05:10:04 -0400
X-MC-Unique: JsmgnGx8Pm-0n2JwTGT-Cg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l33-20020a05600c1d2100b00394059572d6so4278998wms.8
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 02:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=KspkaPueYED0tbF8zj9q2bHC70mELMawWh7bdKmevUA=;
 b=vA6B0aaTcvkiFtzqd0KuF3k76xHoOAzIJ9WSqfE5pMPp+PiD159VtRzayNZ+ByTQCG
 JyI3BITNG/VWzNmuhesD52qwi/O+7kK9l0UtNJZJpPFUIfrIkf9oQrUTP2Dp2pBWMdId
 AexsOs5quj2kYENVrH30ixRS8vFRJxeMzYwXCHBTEb13sr+KIxmOHYq+C9cHOzPmIoCi
 eTJjyXxUyKwEcuLhaR2cL2I4df+TlLl224kV7bk+mG2bOenoXA2jzBPgogJCPSNWap0y
 7dUvnHeXf4xyV4LALx68LuxsrdgZWebxhSo8NFt8V3cQrBrS2kzvujSURfGl3JvQ4BSv
 YnEQ==
X-Gm-Message-State: AOAM533ZnrcrHWJc4r9loWmiFCJ1tMPE2I5xdwcoGTSNaSVjBIdUFvnc
 cW5t5Lf3+5jbrDfotfI8bbx+9sU4oAk4j/Q6VSj5IDUI8ySaGREFPaZpdH3a4KZLd63uACKxKvh
 Pu8DTMTHltcfJjOs=
X-Received: by 2002:a5d:6b84:0:b0:20a:e230:383b with SMTP id
 n4-20020a5d6b84000000b0020ae230383bmr8396306wrx.107.1651482603250; 
 Mon, 02 May 2022 02:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2bRlNnMiVipFQi50F1ZM/+U249HbXBYza1J8Nuv8DqvQMqS2SFY1bQhqQhRHIUnaRrEGW+A==
X-Received: by 2002:a5d:6b84:0:b0:20a:e230:383b with SMTP id
 n4-20020a5d6b84000000b0020ae230383bmr8396282wrx.107.1651482602906; 
 Mon, 02 May 2022 02:10:02 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c028e00b003942a244f2dsm6041860wmk.6.2022.05.02.02.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 02:10:02 -0700 (PDT)
Message-ID: <7c69e9b9-8bc5-efbd-67dd-d2da125872bb@redhat.com>
Date: Mon, 2 May 2022 11:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 13/13] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 David Miller <dmiller423@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220428094708.84835-1-david@redhat.com>
 <20220428094708.84835-14-david@redhat.com>
 <8c399ab0-5128-1aca-0e25-8b60e2a442fd@redhat.com>
In-Reply-To: <8c399ab0-5128-1aca-0e25-8b60e2a442fd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/05/2022 10.12, Thomas Huth wrote:
> On 28/04/2022 11.47, David Hildenbrand wrote:
>> From: David Miller <dmiller423@gmail.com>
>>
>> Signed-off-by: David Miller <dmiller423@gmail.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   tests/tcg/s390x/Makefile.target |   8 ++
>>   tests/tcg/s390x/vx.h            |  19 +++++
>>   tests/tcg/s390x/vxeh2_vcvt.c    |  88 ++++++++++++++++++++
>>   tests/tcg/s390x/vxeh2_vlstr.c   | 139 ++++++++++++++++++++++++++++++++
>>   tests/tcg/s390x/vxeh2_vs.c      |  93 +++++++++++++++++++++
>>   5 files changed, 347 insertions(+)
>>   create mode 100644 tests/tcg/s390x/vx.h
>>   create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
>>   create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
>>   create mode 100644 tests/tcg/s390x/vxeh2_vs.c
>>
>> diff --git a/tests/tcg/s390x/Makefile.target 
>> b/tests/tcg/s390x/Makefile.target
>> index f0d474a245..e50d617f21 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -17,6 +17,14 @@ TESTS+=trap
>>   TESTS+=signals-s390x
>>   TESTS+=branch-relative-long
>> +VECTOR_TESTS=vxeh2_vs
>> +VECTOR_TESTS+=vxeh2_vcvt
>> +VECTOR_TESTS+=vxeh2_vlstr
>> +
>> +TESTS+=$(VECTOR_TESTS)
>> +
>> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
> 
> I'm sorry, but this still fails in the QEMU CI:
> 
> https://gitlab.com/thuth/qemu/-/jobs/2401500348
> 
> s390x-linux-gnu-gcc: error: unrecognized argument in option '-march=z15'
> 
> I think we either have to switch to manually encoded instructions again, or 
> add a check to the Makefile and only add the tests if the compiler supports 
> -march=z15 ...? Opinions? Preferences?

I just tried, and seems like something like this should do the job, I think:

diff a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -20,11 +20,11 @@ TESTS+=branch-relative-long
  VECTOR_TESTS=vxeh2_vs
  VECTOR_TESTS+=vxeh2_vcvt
  VECTOR_TESTS+=vxeh2_vlstr
-
-TESTS+=$(VECTOR_TESTS)
-
  $(VECTOR_TESTS): CFLAGS+=-march=z15 -O2
  
+TESTS+=$(if $(shell $(CC) -march=z15 -S -o /dev/null -xc /dev/null \
+                        >/dev/null 2>&1 && echo OK),$(VECTOR_TESTS))
+
  ifneq ($(HAVE_GDB_BIN),)
  GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
  
Does that look reasonable?

  Thomas


