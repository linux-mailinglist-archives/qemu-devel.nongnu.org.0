Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A36C8377
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:40:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflOP-0003TP-7l; Fri, 24 Mar 2023 13:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pflOH-0003I9-4g
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:39:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pflOE-0008FO-T6
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679679584;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xCoRPucUUW76t+YwVKRaMOHScmT3KziHVgijN1Peu90=;
 b=MRFm0J5i7AY/V2Yiyk263fUX+X9VVn0VoYe+29IsnUwdSpPr8CPbzrNC4ZQ/aZyLUR5PiF
 /vSB+lLJtgWot1iSvOjLKus3tlBbldKSO1+dKjhwX+jeDzBOsmFM4R6Nj2MRyENJfMBo6O
 L5Tw4sUI4hyF827L4QZyjd4qDNBhk+4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-kpkpXw04O9KXlANVDN5wJA-1; Fri, 24 Mar 2023 13:39:42 -0400
X-MC-Unique: kpkpXw04O9KXlANVDN5wJA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m5-20020a05600c4f4500b003ee8db23ef9so2713603wmq.8
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679679581;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xCoRPucUUW76t+YwVKRaMOHScmT3KziHVgijN1Peu90=;
 b=Ge5snwdVbbJerxiki1nBk9n3XXyIupXPaBcKHjnj7pM9GrwVUJPKwgn0C/rSEOVbfe
 LBHNjY3MQGcj1ef4YJvxc9ovEfI7d/kF5jthwW4RSG3EjEWt/CmemhuUOUyzFHq/XE3P
 sre0IidfaAu9zGVflHoG6bVo6YjK3iq/5zqn948x8yBoVE4ihm8GHvAUIlaFcTWoCROb
 ClEHzlov0Ui6Bx6mKBcPiwMBLt98kmSTDaGO6PKx2OLcaw8FlGv0HXPVDZQiSkuMh3Tl
 DJJhHw0/vC+Xn7sriq6RZIqDBn5rYlVdPIXEXe8Mfmi1QEMiZjk9cDEhZlLKmKZDaFKy
 esJQ==
X-Gm-Message-State: AO0yUKWgmPE2YZADT7t87wf+iWSg0RRP9T63xY6UJuMwZwBbIvFdctT6
 dLqyISLsgdzLz8k57OuHIPEqWYAIeyvp2oPJv1on6C0mnFHBcCzu3i9+bol+wYD7ZCPdLTn3TE1
 2tun1RVzDcMN1R/M=
X-Received: by 2002:a05:600c:22c8:b0:3d3:49db:9b25 with SMTP id
 8-20020a05600c22c800b003d349db9b25mr3196332wmg.26.1679679581051; 
 Fri, 24 Mar 2023 10:39:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/+gC+EXgKY6ET7MEofQjNq6bhhUgZaiJBgj+l0lbZFSjN+h5Rnnn/J7oAxf/Aj6oCkPFO3Og==
X-Received: by 2002:a05:600c:22c8:b0:3d3:49db:9b25 with SMTP id
 8-20020a05600c22c800b003d349db9b25mr3196318wmg.26.1679679580753; 
 Fri, 24 Mar 2023 10:39:40 -0700 (PDT)
Received: from redhat.com ([47.60.41.136]) by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003eeb1d6a470sm3492035wmi.13.2023.03.24.10.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 10:39:39 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
In-Reply-To: <ZByhueDO9J9MLuSJ@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 23 Mar 2023 19:00:09 +0000")
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 24 Mar 2023 18:39:34 +0100
Message-ID: <87pm8ykq09.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
>> Hi
>>=20
>> I want to enter a discussion about changing the default of the style
>> guide.
>>=20
>> There are several reasons for that:
>> - they exist since C99 (i.e. all supported compilers support them)
>> - they eliminate the posibility of an unitialized variable.
>
> Actually they don't do that reliably. In fact, when combined
> with usage of 'goto', they introduce uninitialized variables,
> despite the declaration having an initialization present, and
> thus actively mislead reviewers into thinking their code is
> safe.

Wait a minute.
If you use goto, you are already in special rules.

And don't get confused, I fully agree when using goto for two reasons:
- performance
  if you show that the code is x% faster when using goto, it is
  justified.  It is even better if you send a bug report to gcc/clang,
  but I will not opose that use.
- code clearity
  Some code (basically error paths) are clearer with goto that without
  them.

But that don't mind that mixed declarations are bad.  It means that goto
is complicated.

> Consider this example:
>
> #include <stdlib.h>
> #include <stdio.h>
>
> void foo(int something) {
>   if (something =3D=3D 8) {
>     goto cleanup;
>   }
>=20=20=20
>   int nitems =3D 3;
>   int *items =3D malloc(sizeof(int) *nitems);
>=20=20=20=20=20=20=20=20
>   printf("Hello world %p\n", items);
>
>  cleanup:
>   printf("nitems=3D%d items=3D%p\n", nitems, items);
>   if (nitems) {
>     free(items);
>   }
> }
>
> int main(int argc, char **argv) {
>   foo(atoi(argv[1]));
>   return 0;
> }
>
> Superficially everything looks awesome right - the variables are
> all initialized at time of declaration after all.

If you uses goto, you need to check for that.
Majority of functions in qemu (and elsewhere) don't use goto, so don't
make the rules for the exception.

> $ gcc -Wall -o mixed mixed.c
>
> $ ./mixed 3
> Hello world 0x18ef2a0
> nitems=3D3 items=3D0x18ef2a0
>
> $ ./mixed 8
> nitems=3D32677 items=3D0x7fa5a9209000
> free(): invalid pointer
> Aborted (core dumped)
>
>
> What happens is that when you 'goto $LABEL' across a variable
> declaration, the variable is in scope at your target label, but
> its declared initializers never get run :-(
>
> Luckily you can protect against that with gcc:
>
> $ gcc -Wjump-misses-init -Wall -o mixed mixed.c
> mixed.c: In function =E2=80=98foo=E2=80=99:
> mixed.c:7:12: warning: jump skips variable initialization [-Wjump-misses-=
init]
>     7 |            goto cleanup;
>       |            ^~~~
> mixed.c:15:5: note: label =E2=80=98cleanup=E2=80=99 defined here
>    15 |     cleanup:
>       |     ^~~~~~~
> mixed.c:11:13: note: =E2=80=98items=E2=80=99 declared here
>    11 |        int *items =3D malloc(sizeof(int) *nitems);
>       |             ^~~~~
> mixed.c:7:12: warning: jump skips variable initialization [-Wjump-misses-=
init]
>     7 |            goto cleanup;
>       |            ^~~~
> mixed.c:15:5: note: label =E2=80=98cleanup=E2=80=99 defined here
>    15 |     cleanup:
>       |     ^~~~~~~
> mixed.c:10:12: note: =E2=80=98nitems=E2=80=99 declared here
>    10 |        int nitems =3D 3;
>       |            ^~~~~~
>

Nice option.  I didn't know about it.

> however that will warn about *all* cases where we jump over a
> declared variable, even if the variable we're jumping over is
> not used at the target label location. IOW, it has significant
> false positive rates. There are quite a few triggers for this
> in the QEMU code already if we turn on this warning.
> It also doesn't alter that the code initialization is misleading
> to read.

I will take a look next week and see how many errors we have have like
that and then we can decide if it is fixable to add that option.

>> - (at least for me), declaring the index inside the for make clear
>>   that index is not used outside the for.
>
> I'll admit that declaring loop indexes in the for() is a nice
> bit, but I'm not a fan in general of mixing the declarations
> in the middle of code for projects that use the 'goto cleanup'
> pattern.

don't do that if we use goto.  I will resend the patch and put the
warning about goto.

>> - Current documentation already declares that they are allowed in some
>>   cases.
>> - Lots of places already use them.
>>=20
>> We can change the text to whatever you want, just wondering if it is
>> valib to change the standard.
>>=20
>> Doing a trivial grep through my local qemu messages (around 100k) it
>> shows that some people are complaining that they are not allowed, and
>> other saying that they are used all over the place.
>
> IMHO the status quo is bad because it is actively dangerous when
> combined with goto and we aren't using any compiler warnings to
> help us.
>
> Either we allow it, but use -Wjump-misses-init to prevent mixing
> delayed declarations with gotos, and just avoid this when it triggers
> a false positive.
>
> Or we forbid it, rewrite current cases that use it, and then add
> -Wdeclaration-after-statement to enforce it.
>
>
> IMHO if we are concerned about uninitialized variables then I think
> a better approach is to add -ftrivial-auto-var-init=3Dzero, which will
> make the compiler initialize all variables to 0 if they lack an
> explicit initializer.=20

I think this is a bad idea.
If we want to "catch" unitialized variables, using something like:

-ftrivial-auto-var-init=3Dpattern sounds much saner.

Obviously gcc is missing

-ftrivial-auto-var-init=3D42

But well, no project is perfect.

Later, Juan.


