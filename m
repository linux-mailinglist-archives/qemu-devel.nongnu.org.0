Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABA68B69A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 08:45:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwBD-0006DK-Av; Mon, 06 Feb 2023 02:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOwBB-0006BM-88
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 02:44:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOwB8-0007f7-Sq
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 02:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675669476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCVHx8k8+dW2EjfeNXvsmU6uZDZFcyxKnJ0jmHeYywA=;
 b=dYplWOGC2bhz3DWlr+J376ZOdMjHiRw3MZAwu8QrM7BpGm6sflUhdllLJTT8TlRNrDJR+I
 LXfL7J6jcm095c/34QXrwwK2SkvWTHRLmSTOWBjwhfEpVDhnKOK5/2Vwr9UFt7npFfXiRR
 p3SR0pISLEihSNz1gP/jju8cqVXrd/I=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-ajvJHCBANF2kZTXCQHy7ZQ-1; Mon, 06 Feb 2023 02:44:33 -0500
X-MC-Unique: ajvJHCBANF2kZTXCQHy7ZQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 ib5-20020a0562141c8500b0053c23b938a0so5475944qvb.17
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 23:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZCVHx8k8+dW2EjfeNXvsmU6uZDZFcyxKnJ0jmHeYywA=;
 b=70X0VZl+Qn3v4uDX2QQorkUEB01PpGuSWZn7HCPjXaz8PUdmf9t3dPh2HGgxA8fZRr
 M2I31Pf6+xsyFzlWB14ReEPgYiBqwC+wc3BTq4de6xJCysmAh6x066EcoJ1BH/7V0M00
 52VJDBtXbETwtyhujVzJDDDL2nYmLK4Vx4qsN1LykV66WbBKqXEhzq17SDwEIyt7Hu7D
 8a8q1vDVf3V0Ynghx1jAudPEFEjQoIVnv2bT4NmZrIkSJABgsuDtjZE1ROSGCWq13DVG
 C0Wmnl1ZIue/ayvihs8pXUmuMyZ1vXOjGONp3vA6LbVIYv1mXusMwNZKt21J6BIr8EW2
 rmyQ==
X-Gm-Message-State: AO0yUKU8eN2nsHkUUoJwHuWZ4Lt0b9qQb2PNE/HYnP8RP/Cb7lkQRoBA
 F3Tl1zSTsZwzIKFJs6+mvvQS38m5gJ3E8W6mdIeseF5e3KquQ5TXMiQm6wly16R5QDFp2c8Frxh
 LwM3gjh4q+dgH93M=
X-Received: by 2002:a05:6214:2604:b0:56b:eda2:a6bc with SMTP id
 gu4-20020a056214260400b0056beda2a6bcmr14735415qvb.11.1675669473295; 
 Sun, 05 Feb 2023 23:44:33 -0800 (PST)
X-Google-Smtp-Source: AK7set94t+zQw3mXc/ovaaas58PZrw1Hw32N+WHzv/IjVZXIxNZvcsVPZ932A1PJKGZ9tfG8McFIxg==
X-Received: by 2002:a05:6214:2604:b0:56b:eda2:a6bc with SMTP id
 gu4-20020a056214260400b0056beda2a6bcmr14735391qvb.11.1675669473053; 
 Sun, 05 Feb 2023 23:44:33 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 dm40-20020a05620a1d6800b006fef61300fesm6886473qkb.16.2023.02.05.23.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 23:44:32 -0800 (PST)
Message-ID: <21fa9ab9-524d-c44d-905a-f1feddf92099@redhat.com>
Date: Mon, 6 Feb 2023 08:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
Content-Language: en-US
To: quintela@redhat.com, Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, hreitz@redhat.com,
 dgilbert@redhat.com
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com> <Y9eizgN9UYo5kbgx@redhat.com>
 <fc5dba59-4993-ee66-a94b-a550bdced396@redhat.com>
 <Y9z5TohXERGuQ6TS@redhat.com>
 <2caefefa-8757-af55-ccf3-fcc641db0784@redhat.com>
 <CAFEAcA972rKvQqJh2-FghQcJ1hswVWkhtzb3-KW4CgsypnQgYA@mail.gmail.com>
 <87sffme9jj.fsf@secure.mitica>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87sffme9jj.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/02/2023 22.14, Juan Quintela wrote:
> Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Fri, 3 Feb 2023 at 15:44, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 03/02/2023 13.08, Kevin Wolf wrote:
>>>> Am 03.02.2023 um 12:23 hat Thomas Huth geschrieben:
>>>>> On 30/01/2023 11.58, Daniel P. Berrangé wrote:
>>>>>> On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
>>>>>>> We can get rid of the build-coroutine-sigaltstack job by moving
>>>>>>> the configure flags that should be tested here to other jobs:
>>>>>>> Move --with-coroutine=sigaltstack to the build-without-defaults job
>>>>>>> and --enable-trace-backends=ftrace to the cross-s390x-kvm-only job.
>>>>>>
>>>>>> The biggest user of coroutines is the block layer. So we probably
>>>>>> ought to have coroutines aligned with a job that triggers the
>>>>>> 'make check-block' for iotests.  IIUC,  the without-defaults
>>>>>> job won't do that. How about, arbitrarily, using either the
>>>>>> 'check-system-debian' or 'check-system-ubuntu' job. Those distros
>>>>>> are closely related, so getting sigaltstack vs ucontext coverage
>>>>>> between them is a good win, and they both trigger the block jobs
>>>>>> IIUC.
>>>>>
>>>>> I gave it a try with the ubuntu job, but this apparently trips up the iotests:
>>>>>
>>>>>    https://gitlab.com/thuth/qemu/-/jobs/3705965062#L212
>>>>>
>>>>> Does anybody have a clue what could be going wrong here?
>>>>
>>>> I'm not sure how changing the coroutine backend could cause it, but
>>>> primarily this looks like an assertion failure in migration code.
>>>>
>>>> Dave, Juan, any ideas what this assertion checks and why it could be
>>>> failing?
>>>
>>> Ah, I think it's the bug that will be fixed by:
>>>
>>>    https://lore.kernel.org/qemu-devel/20230202160640.2300-2-quintela@redhat.com/
>>>
>>> The fix hasn't hit the master branch yet (I think), and I had another patch
>>> in my CI that disables the aarch64 binary in that runner, so the iotests
>>> suddenly have been executed with the alpha binary there --> migration fails.
>>>
>>> So never mind, it will be fixed as soon as Juan's pull request gets included.
>>
>> The migration tests have been flaky for a while now,
>> including setups where host and guest page sizes are the same.
>> (For instance, my x86 macos box pretty reliably sees failures
>> when the machine is under load.)
> 
> I *thought* that we had fixed all of those.
> 
> But it is difficult for me to know because:
> - I only happens when one runs "make check"
> - running ./migration-test have never failed to me
> - When it fails (and it has been a while since it has failed to me)
>    it is impossible to me to detect what is going on, and as said, I have
>    never been able to reproduce running only migration-test.
> 
> I will try to run several at the same time and see if it happens.
> 
> And as Thomas said, I *think* that the fix that Peter Xu posted should
> fix this issue.  Famous last words.

The patch from Peter should fix my problems that I triggered via the iotests 
- but the migration-qtest is still unstable independent from that issue, I 
think. See for example the latest staging pipeline:

  https://gitlab.com/qemu-project/qemu/-/pipelines/767961842

The migration qtest failed in both, the x86-freebsd-build and the 
ubuntu-20.04-s390x-all pipelin.

  Thomas



