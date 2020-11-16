Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5372B4C27
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:09:42 +0100 (CET)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kei0b-0001cf-8u
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kehs9-0000q6-Er
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:00:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kehrv-0000g9-DN
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605546038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Po0Lb1cL0dWUu4MKnXXiq1I6mH8QJSBnupCTrPmQg5w=;
 b=iM3p7gvBWbVQRZkhvLEm6xyCP8zncL7MGnU7L3T1eV1nLhrEGQPatU1jnXqhc9Ed+CyvrY
 LJ+MLN5VrL1IqUTmB0RNoIXSZSZTvWP7Hz6b2QHWNbul450tRycrPWisd4r+f1bM+GNI5z
 HxwYnPv+IRQjL3daJXVCbc5vFwggqmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-j3FYjU06PhG0ztMKMY-tfg-1; Mon, 16 Nov 2020 12:00:34 -0500
X-MC-Unique: j3FYjU06PhG0ztMKMY-tfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BCBD188C13E;
 Mon, 16 Nov 2020 17:00:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 448F619C66;
 Mon, 16 Nov 2020 17:00:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F2C311358BA; Mon, 16 Nov 2020 18:00:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
Date: Mon, 16 Nov 2020 18:00:30 +0100
In-Reply-To: <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com> (Thomas Huth's
 message of "Mon, 16 Nov 2020 15:30:20 +0100")
Message-ID: <877dqldyoh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> On 16/11/2020 14.25, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Gan,
>>=20
>> On 11/15/20 7:49 PM, Gan Qixin wrote:
>>> Some peripherals of bcm2835 cprman have no category, put them into the =
'misc'
>>> category.
>>>
>>> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
>>> ---
>>> Cc: Philippe Mathieu-Daud=C3=83=C6=92=C3=82=C2=A9 <f4bug@amsat.org>
>>> ---
>>>  hw/misc/bcm2835_cprman.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
>>> index 7e415a017c..c62958a99e 100644
>>> --- a/hw/misc/bcm2835_cprman.c
>>> +++ b/hw/misc/bcm2835_cprman.c
>>> @@ -136,6 +136,7 @@ static void pll_class_init(ObjectClass *klass, void=
 *data)
>>> =20
>>>      dc->reset =3D pll_reset;
>>>      dc->vmsd =3D &pll_vmstate;
>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>=20
>> Well, this is not an usable device but a part of a bigger device,
>> so here we want the opposite: not list this device in any category.
>>=20
>> Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
>> types so management apps can filter them out? (And so we are sure
>> all QOM is classified).
>>=20
>> Thomas, you already dealt with categorizing devices in the past,
>> what do you think about this? Who else could help? Maybe add
>> someone from libvirt in the thread?
>
> My 0.02 =E2=82=AC : Mark the device as user_creatable =3D false if it can=
 not really
> be used by the user with the -device CLI parameter. Then it also does not
> need a category. I know Markus will likely have a different opinion, but =
in

You're hurting my feelings!  ;-P

> my eyes it's just ugly if we present devices to the users that they can n=
ot use.

If we believe a device should only ever be used from C, then we should
keep it away from the UI.

However, I'm wary of overloading user_creatable.  Even though it has
shifted shape a number of times (cannot_instantiate_with_device_add_yet,
no_user, and now user_creatable), its purpose has always been focused:
distinguishing devices that can be instantiated by generic code from the
ones that need device-specific code.  See user_creatable's comment in
qdev-core.h.

I don't want to lose that distinction.  That's all.

> (By the way, this device here seems to be a decendant of TYPE_SYS_BUS_DEV=
ICE
> ... shouldn't these show up as user_creatable =3D false automatically?)

Yes, unless it is a dynamic sysbus device (which I consider a flawed
concept).

But TYPE_CPRMAN_PLL is *not* a descendant of TYPE_SYS_BUS_DEVICE, it's a
bus-less device:

    static const TypeInfo cprman_pll_info =3D {
        .name =3D TYPE_CPRMAN_PLL,
--->    .parent =3D TYPE_DEVICE,
        .instance_size =3D sizeof(CprmanPllState),
        .class_init =3D pll_class_init,
        .instance_init =3D pll_init,
    };

Unless bus-less devices are somehow usable with -device, they should
have user_creatable =3D false.

qdev_device_add() looks like a bus-less device is usable if the machine
provides a hotplug handler for it.  Commit 03fcbd9dc5 "qdev: Check for
the availability of a hotplug controller before adding a device" seems
to be pertinent.

Are there any hotplug handlers for this device?  If yes, which machines
provide one?


