Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC12C1141F6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 14:54:28 +0100 (CET)
Received: from localhost ([::1]:54450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icraN-00052p-Nc
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 08:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1icrLh-0007hn-PX
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 08:39:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1icrLe-0004S5-Qc
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 08:39:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29659
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1icrLd-0004Pq-3h
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 08:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575553150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnhb/x6YaZwfbYwlyRlda7171y0HPcU5qK2g5bnRUHs=;
 b=HV66kXuStetuAOJKDAWC5J25aq+52xIA7o9LJKwmjZYRVw6H80MmvmIgnBqPueQZ/u6qFZ
 z/0cXKIZFJBuTmnvKCAqULunXONc6vmcpbVxpy5mGnh/8G0NsAeL2klQXKcSe8cC3rJyA8
 mY/KRgMIkamjdIu4Qgj/o3A/P22H8H0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-In8rOFh3PGWTvk4no7Xklw-1; Thu, 05 Dec 2019 07:37:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 247F5100;
 Thu,  5 Dec 2019 12:37:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59B435C1B5;
 Thu,  5 Dec 2019 12:36:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB0531138606; Thu,  5 Dec 2019 13:36:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC v5 024/126] error: auto propagated local_err
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-25-vsementsov@virtuozzo.com>
 <87muc8p24w.fsf@dusky.pond.sub.org>
 <55393c08-5bda-8042-1a95-f350b3781d99@virtuozzo.com>
Date: Thu, 05 Dec 2019 13:36:40 +0100
In-Reply-To: <55393c08-5bda-8042-1a95-f350b3781d99@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 5 Dec 2019 09:38:49 +0000")
Message-ID: <87d0d3c5k7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: In8rOFh3PGWTvk4no7Xklw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Jeff Cody <codyprime@gmail.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alberto Garcia <berto@igalia.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Anthony Green <green@moxielogic.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Chris Wulff <crwulff@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Michael Walle <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Igor Mammedov <imammedo@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Eric Farman <farman@linux.ibm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Liu Yuan <namei.unix@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Ari Sundholm <ari@tuxera.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Jason Dillaman <dillaman@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 Laszlo Ersek <lersek@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Max Reitz <mreitz@redhat.com>,
 Denis Lunev <den@virtuozzo.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>,
 David Gibson <david@gibson.dropbear.id.au>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Wen Congyang <wencongyang2@huawei.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 04.12.2019 17:59, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>=20
>>> Here is introduced ERRP_AUTO_PROPAGATE macro, to be used at start of
>>> functions with errp OUT parameter.
>>>
>>> It has three goals:
>>>
>>> 1. Fix issue with error_fatal & error_prepend/error_append_hint: user
>>> can't see this additional information, because exit() happens in
>>> error_setg earlier than information is added. [Reported by Greg Kurz]
>>>
>>> 2. Fix issue with error_abort & error_propagate: when we wrap
>>> error_abort by local_err+error_propagate, resulting coredump will
>>> refer to error_propagate and not to the place where error happened.
>>=20
>> I get what you mean, but I have plenty of context.
>>=20
>>> (the macro itself doesn't fix the issue, but it allows to [3.] drop all
>>> local_err+error_propagate pattern, which will definitely fix the issue)
>>=20
>> The parenthesis is not part of the goal.
>>=20
>>> [Reported by Kevin Wolf]
>>>
>>> 3. Drop local_err+error_propagate pattern, which is used to workaround
>>> void functions with errp parameter, when caller wants to know resulting
>>> status. (Note: actually these functions could be merely updated to
>>> return int error code).
>>>
>>> To achieve these goals, we need to add invocation of the macro at start
>>> of functions, which needs error_prepend/error_append_hint (1.); add
>>> invocation of the macro at start of functions which do
>>> local_err+error_propagate scenario the check errors, drop local errors
>>> from them and just use *errp instead (2., 3.).
>>=20
>> The paragraph talks about two cases: 1. and 2.+3.=20
>
> Hmm, I don't think so.. 1. and 2. are issues. 3. is a refactoring.. We ju=
st
> fix achieve 2 and 3 by one action.
>
>> Makes me think we
>> want two paragraphs, each illustrated with an example.
>>=20
>> What about you provide the examples, and then I try to polish the prose?
>
> 1: error_fatal problem
>
> Assume the following code flow:
>
> int f1(errp) {
>     ...
>     ret =3D f2(errp);
>     if (ret < 0) {
>        error_append_hint(errp, "very useful hint");
>        return ret;
>     }
>     ...
> }
>
> Now, if we call f1 with &error_fatal argument and f2 fails, the program
> will exit immediately inside f2, when setting the errp. User will not
> see the hint.
>
> So, in this case we should use local_err.

How does this example look after the transformation?

> 2: error_abort problem
>
> Now, consider functions without return value. We normally use local_err
> variable to catch failures:
>
> void f1(errp) {
>     Error *local_err =3D NULL;
>     ...
>     f2(&local_err);
>     if (local_err) {
>         error_propagate(errp, local_err);
>         return;
>     }
>     ...
> }
>
> Now, if we call f2 with &error_abort and f2 fails, the stack in resulting
> crash dump will point to error_propagate, not to the failure point in f2,
> which complicates debugging.
>
> So, we should never wrap error_abort by local_err.

Likewise.

>
> =3D=3D=3D
>
> Our solution:
>
> - Fixes [1.], adding invocation of new macro into functions with error_ap=
pen_hint/error_prepend,
>    New macro will wrap error_fatal.
> - Fixes [2.], by switching from hand-written local_err to smart macro, wh=
ich never
>    wraps error_abort.
> - Handles [3.], by switching to macro, which is less code
> - Additionally, macro doesn't wrap normal non-zero errp, to avoid extra p=
ropagations
>    (in fact, error_propagate is called, but returns immediately on first =
if (!local_err))


