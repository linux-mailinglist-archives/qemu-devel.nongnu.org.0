Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4155544E1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 11:33:21 +0200 (CEST)
Received: from localhost ([::1]:42792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3wjg-0002et-Je
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 05:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o3whb-0000zp-69
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:31:13 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o3whZ-000125-1h
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 05:31:10 -0400
Received: by mail-ej1-x62f.google.com with SMTP id ay16so13545810ejb.6
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5R97i4OtenCFBC50RHVTLaKxPAYnREvJnGlzf9hAcGA=;
 b=DyeGaMyZ6oMztCjYWmsUujWVSbVY67L9DpYmTOFYgW+jRZ+jjW5h1rBVoHkwAP4oKf
 FIJ4RBmce+JOpXdXL9zWFkuWssRnp/49HDJPswLEWFl38XW3WWeibt6Odu+FyBGNslGj
 L4lKZqgLATAAKAF/nK3uMiqNlTcQnG4qhVnjK8B0YNqOR+EhGruOYVmDafPhzk9lM/5x
 K8dBiZAFbcpQuUMHwxQeB7X7MmJB62HLD7MKuuJdsEYma9ti8XCJXp3kYbVwQyidfhIx
 sOLdtPS7nmCMjSXzUY28uRc/MAQBOb4ePU77iaEqbQRduMQijvyuGs30cE93HWTIYImn
 FJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5R97i4OtenCFBC50RHVTLaKxPAYnREvJnGlzf9hAcGA=;
 b=xBFCw2PPmlyKGOkyhYjKDVSqAo+kFDiaZQdUafBxD3r5G+sqPFW7u6BCzJAlk53PXY
 04A7uCGyCzoJ7h+BarT50ZN+JnIIO3Mhi4d3pk9+ailuDWvS/3Dy68VyQK5XZWKIb03n
 Na6DtOnTzR1a/30TRMNN8chWXV7XF/nQH0EY92Fe7wf7ZYBpflRjaikIHhrAAWlgxrTK
 0jktYVtDIKHc5FNAtI2kEuhbYhhcHfIfcD2zDNwt8MdcxLQiMTKlLJPDOaNq0OtkXXcZ
 itR7VuSUYX7LrG/XU3cJNm9Tm6qHCALvKZi2bA1FMpT6F5+a1FNFqKQkWoMd1KM3kHrw
 +eKw==
X-Gm-Message-State: AJIora8oqVH0X2IuZQWqtsOEWHylKcs5HGSofcdKmUy2ekF1pw8O/I+z
 ONUeyzO3j6QqvFSMZSxk1us=
X-Google-Smtp-Source: AGRyM1tV57yr1CLFPoRiPScq4Ij3udo4RMWYI6VAt5JToMy3hT8gjVGX1dgT4/URv0K/4tLOqtP3Ag==
X-Received: by 2002:a17:907:97d5:b0:706:76ba:f28f with SMTP id
 js21-20020a17090797d500b0070676baf28fmr2116228ejc.367.1655890266855; 
 Wed, 22 Jun 2022 02:31:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6211655ejc.196.2022.06.22.02.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 02:31:06 -0700 (PDT)
Message-ID: <dfff6cba-e490-830b-21e9-85a96795e1b2@redhat.com>
Date: Wed, 22 Jun 2022 11:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/6] configure, pc-bios/optionrom: pass cross CFLAGS
 correctly
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220621075147.36297-1-pbonzini@redhat.com>
 <20220621075147.36297-3-pbonzini@redhat.com>
 <d2a9550e-28dc-bbd1-098c-ea16a4a031d5@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <d2a9550e-28dc-bbd1-098c-ea16a4a031d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/21/22 16:55, Richard Henderson wrote:
> On 6/21/22 00:51, Paolo Bonzini wrote:
>> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
>> index ea89ce9d59..e90ca2e1c6 100644
>> --- a/pc-bios/optionrom/Makefile
>> +++ b/pc-bios/optionrom/Makefile
>> @@ -11,7 +11,7 @@ CFLAGS = -O2 -g
>>   quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 
>> && $1, @$1))
>>   cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null 
>> >/dev/null 2>&1 && echo OK), $1, $2)
>> -override CFLAGS += -march=i486 -Wall -m16
>> +override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16
> 
> Hmm.  I'm not sure about this.  Given that EXTRA_CFLAGS is going to be 
> e.g. -m32 or empty, being immediately overwritten to -m16, I don't quite 
> see the point.

I added it mostly for consistency with the other pc-bios subdirectories, 
and because it can also be overridden with --cross-cflags-i386 though.

Even for the default -m32, however, there would be a reason to have 
$(EXTRA_FLAGS) in there.  I have played with removing the direct use of 
"ld -m" in the build of pc-bios/optionrom, and stumbled on a weird GCC 
configuration issue.  The problem is that some hosts pick the right 
linker emulation when given -m16, but others don't:

$ gcc -dumpspecs
...
*link:
... %{m16|m32|mx32:;:-m elf_x86_64}  %{m16|m32:-m elf_i386}

# x86_64-w64-mingw32-gcc
...
*link:
%{!m32:-m i386pep} %{m32:-m i386pe} ...

The error is in GCC's gcc/config/i386/mingw-w64.h, which provides a 
MULTILIB_DEFAULTS #define but does not rely on it:

#undef SPEC_32
#undef SPEC_64
#if TARGET_64BIT_DEFAULT
#define SPEC_32 "m32"           // should be m16|m32
#define SPEC_64 "!m32"          // should be m64
#else
#define SPEC_32 "!m64"          // should be m16|m32
#define SPEC_64 "m64"
#endif

So you need -m32 -m16 on 64-bit hosts!  For the "working" specs the -m16 
would override -m32, while on the broken ones -m32 is for the linker and 
-m16 is for the compiler.

Paolo

