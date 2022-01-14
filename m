Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49B48EDC9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 17:14:22 +0100 (CET)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8PDa-0004cp-0b
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 11:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8Ovb-0005lt-UG
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:55:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8OvU-00035q-As
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642175738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V1l7Hp0V0RPtTfP5RMIIYmWkvblu4Kc/sVKrPAZrw/c=;
 b=en2LYwd/NofGjUvxtdiEATxF2fNKabJTwICtk4Yc+TAcdyOpaqfVgEQYMdKIKeyhJuIMsZ
 NlVyVMI5NFWHBuWfEwj1c1KnNNwLfYMzPKmk48+WNkRPzaTxGBIquWdTuWB71Hy67KL0bs
 Z/0JUAfxeUNVOmdq/Pveuqv/RO2JYrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-T9JpatPsM4K3AxS6PTi0sw-1; Fri, 14 Jan 2022 10:55:35 -0500
X-MC-Unique: T9JpatPsM4K3AxS6PTi0sw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022341015DA1;
 Fri, 14 Jan 2022 15:55:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A894C7EBDE;
 Fri, 14 Jan 2022 15:55:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 12D7811380A2; Fri, 14 Jan 2022 16:55:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 4/6] migration: Add ram-only capability
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
 <87v8ym36l6.fsf@dusky.pond.sub.org> <YeFgwNZ497nhNRF7@redhat.com>
Date: Fri, 14 Jan 2022 16:55:11 +0100
In-Reply-To: <YeFgwNZ497nhNRF7@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 14 Jan 2022 11:38:40 +0000")
Message-ID: <87sftqz50g.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Nikita Lapshin <nikita.lapshin@virtuozzo.com>,
 crosa@redhat.com, hreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Jan 14, 2022 at 12:22:13PM +0100, Markus Armbruster wrote:
>> Nikita Lapshin <nikita.lapshin@virtuozzo.com> writes:
>>=20
>> > If this capability is enabled migration stream
>> > will have RAM section only.
>> >
>> > Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
>>=20
>> [...]
>>=20
>> > diff --git a/qapi/migration.json b/qapi/migration.json
>> > index d53956852c..626fc59d14 100644
>> > --- a/qapi/migration.json
>> > +++ b/qapi/migration.json
>> > @@ -454,6 +454,8 @@
>> >  #
>> >  # @no-ram: If enabled, migration stream won't contain any ram in it. =
(since 7.0)
>> >  #
>> > +# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
>> > +#
>>=20
>> What happens when I ask for 'no-ram': true, 'ram-only': true?
>
> So IIUC
>
>   no-ram=3Dfalse, ram-only=3Dfalse =3D>  RAM + vmstate
>   no-ram=3Dtrue, ram-only=3Dfalse =3D> vmstate
>   no-ram=3Dfalse, ram-only=3Dtrue =3D>  RAM
>   no-ram=3Dtrue, ram-only=3Dtrue =3D> nothing to send ?
>
> I find that the fact that one flag is a negative request and
> the other flag is a positive request to be confusing.

Me too.

> If we must have two flags then could we at least use the same
> style for both. ie either
>
>   @no-ram
>   @no-vmstate
>
> Or
>
>   @ram-only
>   @vmstate-only

I strongly prefer "positive" names for booleans, avoiding double
negation.

> Since the code enforces these flags are mutually exclusive
> though, it might point towards being handled by a enum
>
>   { 'enum': 'MigrationStreamContent',
>     'data': ['both', 'ram', 'vmstate'] }

Enumerating the combinations that are actually valid is often nicer than
a set of flags that look independent, but aren't.

MigrationCapability can only do flags.  For an enum, we'd have to use
MigrationParameters & friends.  For an example, check out
@multifd-compression there.

> none of these approaches are especially future proof if we ever
> need fine grained control over sending a sub-set of the non-RAM
> vmstate. Not sure if that matters in the end.
>
>
> Regards,
> Daniel


