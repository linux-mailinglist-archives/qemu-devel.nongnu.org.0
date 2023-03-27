Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557516CA19C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 12:47:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgkLr-00035L-UC; Mon, 27 Mar 2023 06:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pgkLm-00034z-IE
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:45:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pgkLk-00006u-NO
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 06:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679913915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=987hBexmp0A7Qhpy4oBbX4BUkexnYM4k7SWNBzpk7GY=;
 b=FbCFuYUNaVgsNI91RkAEugiy7bCowx37xhB7o5TCFNELia3B7mzEYA3bo3Ovw70rOd3DxK
 FELuKL6TNKs/dqXY6XWljreAArSfb8Wsu220fL/K+54ZjBNK3ZvqUOGIxcb72cEdRIQyf9
 jfuWEHoObX2yKzZjEGWZ8K8aUgGRulw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-Jj-gl4vYPTORcyCRn1poVA-1; Mon, 27 Mar 2023 06:45:11 -0400
X-MC-Unique: Jj-gl4vYPTORcyCRn1poVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8E583C0ED4A
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:45:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFAE02166B26
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:45:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7F84F21E6926; Mon, 27 Mar 2023 12:45:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com>
Date: Mon, 27 Mar 2023 12:45:09 +0200
In-Reply-To: <ZByhueDO9J9MLuSJ@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 23 Mar 2023 19:00:09 +0000")
Message-ID: <87ilemcw22.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

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
>
> Consider this example:

[...]

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
>
> however that will warn about *all* cases where we jump over a
> declared variable, even if the variable we're jumping over is
> not used at the target label location. IOW, it has significant
> false positive rates. There are quite a few triggers for this
> in the QEMU code already if we turn on this warning.
>
> It also doesn't alter that the code initialization is misleading
> to read.

Yup.  Strong dislike.

>> - (at least for me), declaring the index inside the for make clear
>>   that index is not used outside the for.
>
> I'll admit that declaring loop indexes in the for() is a nice
> bit, but I'm not a fan in general of mixing the declarations
> in the middle of code for projects that use the 'goto cleanup'
> pattern.

A declaration in a for statement's first operand is effectively at the
beginning of a block.  Therefore, use of this feature is already
sanctioned by the QEMU Coding Style.  The proposed patch at most
clarifies this.

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

I'm in favour of -Wdeclaration-after-statement.

> IMHO if we are concerned about uninitialized variables then I think
> a better approach is to add -ftrivial-auto-var-init=3Dzero, which will
> make the compiler initialize all variables to 0 if they lack an
> explicit initializer.=20

How often do we get bitten by uninitialized variables despite
-Wmaybe-uninitialized?  Honest question!

>> Discuss.


