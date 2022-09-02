Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB5E5AAD99
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 13:26:21 +0200 (CEST)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU4oW-00065N-3l
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 07:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU4ej-0005zj-P9
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oU4ef-000619-Uv
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 07:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662117368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8hJQtpnkl1XDR8G+xsPNtWLsIhwpZ/cgx0U2oPeuRYY=;
 b=DYil1DJNdp63q+CqDe0LGDAsYF/gNBaMsHYCPZG6aFx8utWWHuswrv9nmSmJSbUNtGIgeN
 K6wGu7ooJMSBr5Yz4iMxbO/a9LPpgisgDRcn+Y6HheWcyGibYkdCKdR4agiWYsW5ktvzHT
 JqwWL2aDaMv2PW7roHSa62w+OPJ8ZTU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-m9YU1v0-PwavQwfVVqUsAw-1; Fri, 02 Sep 2022 07:16:03 -0400
X-MC-Unique: m9YU1v0-PwavQwfVVqUsAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C39EF2919EB8;
 Fri,  2 Sep 2022 11:16:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 682822166B26;
 Fri,  2 Sep 2022 11:16:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D932621E6900; Fri,  2 Sep 2022 13:15:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Xie Yongji <xieyongji@bytedance.com>,  Kyle Evans
 <kevans@freebsd.org>,  John Snow <jsnow@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Warner Losh <imp@bsdimp.com>,  Kevin Wolf
 <kwolf@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Laurent Vivier
 <laurent@vivier.eu>,  Fam Zheng <fam@euphon.net>,  Hanna Reitz
 <hreitz@redhat.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
 <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
 <87o7wr5ew9.fsf@pond.sub.org>
 <CAJ+F1CKbkTOX7Fh9RvkBvuW_gZqZjYSta=7nEKbzm-OefPE_GQ@mail.gmail.com>
 <CAFEAcA8E7uTSHh+BdnU2ZHiaquaQDqpYMurUwpjvVmK-Ks522w@mail.gmail.com>
 <CAJ+F1CLb=+gA=Keb3WgW3Mf84eWRikWVxV8HTjdQU8pFTVNMEg@mail.gmail.com>
 <YvTy8zYFQYAKqgoF@redhat.com> <87o7wqoqc1.fsf@pond.sub.org>
 <CAJ+F1C+DNUwtdwSgf+aAoAcJ6u_fn=txXfHG9QdGaC8o26cxkg@mail.gmail.com>
Date: Fri, 02 Sep 2022 13:15:59 +0200
In-Reply-To: <CAJ+F1C+DNUwtdwSgf+aAoAcJ6u_fn=txXfHG9QdGaC8o26cxkg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Mon, 22 Aug 2022
 12:16:03 +0400")
Message-ID: <87o7vyt4b4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Thu, Aug 11, 2022 at 5:35 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>
>> > On Thu, Aug 11, 2022 at 02:50:01PM +0400, Marc-Andr=C3=A9 Lureau wrote:
>> >> Hi
>> >>
>> >> On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell <peter.maydell@linaro.o=
rg
>> >
>> >> wrote:
>>
>> [...]
>>
>> >> > As Markus says, your branch ends up moving most of qobject into
>> >> > qemu-common/. We are never going to let that out of QEMU proper,
>> >> > because we are never going to allow ourselves to be tied to API
>> >> > compatibility with it as an external library. So anything that
>> >> >
>> >>
>> >> Why is that? We do it with a lot of dependencies already, with stable
>> APIs.
>> >>
>> >> Furthermore, we don't "have to" be tied to a specific ABI/API, we can
>> >> continue to link statically and compile against a specific version. l=
ike
>> >> with libvfio-user today.
>> >>
>> >> And at this point, I am _not_ proposing to have an extra "qemu-common"
>> >> repository. I don't think there are enough reasons to want that eithe=
r.
>> >>
>> >>
>> >>
>> >> > needs qobject is never going to leave the QEMU codebase. Which
>> >> > means that there's not much gain from shoving it into subproject/
>> >> > IMHO.
>> >>
>> >>
>> >> (just to be extra clear, it's qobject not QOM we are talking about)
>> >>
>> >> qobject is fundamental to all the QAPI related generated code. Why
>> should
>> >> that remain tight to QEMU proper?
>> >
>> > Neither qobject nor QOM have ever been designed to be public APIs.
>> > Though admittedly qobject is quite a bit simpler as an API, I'm
>> > not convinced its current design is something we want to consider
>> > public. As an example, just last month Markus proposed changing
>> > QDict's implementation
>> >
>> > https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00758.html
>> >
>> >
>> > If we want external projects to be able to take advantage of QAPI,
>> > the bare minimum we need to be public is a QAPI parser, from which
>> > people can then build any code generators desired.
>>
>> Basically scripts/qapi/ less the code generators.
>>
>>
> The generated code is used by qemu-ga & storage daemon, at least. They are
> the first potential consumers, after qemu.
>
>
>> Not sure a subproject would be a good fit.
>>
>
> (I won't repeat the arguments of structuring a project)
>
>
>>
>> Shot from the hip: could the build process spit out something external
>> projects could consume?  It's how "consumables" are commonly delivered.
>> E.g. .so + a bunch of headers.  Sometimes that gets packaged.  Sometimes
>> it gets copied into the consuming tree ("vendored").
>>
>>
> Not sure I follow, but that's just the "install" step isn't it ?
>
> Sure, we could have a "qemu-devel", that ships qapi-gen, I guess. But the=
n,
> you would expect stability/versioning. That's not what I am proposing (at
> least at this point), which is just about the build system and project
> structure, so we can build and work on subprojects independently. (for ex,
> in my wip branch, qemu-ga meson.build is 115 lines, doesn't need QEMU
> configure etc)

I'm afraid I'm still wobbly on the benefits of subprojects, or even how
to work with them.

How exactly would we "build and work independently" on the subprojects
involving QAPI?  git-clone all of QEMU, but build only a subproject (and
its dependencies)?  Am I confused?

>> > We don't neccessarily need the current QAPI C code generator. There
>> > could be a new C generator that didn't use qobject, but instead used
>> > some standard GLib types like GHashTable/GList instead of QDict/QList.
>>
>> Yes, that should be possible.
>>
>>
> I can't see much benefit from doing that extra work. It would create two C
> APIs, making future bindings efforts more difficult etc.

We need to distinguish client-side and server-side APIs / bindings.

The existing C generator targets internal, server-side use.  It
generates everything defined in the schema.

The existing introspection generator generates data for external,
client-side use (via QMP).  It generates just the subset visible in QMP.

The proposed Go generator also targets external, client-side use (client
bindings for QMP), and should also generate just the subset visible in
QMP.

So should a future C generator of client bindings for QMP.

And then we'd have two distinct C APIs: a server-side one to help us
implement QMP, and a client-side one to help use use QMP (QMP bindings).

Whether the two would profit from sharing QObject is not clear to me
at this point.

> QObject is very much like GValue though (the naming is better too :), just
> like the QOM & GObject story.
>
> thanks


