Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86AD361100
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:20:53 +0200 (CEST)
Received: from localhost ([::1]:53304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5fg-0005Eb-VY
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lX5IW-0005Zy-5l
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:56:57 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lX5IS-0007TY-3V
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:56:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DC5719A93EDA;
 Thu, 15 Apr 2021 18:56:40 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Apr
 2021 18:56:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00216e203dc-32f0-4629-bbea-601cda7075ad,
 6691293821731CB7DBA648D2D7B51D476DB59CA9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 15 Apr 2021 18:56:39 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of
 qdev_get_machine() for user and system
Message-ID: <20210415185639.12300368@bahia.lan>
In-Reply-To: <d21045c1-3df2-1569-3bf9-8a7ea27866f4@redhat.com>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
 <25ab34ad-0950-65f0-6cb2-d3f7a4a86744@redhat.com>
 <20210415153056.04f981a8@bahia.lan>
 <d21045c1-3df2-1569-3bf9-8a7ea27866f4@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0c03d58c-57b0-4518-b9dd-73c2937054cc
X-Ovh-Tracer-Id: 8090716732497303913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqfedtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvddvvddukeetudeifffhtdegfeejheelvdeujeehveeffeelfeejhfdtudevjeevnecuffhomhgrihhnpehmvghsohhnrdgsuhhilhgunecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheprghrmhgsrhhusehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On Thu, 15 Apr 2021 18:45:45 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 4/15/21 3:30 PM, Greg Kurz wrote:
> > On Thu, 15 Apr 2021 14:39:55 +0200
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >=20
> >> On 4/9/21 6:03 PM, Greg Kurz wrote:
> >>> Despite its simple name and common usage of "getting a pointer to
> >>> the machine" in system-mode emulation, qdev_get_machine() has some
> >>> subtilities.
> >>>
> >>> First, it can be called when running user-mode emulation : this is
> >>> because user-mode partly relies on qdev to instantiate its CPU
> >>> model.
> >>>
> >>> Second, but not least, it has a side-effect : if it cannot find an
> >>> object at "/machine" in the QOM tree, it creates a dummy "container"
> >>> object and put it there. A simple check on the type returned by
> >>> qdev_get_machine() allows user-mode to run the common qdev code,
> >>> skipping the parts that only make sense for system-mode.
> >>>
> >>> This side-effect turns out to complicate the use of qdev_get_machine()
> >>> for the system-mode case though. Most notably, qdev_get_machine() must
> >>> not be called before the machine object is added to the QOM tree by
> >>> qemu_create_machine(), otherwise the existing dummy "container" object
> >>> would cause qemu_create_machine() to fail with something like :
> >>>
> >>> Unexpected error in object_property_try_add() at ../../qom/object.c:1=
223:
> >>> qemu-system-ppc64: attempt to add duplicate property 'machine' to
> >>>  object (type 'container')
> >>> Aborted (core dumped)
> >>>
> >>> This situation doesn't exist in the current code base, mostly because
> >>> of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c15=
64
> >>> and e2fb3fbbf9c for details).
> >>>
> >>> A new kind of breakage was spotted very recently though :
> >>>
> >>> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> >>> /home/thuth/devel/qemu/include/hw/boards.h:24:
> >>>  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> >>> Aborted (core dumped)
> >>>
> >>> This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> >>> added a new condition for qdev_get_machine() to be called too early,
> >>> breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> >>> time.
> >>>
> >>> In order to avoid further subtle breakages like this, change the
> >>> implentation of qdev_get_machine() to:
> >>> - keep the existing behaviour of creating the dummy "container"
> >>>   object for the user-mode case only ;
> >>> - abort() if the machine doesn't exist yet in the QOM tree for
> >>>   the system-mode case. This gives a precise hint to developpers
> >>>   that calling qdev_get_machine() too early is a programming bug.
> >>>
> >>> This is achieved with a new do_qdev_get_machine() function called
> >>> from qdev_get_machine(), with different implementations for system
> >>> and user mode.
> >>>
> >>> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> >>> qemu-system-ppc64: ../../hw/core/machine.c:1290:
> >>>  qdev_get_machine: Assertion `machine !=3D NULL' failed.
> >>> Aborted (core dumped)
> >>>
> >>> Reported-by: Thomas Huth <thuth@redhat.com>
> >>> Signed-off-by: Greg Kurz <groug@kaod.org>
> >>> ---
> >>>  hw/core/machine.c        | 14 ++++++++++++++
> >>>  hw/core/qdev.c           |  2 +-
> >>>  include/hw/qdev-core.h   |  1 +
> >>>  stubs/meson.build        |  1 +
> >>>  stubs/qdev-get-machine.c | 11 +++++++++++
> >>>  5 files changed, 28 insertions(+), 1 deletion(-)
> >>>  create mode 100644 stubs/qdev-get-machine.c
> >> ...
> >>
> >>> diff --git a/stubs/meson.build b/stubs/meson.build
> >>> index be6f6d609e58..b99ee2b33e94 100644
> >>> --- a/stubs/meson.build
> >>> +++ b/stubs/meson.build
> >>> @@ -54,3 +54,4 @@ if have_system
> >>>  else
> >>>    stub_ss.add(files('qdev.c'))
> >>>  endif
> >>> +stub_ss.add(files('qdev-get-machine.c'))
> >>
> >> Adding this as a stub looks suspicious...
> >> Why not add it in to user_ss in hw/core/meson.build?
> >> Maybe name the new file hw/core/qdev-user.c?
> >>
> >=20
> > It turns out that this isn't specific to user-mode but rather
> > to any non-qemu-system-FOO binary built with qdev, e.g.
> > test-qdev-global-props :
> >=20
> > #0  do_qdev_get_machine () at ../../stubs/qdev-get-machine.c:10
> > #1  0x0000000100017938 in qdev_get_machine () at ../../hw/core/qdev.c:1=
134
> > #2  0x000000010001855c in device_set_realized (obj=3D0x100128b60, value=
=3D<optimized out>, errp=3D0x7fffffffd4e0) at ../../hw/core/qdev.c:745
> > #3  0x000000010001cc5c in property_set_bool (obj=3D0x100128b60, v=3D<op=
timized out>, name=3D<optimized out>, opaque=3D0x1000f33f0, errp=3D0x7fffff=
ffd4e0) at ../../qom/object.c:2257
> > #4  0x0000000100020a9c in object_property_set (obj=3D0x100128b60, name=
=3D0x100093f78 "realized", v=3D0x100136d30, errp=3D0x1000e3af8 <error_fatal=
>) at ../../qom/object.c:1402
> > #5  0x000000010001c38c in object_property_set_qobject (obj=3D0x100128b6=
0, name=3D0x100093f78 "realized", value=3D<optimized out>, errp=3D0x1000e3a=
f8 <error_fatal>) at ../../qom/qom-qobject.c:28
> > #6  0x0000000100020e20 in object_property_set_bool (obj=3D0x100128b60, =
name=3D0x100093f78 "realized", value=3D<optimized out>, errp=3D0x1000e3af8 =
<error_fatal>) at ../../qom/object.c:1472
> > #7  0x000000010001612c in qdev_realize (dev=3D0x100128b60, bus=3D<optim=
ized out>, errp=3D0x1000e3af8 <error_fatal>) at ../../hw/core/qdev.c:389
> > #8  0x000000010000fb10 in test_static_prop_subprocess () at /home/greg/=
Work/qemu/qemu-master/include/hw/qdev-core.h:17
> > #9  0x00007ffff7e95654 in g_test_run_suite_internal () from /lib64/libg=
lib-2.0.so.0
> > #10 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libg=
lib-2.0.so.0
> > #11 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libg=
lib-2.0.so.0
> > #12 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libg=
lib-2.0.so.0
> > #13 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libg=
lib-2.0.so.0
> > #14 0x00007ffff7e959cc in g_test_run_suite () from /lib64/libglib-2.0.s=
o.0
> > #15 0x00007ffff7e95a80 in g_test_run () from /lib64/libglib-2.0.so.0
> > #16 0x000000010000ecec in main (argc=3D<optimized out>, argv=3D<optimiz=
ed out>) at ../../tests/unit/test-qdev-global-props.c:316
> >=20
> > Is there a meson thingy to handle this dependency ?
>=20
>   if not have_system
>     common_ss.add(files('qdev-machine-stubs.c'))
>   endif
>=20
> This is not pretty, but better than a generic stubs/qdev-get-machine.c
> IMO...
>=20

Yeah it isn't that much different, except maybe an improvement on the
file location. Thanks for tip !

> >=20
> >> -- >8 --
> >> --- a/hw/core/meson.build
> >> +++ b/hw/core/meson.build
> >> @@ -24,6 +24,8 @@
> >>  common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
> >>  common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
> >>
> >> +user_ss.add(files('qdev-user.c'))
> >> +
> >>  softmmu_ss.add(files(
> >>    'fw-path-provider.c',
> >>    'loader.c',
> >> ---
> >>
> >> Thanks,
> >>
> >> Phil.
> >>
> >=20
>=20


