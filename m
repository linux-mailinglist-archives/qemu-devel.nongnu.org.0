Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8077A58F9C8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:12:06 +0200 (CEST)
Received: from localhost ([::1]:42710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4EX-0003QA-Ec
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM48H-0006rM-CL
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM48C-0001Gs-WE
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660208732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxaTeXArh9Dmhd/qkwRjm/YBGtJB0bayEncmLzJMP+Y=;
 b=iMSOiMlVgUBj4oZa8AhRNysF4d6BU436vxg3k2O5rSFtrQ07wTftIlvygxCBpledwi8LSB
 ar0gRpS5YFiYz1sxT9cobQIUbdNg3MKVHAlHXUW+wy4dhfcMPD4GZF7eIvbcFE1EMSBUSs
 dl0MPeyBhZizNEZrSL8fCuJbXZah1No=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-CXBkncfPO9ezu4gG_yxNEQ-1; Thu, 11 Aug 2022 05:05:29 -0400
X-MC-Unique: CXBkncfPO9ezu4gG_yxNEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 846091857F08;
 Thu, 11 Aug 2022 09:05:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BA6D40D2827;
 Thu, 11 Aug 2022 09:05:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6357621E668B; Thu, 11 Aug 2022 11:05:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org,  Eric Blake <eblake@redhat.com>,  Cleber Rosa
 <crosa@redhat.com>,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Xie Yongji <xieyongji@bytedance.com>,  Kyle Evans
 <kevans@freebsd.org>,  Peter Maydell <peter.maydell@linaro.org>,  John
 Snow <jsnow@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Warner
 Losh <imp@bsdimp.com>,  Kevin Wolf <kwolf@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Laurent Vivier <laurent@vivier.eu>,  Fam
 Zheng <fam@euphon.net>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 11/15] qemu-common: move scripts/qapi
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-12-marcandre.lureau@redhat.com>
 <87pmhf86ew.fsf@pond.sub.org>
 <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 <8735e38e6t.fsf@pond.sub.org>
 <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
Date: Thu, 11 Aug 2022 11:05:26 +0200
In-Reply-To: <CAJ+F1CKH5y8SWULvgXWh7PPDTXOMGusYHE6RwZDZWVJoC=m8hQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 11 Aug 2022
 11:11:15 +0400")
Message-ID: <87o7wr5ew9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
> On Thu, Aug 11, 2022 at 10:52 AM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>>
>> > Hi
>> >
>> > On Fri, Aug 5, 2022 at 12:12 PM Markus Armbruster <armbru@redhat.com>
>> wrote:
>> >
>> >> marcandre.lureau@redhat.com writes:
>> >>
>> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >> >
>> >> > This is just moving qapi-gen.py and related subdir to qemu-common, =
to
>> >> > ease review and proceed step by step. The following patches will mo=
ve
>> >> > related necessary code, tests etc.
>> >> >
>> >> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >>
>> >> As moved files tend to become low-level annoyances for a long time, I=
'd
>> >> like to understand why you want to move them.  The commit message says
>> >> "to ease review", which I suspect isn't the real reason.  Perhaps you
>> >> explained all that elsewhere already, but I missed it.
>> >>
>> >>
>> >>
>> > The end goal is to split some projects, such as qemu-ga, to standalone
>> > meson projects/subprojects. We will be able to build them independently
>> > from the rest of QEMU, and later on perhaps handle them outside of QEMU
>> > main repository. To achieve this, I first introduce a qemu-common
>> > subproject, where qapi and common units are provided. You can check
>> > https://gitlab.com/marcandre.lureau/qemu/-/commits/qga for a sneak pee=
k at
>> > current end result.
>>
>> I worry this move of the QAPI generator code into
>> subjprojects/common/scripts/qapi/ will be followed by a move into its
>> own subproject.
>>
>
> Do you mean: it could be moved again to another smaller subproject? not
> really, see below
>
>
>> Ignorant question: could we turn the QAPI generator into a subproject in
>> place?
>>
>
> If it's just the generator, probably the target would then be a python
> project (not meson), similar to python-qemu-qmp.
>
> But I don't see much point, since it's not really a standalone python
> module, it generates code, and that code needs most of what is in
> qemu-common (see
> https://gitlab.com/marcandre.lureau/qemu/-/tree/qga/subprojects/qemu-comm=
on).
> It's best to have it together imho. Maybe we can consider a different
> naming or to be more careful not to add stuff that is not strictly needed
> by qapi?

I had a look at subjprojects/qemu-common in your qga branch.  Contents:

* Subproject machinery

* Some common headers (glib-compat.h), but not others (qemu/osdep.h).  I
  guess it's whatever subjproject code needs.

  Is subprojects/qemu-common/include/block/nvme.h there by accident?

* Most of the QObject subsystem

  qobject/block-qdict.c is left behind.

* Most of the QAPI subsystem

  Some visitors left behind: opts, forward, string input / output.  Hmm,
  only the .c, the .h are in the subjproject.  Accident?

  A bit of HMP support left behind.

* Parts of util/ and include/qemu/

  Error reporting, key-value CLI, some C utilities, but not others
  (e.g. qemu/atomic.h, but not qemu/atomic128.h).  I guess it's again
  whatever subjproject code needs.

* Parts of the QAPI Schema subsystem

Aside: MAINTAINERS mostly not updated.

Your moves tear closely related code apart.  This is going to be a drag
for developers in general and maintainers in particular.

Ergonomics suffer when related code is in multiple places.  Having to
switch between directories and remember where is what will a constant
low-level pain.  Things that used to be simple & quick, like git-grep
qapi/*.c, become more involved.

Hurts even when merely consuming the subsystem: when I see #include
"qemu/foo.h", the straightforward include/qemu/foo.h may or may not do.
When it doesn't, I need to know where to look instead.

subprojects/qemu-common/include/ is a lot to type.  Sufficiently
powerful editors mitigate, but not completely.

When changes need to be applied to every instance of an abstraction,
it's easy to miss instances "elsewhere".  There's a reason the QAPI
visitors are all in one place.

The actual split seems somewhat arbitrary in places.  I suspect more
code will move over time.  Invalidating "what is where" knowledge.

I believe a serious think about other ways to accomplish your goals is
called for.

> (fwiw, it's a bit of a shame python-qemu-qmp didn't import git history fr=
om
> qemu.. we did better with libslirp. If we ever move code in standalone
> repositories again, we should be careful to keep history with it)

Yes, we should preserve history whenever practical.

[...]


