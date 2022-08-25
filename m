Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A025A12F7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:05:52 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDUU-00087E-Oz
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDRB-0006P6-9h
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:02:25 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRDR9-0007kP-DO
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:02:24 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y141so19863119pfb.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=ZKzkDoBK8t7mlIQqGgW5V6IUm7vy/i3+LWaDDqSmOrk=;
 b=Z9c6uNV7Dd1LT2GqDHosbgWAVpZg/xsdkYQyo/j/JqcaG5iEOWhh5yEtj1WdUbBK7p
 NmgOC7Aj3Qgnq3iU9m2FuqcDuR6LZOcVWnn5MSNx6jpBmxatKD1zGM2CH+LOden47OQW
 EQdkBaUAJ/Hab1HqhrqvBqWH9qxEMbfYCOSozTuktUqjwVqiKqVD8Yk+UZ2jO6oxMNvv
 xGa5LTgPZTT9WWz5J4Jvpp1vlbV+YnWPtDkUShgS4x5yO6o+ljBgiRVxvxEwpYdz8+ES
 2Vktp1yDSj6z9CJ86kYA7vzfto+fdz+jGdTnniYmM/4DcCLFdQDXaWl+N+wP25s7//gE
 lSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=ZKzkDoBK8t7mlIQqGgW5V6IUm7vy/i3+LWaDDqSmOrk=;
 b=TCnjNMIFGbgXbmMdjbS39FSOr+Hj27EqIf8OsOOlbo1MYp86Z46BiLPj8FWnBTrius
 73cYlbIbUwZp8Ll1lQNiMrDPqMGYgAqqwod2BMJcVm1Y/QOsDbuo1Ok2wQS5J33bkx1N
 1u4nLvKh3REFtcGSCe3zNkGYqgtphrlVnIr/bYWN3/sbP4pFR+5F9M+K8VdFbZ9QLpe1
 puUMG5tkqc3dwbnkIzDtPDusg9iQwLD1D8dVHGjif5NMhmkjvxiLSsEsAjTsk8lgYGtG
 M28DJN1T/yRHOnG1sirm6JvQ183v+A0JiF4uqNL2HpgVDUMdsBqoy1RyYJ7mpuT8RMEF
 ujww==
X-Gm-Message-State: ACgBeo3yurxBtJhVRX3SEZ7ekjONVR6cT0sR9Ij7QmrUZi9sKPgr79hz
 iX+3dGqTC+W2AwhJG03Mq0E=
X-Google-Smtp-Source: AA6agR78Xxyi2h7dq6HUbONspCFkZ9l68A4i+8T0Q4LcbMZsQStwiOC8ctenSGy66iu4Mi4WIMOUhA==
X-Received: by 2002:a05:6a00:1145:b0:52b:78c:fa26 with SMTP id
 b5-20020a056a00114500b0052b078cfa26mr4442680pfm.27.1661436141276; 
 Thu, 25 Aug 2022 07:02:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902f78b00b001709e3c750dsm3952816pln.194.2022.08.25.07.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:02:20 -0700 (PDT)
Message-ID: <69e48a9d-a343-5cdc-d0fc-6b38fd9d25fd@amsat.org>
Date: Thu, 25 Aug 2022 16:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] tests/vm: Remove obsolete Fedora VM test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20220822175317.190551-1-thuth@redhat.com>
 <87ilmhh7nd.fsf@linaro.org>
In-Reply-To: <87ilmhh7nd.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 24/8/22 19:29, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> It's still based on Fedora 30 - which is not supported anymore by QEMU
>> since years. Seems like nobody is using (and refreshing) this, and it's
>> easier to test this via a container anyway, so let's remove this now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Queued to testing/next, thanks.

FYI this is the image I'm using to test x86 guest on aarch64/mips64
hosts, but I can test a BSD-based instead; I suppose Linux as a guest
is already well tested.

>> ---
>>   tests/vm/Makefile.include |   3 +-
>>   tests/vm/fedora           | 190 --------------------------------------
>>   2 files changed, 1 insertion(+), 192 deletions(-)
>>   delete mode 100755 tests/vm/fedora
>>
>> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
>> index 8d2a164552..2cc2203d09 100644
>> --- a/tests/vm/Makefile.include
>> +++ b/tests/vm/Makefile.include
>> @@ -15,7 +15,7 @@ endif
>>   
>>   EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
>>   
>> -X86_IMAGES := freebsd netbsd openbsd fedora haiku.x86_64
>> +X86_IMAGES := freebsd netbsd openbsd haiku.x86_64
>>   ifneq ($(GENISOIMAGE),)
>>   X86_IMAGES += centos
>>   ifneq ($(EFI_AARCH64),)
>> @@ -45,7 +45,6 @@ vm-help vm-test:
>>   	@echo "  vm-build-freebsd                - Build QEMU in FreeBSD VM"
>>   	@echo "  vm-build-netbsd                 - Build QEMU in NetBSD VM"
>>   	@echo "  vm-build-openbsd                - Build QEMU in OpenBSD VM"
>> -	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
>>   ifneq ($(GENISOIMAGE),)
>>   	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
>>   ifneq ($(EFI_AARCH64),)

