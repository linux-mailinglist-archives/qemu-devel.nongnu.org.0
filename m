Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E23619F5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 08:43:43 +0200 (CEST)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXICc-00087R-7d
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 02:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lXIBR-0007ge-Pg
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:42:29 -0400
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:45192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lXIBN-00044u-Lq
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:42:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id D106F25D3EE;
 Fri, 16 Apr 2021 08:42:20 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 08:42:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003dcbd630c-bb76-4d16-89bf-99d8298b6114,
 138CDC1FF09234587CE5031F2EFAB81617CD6BEF) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 16 Apr 2021 08:42:19 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of
 qdev_get_machine() for user and system
Message-ID: <20210416084219.7bd254a4@bahia.lan>
In-Reply-To: <1a68b426-47da-9fba-a34a-d024ac9ed148@redhat.com>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
 <25ab34ad-0950-65f0-6cb2-d3f7a4a86744@redhat.com>
 <20210415153056.04f981a8@bahia.lan>
 <d21045c1-3df2-1569-3bf9-8a7ea27866f4@redhat.com>
 <20210415185639.12300368@bahia.lan>
 <1a68b426-47da-9fba-a34a-d024ac9ed148@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d5cb7258-dfb1-4664-a3d6-b3e2e4f3f988
X-Ovh-Tracer-Id: 3588243005609449833
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelgedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdfgteefgeekheevgfdtgeeiuedtteevveelkeeihefggfevjeehhfetffegieefnecuffhomhgrihhnpehmvghsohhnrdgsuhhilhgunecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheprghrmhgsrhhusehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 21:07:33 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 4/15/21 6:56 PM, Greg Kurz wrote:
> > On Thu, 15 Apr 2021 18:45:45 +0200
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >=20
> >> On 4/15/21 3:30 PM, Greg Kurz wrote:
> >>> On Thu, 15 Apr 2021 14:39:55 +0200
> >>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >>>
> >>>> On 4/9/21 6:03 PM, Greg Kurz wrote:
> >>>>> Despite its simple name and common usage of "getting a pointer to
> >>>>> the machine" in system-mode emulation, qdev_get_machine() has some
> >>>>> subtilities.
> >>>>>
> >>>>> First, it can be called when running user-mode emulation : this is
> >>>>> because user-mode partly relies on qdev to instantiate its CPU
> >>>>> model.
> >>>>>
> >>>>> Second, but not least, it has a side-effect : if it cannot find an
> >>>>> object at "/machine" in the QOM tree, it creates a dummy "container"
> >>>>> object and put it there. A simple check on the type returned by
> >>>>> qdev_get_machine() allows user-mode to run the common qdev code,
> >>>>> skipping the parts that only make sense for system-mode.
> >>>>>
> >>>>> This side-effect turns out to complicate the use of qdev_get_machin=
e()
> >>>>> for the system-mode case though. Most notably, qdev_get_machine() m=
ust
> >>>>> not be called before the machine object is added to the QOM tree by
> >>>>> qemu_create_machine(), otherwise the existing dummy "container" obj=
ect
> >>>>> would cause qemu_create_machine() to fail with something like :
> >>>>>
> >>>>> Unexpected error in object_property_try_add() at ../../qom/object.c=
:1223:
> >>>>> qemu-system-ppc64: attempt to add duplicate property 'machine' to
> >>>>>  object (type 'container')
> >>>>> Aborted (core dumped)
> >>>>>
> >>>>> This situation doesn't exist in the current code base, mostly becau=
se
> >>>>> of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c=
1564
> >>>>> and e2fb3fbbf9c for details).
> >>>>>
> >>>>> A new kind of breakage was spotted very recently though :
> >>>>>
> >>>>> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> >>>>> /home/thuth/devel/qemu/include/hw/boards.h:24:
> >>>>>  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> >>>>> Aborted (core dumped)
> >>>>>
> >>>>> This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> >>>>> added a new condition for qdev_get_machine() to be called too early,
> >>>>> breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> >>>>> time.
> >>>>>
> >>>>> In order to avoid further subtle breakages like this, change the
> >>>>> implentation of qdev_get_machine() to:
> >>>>> - keep the existing behaviour of creating the dummy "container"
> >>>>>   object for the user-mode case only ;
> >>>>> - abort() if the machine doesn't exist yet in the QOM tree for
> >>>>>   the system-mode case. This gives a precise hint to developpers
> >>>>>   that calling qdev_get_machine() too early is a programming bug.
> >>>>>
> >>>>> This is achieved with a new do_qdev_get_machine() function called
> >>>>> from qdev_get_machine(), with different implementations for system
> >>>>> and user mode.
> >>>>>
> >>>>> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> >>>>> qemu-system-ppc64: ../../hw/core/machine.c:1290:
> >>>>>  qdev_get_machine: Assertion `machine !=3D NULL' failed.
> >>>>> Aborted (core dumped)
> >>>>>
> >>>>> Reported-by: Thomas Huth <thuth@redhat.com>
> >>>>> Signed-off-by: Greg Kurz <groug@kaod.org>
> >>>>> ---
> >>>>>  hw/core/machine.c        | 14 ++++++++++++++
> >>>>>  hw/core/qdev.c           |  2 +-
> >>>>>  include/hw/qdev-core.h   |  1 +
> >>>>>  stubs/meson.build        |  1 +
> >>>>>  stubs/qdev-get-machine.c | 11 +++++++++++
> >>>>>  5 files changed, 28 insertions(+), 1 deletion(-)
> >>>>>  create mode 100644 stubs/qdev-get-machine.c
> >>>> ...
> >>>>
> >>>>> diff --git a/stubs/meson.build b/stubs/meson.build
> >>>>> index be6f6d609e58..b99ee2b33e94 100644
> >>>>> --- a/stubs/meson.build
> >>>>> +++ b/stubs/meson.build
> >>>>> @@ -54,3 +54,4 @@ if have_system
> >>>>>  else
> >>>>>    stub_ss.add(files('qdev.c'))
> >>>>>  endif
> >>>>> +stub_ss.add(files('qdev-get-machine.c'))
> >>>>
> >>>> Adding this as a stub looks suspicious...
> >>>> Why not add it in to user_ss in hw/core/meson.build?
> >>>> Maybe name the new file hw/core/qdev-user.c?
> >>>>
> >>>
> >>> It turns out that this isn't specific to user-mode but rather
> >>> to any non-qemu-system-FOO binary built with qdev, e.g.
> >>> test-qdev-global-props :
> >>>
> >>> #0  do_qdev_get_machine () at ../../stubs/qdev-get-machine.c:10
> >>> #1  0x0000000100017938 in qdev_get_machine () at ../../hw/core/qdev.c=
:1134
> >>> #2  0x000000010001855c in device_set_realized (obj=3D0x100128b60, val=
ue=3D<optimized out>, errp=3D0x7fffffffd4e0) at ../../hw/core/qdev.c:745
> >>> #3  0x000000010001cc5c in property_set_bool (obj=3D0x100128b60, v=3D<=
optimized out>, name=3D<optimized out>, opaque=3D0x1000f33f0, errp=3D0x7fff=
ffffd4e0) at ../../qom/object.c:2257
> >>> #4  0x0000000100020a9c in object_property_set (obj=3D0x100128b60, nam=
e=3D0x100093f78 "realized", v=3D0x100136d30, errp=3D0x1000e3af8 <error_fata=
l>) at ../../qom/object.c:1402
> >>> #5  0x000000010001c38c in object_property_set_qobject (obj=3D0x100128=
b60, name=3D0x100093f78 "realized", value=3D<optimized out>, errp=3D0x1000e=
3af8 <error_fatal>) at ../../qom/qom-qobject.c:28
> >>> #6  0x0000000100020e20 in object_property_set_bool (obj=3D0x100128b60=
, name=3D0x100093f78 "realized", value=3D<optimized out>, errp=3D0x1000e3af=
8 <error_fatal>) at ../../qom/object.c:1472
> >>> #7  0x000000010001612c in qdev_realize (dev=3D0x100128b60, bus=3D<opt=
imized out>, errp=3D0x1000e3af8 <error_fatal>) at ../../hw/core/qdev.c:389
> >>> #8  0x000000010000fb10 in test_static_prop_subprocess () at /home/gre=
g/Work/qemu/qemu-master/include/hw/qdev-core.h:17
> >>> #9  0x00007ffff7e95654 in g_test_run_suite_internal () from /lib64/li=
bglib-2.0.so.0
> >>> #10 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/li=
bglib-2.0.so.0
> >>> #11 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/li=
bglib-2.0.so.0
> >>> #12 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/li=
bglib-2.0.so.0
> >>> #13 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/li=
bglib-2.0.so.0
> >>> #14 0x00007ffff7e959cc in g_test_run_suite () from /lib64/libglib-2.0=
.so.0
> >>> #15 0x00007ffff7e95a80 in g_test_run () from /lib64/libglib-2.0.so.0
> >>> #16 0x000000010000ecec in main (argc=3D<optimized out>, argv=3D<optim=
ized out>) at ../../tests/unit/test-qdev-global-props.c:316
> >>>
> >>> Is there a meson thingy to handle this dependency ?
> >>
> >>   if not have_system
> >>     common_ss.add(files('qdev-machine-stubs.c'))
> >>   endif
> >>
> >> This is not pretty, but better than a generic stubs/qdev-get-machine.c
> >> IMO...
> >>
> >=20
> > Yeah it isn't that much different,
>=20
> I'd expect symbols in stubs/ to be declared weak, while not with this
> approach, so we'd catch clash for incorrect configs. Maybe I'm wrong...
>=20

Ah yes, you're certainly right. I'm convinced :)

> > except maybe an improvement on the
> > file location. Thanks for tip !
>=20


