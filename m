Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBBB14545D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 13:26:26 +0100 (CET)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuF5V-0001gc-AS
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 07:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iuF4D-0000sp-Qk
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 07:25:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iuF4C-000882-GK
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 07:25:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33219
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iuF4C-00087P-CR
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 07:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579695904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJ8VTUTsR0A3bUokoEfG5TZFK+goq8/I1dZOnP0Zl+U=;
 b=cvNNL5oAplTbKMcyRLvpG/MX+aJDVPY6wlvZhBOKbPxwyt51CTpMcobIUZr9NcqCvxEMXO
 i+NwZBXELKlG7L9/UluF0/IOZSzpTrrGH97QfqdLeYEIRcfUEBV3XVGcnZtFKcRixLS4bJ
 KcgB51bDktUJTz73iqrCJd+DG2PLZLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-FTjmu_cbNJiYe8SFKJZ2qQ-1; Wed, 22 Jan 2020 07:25:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E13E08010ED;
 Wed, 22 Jan 2020 12:24:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89FF060FA2;
 Wed, 22 Jan 2020 12:24:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F3901138600; Wed, 22 Jan 2020 13:24:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: Integrating QOM into QAPI
References: <87d0bmchq0.fsf@dusky.pond.sub.org>
 <1B253197-5592-472A-AA26-E0614A13C91A@redhat.com>
 <87o8v52hz9.fsf@dusky.pond.sub.org>
 <8CF8359B-1E52-4F7A-944E-C1C14FEC4F92@redhat.com>
 <87r200zzje.fsf@dusky.pond.sub.org>
 <20200120100849.GB345995@stefanha-x1.localdomain>
 <871rrtmkko.fsf@dusky.pond.sub.org>
 <20200121113224.GD630615@stefanha-x1.localdomain>
 <CAJ+F1C+anMuBE6pOu8JNOoaNnDw8a47Dc1f6MhnxH=rRNqMF=Q@mail.gmail.com>
 <87wo9lc4oe.fsf_-_@dusky.pond.sub.org>
 <20200121143658.GB597037@redhat.com>
 <871rrs97ld.fsf@dusky.pond.sub.org>
 <CAJ+F1CJ68_QM7zhqoL-bom3vFSNprN3zOV5FUBtrJWg4nAai5g@mail.gmail.com>
 <87y2tzzrwo.fsf@linaro.org>
Date: Wed, 22 Jan 2020 13:24:52 +0100
In-Reply-To: <87y2tzzrwo.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 22 Jan 2020 10:50:31 +0000")
Message-ID: <87wo9ju19n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: FTjmu_cbNJiYe8SFKJZ2qQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>, "Denis V.
 Lunev" <den@virtuozzo.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Dominik Csapak <d.csapak@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>> Actually, we are not that far off from being able to use GObject
>> altogether (I hacked something like that to play with), but I
>> disgress...
>
> As a mostly hands off observer who mainly c&p's QOM code when he has to
> I have to ask is this a long term plan?
>
> I've always found having our own hand rolled object system a little
> incongruous given we lean heavily on the rest of glib.

I vaguely remember claims that GObject falls short of our needs.  Sadly,
I don't remember the details.  This is why major features should come
with a design document.

https://wiki.qemu.org/Features/QOM ain't: it does not mention GObject.
I'm afraid that page has fallen too far behind the code to be useful to
anyone not familiar with the code.

>> So introducing GObject-like macros? sure!
>>
>> There are plenty of refactoring to do. The problem when touching the
>> whole code-base, imho, is review time. It may take a couple of
>> hours/days to come up with a cocci/spatch, and make various patches
>> here and there. But it takes often weeks and a lot of constant push to
>> various folks to get all the reviews (as seens by the qdev prop-ptr
>> series earlier for example). How can we better address whole code-base
>> changes?
>
> The problem with review time - especially for QOM - is having domain
> knowledge to understand what is happening.
>
> Are we happy that the existing qdev/qmp tests sufficiently exercise
> QEMU's object model? Perhaps with a little extra tweaking of the tests
> we could dump the object hierarchy and then compare it to the hierarchy
> presented after modification. That might make it easier to have
> confidence that these large scale but mostly mechanical changes don't
> change anything externally visible?

Comparing the composition tree complete with properties and property
values before and after feels like a useful regression test.  Any
takers?


