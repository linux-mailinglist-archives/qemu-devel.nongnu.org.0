Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE513C0D0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 13:27:30 +0100 (CET)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irhlh-000249-7w
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 07:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1irhjm-0008EH-D5
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 07:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1irhji-00033O-QE
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 07:25:30 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49410
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1irhji-000332-Mp
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 07:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579091126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgVTufXyo/q47fR/teQLe9bmw5/5vM7mbmzGMIphM1c=;
 b=Cf9r/D/K32D0f/R6q0CwjKhGv2HGyrR/pmz0NHYpMjNLK11mffVZpRLFtjbXmoK7X8lDbr
 slKFfvrhgyUBF/KRM3t4XB9Hocvw9E+MdgQQUvyoo9Lvkj6xlH7RC4JcmJs/Rq6FNl/w3U
 sgDH42wS0d0ZdWO+/xteDGxPhnjO/Ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-poN85bLbOBOPfR8WNXkEkQ-1; Wed, 15 Jan 2020 07:25:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1CB312BF5D;
 Wed, 15 Jan 2020 12:25:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB41F5C219;
 Wed, 15 Jan 2020 12:25:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6FF0F1138600; Wed, 15 Jan 2020 13:25:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: Making QEMU easier for management tools and applications
References: <CAJSP0QUk=4co-nqk8fv2n-T2_W40rE3r_5OMoxD7otAV993mCA@mail.gmail.com>
 <1EFEF446-AFEA-429F-B6BA-3206A7C41836@redhat.com>
 <20200108104306.GC5057@dhcp-200-226.str.redhat.com>
 <97F153BD-FB8A-46C7-90D0-9E894B9E0292@redhat.com>
 <20200108133842.GE5057@dhcp-200-226.str.redhat.com>
 <87d0bmchq0.fsf@dusky.pond.sub.org>
 <1B253197-5592-472A-AA26-E0614A13C91A@redhat.com>
 <87o8v52hz9.fsf@dusky.pond.sub.org>
 <CAJ+F1C+ayOH=86zuaeXnZ=vqVw77ahK0KHGZOvbYSijwKh6WjQ@mail.gmail.com>
Date: Wed, 15 Jan 2020 13:25:15 +0100
In-Reply-To: <CAJ+F1C+ayOH=86zuaeXnZ=vqVw77ahK0KHGZOvbYSijwKh6WjQ@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 15 Jan 2020
 13:35:21 +0400")
Message-ID: <87muaozz2s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: poN85bLbOBOPfR8WNXkEkQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Dominik Csapak <d.csapak@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Wed, Jan 15, 2020 at 1:21 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Christophe de Dinechin <dinechin@redhat.com> writes:
>>
>> >> To make this worthwhile, we'd have to replace dynamic QOM properties =
by
>> >> static ones when possible.  Monumental task.
>> >
>> > I=E2=80=99m sure you are right, but it=E2=80=99s hard for me to evalua=
te, given how
>> > many ways there are to access an object. Naively, grepping for
>> > set_prop and for new_with_prop does not give me that many hits.
>>
>> Look for object_property_add*().  Some 450 hits.
>
> fwiw, I have started tackling that.

Laudable.

> Easy first step is to move all QDev properties to class properties,
> and this is done in :
> https://patchew.org/QEMU/20200110153039.1379601-1-marcandre.lureau@redhat=
.com/

Easy because qdev properties are declarative by design.  Imperative came
in when they got rebased onto QOM.

> Moving from instance to class properties is straightforward many times
> (when the property is unconditonally added in instance init for
> example). There are a few complicated cases though.
>
> To me, the most problematic is reviewer-time and willingness to do
> such low-benefits changes.

Understand.

>> Basing the QAPI language on JSON was a poor choice.

Aggravated by immediately extending it in ways that defeat all common
JSON tools.

>>                                                      Not sure that's
>> fixable at a reasonable cost.
>
> Translating it to another language should be relatively easy, but to what=
?

The QAPI language is layered on top of JSON (see
docs/devel/qapi-code-gen.txt section "Schema syntax").  Swapping out
JSON for another language that is at least as expressive is an
relatively simple change.  Obvious candidates: s-expressions, TOML,
YAML.  The latter is far too complex for my taste.

The expensive part is dealing with the conflicts during the transition,
and having everybody relearn QAPI schema syntax.


