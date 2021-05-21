Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA7738C776
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:07:27 +0200 (CEST)
Received: from localhost ([::1]:45686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4sA-0005L9-S8
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk4ph-0002FA-9H
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:04:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk4pc-0001DG-LB
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:04:53 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so7142314wmg.3
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=g57KhzZBSlYRTmOkMp+nOCdcA09SLubqwK6n8L6rTno=;
 b=oMxVWRnHsftfd9ETEA+trGE8N5QxU/nTsWGQkJWYVYGuQVe+60w0SIxszHDwbNggSo
 mcJCz3sZp5wPhRgDDIwgx5IylXog/NxvvTFE/4X7ujpG7XWUNXVFUJOvrAtJWKT8KU3o
 7Q2vdhRq+CgXrZHqUlg9LwO64xE55RqWE01EkvRJR7vtQHaO0ly9A66bIZySBYgcPhQj
 MqZOfMvHzjLJC8YaUOlarXzwZOq9zCSBbe+n0mX37/pD+PRcHMqkDfL7iN62Hcy4dJUl
 PeCUsBxD14HhlJ+V5KkZ1WZW4skTeSSmPUmKn0ooeE0KEhcAW9Aftc4NRJGkNz1IAXbv
 443A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=g57KhzZBSlYRTmOkMp+nOCdcA09SLubqwK6n8L6rTno=;
 b=UOqHytWg9qqGjqLbiJkqbWYdnZk0ZkJuzddk0fkbneQ5eBhQGZuzN/feWGe/afsyGe
 QyXR+9kc4vEh4ssWZYFRu+scF0hVzBnKgwa4gQKfiuKGyGAoP5JzSwr5wr7fMTtO07/q
 /t5VOpiCnn32m0mGT2jtlN6Tt2u/HCvehBkk48E82QISutibBv7HvWiztCnxsllFB3Oo
 Pq5Qvua8KEm8XuDmeXXkMMu01j/ivXcFvh+mVdXpS8C+ryJ9RRrRLJ0Meox+m5XQZ55U
 c7cDaCEFhR8EbPr9UQ+Q7hL5DM25G2Stv4saKXzb9fFEH/tZVjr7tD53jU1c2JJU8Rzf
 AgPg==
X-Gm-Message-State: AOAM531PaxrLrloa3x63QolBxIsXmo58rpflw79wAbBpUh6MOZGbW79A
 pVe5OneJoIU2PrJzKUI45rWgyQ==
X-Google-Smtp-Source: ABdhPJxg4NPW/y5xfM8BzKeShxvRODahwgg3UThoZ6OsEdLOQuYBLXBhdRpWuzoy1RRYncg2DHZp9Q==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr8794474wmh.115.1621602286239; 
 Fri, 21 May 2021 06:04:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a11sm2028749wrr.48.2021.05.21.06.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 06:04:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A257A1FF7E;
 Fri, 21 May 2021 14:04:44 +0100 (BST)
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
Date: Fri, 21 May 2021 14:03:34 +0100
In-reply-to: <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com>
Message-ID: <87sg2gb5lf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/21/21 2:28 PM, Willian Rampazzo wrote:
>> On Fri, May 21, 2021 at 4:16 AM Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 20/05/2021 22.28, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 5/20/21 9:53 PM, Willian Rampazzo wrote:
>>>>> Conceptually speaking, acceptance tests "are a series of specific tes=
ts
>>>>> conducted by the customer in an attempt to uncover product errors bef=
ore
>>>>> accepting the software from the developer. Conducted by the end-user =
rather
>>>>> than software engineers, acceptance testing can range from an informal
>>>>> =E2=80=9Ctest drive=E2=80=9D to a planned and systematically executed=
 series of scripted
>>>>> tests" [1]. Every time Pressman refers to the term "acceptance testin=
g," he
>>>>> also refers to user's agreement in the final state of an implemented =
feature.
>>>>> Today, QEMU is not implementing user acceptance tests as described by=
 Pressman.
>>>>>
>>>>> There are other three possible terms we could use to describe what is=
 currently
>>>>> QEMU "acceptance" tests:
>>>>>
>>>>>    1 - Integration tests:
>>>>>        - "Integration testing is a systematic technique for construct=
ing the
>>>>>           software architecture while at the same time conducting tes=
ts to
>>>>>           uncover errors associated with interfacing. The objective i=
s to take
>>>>>           unit-tested components and build a program structure that h=
as been
>>>>>           dictated by design." [2]
>>>>>        * Note: Sommerville does not have a clear definition of integr=
ation
>>>>>          testing. He refers to incremental integration of components =
inside
>>>>>          the system testing (see [3]).
>>>
>>> After thinking about this for a while, I agree with you that renaming t=
he
>>> "acceptance" tests to "integration" tests is also not a good idea. When=
 I
>>> hear "integration" test in the context of the virt stack, I'd rather ex=
pect
>>> a test suite that picks KVM (i.e. a kernel), QEMU, libvirt and maybe
>>> virt-manager on top and tests them all together. So we should look for a
>>> different name indeed.
>>>
>>>>>    2 - Validation tests:
>>>>>        - "Validation testing begins at the culmination of integration=
 testing,
>>>>>           when individual components have been exercised, the softwar=
e is
>>>>>           completely assembled as a package, and interfacing errors h=
ave been
>>>>>           uncovered and corrected. At the validation or system level,=
 the
>>>>>           distinction between different software categories disappear=
s. Testing
>>>>>           focuses on user-visible actions and user-recognizable outpu=
t from the
>>>>>           system." [4]
>>>>>        - "where you expect the system to perform correctly using a se=
t of test
>>>>>           cases that reflect the system=E2=80=99s expected use." [5]
>>>>>        * Note: the definition of "validation testing" from Sommervill=
e reflects
>>>>>          the same definition found around the Internet, as one of the=
 processes
>>>>>          inside the "Verification & Validation (V&V)." In this concep=
t,
>>>>>          validation testing is a high-level definition that covers un=
it testing,
>>>>>          functional testing, integration testing, system testing, and=
 acceptance
>>>>>          testing.
>>>>>
>>>>>    3 - System tests:
>>>>>        - "verifies that all elements mesh properly and that overall s=
ystem
>>>>>           function and performance is achieved." [6]
>>>>>        - "involves integrating components to create a version of the =
system and
>>>>>           then testing the integrated system. System testing checks t=
hat
>>>>>           components are compatible, interact correctly, and transfer=
 the right
>>>>>           data at the right time across their interfaces." [7]
>>>>>
>>>>> The tests implemented inside the QEMU "acceptance" directory depend o=
n the
>>>>> software completely assembled and, sometimes, on other elements, like=
 operating
>>>>> system images. In this case, the proposal here is to rename the curre=
nt
>>>>> "acceptance" directory to "system."
>>>>
>>>> Are user-mode tests using Avocado also system tests?
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg782505.html
>>>
>>> We've indeed got the problem that the word "system" is a little bit
>>> overloaded in the context of QEMU. We often talk about "system" when
>>> referring to the qemu-softmmu-xxx emulators (in contrast to the linux-u=
ser
>>> emulator binaries). For example, the "--disable-system" switch of the
>>> configure script, or the "build-system" and "check-system" jobs in the
>>> .gitlab-ci.yml file ... thus this could get quite confusing in the
>>> .gitlab-ci.yml file afterwards.
>>=20
>> I agree with you here. After I made the changes to the code, I noticed
>> QEMU has the "system" word spread all over the place. That may confuse
>> people looking at the "system tests" without much interaction with
>> software testing terminology.
>>=20
>>>
>>> So I think renaming "acceptance" to "system" is especially ok if we only
>>> keep the "softmmu"-related tests in that folder... would it maybe make =
sense
>>> to add the linux-user related tests in a separate folder called tests/u=
ser/
>>> instead, Philippe? And we should likely rename the current build-system=
 and
>>> check-system jobs in our gitlab-CI to build-softmmu and check-softmmu o=
r so?
>>>
>>=20
>> As I mentioned in Philippe's reply, those tests are still considered
>> system tests because system testing is the software built and
>> interacting with external test artifacts in software engineering.
>>=20
>>> Alternatively, what about renaming the "acceptance" tests to "validatio=
n"
>>> instead? That word does not have a duplicated definition in the context=
 of
>>> QEMU yet, so I think it would be less confusing.
>>=20
>> While at the beginning of your reply, I started thinking if
>> "validation" would cause less confusion for the QEMU project. Although
>> validation testing is a broader concept inside the Verification &
>> Validation process, encompassing unit testing, functional testing,
>> integration testing, system testing, and acceptance testing, it may be
>> an option for the QEMU project.
>>=20
>> While system testing would be the correct terminology to use, if it
>> causes more confusion, using a less strict terminology, like
>> validation testing, is valid, in my opinion.
>
> This works for me:
>
> - tests/system/softmmu
> - tests/system/user
>
> Or validation, as you prefer.

So what are tests/tcg if not user tests? They *mostly* test
linux-user emulation but of course we have softmmu tests in there as
well.=20

>
> Thanks for sharing the background references,
>
> Phil.


--=20
Alex Benn=C3=A9e

