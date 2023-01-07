Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF84660F82
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 15:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEAFh-0001rV-4l; Sat, 07 Jan 2023 09:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEAFe-0001qw-D7
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 09:32:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEAFb-0004gb-9h
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 09:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673101965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlSae2if/rIlB7ynbsFi8L/jmRWgB4/UKSFaEBRIIj4=;
 b=WlGU3WWtKEJwyixiKxhsCPJDHbDTkCPI8sD8whkaV9pC+TJcmdVh0sTMSZDqS9HZk//1Ff
 F0lCxXS/TA03O+qj6meQqJ9EukEYsvkVXibDpu6G719ZWT+/YMTZqAHlGcCI3eeg0Yi4TH
 smJnwpFbVkLOxdk1lIKJGn6SUMfgedM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-HvEOLKSnNk6QFSltD4ho-A-1; Sat, 07 Jan 2023 09:32:44 -0500
X-MC-Unique: HvEOLKSnNk6QFSltD4ho-A-1
Received: by mail-ed1-f69.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso2931899edd.14
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 06:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FlSae2if/rIlB7ynbsFi8L/jmRWgB4/UKSFaEBRIIj4=;
 b=oUPTjEOQd/qmsIQWlg4ZxEbaNfS+MIUBukNrj45pkFwmf+7jM/GP9/3YqNYRznbtLf
 uGFuqAxPoZBnBeJNC5UfiJ0fskqL3XSD941RqkNxkNJ0K8CDZJTK6Xe8wjjY9/lbH2hy
 HPKWXbW6JyvZ+dk6/Xx0FSQUxe4eFvLi93XxusEyuCupAFvZIUZe9TbOAyos0V1qH21O
 8lG+17B4GaiHVFapHcW0FHjnRO3KJlkgi1qYtrwlorYRIjUoSmGMLUe794xtrGzG3Pz8
 zlYmXOF95sZ6zlAvSciThYUFt2czt1xv1ofE7cQR3vMUP0PkiEtAKA6FuRXO9cv0NXoW
 JWsQ==
X-Gm-Message-State: AFqh2kq1oUtsNc5bCZVhOhiI05NICMNY9NkCQFuwygiF5cDsmm2VlbPT
 xbPYfshLEm/ekmNvaLH+2pR+cMr+aNHJot8SRPFC7mv4ufF3+1juiMFNq1pw68WkmRUnJNmIuNr
 JsAyTV85puGBd+Z4=
X-Received: by 2002:a17:906:99c7:b0:7b5:860d:7039 with SMTP id
 s7-20020a17090699c700b007b5860d7039mr51113587ejn.10.1673101963027; 
 Sat, 07 Jan 2023 06:32:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMz3/ynz8FcWXrEThxGfiQkDjR8V8znyh9gU9sJRqmJznYIQ7KUc9HHYECA5U1NR5NcwM0Jg==
X-Received: by 2002:a17:906:99c7:b0:7b5:860d:7039 with SMTP id
 s7-20020a17090699c700b007b5860d7039mr51113573ejn.10.1673101962820; 
 Sat, 07 Jan 2023 06:32:42 -0800 (PST)
Received: from [192.168.8.100] (tmo-098-170.customers.d1-online.com.
 [80.187.98.170]) by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b0084c90164a56sm1482279ejd.29.2023.01.07.06.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 06:32:42 -0800 (PST)
Message-ID: <abe34786-e35b-923d-7b36-aecc307c36ee@redhat.com>
Date: Sat, 7 Jan 2023 15:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230104123559.277586-1-thuth@redhat.com>
 <CAFEAcA-1-CBVd9FRYHS5_KTjC9UfTUz6E7qDz0g7xYjsA7PC=w@mail.gmail.com>
 <46726378-d075-e77a-5439-bbfa822f70fd@redhat.com>
 <b3fe53d9-67c5-9e22-d5e7-fa98cac5cd58@redhat.com>
 <CAEUhbmUsvseOFDru-Hnw4co-+VNKHDPKne_-Dpj1jPD03w=VnQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmUsvseOFDru-Hnw4co-+VNKHDPKne_-Dpj1jPD03w=VnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.114, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/01/2023 10.24, Bin Meng wrote:
> On Fri, Jan 6, 2023 at 3:35 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 05/01/2023 09.34, Thomas Huth wrote:
>>> On 04/01/2023 23.01, Peter Maydell wrote:
>>>> On Wed, 4 Jan 2023 at 12:36, Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>> The windows jobs (especially the 32-bit job) recently started to
>>>>> hit the timeout limit. Bump it a little bit to ease the situation
>>>>> (80 minutes is quite long already - OTOH, these jobs do not have to
>>>>> wait for a job from the container stage to finish, so this should
>>>>> still be OK).
>>>>>
>>>>> Additionally, some update on the container side recently enabled
>>>>> OpenGL in these jobs - but the corresponding code fails to compile.
>>>>> Thus disable OpenGL here for the time being until someone figured
>>>>> out the proper fix in the shader code for this.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>    Now that the timeout and OpenGL problems are gone, the 64-bit is
>>>>>    working fine for me again. However, I'm still seeing random issues
>>>>>    with the 32-bit job ... not sure whether it's a problem on the
>>>>>    QEMU side or whether the builders are currently instable, since
>>>>>    the issues do not reproduce reliably...
>>>>>
>>>>>    .gitlab-ci.d/windows.yml | 7 ++++---
>>>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> Thanks; applied to master on the assumption it will improve the
>>>> CI situation. I found that the msys2-32bit job still timed out
>>>> at 1h20, though:
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3555245586
>>>
>>> I just gave it a try again, too, and for me, it finished within 65 minutes:
>>>
>>>    https://gitlab.com/thuth/qemu/-/jobs/3557600268
>>>
>>> ... let's keep looking for a while, maybe it's ok in most cases now, but if
>>> not, we have to consider something else.
>>
>> Ok, so after I've been struggling with a failing msys2-32bit job for my new
>> upcoming pull request the last two days (I thought I had a bad patch in
>> there), where I had some problems with the test-hmp and qom-test qtests,
>> I've come up with a new theory after looking at this CI run from the
>> qemu-project staging branch and seeing that these tests are also failing there:
>>
>>    https://gitlab.com/qemu-project/qemu/-/jobs/3558798544
>>    https://gitlab.com/qemu-project/qemu/-/jobs/3560870904
>>
>> That might also explain the timed-out job that you have seen earlier, Peter,
>> it was likely a hanging qom-test since that seems to be the first test to be
>> executed during the "make check" there.
>>
>> So the qtests for Windows are definitely not ready for the CI yet (after
>> we've enabled them just in December). I think it's best to disable them
>> there again completely until the issues are understood and fixed.
>>
> 
> I cannot reproduce the test failures of both tests (test-hmp and
> qom-test) with w32 executables. Neither did the w64 executables.
> 
> My testing repo is at commit d1852caab131ea898134fdcea8c14bc2ee75fbe9.

Can you at least reproduce it in the Gitlab-CI? ... it also does not always 
occur, sometimes the jobs are working fine. I suspect it's some kind of race 
or memory problem ... is there something similar to "Valgrind" on Windows? 
If so, could you try to run those qtests there with such tooling enabled?

  Thomas


