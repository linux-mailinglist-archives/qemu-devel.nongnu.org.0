Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63858FD8A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:41:15 +0200 (CEST)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8Qz-0003mQ-Er
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM8Lq-00057n-7C
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oM8Ll-00075R-HS
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660224947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOuCxKPSiRdzM8PGe+NTjYRa3c3QtCGa4R5sNnZMoCk=;
 b=HaDh9b187+LE3lrNzZ1WWkqLxP5gy3nTHvCQZ2klFByHOE+dKk2ouMYFOxopQRXU0D1EuJ
 rmpd0rVsbVAC7ht7mOs2nlsrFiW5fGJXAtjG6mPdnpYvWGbVjGeSofEbYU5DKnVDRdnsXn
 N3PCgJdEeF0+S3xlsuxfHLyakYTUwr4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-qK6-Hd6_MP-we5XcDvf8Ig-1; Thu, 11 Aug 2022 09:35:44 -0400
X-MC-Unique: qK6-Hd6_MP-we5XcDvf8Ig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E49281C00145;
 Thu, 11 Aug 2022 13:35:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65F6D1415129;
 Thu, 11 Aug 2022 13:35:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 456E121E693E; Thu, 11 Aug 2022 15:35:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Markus Armbruster <armbru@redhat.com>,
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
 <YvTy8zYFQYAKqgoF@redhat.com>
Date: Thu, 11 Aug 2022 15:35:42 +0200
In-Reply-To: <YvTy8zYFQYAKqgoF@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 11 Aug 2022 13:15:47 +0100")
Message-ID: <87o7wqoqc1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Aug 11, 2022 at 02:50:01PM +0400, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>=20
>> On Thu, Aug 11, 2022 at 2:22 PM Peter Maydell <peter.maydell@linaro.org>
>> wrote:

[...]

>> > As Markus says, your branch ends up moving most of qobject into
>> > qemu-common/. We are never going to let that out of QEMU proper,
>> > because we are never going to allow ourselves to be tied to API
>> > compatibility with it as an external library. So anything that
>> >
>>=20
>> Why is that? We do it with a lot of dependencies already, with stable AP=
Is.
>>=20
>> Furthermore, we don't "have to" be tied to a specific ABI/API, we can
>> continue to link statically and compile against a specific version. like
>> with libvfio-user today.
>>=20
>> And at this point, I am _not_ proposing to have an extra "qemu-common"
>> repository. I don't think there are enough reasons to want that either.
>>=20
>>=20
>>=20
>> > needs qobject is never going to leave the QEMU codebase. Which
>> > means that there's not much gain from shoving it into subproject/
>> > IMHO.
>>=20
>>=20
>> (just to be extra clear, it's qobject not QOM we are talking about)
>>=20
>> qobject is fundamental to all the QAPI related generated code. Why should
>> that remain tight to QEMU proper?
>
> Neither qobject nor QOM have ever been designed to be public APIs.
> Though admittedly qobject is quite a bit simpler as an API, I'm
> not convinced its current design is something we want to consider
> public. As an example, just last month Markus proposed changing
> QDict's implementation
>
> https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00758.html
>
>
> If we want external projects to be able to take advantage of QAPI,
> the bare minimum we need to be public is a QAPI parser, from which
> people can then build any code generators desired.

Basically scripts/qapi/ less the code generators.

Not sure a subproject would be a good fit.

Shot from the hip: could the build process spit out something external
projects could consume?  It's how "consumables" are commonly delivered.
E.g. .so + a bunch of headers.  Sometimes that gets packaged.  Sometimes
it gets copied into the consuming tree ("vendored").

> We don't neccessarily need the current QAPI C code generator. There
> could be a new C generator that didn't use qobject, but instead used
> some standard GLib types like GHashTable/GList instead of QDict/QList.

Yes, that should be possible.


