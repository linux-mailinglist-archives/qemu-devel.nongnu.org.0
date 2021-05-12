Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE637BFC9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:21:37 +0200 (CEST)
Received: from localhost ([::1]:33354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpk0-0002aP-Ef
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgpYQ-0005IT-C0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgpYK-0008VO-FH
 for qemu-devel@nongnu.org; Wed, 12 May 2021 10:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620828570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckojcbuL+tlwY5t7jPreCbliORala/pKiSj6ZzyZNok=;
 b=VPbXsZl6QSocNtovN3WkA3JCixPYZ9yVkLDFIywVTV4Pbk6Imaishhaf3Ov7+WoV1EcSHM
 6jzP/NZwucwQjvR5yeytjqmAQTGStUVNdrIYKv2nYT4l6vmO1UYkdRnySqSP4WLhM/quWb
 qwDgvj7v1bbRlpzb8FgOPBssEPleLj8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-hITswUZMMImk7YJAZd9GEA-1; Wed, 12 May 2021 10:09:29 -0400
X-MC-Unique: hITswUZMMImk7YJAZd9GEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j136-20020a1c238e0000b029014675462236so2861822wmj.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 07:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ckojcbuL+tlwY5t7jPreCbliORala/pKiSj6ZzyZNok=;
 b=JHIuodrJFtKSFOT3PYcyq75dlodlJkEPu2WvphWaNhRC9M0mc1SYSzro/1HS4GQPVi
 LuyeLWITJwVlX0qgVeGRFkKKyeLiMncTMRleTyHWSaSj6MDwgsNxpi7h0kb0W78qrid2
 EeicV/WV2qAVQmMzMoTyDNRLZLO7rCsateURrJIuqToSegKOq3ASywJgUAU43m1EajDI
 QN2Uu9boCA1aO+dxK0fDiICR0NDGwcJ6f8vFX2ih7czUeTX+YPw73P+kc8SD4QxGR/CZ
 YNV7/xRNJrs9LyFCwNa104fnH6BqJTdQwOMdMGJ7nw3W74OZvr7vOGx/n2Q/NRFku735
 Ixaw==
X-Gm-Message-State: AOAM532LuZkuXBG+xPak/aYuxcT67miDJl/KNFpG2JS9eTyWmkWKO+tK
 k11ryeLpsJ7XW+eHL/nIqzfkIBwXMvkvFCPIQgjkYShAJlw6xTM2+nl+WXqm+rqK18juQKNlAIO
 /m4tumIUVqck10to=
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr9112845wrf.420.1620828568037; 
 Wed, 12 May 2021 07:09:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2DZcuUl5I5+vQXMQIeuFc7PzTL/6waIu38H707/aufZl6dOPhA2PtQ571CLcB6A/ACCIpVw==
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr9112823wrf.420.1620828567869; 
 Wed, 12 May 2021 07:09:27 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c14sm31188346wrt.77.2021.05.12.07.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 07:09:27 -0700 (PDT)
Subject: Re: [PULL 8/9] pc-bios/s390-ccw: Allow building with Clang, too
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210510073524.85951-1-thuth@redhat.com>
 <20210510073524.85951-9-thuth@redhat.com>
 <e35749b2-2452-4a6c-2eb3-81a969a2704a@redhat.com>
Message-ID: <9bf0eaaa-2b2a-f954-77ef-ccaab203b751@redhat.com>
Date: Wed, 12 May 2021 16:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e35749b2-2452-4a6c-2eb3-81a969a2704a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:53 PM, Philippe Mathieu-Daudé wrote:
> On 5/10/21 9:35 AM, Thomas Huth wrote:
>> Clang unfortunately does not support generating code for the z900
>> architecture level and starts with the z10 instead. Thus to be able
>> to support compiling with Clang, we have to check for the supported
>> compiler flags. The disadvantage is of course that the bios image
>> will only run with z10 guest CPUs upwards (which is what most people
>> use anyway), so just in case let's also emit a warning in that case
>> (we will continue to ship firmware images that have been pre-built
>> with GCC in future releases, so this should not impact normal users,
>> too).
>>
>> Message-Id: <20210502174836.838816-5-thuth@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  configure                 | 9 ++++++++-
>>  pc-bios/s390-ccw/Makefile | 3 ++-
>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 4f374b4889..5ebc937746 100755
>> --- a/configure
>> +++ b/configure
>> @@ -5417,9 +5417,16 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
>>  fi
>>  
>>  # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
>> +# or -march=z10 (which is the lowest architecture level that Clang supports)
>>  if test "$cpu" = "s390x" ; then
>>    write_c_skeleton
>> -  if compile_prog "-march=z900" ""; then
>> +  compile_prog "-march=z900" ""
>> +  has_z900=$?
>> +  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
>> +    if [ $has_z900 != 0 ]; then
>> +      echo "WARNING: Your compiler does not support the z900!"
>> +      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
>> +    fi
>>      roms="$roms s390-ccw"
>>      # SLOF is required for building the s390-ccw firmware on s390x,
>>      # since it is using the libnet code from SLOF for network booting.
>> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>> index 83fb1afb73..cee9d2c63b 100644
>> --- a/pc-bios/s390-ccw/Makefile
>> +++ b/pc-bios/s390-ccw/Makefile
>> @@ -34,7 +34,8 @@ QEMU_CFLAGS += $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-stringop-overflow)
>>  QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
>>  QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
>>  QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
>> -QEMU_CFLAGS += -msoft-float -march=z900
>> +QEMU_CFLAGS += -msoft-float
>> +QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS),-march=z900,-march=z10)
>>  QEMU_CFLAGS += -std=gnu99
>>  LDFLAGS += -Wl,-pie -nostdlib
> 
> This broke the travis-ci  "[s390x] Clang (disable-tcg)" job:
> https://travis-ci.org/github/qemu/qemu/jobs/770794417#L1776
> 
> Description:	Ubuntu 18.04.4 LTS
> Release:	18.04
> Codename:	bionic
> 
> $ clang --version
> clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> Target: s390x-ibm-linux-gnu

Using clang-10:

C compiler for the host machine: clang-10 (clang 10.0.0-4ubuntu1 "clang
version 10.0.0-4ubuntu1~18.04.2 ")
C linker for the host machine: clang-10 ld.bfd 2.30
C++ compiler for the host machine: clang++-10 (clang 10.0.0-4ubuntu1
"clang version 10.0.0-4ubuntu1~18.04.2 ")
C++ linker for the host machine: clang++-10 ld.bfd 2.30
[...]
  Compilation
                         host CPU: s390x
                  host endianness: big
                       C compiler: clang-10
                  Host C compiler: clang-10
                     C++ compiler: clang++-10

clang-10 -Wall -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-int
-Wno-typedef-redefinition -Wno-tautological-type-limit-compare
-ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE -fwrapv
-fno-strict-aliasing -fno-asynchronous-unwind-tables
-fno-stack-protector -msoft-float -march=z10 -std=gnu99 -nostdinc
-I/home/travis/build/philmd/qemu/roms/SLOF/lib/libc/include
-I/home/travis/build/philmd/qemu/roms/SLOF/lib/libnet -MMD -MP -MT
jump2ipl.o -MF ./jump2ipl.d -O2 -g -c -o jump2ipl.o
/home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c
clang: warning: argument unused during compilation: '-msoft-float'
[-Wunused-command-line-argument]
/home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:18: error:
invalid operand for instruction
    asm volatile("lghi 1,1\n\t"
                 ^
<inline asm>:1:7: note: instantiated into assembly here
        lghi 1,1
             ^
/home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:29: error:
invalid operand for instruction
    asm volatile("lghi 1,1\n\t"
                            ^
<inline asm>:2:7: note: instantiated into assembly here
        diag 1,1,0x308
             ^
2 errors generated.
Makefile:20: recipe for target 'jump2ipl.o' failed
make[1]: *** [jump2ipl.o] Error 1


