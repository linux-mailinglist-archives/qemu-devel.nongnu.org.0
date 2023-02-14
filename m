Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743B6962AE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:50:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtoU-0004PZ-9H; Tue, 14 Feb 2023 06:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRtoS-0004PG-4p
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:49:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRtoQ-00059o-Gf
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676375369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4v9ZEE3vGAgeUjZ2N7LBHb7aitT7QGLD7n8ZNeVjHs=;
 b=hC14dh/w3ItQ2YpLyIGBuqA+p6emNGaa26P/C2RU5JtkX1/smrG11XLzlQ1ZsJJiOD1yA/
 ytxTk86bNFAI6bPeVAzf3ri9rfhEu0uHKbBUAtyNIIEQQV0D/sY4K16KkO5WbzM/9125b+
 xRI7DfSxPrDmBDs468aFKAl8xPiGLxc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-2rBl5wDuNFuz6QNdakKJlw-1; Tue, 14 Feb 2023 06:49:26 -0500
X-MC-Unique: 2rBl5wDuNFuz6QNdakKJlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12F04101A55E;
 Tue, 14 Feb 2023 11:49:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD24718EC7;
 Tue, 14 Feb 2023 11:49:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB9F121E6A1F; Tue, 14 Feb 2023 12:49:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>,  eduardo@habkost.net,
 antonkuchin@yandex-team.ru,  philmd@linaro.org,  mst@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  den-plotnikov@yandex-team.ru,
 marcel.apfelbaum@gmail.com,  pbonzini@redhat.com,  eblake@redhat.com
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+tTgpoz/o0nDu9r@angien.pipo.sk> <Y+ttBkTvDv1T7qi1@redhat.com>
Date: Tue, 14 Feb 2023 12:49:24 +0100
In-Reply-To: <Y+ttBkTvDv1T7qi1@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 14 Feb 2023 11:14:14 +0000")
Message-ID: <87ttzojwl7.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 14, 2023 at 10:25:22AM +0100, Peter Krempa wrote:
>> On Tue, Feb 14, 2023 at 09:54:22 +0100, Markus Armbruster wrote:
>> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >=20
>> > > On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievsk=
iy wrote:
>> > >> The device field is redundant, because QOM path always include devi=
ce
>> > >> ID when this ID exist.
>> > >
>> > > The flipside to that view is that applications configuring QEMU are
>> > > specifying the device ID for -device (CLI) / device_add (QMP) and
>> > > not the QOM path. IOW, the device ID is the more interesting field
>> > > than QOM path, so feels like the wrong one to be dropping.
>> >=20
>> > QOM path is a reliable way to identify a device.  Device ID isn't:
>> > devices need not have one.  Therefore, dropping the QOM path would be
>> > wrong.
>> >=20
>> > > Is there any real benefit to dropping this ?=20
>> >=20
>> > The device ID is a trap for the unwary: relying on it is fine until you
>> > run into a scenario where you have to deal with devices lacking IDs.
>>=20
>> Note that libvirt's code is still using the 'device' bit rather than QOM
>> path and the fix might not be entirely trivial although should not be
>> too hard.
>
> What's the documented way to construct a QOM path, given only an ID  as
> input ?

QOM paths a gap in our documentation, even though the composition tree
structure has been stable since day one, and is de facto ABI.

Short answer: "/machine/peripheral/ID".

Long answer follows.

We have three "containers" under /machine that serve as parents for
devices:

* /machine/peripheral/

  Parent of user-created devices with ID.  Children are named "ID".

  Put there by qdev_set_id(), called from qdev_device_add_from_qdict().

  On "user-created": Nothing stops board code to abuse qdev_set_id() for
  onboard devices, directly or indirectly, but it really, really
  shouldn't.

* /machine/peripheral-anon/

  Parent of user-created devices without ID.  Children are named
  "device[N]", where N counts up from zero.

  Put there by qdev_set_id(), called from qdev_device_add_from_qdict().

  Again, abuse by board code is possible, but would be wrong.

  Beware: a particular device's N changes when the set of devices
  created before it grows or shrinks.  Messing with the machine type can
  change it (different onboard devices).

* /machine/unattached/

  Surrogate parent of onboard devices created without a parent.

  Put there by device_set_realized() (general case),
  qdev_connect_gpio_out_named() (input pins) , memory_region_do_init()
  (memory regions), qemu_create_machine() (the main sysbus).

  I believe this container was created as a convenience, so we don't
  have to retrofit parents to existing code.  Probably abused ever
  since.


