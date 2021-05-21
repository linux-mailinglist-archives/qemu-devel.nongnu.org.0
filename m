Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290A38C6A8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:38:25 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4Q3-00031i-Ve
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4Jb-0003Mi-U9
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk4JW-0005A7-5E
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621600297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IX7o9e7g186bTgNjwSBUpRldjeF3ty6TyquUxbjqPAw=;
 b=LkT7NhXaIgz9CUFb1lWJembzmTaVSGVJ7jhX1eqyzxmwqVIOb3xP6Ey2RdetE4Xz+k5cUP
 zL+TAxJbfvDII6ZejFa5xuzZEZpbtIn1ZU6lnP6T9Sioznh5ADCIbrWLR8Y8VIigkBNsPl
 afnFKpVm3sMU7Z9IxUIeTpCR468DOro=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-RVpPQV1bOz25v1ToyC4_OA-1; Fri, 21 May 2021 08:31:35 -0400
X-MC-Unique: RVpPQV1bOz25v1ToyC4_OA-1
Received: by mail-wr1-f70.google.com with SMTP id
 g3-20020adfd1e30000b02901122a4b850aso1396421wrd.20
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IX7o9e7g186bTgNjwSBUpRldjeF3ty6TyquUxbjqPAw=;
 b=QPgdAkHvjb0qJeNkz1alM32v5TYWG9jNhU3qj4xjiwf86rnUKOgBtUI4ub9CGqiPys
 9wRUlGkD30t+037w+X5sVloa/8uqO0xPrwAyZHuLNJuWi9MNQGNP5PSuRiMJWr2bswpl
 FuBnT1Wa3ZRz0T88g/iEtYejfCJR8TNbh41+0N7cQ1vRN2TmkA/l3lUz/+cwz4Z/D+Nc
 L1arJ+x4bAx6DRKfdrLiHuX345iMlLsdphhmRfiKkHKi94SWlGyBQ2cKo9fbYlQw3+TO
 d9XCH3yClnYAA1CieuOhXwVqr1QGwxHPVxpvcyy4n6Z0mLjFre2XitHpUshJUSXmPPzP
 zFWA==
X-Gm-Message-State: AOAM533I+7nL5T1PCGC+UnoCTIh12kiYvWB1miMX6nd7H9oJgPJoOrMD
 mT1spuZ1jZLjUlp3QGjTT9FUe13FrR6WIxDIt2vxWHyNHjVa2byqRatZz/ywSMGOkY2xk12IW6l
 vOixxgvYhfHgaeps=
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr8341608wmd.20.1621600294386; 
 Fri, 21 May 2021 05:31:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOp5EGyc9yNYzLIT72z/VZZUOzOmoQDa/+6arQ7qeIfdIhu8u1TCFmWrBAQJSXJ/m0Mh7ugA==
X-Received: by 2002:a1c:7f86:: with SMTP id a128mr8341580wmd.20.1621600294069; 
 Fri, 21 May 2021 05:31:34 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c194sm12719556wme.46.2021.05.21.05.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 05:31:33 -0700 (PDT)
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com>
Date: Fri, 21 May 2021 14:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 2:28 PM, Willian Rampazzo wrote:
> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 20/05/2021 22.28, Philippe Mathieu-Daudé wrote:
>>> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
>>>> Conceptually speaking, acceptance tests "are a series of specific tests
>>>> conducted by the customer in an attempt to uncover product errors before
>>>> accepting the software from the developer. Conducted by the end-user rather
>>>> than software engineers, acceptance testing can range from an informal
>>>> “test drive” to a planned and systematically executed series of scripted
>>>> tests" [1]. Every time Pressman refers to the term "acceptance testing," he
>>>> also refers to user's agreement in the final state of an implemented feature.
>>>> Today, QEMU is not implementing user acceptance tests as described by Pressman.
>>>>
>>>> There are other three possible terms we could use to describe what is currently
>>>> QEMU "acceptance" tests:
>>>>
>>>>    1 - Integration tests:
>>>>        - "Integration testing is a systematic technique for constructing the
>>>>           software architecture while at the same time conducting tests to
>>>>           uncover errors associated with interfacing. The objective is to take
>>>>           unit-tested components and build a program structure that has been
>>>>           dictated by design." [2]
>>>>        * Note: Sommerville does not have a clear definition of integration
>>>>          testing. He refers to incremental integration of components inside
>>>>          the system testing (see [3]).
>>
>> After thinking about this for a while, I agree with you that renaming the
>> "acceptance" tests to "integration" tests is also not a good idea. When I
>> hear "integration" test in the context of the virt stack, I'd rather expect
>> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
>> virt-manager on top and tests them all together. So we should look for a
>> different name indeed.
>>
>>>>    2 - Validation tests:
>>>>        - "Validation testing begins at the culmination of integration testing,
>>>>           when individual components have been exercised, the software is
>>>>           completely assembled as a package, and interfacing errors have been
>>>>           uncovered and corrected. At the validation or system level, the
>>>>           distinction between different software categories disappears. Testing
>>>>           focuses on user-visible actions and user-recognizable output from the
>>>>           system." [4]
>>>>        - "where you expect the system to perform correctly using a set of test
>>>>           cases that reflect the system’s expected use." [5]
>>>>        * Note: the definition of "validation testing" from Sommerville reflects
>>>>          the same definition found around the Internet, as one of the processes
>>>>          inside the "Verification & Validation (V&V)." In this concept,
>>>>          validation testing is a high-level definition that covers unit testing,
>>>>          functional testing, integration testing, system testing, and acceptance
>>>>          testing.
>>>>
>>>>    3 - System tests:
>>>>        - "verifies that all elements mesh properly and that overall system
>>>>           function and performance is achieved." [6]
>>>>        - "involves integrating components to create a version of the system and
>>>>           then testing the integrated system. System testing checks that
>>>>           components are compatible, interact correctly, and transfer the right
>>>>           data at the right time across their interfaces." [7]
>>>>
>>>> The tests implemented inside the QEMU "acceptance" directory depend on the
>>>> software completely assembled and, sometimes, on other elements, like operating
>>>> system images. In this case, the proposal here is to rename the current
>>>> "acceptance" directory to "system."
>>>
>>> Are user-mode tests using Avocado also system tests?
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>>
>> We've indeed got the problem that the word "system" is a little bit
>> overloaded in the context of QEMU. We often talk about "system" when
>> referring to the qemu-softmmu-xxx emulators (in contrast to the linux-user
>> emulator binaries). For example, the "--disable-system" switch of the
>> configure script, or the "build-system" and "check-system" jobs in the
>> .gitlab-ci.yml file ... thus this could get quite confusing in the
>> .gitlab-ci.yml file afterwards.
> 
> I agree with you here. After I made the changes to the code, I noticed
> QEMU has the "system" word spread all over the place. That may confuse
> people looking at the "system tests" without much interaction with
> software testing terminology.
> 
>>
>> So I think renaming "acceptance" to "system" is especially ok if we only
>> keep the "softmmu"-related tests in that folder... would it maybe make sense
>> to add the linux-user related tests in a separate folder called tests/user/
>> instead, Philippe? And we should likely rename the current build-system and
>> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu or so?
>>
> 
> As I mentioned in Philippe's reply, those tests are still considered
> system tests because system testing is the software built and
> interacting with external test artifacts in software engineering.
> 
>> Alternatively, what about renaming the "acceptance" tests to "validation"
>> instead? That word does not have a duplicated definition in the context of
>> QEMU yet, so I think it would be less confusing.
> 
> While at the beginning of your reply, I started thinking if
> "validation" would cause less confusion for the QEMU project. Although
> validation testing is a broader concept inside the Verification &
> Validation process, encompassing unit testing, functional testing,
> integration testing, system testing, and acceptance testing, it may be
> an option for the QEMU project.
> 
> While system testing would be the correct terminology to use, if it
> causes more confusion, using a less strict terminology, like
> validation testing, is valid, in my opinion.

This works for me:

- tests/system/softmmu
- tests/system/user

Or validation, as you prefer.

Thanks for sharing the background references,

Phil.


