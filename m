Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF5658F7FC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 08:58:21 +0200 (CEST)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM28w-0004g4-Cg
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 02:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM23a-0001gR-SW
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 02:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM23V-0003W3-Jk
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 02:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660200752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQXKk6e0JkbSNv153GgQSTUY6CCmtGnXHdRUx88fpAw=;
 b=aWTbzMrX5Guh9K18MX9PlX5GCENbg5syB7rZu0ZUlhcKfEChZJ39n68j/DVPr/3p5b+/Na
 KcYWEk/oDJJ7HKQbYctBdgJrPGcWV79jvacFi7jzw8DFZuYkLMyasjmbA1wvJvEkgLhYxO
 oGQSdiFvUKKpc+c13iQgMAz7+WW/VQ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-RsacmTmCNmKkgJ4Edt-LFA-1; Thu, 11 Aug 2022 02:52:29 -0400
X-MC-Unique: RsacmTmCNmKkgJ4Edt-LFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC0C51C07561;
 Thu, 11 Aug 2022 06:52:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F624C15BAA;
 Thu, 11 Aug 2022 06:52:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F68F21E668B; Thu, 11 Aug 2022 08:52:26 +0200 (CEST)
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
Date: Thu, 11 Aug 2022 08:52:26 +0200
In-Reply-To: <CAJ+F1C+=TbU+dW23MM8Vyaxti73xySMkuK4+wRDjgdM32qMCAA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Fri, 5 Aug 2022
 12:49:55 +0400")
Message-ID: <8735e38e6t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> On Fri, Aug 5, 2022 at 12:12 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > This is just moving qapi-gen.py and related subdir to qemu-common, to
>> > ease review and proceed step by step. The following patches will move
>> > related necessary code, tests etc.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> As moved files tend to become low-level annoyances for a long time, I'd
>> like to understand why you want to move them.  The commit message says
>> "to ease review", which I suspect isn't the real reason.  Perhaps you
>> explained all that elsewhere already, but I missed it.
>>
>>
>>
> The end goal is to split some projects, such as qemu-ga, to standalone
> meson projects/subprojects. We will be able to build them independently
> from the rest of QEMU, and later on perhaps handle them outside of QEMU
> main repository. To achieve this, I first introduce a qemu-common
> subproject, where qapi and common units are provided. You can check
> https://gitlab.com/marcandre.lureau/qemu/-/commits/qga for a sneak peek at
> current end result.

I worry this move of the QAPI generator code into
subjprojects/common/scripts/qapi/ will be followed by a move into its
own subproject.

Ignorant question: could we turn the QAPI generator into a subproject in
place?

> I said "to ease review and proceed step by step" simply because there are
> no other changes: I don't move the rest of the qapi code & tests all
> together, it's in the subsequent series.

I'd recommend to provide a bit more context in the commit message, even
if you copy it to several messages in a row.  Our future selves will
likely be grateful.


