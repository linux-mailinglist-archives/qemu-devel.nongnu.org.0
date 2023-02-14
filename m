Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A982D696921
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:18:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRy0j-0008DE-O2; Tue, 14 Feb 2023 11:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRy0h-0008D6-FJ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:18:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRy0f-0006SU-0c
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676391503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+KU6/3fDrXbDa2aRAxRhBVyJ0STEQa8nG2TICI4u0us=;
 b=JsoIApCBFNh7T7FIiYDBwFAGFeED71RKxJu6eA7XQalO81L4cUW6O7NNKwzjBX5vvzZgIa
 CUtElXzWtuMcPj07yN6QnYIuK9KkaK8+kBDyQ1yEEcS3rrhux7np89gedk2G8eIKZAvEUw
 DxB1J3OsYv8VEbq+p/5YTDedbAT7yaM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-qTrQJLaHMxu42dlzwHynoA-1; Tue, 14 Feb 2023 11:18:21 -0500
X-MC-Unique: qTrQJLaHMxu42dlzwHynoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62F3F29AB3E8;
 Tue, 14 Feb 2023 16:18:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDF8A1121319;
 Tue, 14 Feb 2023 16:18:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA40D21E6A1F; Tue, 14 Feb 2023 17:18:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  Peter Krempa <pkrempa@redhat.com>,
 eduardo@habkost.net,  antonkuchin@yandex-team.ru,  mst@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  den-plotnikov@yandex-team.ru,
 marcel.apfelbaum@gmail.com,  pbonzini@redhat.com,  eblake@redhat.com
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+tTgpoz/o0nDu9r@angien.pipo.sk> <Y+ttBkTvDv1T7qi1@redhat.com>
 <87ttzojwl7.fsf@pond.sub.org>
 <73444fb8-49a7-fc2f-091e-6f65e916fa58@linaro.org>
 <87o7pwigqn.fsf@pond.sub.org>
 <9509eb04-16a3-9b29-f676-940f5d51d263@linaro.org>
Date: Tue, 14 Feb 2023 17:18:18 +0100
In-Reply-To: <9509eb04-16a3-9b29-f676-940f5d51d263@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 14 Feb 2023 14:56:00
 +0100")
Message-ID: <875yc4gr05.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 14/2/23 13:17, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 14/2/23 12:49, Markus Armbruster wrote:
>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> [...]
>>=20
>>>>> What's the documented way to construct a QOM path, given only an ID  =
as
>>>>> input ?
>>>>
>>>> QOM paths a gap in our documentation, even though the composition tree
>>>> structure has been stable since day one, and is de facto ABI.
>>>>
>>>> Short answer: "/machine/peripheral/ID".
>>>>
>>>> Long answer follows.
>>>>
>>>> We have three "containers" under /machine that serve as parents for
>>>> devices:
>>>>
>>>> * /machine/peripheral/
>>>>
>>>>    Parent of user-created devices with ID.  Children are named "ID".
>>>>
>>>>    Put there by qdev_set_id(), called from qdev_device_add_from_qdict(=
).
>>>>
>>>>    On "user-created": Nothing stops board code to abuse qdev_set_id() =
for
>>>>    onboard devices, directly or indirectly, but it really, really
>>>>    shouldn't.
>>>>
>>>> * /machine/peripheral-anon/
>>>>
>>>>    Parent of user-created devices without ID.  Children are named
>>>>    "device[N]", where N counts up from zero.
>>>>
>>>>    Put there by qdev_set_id(), called from qdev_device_add_from_qdict(=
).
>>>>
>>>>    Again, abuse by board code is possible, but would be wrong.
>>>>
>>>>    Beware: a particular device's N changes when the set of devices
>>>>    created before it grows or shrinks.  Messing with the machine type =
can
>>>>    change it (different onboard devices).
>>>>
>>>> * /machine/unattached/
>>>>
>>>>    Surrogate parent of onboard devices created without a parent.
>>>>
>>>>    Put there by device_set_realized() (general case),
>>>>    qdev_connect_gpio_out_named() (input pins) , memory_region_do_init()
>>>>    (memory regions), qemu_create_machine() (the main sysbus).
>>>>
>>>>    I believe this container was created as a convenience, so we don't
>>>>    have to retrofit parents to existing code.  Probably abused ever
>>>>    since.
>>>
>>> Are you suggesting this is a stable interface and we can not move
>>> devices (like from /machine/unattached/ to /machine/peripheral/)
>>> without going thru the deprecation process?
>>=20
>> Difficult question!
>>=20
>> The point of not changing interfaces incompatibly without a grace period
>> / deprecation process is not breaking users of the interface.
>>=20
>> When an interface has always worked a certain way, its users may well
>> depend on it, whether it's documented or not.
>>=20
>> The question to ask is always "will this break users?"
>>=20
>> For documented aspects, we generally assume it will.  Doesn't mean we
>> can simply assume "won't" for undocumented aspects.
>>=20
>> Does this make sense?
>
> Yes, but I never considered the QOM paths as a stable interface...
> I'm very surprised.

I think it's a gray area.

For a good part of the QMP interface, we make an effort to review and
document, and to spell out what is stable and what isn't.  Sadly, QOM
and qdev are exceptions.

Properties are an essential part of the QMP interface, yet they are
virtually undocumented: closest we have is output of "-device
TYPENAME,help", which is utterly inadequate.  There is no systematic
review.  We've never been quite clear on which properties are part of
the stable interface.

QOM paths are a much less prominent part of the QMP interface, but they
are a part.  The structure of the QOM composition tree is undocumented.
Are they part of the stable interface?  Anybody's guess.  I figure they
weren't intended to be stable interace.  But then a QOM path is the only
way to device_del a device without ID.  Gray area.

Moreover, Hyrum's law[*] can catch up with us any time.

> "Automatically assigned to /machine/unattached/" doesn't seem
> quite stable...

The practical difficulties in (ab)using these push them towards the
unstable end of the gray area.


[*] "With a sufficient number of users of an API, it does not matter
what you promise in the contract: all observable behaviors of your
system will be depended on by somebody."


