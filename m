Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D086E272D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:43:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLYs-0004Mu-PI; Fri, 14 Apr 2023 11:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnLYq-0004Mg-NC
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:42:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pnLYl-000243-8d
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681486918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yhco7jT/TC1doXoqIvq9KOU04XPgdkASgzA2UOyX+fo=;
 b=Z2NIG9rOClvgpgxUYQWv0ETau1X9SdlfRcMeIiFzA4ZpOZi85pil2/6KtY06Ynf+LsDYZd
 RGiaRP/NsoJMDz2xC2jy9ri/MZpfteUxtmAVOSPidECkaNRG8dl7Ft8aE5Lh85Zp1x8BGa
 OjmOa8LpuQete+Pys3p5fP/yLeAxugE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-vv_fRDOkOdCTWmzb_mcRng-1; Fri, 14 Apr 2023 11:41:56 -0400
X-MC-Unique: vv_fRDOkOdCTWmzb_mcRng-1
Received: by mail-wm1-f70.google.com with SMTP id
 j34-20020a05600c1c2200b003f0ad53c14eso2004505wms.5
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681486915; x=1684078915;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yhco7jT/TC1doXoqIvq9KOU04XPgdkASgzA2UOyX+fo=;
 b=I7Co7IpMVvySK9bbwxEBEQT0oOPY19kYjb5TAryeM9tXjACkUdKZvT5s0kULKwNUWr
 MRB6fV8I+O6lVJrbfL6hijYoFf59oIAgLiCHdb9cMarv2/w5sbARUfu3G1h+njrWbIBU
 vAhslqNVynrVQFZ1F7XL/AyvHk9lABNgb7Fah84w9kWxsU213Q2d7OIILsHvYLqh+sQU
 OnzsaYk7GnRHEN4kTjfFxI2CrdzJul9F7DSNHmFk9yqjHKPiwtbqUs4osv6lPoNfNgK1
 MSIKmfkoGijZS6upbA6fxuHVOP/U+aIHvwCeU4fUL56Ykm5A4U0f1z75vHkzjQ1s9eE1
 AERQ==
X-Gm-Message-State: AAQBX9elyl0RipVk1DuNg19we4pXddfsw7LZGLIlG96jxZ/XJkcQ64M4
 k622nqWCRp0vMDeHDBKu+d3ozKegmQZ9nKJ+uJLC0RPny0mxZ58TeIN8QqGCS5L2pEmzlHW/Dro
 XgOpjJRFwZGB8XaQ=
X-Received: by 2002:a05:600c:24e:b0:3ef:71d5:41d8 with SMTP id
 14-20020a05600c024e00b003ef71d541d8mr4883284wmj.32.1681486915329; 
 Fri, 14 Apr 2023 08:41:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350aK0uSxZ3K/aIklRsVJdvLpuPKC+xQ7dJM/ddz2Kvu7hfUvubddWGSPgmX1QBgAD9lygOzpSA==
X-Received: by 2002:a05:600c:24e:b0:3ef:71d5:41d8 with SMTP id
 14-20020a05600c024e00b003ef71d541d8mr4883270wmj.32.1681486914997; 
 Fri, 14 Apr 2023 08:41:54 -0700 (PDT)
Received: from [192.168.8.105] (tmo-096-44.customers.d1-online.com.
 [80.187.96.44]) by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003f09d7b6e20sm4616394wmc.2.2023.04.14.08.41.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:41:54 -0700 (PDT)
Message-ID: <c48c2c3c-3ddf-d11f-a119-0bc0b22176e9@redhat.com>
Date: Fri, 14 Apr 2023 17:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: clean after distclean gobbles source files
Content-Language: en-US
To: Steven Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <bafc456e-34be-f2a4-71fc-e52ed964484e@oracle.com>
 <5caa18b7-9920-7867-77aa-5d9770cbde14@redhat.com>
 <bb433891-8f08-626e-21f1-e002f7a842e2@oracle.com>
Cc: Michael Roth <michael.roth@amd.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <bb433891-8f08-626e-21f1-e002f7a842e2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.282, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/04/2023 17.30, Steven Sistare wrote:
> On 4/13/2023 7:41 AM, Thomas Huth wrote:
>> On 07/04/2023 17.44, Steven Sistare wrote:
>>> Run 'make distclean', and GNUmakefile is removed.
>>> But, GNUmakefile is where we cd to build/.
>>> Run 'make distclean' or 'make clean' again, and Makefile applies
>>> the clean actions, such as this one, at the top level of the tree:
>>>
>>>       find . \( -name '*.so' -o -name '*.dll' -o \
>>>             -name '*.[oda]' -o -name '*.gcno' \) -type f \
>>>           ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>>>           ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
>>>           -exec rm {} +
>>>
>>> For example, it removes the .d source files in 'meson/test cases/d/*/*.d'.
>>> The damage could be worse in the future if more suffixes are cleaned.
>>>
>>> I don't have a suggested fix.  Recursion and the GNUmakefile bootstrap
>>> make it non-trivial.
>>
>> That's somewhat ugly, indeed.
>>
>> We could maybe disallow make [dist]clean if running in-tree? Something like that:
>>
>> diff a/Makefile b/Makefile
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -26,7 +26,7 @@ quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
>>   quiet-@ = $(if $(V),,@)
>>   quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
>>   
>> -UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
>> +UNCHECKED_GOALS := TAGS cscope ctags dist \
>>       help check-help print-% \
>>       docker docker-% vm-help vm-test vm-build-%
>>   
>> @@ -201,7 +201,7 @@ recurse-distclean: $(addsuffix /distclean, $(ROMS))
>>   
>>   ######################################################################
>>   
>> -clean: recurse-clean
>> +clean: config-host.mak recurse-clean
>>          -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
>>          -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
>>          find . \( -name '*.so' -o -name '*.dll' -o \
>>
>>
>> ... or if we still want to allow that, maybe just make an exception for the *.d files:
>>
>> diff --git a/Makefile b/Makefile
>> index e421f8a1f4..0cb2a7aa98 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -208,6 +208,7 @@ clean: recurse-clean
>>                    -name '*.[oda]' -o -name '*.gcno' \) -type f \
>>                  ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>>                  ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
>> +               ! -path './meson/test cases/d/*/*.d' \
>>                  -exec rm {} +
>>          rm -f TAGS cscope.* *~ */*~
>>   
>>
>> What do you think?
> 
> Actually, all make targets are broken if we do not cd to build first.

I think some of them work from the source directory, too... e.g. "make help" 
or "make vm-build-XXX" or "make dist" ... not sure how important this 
possibility is ... I guess "make dist" is still a thing? Michael?

> This should do the trick.  If you agree, I will submit a patch.
> 
> diff --git a/Makefile b/Makefile
> index a48103c..3d03101 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -4,6 +4,10 @@ ifneq ($(words $(subst :, ,$(CURDIR))), 1)
>     $(error main directory cannot contain spaces nor colons)
>   endif
> 
> +ifneq ($(notdir $(CURDIR)),build)
> +$(error To build in tree, run configure first.)
> +endif

If we decide to go down that road, I think you should remove the existing 
"Please call configure before running make" UNCHECKED_GOALS logic in that 
file, too.

  Thomas


