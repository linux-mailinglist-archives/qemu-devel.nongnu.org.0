Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2553C423
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 07:23:52 +0200 (CEST)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwzmp-0003AZ-4U
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 01:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwzkb-0002SB-Ay
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 01:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwzkY-00049g-Lb
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 01:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654233689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bonZO1IcZlTf/Hfw83qfgYk7wKk2n2AVBdK+P5mjic=;
 b=cMm5rWklo6cQjvMylpNUuHlCINbNEHxbfemb17SLTOO0Db7gHF1BhXeZ7s9v0xEl7oYmU0
 LcWafOXOD7EAAMOmuBwFJn+aD6cawJQDSay9/efNgS10TbjpO3lFcxShzMQw8LAuQyQe9G
 U6sHjTTny1HrhxHj5oJQJbrq9yo3fgs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-ZEV-YZnsMy66m4KOo_Hlxg-1; Fri, 03 Jun 2022 01:21:27 -0400
X-MC-Unique: ZEV-YZnsMy66m4KOo_Hlxg-1
Received: by mail-ed1-f72.google.com with SMTP id
 t14-20020a056402020e00b0042bd6f4467cso4732627edv.9
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 22:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9bonZO1IcZlTf/Hfw83qfgYk7wKk2n2AVBdK+P5mjic=;
 b=iOd66YKOwVpbmBK7sYVEXpIDI0/XN+6XC69kWH1BGz7qeOxq8jaqgUgI8oE2q9P/LA
 MJ+C27QEp4Hqefi407kCBgiLhbTKo8oTUkLgwxPZpMxTF6GpZIWdv3VUUwYwlNzBeuO1
 07schb6LzRLd2Uf/QbPrfV8UFNitBQQVURJAjaWEzy1Bujahy6LzF6FHVM7iiKz8NV+3
 eg1YRVaiDzz7oYTRnFm0CrjBVwQBQ4x85zutC6P1PC7paianE/W4r7NJlKsga+1sgtub
 jCGCkRLlL03C1b5n0AOeJLRoZjhzk4gCsz+EdxuZeiYsNoNNAhjwVtb/38n/yTqHoBk0
 NHdA==
X-Gm-Message-State: AOAM5316cqbu+tQDacSPHNGqvXanUjy95FVSsUtLNv63KzsdkdJ1+c4k
 bb4JLh1XuKj7O1UP58qvtm0Ao96RaOteCkQEJufcEV31waHciw2tyz3/NcE8LWyTrau/QnUmXNJ
 9RryqKOjx1gr4n+0=
X-Received: by 2002:a05:6402:90d:b0:428:bda9:3e6b with SMTP id
 g13-20020a056402090d00b00428bda93e6bmr8884719edz.132.1654233686829; 
 Thu, 02 Jun 2022 22:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIWRv38riSRVIHcAPvVzZFafYilPuhXjDoGH/GFYhXmMzfQDnAwcI6t1gXrdazrvbSao+3Mg==
X-Received: by 2002:a05:6402:90d:b0:428:bda9:3e6b with SMTP id
 g13-20020a056402090d00b00428bda93e6bmr8884697edz.132.1654233686610; 
 Thu, 02 Jun 2022 22:21:26 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com.
 [80.187.98.213]) by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00705976bcd01sm2430460ejx.206.2022.06.02.22.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 22:21:26 -0700 (PDT)
Message-ID: <757ff3c0-b77a-b230-6a09-fb3d8c95b1c7@redhat.com>
Date: Fri, 3 Jun 2022 07:21:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
 <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
 <f614c7f6-2523-d587-ea44-fe4c70e8c630@redhat.com>
 <c263a4ca-ceb3-a2f0-0839-b915cf98728e@linaro.org>
 <5098180d-334f-7631-011f-6beb3a1434ac@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5098180d-334f-7631-011f-6beb3a1434ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/06/2022 02.56, Richard Henderson wrote:
> On 6/2/22 17:03, Richard Henderson wrote:
>> Ho hum.  So... the first time I try to do any actual debugging after this 
>> has gone in, and I am reminded exactly how terrible capstone 4.0.1 is for 
>> anything except x86.  There was a reason I had chosen a development branch 
>> snapshot, and that's because it was usable.
>>
>> Here, for instance, is how ubuntu 20.04 capstone disassembles
>> tests/tcg/aarch64/system/boot.S:
>>
>> 0x00000000400027b0:  10ffc280      adr x0, #-0x7b0 (addr 0x40002000)
>>
>> 0x00000000400027b4:  d518c000      msr (unknown), x0
>>
>>
>> 0x00000000400027b8:  d0000fe0      adrp x0, #+0x1fe000 (addr 0x40200000)
>>
>> 0x00000000400027bc:  91000000      add x0, x0, #0x0 (0)
>>
>> 0x00000000400027c0:  d5182000      msr (unknown), x0
>>
>> ...
>> 0x0000000040002850:  d5381040      mrs x0, (unknown)
>>
>> 0x0000000040002854:  b26c0400      orr x0, x0, #0x300000
>>
>> 0x0000000040002858:  d5181040      msr (unknown), x0
>>
>>
>> And this is the extremely simple case of ARMv8.0 with no extensions.
>>
>> I am very much tempted to re-instate the capstone submodule, or update 
>> disas/vixl and disable use of capstone for arm.
> 
> Double ho-hum.  It would appear that this horrible disassembly *is* vixl, 
> because I didn't double check that libcapstone was installed.

So is capstone disassembly better now with Ubuntu 20.04 or should we still 
revert the submodule removal?

Also, if libvixl is so bad, why do we still have that in the repo?

  Thomas



