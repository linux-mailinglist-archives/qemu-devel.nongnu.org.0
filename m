Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8EC2B7EA2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:54:25 +0100 (CET)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNui-0000KE-FY
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfNty-0008KY-7u
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfNtv-0005vf-8r
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605707613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtM9Nq3Y6f0qmDrlSlfE7fXIpPIFh7Ov/wcAL5UBjSE=;
 b=Eq4gzWO1HvfhcNWNk91VNds5vdSXBUovjG55vOyxTKnKVN6lf/L3DMax5VKSC3nWgBz7mo
 Z/GawrELqj3szAF+wZhprDXvG9YZrphbii7JF0pdDPyzohzTz6T6OsA3j1C8rpmC8yEFDE
 zuZtnQD5uxp6gghLWPk+Uo03bXtMq8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-6g1oxryAMsKlwbF3L4oTlQ-1; Wed, 18 Nov 2020 08:53:31 -0500
X-MC-Unique: 6g1oxryAMsKlwbF3L4oTlQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 794126D581;
 Wed, 18 Nov 2020 13:53:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FFBF60843;
 Wed, 18 Nov 2020 13:53:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AEFE411358BA; Wed, 18 Nov 2020 14:53:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
 <20201118112845.GA11988@merkur.fritz.box>
 <20201118115612.GD229461@redhat.com>
Date: Wed, 18 Nov 2020 14:53:26 +0100
In-Reply-To: <20201118115612.GD229461@redhat.com> ("Daniel P. =?utf-8?Q?Be?=
 =?utf-8?Q?rrang=C3=A9=22's?=
 message of "Wed, 18 Nov 2020 11:56:12 +0000")
Message-ID: <87blfukbzd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Nov 18, 2020 at 12:28:45PM +0100, Kevin Wolf wrote:
>> Am 18.11.2020 um 09:36 hat Markus Armbruster geschrieben:
>> > >> >>                                       [...]  Even better would b=
e
>> > >> >> returning an array of KvmInfo with information on all supported
>> > >> >> accelerators at once, rather than making the user call this comm=
and once
>> > >> >> per name.
>> > >> >
>> > >> > Maybe.  It would save us the work of answering the question
>> > >> > above, but is this (querying information for all accelerators at
>> > >> > once) going to be a common use case?
>> > >>=20
>> > >> I recommend to scratch the query-accel parameter, and return inform=
ation
>> > >> on all accelerators in this build of QEMU.  Simple, and consistent =
with
>> > >> similar ad hoc queries.  If a client is interested in just one, fis=
hing
>> > >> it out of the list is easy enough.
>> > >>=20
>> > >
>> > > Works for me. I'll then leave KvmInfo as is and will introduce Accel=
Info
>> > > with two fields: name and enabled. enabled will be true only for
>> > > currently active accelerator.
>> >=20
>> > Please document that at most on result can have 'enabled': true.
>>=20
>> This doesn't feel right.
>>=20
>> If I understand right, the proposal is to get a result like this:
>>=20
>>     [ { 'name': 'kvm', 'enabled': true },
>>       { 'name': 'tcg', 'enabled': false },
>>       { 'name': 'xen', 'enabled': false } ]
>>=20
>> The condition that only one field can be enabled would only be in the
>> documentation instead of being enforced.
>>=20
>> Instead, consider a response like this:
>>=20
>>     { 'available': [ 'kvm', 'tcg', 'xen' ],
>>       'active': 'kvm' }
>>=20
>> This is not only shorter, but also makes sure that only one accelerator
>> can be reported as active.

Better.

Documentation only, not enforced: no duplicate array elements.  We got
that elsewhere already (arrays used as sets, basically).

If we want to provide for reporting additional information on available
accelerators, tweak it to

      {"available": [{"name": "kvm"}, {"name": "tcg"}, {"name": "xen"}],
       "active": "kvm"}

If accelerator-specific extra information is needed, the array elements
can compatibly evolve into flat unions.

Another way to skin this cat:

      {"available": {"kvm": { extra properties... },
                     "tcg": ...,
                     "xen": ...},
       "active": "kvm"}

No need for unions then.  "No dupes" is enforced.

We could inline "available":

      {"kvm": { extra properties... },
       "tcg": ...,
       "xen": ...,
       "active": "kvm"}

Future accelerators can't be named "active" then.

> I guess this can be extended with a union to report extra props for the
> accelerator, discriminated on the 'active' field eg
>
>      { 'available': [ 'kvm', 'tcg', 'xen' ],
>        'active': 'kvm',
>        'data': {
>            "allow-nested": true,
>        }
>     }

Correct.


