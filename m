Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598BB6BE77C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 12:01:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd7p0-0000SF-7p; Fri, 17 Mar 2023 07:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd7om-0000Qi-BG
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 07:00:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd7ok-0000QR-Jg
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 07:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679050813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lR2gh4iULY9yvtOEtoUJzdswtC1dksdCf3aB01Bmi1M=;
 b=fLd5DRnDao/eHJDJXIntrUUkpjZDssqLcYHhrR/DL1g1JUgZf6vo20qfYP5Vk6KJzhsEfZ
 4ai1m0xpuoF/nN/LHsG5AawlWpdSrh0OESWnmO9XjIBsLwORFHorg48esV6UPhKFHuTMTs
 AodMlMkvhHc7cZEeNkCv9LISNUinCdk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-M2pwzg3QPPyUqmOEPzh_SQ-1; Fri, 17 Mar 2023 07:00:12 -0400
X-MC-Unique: M2pwzg3QPPyUqmOEPzh_SQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n2-20020adf8b02000000b002d26515fc49so698089wra.17
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 04:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679050810;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lR2gh4iULY9yvtOEtoUJzdswtC1dksdCf3aB01Bmi1M=;
 b=ZOFQfRAcKULx2rZDPRSKOrjW2IZxFmQ6MSpLTFjDFt0fc7S2Y6rsZMdnFdyTFbXY/0
 gThdvQtHdXeVs/p50adeqJZypvc1B4TpJRkh73CrT69mNnSmbhUHkdTELks3x/YQgVMD
 JmL7X0X/loGQne3XJ7hBVX66mNuIPQlveeneI9U5WE6LPpKnKG7f13zV1RQoDZgY7r/q
 ALW9vKKl5Y8L74s2m1iRHCHW/bsmrX7JIbWDb4/87FZSrlVwie/oNK8MMfd/tlU4JFkj
 lNJ0AWHQXivjpwmbLK2Q+pptH8xaR3b68ExKVk+m+xGe7b2kzxKiyJhSfUr8WLf4xrZJ
 O8sQ==
X-Gm-Message-State: AO0yUKXpqk635eGJon1x+T2gsZaJCnDdZhoRWMI0DsLiPkdMIx8Exhfb
 eQMtJYLyIBycBLTd4bulgndR8vnO9uGl+KXY8tKyVdGXLE8HTtK7i+Vf3usELWGdMFnj6WS1qXL
 dKIAAs3hUy++QMDc=
X-Received: by 2002:a05:600c:474c:b0:3ed:355c:4610 with SMTP id
 w12-20020a05600c474c00b003ed355c4610mr7904705wmo.35.1679050810759; 
 Fri, 17 Mar 2023 04:00:10 -0700 (PDT)
X-Google-Smtp-Source: AK7set8McvnjgI06smeKj1/uEcXS3KZk2/5X3v1uvYzXRSbSiHWiu90pirJOIXm7vWPSV+6N8xigPw==
X-Received: by 2002:a05:600c:474c:b0:3ed:355c:4610 with SMTP id
 w12-20020a05600c474c00b003ed355c4610mr7904681wmo.35.1679050810472; 
 Fri, 17 Mar 2023 04:00:10 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 u13-20020a7bc04d000000b003eb0d6f48f3sm7483603wmc.27.2023.03.17.04.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 04:00:09 -0700 (PDT)
Message-ID: <c7e9b213-bcf6-1f11-6c12-e62666a9def5@redhat.com>
Date: Fri, 17 Mar 2023 12:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 12/12] tests/tcg/s390x: Test unaligned accesses
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230316164428.275147-1-iii@linux.ibm.com>
 <20230316164428.275147-13-iii@linux.ibm.com>
 <41989f42-bca7-759f-8942-8b295d9f48eb@redhat.com>
In-Reply-To: <41989f42-bca7-759f-8942-8b295d9f48eb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/03/2023 11.54, Thomas Huth wrote:
> On 16/03/2023 17.44, Ilya Leoshkevich wrote:
>> Add a number of small test that check whether accessing unaligned
>> addresses in various ways leads to a specification exception.
>>
>> Run these test both in softmmu and user configurations; expect a PGM
>> in one case and SIGILL in the other.
>>
>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> ---
> ...
>> diff --git a/tests/tcg/s390x/Makefile.softmmu-target 
>> b/tests/tcg/s390x/Makefile.softmmu-target
>> index 725b6c598db..6d8bf299b28 100644
>> --- a/tests/tcg/s390x/Makefile.softmmu-target
>> +++ b/tests/tcg/s390x/Makefile.softmmu-target
>> @@ -1,11 +1,20 @@
>>   S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>   VPATH+=$(S390X_SRC)
>>   QEMU_OPTS=-action panic=exit-failure -kernel
>> +LINK_SCRIPT=$(S390X_SRC)/softmmu.ld
>> +LDFLAGS=-nostdlib -static -Wl,-T$(LINK_SCRIPT)
>> -%: %.S
>> -    $(CC) -march=z13 -m64 -nostdlib -static -Wl,-Ttext=0 \
>> -        -Wl,--build-id=none $< -o $@
>> +%.o: %.S
>> +    $(CC) -march=z13 -m64 -c $< -o $@
>> +
>> +%: %.o $(LINK_SCRIPT)
>> +    $(CC) $< -o $@ $(LDFLAGS)
>>   TESTS += unaligned-lowcore
>>   TESTS += bal
>>   TESTS += sam
>> +
>> +include $(S390X_SRC)/pgm-specification.mak
>> +$(PGM_SPECIFICATION_TESTS): pgm-specification-softmmu.o
>> +$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-softmmu.o
>> +TESTS += $(PGM_SPECIFICATION_TESTS)
>> diff --git a/tests/tcg/s390x/Makefile.target 
>> b/tests/tcg/s390x/Makefile.target
>> index cf93b966862..1002ab79886 100644
>> --- a/tests/tcg/s390x/Makefile.target
>> +++ b/tests/tcg/s390x/Makefile.target
>> @@ -2,6 +2,9 @@ S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
>>   VPATH+=$(S390X_SRC)
>>   CFLAGS+=-march=zEC12 -m64
>> +%.o: %.c
>> +    $(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
>> +
>>   config-cc.mak: Makefile
>>       $(quiet-@)( \
>>           $(call cc-option,-march=z14, CROSS_CC_HAS_Z14); \
>> @@ -33,6 +36,11 @@ TESTS+=chrl
>>   cdsg: CFLAGS+=-pthread
>>   cdsg: LDFLAGS+=-pthread
>> +include $(S390X_SRC)/pgm-specification.mak
>> +$(PGM_SPECIFICATION_TESTS): pgm-specification-user.o
>> +$(PGM_SPECIFICATION_TESTS): LDFLAGS+=pgm-specification-user.o
>> +TESTS += $(PGM_SPECIFICATION_TESTS)
> ...
>> diff --git a/tests/tcg/s390x/softmmu.ld b/tests/tcg/s390x/softmmu.ld
>> new file mode 100644
>> index 00000000000..ea944eaa3cb
>> --- /dev/null
>> +++ b/tests/tcg/s390x/softmmu.ld
>> @@ -0,0 +1,20 @@
>> +/*
>> + * Linker script for the softmmu test kernels.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +ENTRY(_start)
>> +
>> +SECTIONS {
>> +    . = 0;
>> +
>> +    .text : {
>> +        *(.head)
>> +        *(.text)
>> +    }
>> +
>> +    /DISCARD/ : {
>> +        *(*)
>> +    }
>> +}
> 
> I just gave it a try, and while it's basically working, I see a lot of these 
> messages in the console:
> 
> /usr/bin/ld: warning: .note.gnu.build-id section discarded, --build-id ignored
> 
> I think you should either pass --build-id=none to the linker, or add a 
> .note.gnu.build-id section to the linker script?

This seems to work:

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -2,7 +2,7 @@ S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
  VPATH+=$(S390X_SRC)
  QEMU_OPTS=-action panic=exit-failure -kernel
  LINK_SCRIPT=$(S390X_SRC)/softmmu.ld
-LDFLAGS=-nostdlib -static -Wl,-T$(LINK_SCRIPT)
+LDFLAGS=-nostdlib -static -Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none
  
  %.o: %.S
         $(CC) -march=z13 -m64 -c $< -o $@

I'll squash that in ... no need to resend.

  Thomas


