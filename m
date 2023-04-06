Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A696D970A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:31:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOkr-00082T-Dw; Thu, 06 Apr 2023 08:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkOkp-00082G-H2
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:30:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pkOkn-0001G1-3l
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680784211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lbxf8vfUgb/jvG7YwM2nix/LKGhjkHm6Lc3zb/PVftE=;
 b=N6HUZil31ymUEHxYCX1f34f7T8lDck0yhs1sks7cYBH4DPrkDf6EumKlgl6Oqsqe6SDW/2
 ZLRz5UuFhTc5RUpI5oteqCxW+7fX/kcrZbTpxKTptvMVZuAvcHgni7he+BWMuKvBrRjOyJ
 XODcZ8cdk4sD/UgAM5Q5ne4jKTi1aMk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-rqWpqseqP4W_v2PdvxPyVQ-1; Thu, 06 Apr 2023 08:30:10 -0400
X-MC-Unique: rqWpqseqP4W_v2PdvxPyVQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 195-20020a3705cc000000b00746a3ab9426so17609765qkf.20
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680784210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lbxf8vfUgb/jvG7YwM2nix/LKGhjkHm6Lc3zb/PVftE=;
 b=dCtV45NiKUwQRC1pAXWT2Mfjhpk04mVdejbH6EvBA7neahuR06sUTRljCqC9LgCtJG
 Xuh0OTmA/RZlPVnbvE98ZwyFOhkeaeMbU2tETHiVInr9nxMMEQXNEYvtNFHrqHAYsGd4
 khrBjxF5+BXraoOarY0vkwPIQcrplmk2Cql39WvI7q+tHozGZR0EBbKERAoBb4hGlVcO
 rmdjDzmWanpTxAL0pSnulp1xhJYl9BpvGJxKLL2ehOlfMyS6yflv4s5s6kGFyw1hSwTC
 DIJcQWmJTobZf5Nr9Br5MEShk1O3OfYjVvnorigfr1SqoTe4L0FYQZ7CPR2KXQvke2kp
 S5bQ==
X-Gm-Message-State: AAQBX9euiXGUSxDjXQ/YR/wzIBLcpBw8JgK9kZvfMWK9aRozv5nZHHkk
 AQ9TFYB2on0YpKXf2SK5QCb6g+70VJ7sLknBhEB6nlUcMgfkwhL8B2LZjGqS7LNYtD5f3Zi4oaN
 BchdWf+kwe1IEe5k=
X-Received: by 2002:a05:6214:2342:b0:5e0:2d2a:33d7 with SMTP id
 hu2-20020a056214234200b005e02d2a33d7mr4176524qvb.34.1680784209701; 
 Thu, 06 Apr 2023 05:30:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350antCZKUmf7g1enHQjajfKzh2k3TDNU2QnqJ+40xE2TM8Yn3Y5pGwl4EC+jH4Z8YDfJpanRrw==
X-Received: by 2002:a05:6214:2342:b0:5e0:2d2a:33d7 with SMTP id
 hu2-20020a056214234200b005e02d2a33d7mr4176476qvb.34.1680784209334; 
 Thu, 06 Apr 2023 05:30:09 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de.
 [109.43.178.193]) by smtp.gmail.com with ESMTPSA id
 lf20-20020a0562142cd400b005dd8b9345f2sm456497qvb.138.2023.04.06.05.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 05:30:08 -0700 (PDT)
Message-ID: <2e529c06-199f-6d5a-a75b-5b88aae44b2c@redhat.com>
Date: Thu, 6 Apr 2023 14:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: s390 private runner CI job timing out
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
 <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
 <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
 <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
 <CAFEAcA_SgAZmv8YpaR0v7iU1oMdNTAMcrcYWaqGPzHDxjSP=wQ@mail.gmail.com>
 <c974308f-42a1-9163-5c4f-54bda7050ee8@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <c974308f-42a1-9163-5c4f-54bda7050ee8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.224, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/04/2023 14.13, Christian Borntraeger wrote:
> 
> 
> Am 06.04.23 um 14:05 schrieb Peter Maydell:
>> On Thu, 6 Apr 2023 at 12:17, Christian Borntraeger
>> <borntraeger@linux.ibm.com> wrote:
>>>
>>> Am 06.04.23 um 12:44 schrieb Peter Maydell:
>>>> On Thu, 6 Apr 2023 at 11:40, Christian Borntraeger
>>>> <borntraeger@linux.ibm.com> wrote:
>>>>> Am 06.04.23 um 11:21 schrieb Peter Maydell:
>>>>>> Christian, does our S390X machine get a guaranteed amount of CPU,
>>>>>> or does it depend on what else is running on the hardware?
>>>>>
>>>>> I think its a shared system with shared CPUs. Can you check the steal
>>>>> time in top or proc? If this is far too high we could ask to give you
>>>>> more weight for that VM.
>>>>
>>>> It's idle at the moment and steal time seems to be low (0.0 .. 0.3);
>>>> I'll try to remember to check next time it's running a job.
>>>>
>>>
>>> Do you have /proc/stat ?
>>
>> Yes; hopefully it means more to you than it does to me :-)
>>
>> linux1@qemu01:~$ cat /proc/stat
>> cpu  60904459 604975 15052194 1435958176 17128179 351949 758578 22218760 0 0
>> cpu0 15022535 146734 3786909 358774818 4283172 98313 237156 5894809 0 0
>> cpu1 15306890 151164 3746024 358968957 4378864 85629 172492 5434255 0 0
>> cpu2 15307709 157180 3762691 359141276 4138714 85736 176367 5474594 0 0
>> cpu3 15267324 149895 3756569 359073124 4327428 82269 172562 5415101 0 0
> 
> This is
> user,nice,system,idle,iowait,irq,softirq,steal,guest,guest_nice
> So overall there is some (20-30% since the last reboot) steal going on.
> Not sure if this is the real problem since it is only Ubuntu 20.04.
> Does a higher timeout make the problem go away?

The thing is: it shouldn't take that long to build QEMU and run the tests 
here, theoretically. Some days ago, the job was finishing in 39 minutes:

  https://gitlab.com/qemu-project/qemu/-/jobs/3973481571

The recent run took 74 minutes:

  https://gitlab.com/qemu-project/qemu/-/jobs/4066136770

That's almost a factor of two! So there is definitely something strange 
going on.

  Thomas


