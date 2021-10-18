Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C0643246D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 19:10:00 +0200 (CEST)
Received: from localhost ([::1]:57736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcW99-00019S-0k
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 13:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mcW6z-0007aP-D4
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mcW6v-0005st-OB
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 13:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634576859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XiyTVqqMVCdIachYuL8/HzDfLq4mLCK4gLENgVj3r+E=;
 b=Y1az39Jk1gqq58XK/rll9RBqpT4L6PUV/HvgBCYeUP9621quy0/d0/A+4phgYa1df4CXDD
 g+0zHVGlELF7WQ2ffUNv7XRInz828f9jfMe+GkbuBJHWLRtZXmmWF9orlNDCNMpnXYGzUJ
 bOMEcGGek25efqI9nj8OFCDgPy/z0EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-qWZqQdsyOZKbiM27AmXjCA-1; Mon, 18 Oct 2021 13:07:36 -0400
X-MC-Unique: qWZqQdsyOZKbiM27AmXjCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E3E31006AA4;
 Mon, 18 Oct 2021 17:07:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7D1A908B;
 Mon, 18 Oct 2021 17:07:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C87811380A7; Mon, 18 Oct 2021 19:07:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: a quetion about sysbus_realize_and_unref function
References: <00ac01d7c417$d7c23580$8746a080$@etri.re.kr>
 <96f0985f-d4e8-c9d1-87a8-78cde0a16ed8@redhat.com>
Date: Mon, 18 Oct 2021 19:07:33 +0200
In-Reply-To: <96f0985f-d4e8-c9d1-87a8-78cde0a16ed8@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 18 Oct 2021 14:43:36
 +0200")
Message-ID: <87a6j66z3e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Chan Kim <ckim@etri.re.kr>,
 'qemu-discuss' <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi,
>
> On 10/18/21 14:01, Chan Kim wrote:
>> Hi, list members,
>>=20
>> I see for example in hw/arm/virt.c, when it creates a device to attach
>> to a system bus, it calls =E2=80=9Csysbus_realize_and_unref(SYS_BUS_DEVI=
CE(dev),
>> &error_fatal);=E2=80=9D function
>>=20
>> .
>>=20
>> static void create_its(VirtMachineState *vms)
>>=20
>> {
>>=20
>>     const char *itsclass =3D its_class_name();
>>=20
>>     DeviceState *dev;
>>=20
>> =20
>>=20
>>     if (!itsclass) {
>>=20
>>         /* Do nothing if not supported */
>>=20
>>         return;
>>=20
>>     }
>>=20
>> =20
>>=20
>>     dev =3D qdev_new(itsclass);
>>=20
>> =20
>>=20
>>     object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gi=
c),
>>=20
>>                              &error_abort);
>>=20
>>     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>=20
>>     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_ITS].ba=
se);
>>=20
>> =20
>>=20
>>     fdt_add_its_gic_node(vms);
>>=20
>>     vms->msi_controller =3D VIRT_MSI_CTRL_ITS;
>>=20
>> }
>>=20
>>=20
>>=20
>> The document says it decrements the reference counter and when the ref
>> count is non zero, the object can=E2=80=99t be removed.
>>=20
>> Then why does it call sysbus_realize_and_unref function to reduce the
>> ref count of the system bus(=3Dparent object) of the device being create=
?
>
> The qemu-devel@nongnu.org is better for developer questions.

Yup.

When working with reference-counted objects, each increase ("ref") must
be paired with a decrease ("unref").  When the last "ref" is "unref'ed",
the object is destroyed.

In the code you quoted, qdev_new() is a "ref", and the matching "unref"
is sysbus_realize_and_unref(), which is a trivial wrapper around
qdev_realize_and_unref().  Its documentation in include/hw/qdev-core.h
explains how it manipulates reference counts.  Please study it, then
come back if you still have questions.

> Cc'ing Markus for:
>
> commit 496a8525622d4ac5d276f76840dd30eddb73672d
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Wed Jun 10 07:32:33 2020 +0200
>
>     sysbus: New sysbus_realize(), sysbus_realize_and_unref()
>
>     Sysbus devices almost always plug into the main system bus.
>     qdev_create() even has a convenience feature to make that easy:
>     a null bus argument gets replaced by the main system bus.
>     qdev_realize() and qdev_realize_and_unref() do the same.
>
>     We can do better.  Provide convenience wrappers around
>     qdev_realize() and qdev_realize_and_unref() that don't take a
>     @bus argument.  They always pass the main system bus.

This commit merely adds convenience wrappers and puts them to use.  The
argument for "and unref" is in the commit that adds the function being
wrapped:

commit 9940b2cfbc05cdffdf6b42227a80cb1e6d2a85c2
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed Jun 10 07:31:53 2020 +0200

    qdev: New qdev_new(), qdev_realize(), etc.
   =20
    We commonly plug devices into their bus right when we create them,
    like this:
   =20
        dev =3D qdev_create(bus, type_name);
   =20
    Note that @dev is a weak reference.  The reference from @bus to @dev
    is the only strong one.
   =20
    We realize at some later time, either with
   =20
        object_property_set_bool(OBJECT(dev), true, "realized", errp);
   =20
    or its convenience wrapper
   =20
        qdev_init_nofail(dev);
   =20
    If @dev still has no QOM parent then, realizing makes the
    /machine/unattached/ orphanage its QOM parent.
   =20
    Note that the device returned by qdev_create() is plugged into a bus,
    but doesn't have a QOM parent, yet.  Until it acquires one,
    unrealizing the bus will hang in bus_unparent():
   =20
        while ((kid =3D QTAILQ_FIRST(&bus->children)) !=3D NULL) {
            DeviceState *dev =3D kid->child;
            object_unparent(OBJECT(dev));
        }
   =20
    object_unparent() does nothing when its argument has no QOM parent,
    and the loop spins forever.
   =20
    Device state "no QOM parent, but plugged into bus" is dangerous.
   =20
    Paolo suggested to delay plugging into the bus until realize.  We need
    to plug into the parent bus before we call the device's realize
    method, in case it uses the parent bus.  So the dangerous state still
    exists, but only within realization, where we can manage it safely.
   =20
    This commit creates infrastructure to do this:
   =20
        dev =3D qdev_new(type_name);
        ...
        qdev_realize_and_unref(dev, bus, errp)
   =20
    Note that @dev becomes a strong reference here.
    qdev_realize_and_unref() drops it.  There is also plain
    qdev_realize(), which doesn't drop it.
   =20
    The remainder of this series will convert all users to this new
    interface.


