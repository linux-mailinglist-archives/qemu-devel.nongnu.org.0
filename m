Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A44ED8AF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:46:40 +0200 (CEST)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtGA-0000Ze-96
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:46:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZt7F-0006sW-VI
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:37:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZt7C-0003ZQ-Ag
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648726641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYguaGjpB1MQGVDSONQ4zq3dhMAr0nP74NyXmD6Manw=;
 b=IFsEK3/nr1FV/CP8EprHyiCv/il3/FTTNODsWRCOYYHeRKtubhMsg/scxJSmDEOGitJeWF
 xm5sOhBMnj/6Y9y9nhfX8QiCQkdm9NNe3fcblcEgdlokKvPmu02wBnYsPxj4WtZ5PZL70e
 Yt+T05NZXMctrO3opHfqh92GxWnJSh4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-OvODxfzLP0q3U4MOotbTTQ-1; Thu, 31 Mar 2022 07:37:20 -0400
X-MC-Unique: OvODxfzLP0q3U4MOotbTTQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63B2F2A2AD60;
 Thu, 31 Mar 2022 11:37:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C4BB401473;
 Thu, 31 Mar 2022 11:37:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC82E21E691D; Thu, 31 Mar 2022 13:37:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
 <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
 <dca7d15b-2f24-cfb2-9a31-47b5ffd9c3d5@redhat.com>
 <YjHY8GA52MzjBxLK@stefanha-x1.localdomain>
 <d041cc7c-f437-3092-2485-ec9b2b0f8c96@redhat.com>
 <66f70dc8-2899-b837-0a9f-572737d64856@redhat.com>
Date: Thu, 31 Mar 2022 13:37:17 +0200
In-Reply-To: <66f70dc8-2899-b837-0a9f-572737d64856@redhat.com> (Hanna Reitz's
 message of "Thu, 17 Mar 2022 16:53:13 +0100")
Message-ID: <875ynuqro2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hanna Reitz <hreitz@redhat.com> writes:

> On 17.03.22 16:11, Paolo Bonzini wrote:
>> On 3/16/22 13:32, Stefan Hajnoczi wrote:
>>> You can define rules and a way to enforce a subset of C++, but I think
>>> over time the code will be C++. A policy that is complicated discourage=
s
>>> contributors.
>>>
>>> For these reasons I think that if code runs through a C++ compiler we
>>> should just allow C++. Either way, it will take time but that way no on=
e
>>> will feel betrayed when C++ creeps in.
>>
>> Fair enough.=C2=A0 We even already have some conventions that will make
>> any C++ that creeps in less weird (for example, mandatory typedef of=20
>> structs).
>>
>> I don't think it would be a big deal overall.=C2=A0 I actually agree tha=
t
>> we should "just allow C++", what matters more to have style rules
>> that make QEMU's flavors of C and C++ consistent.
>
> I just want to throw in that I personally am absolutely not confident
> in reviewing C++ code.

Me neither.

>                         As for Rust, you keep mentioning that we don=E2=
=80=99t
> have anyone who would =E2=80=9Cshepherd us through the learning experienc=
e=E2=80=9D,
> but I find the very same argument applies to C++.
>
> C++ may start out looking like C, but if used ideally, then it is a
> very different language, too.=C2=A0 I understand the difference is that w=
e
> can incrementally convert our C code to C++,

Bad C++ in need of rework, presumably.

>                                              but I=E2=80=99m not comforta=
ble=20
> overseeing that process, which I would have to do as a maintainer.=C2=A0

That makes two of us.

The plain language version of "I'm not comfortable serving" is of course
"I do not intend to serve".

> Assuming our overall stance does change to =E2=80=9Cjust allowing C++=E2=
=80=9D, I=E2=80=99d
> feel unjust if I were to reject C++isms just based on the fact that I
> don=E2=80=99t know C++, so I=E2=80=99d be forced to learn C++.=C2=A0 I=E2=
=80=99m not strictly
> opposed to that (though from experience I=E2=80=99m more than hesitant), =
but
> forcing maintainers to learn C++ is something that has a cost
> associated with it.

I'm a lot more interested in learning Rust than in (re-)learning C++.

> My biggest gripe about C++ is that as far as I understand there are
> many antipatterns, many of which I think stem from the exact fact that
> it is kind of compatible with C, and so you can easily accidentally
> write really bad C++ code; but without years of experience, I=E2=80=99m
> absolutely not confident that I could recognize them.=C2=A0 Now, I might
> say I=E2=80=99d just disallow complicated stuff, and keep everything C-li=
ke,
> but from what I=E2=80=99ve heard, C-like C++ seems to be exactly one case=
 that
> is considered bad C++.=C2=A0 I=E2=80=99m really under the impression that=
 I=E2=80=99d need
> years of experience to discern good from bad C++, and I don=E2=80=99t hav=
e
> that experience.

Right.


