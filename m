Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C3E360A88
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:32:31 +0200 (CEST)
Received: from localhost ([::1]:48174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX26f-0000mu-VP
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lX25K-0000GD-AA
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:31:06 -0400
Received: from 1.mo51.mail-out.ovh.net ([178.32.121.110]:58585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lX25F-0001HV-Vo
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:31:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 2482827F573;
 Thu, 15 Apr 2021 15:30:57 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Apr
 2021 15:30:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005320f6244-80e1-4f33-b222-7a43a7fbf473,
 6691293821731CB7DBA648D2D7B51D476DB59CA9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 15 Apr 2021 15:30:56 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of
 qdev_get_machine() for user and system
Message-ID: <20210415153056.04f981a8@bahia.lan>
In-Reply-To: <25ab34ad-0950-65f0-6cb2-d3f7a4a86744@redhat.com>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
 <25ab34ad-0950-65f0-6cb2-d3f7a4a86744@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 11704b40-c6f3-4e6f-9308-0efc9cace2c6
X-Ovh-Tracer-Id: 4616471094586874217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvgfetfeegkeehvefgtdegieeutdetveevleekieehgffgveejhefhteffgeeifeenucffohhmrghinhepmhgvshhonhdrsghuihhlugenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=groug@kaod.org;
 helo=1.mo51.mail-out.ovh.net
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
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 14:39:55 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 4/9/21 6:03 PM, Greg Kurz wrote:
> > Despite its simple name and common usage of "getting a pointer to
> > the machine" in system-mode emulation, qdev_get_machine() has some
> > subtilities.
> >=20
> > First, it can be called when running user-mode emulation : this is
> > because user-mode partly relies on qdev to instantiate its CPU
> > model.
> >=20
> > Second, but not least, it has a side-effect : if it cannot find an
> > object at "/machine" in the QOM tree, it creates a dummy "container"
> > object and put it there. A simple check on the type returned by
> > qdev_get_machine() allows user-mode to run the common qdev code,
> > skipping the parts that only make sense for system-mode.
> >=20
> > This side-effect turns out to complicate the use of qdev_get_machine()
> > for the system-mode case though. Most notably, qdev_get_machine() must
> > not be called before the machine object is added to the QOM tree by
> > qemu_create_machine(), otherwise the existing dummy "container" object
> > would cause qemu_create_machine() to fail with something like :
> >=20
> > Unexpected error in object_property_try_add() at ../../qom/object.c:122=
3:
> > qemu-system-ppc64: attempt to add duplicate property 'machine' to
> >  object (type 'container')
> > Aborted (core dumped)
> >=20
> > This situation doesn't exist in the current code base, mostly because
> > of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
> > and e2fb3fbbf9c for details).
> >=20
> > A new kind of breakage was spotted very recently though :
> >=20
> > $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> > /home/thuth/devel/qemu/include/hw/boards.h:24:
> >  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> > Aborted (core dumped)
> >=20
> > This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> > added a new condition for qdev_get_machine() to be called too early,
> > breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> > time.
> >=20
> > In order to avoid further subtle breakages like this, change the
> > implentation of qdev_get_machine() to:
> > - keep the existing behaviour of creating the dummy "container"
> >   object for the user-mode case only ;
> > - abort() if the machine doesn't exist yet in the QOM tree for
> >   the system-mode case. This gives a precise hint to developpers
> >   that calling qdev_get_machine() too early is a programming bug.
> >=20
> > This is achieved with a new do_qdev_get_machine() function called
> > from qdev_get_machine(), with different implementations for system
> > and user mode.
> >=20
> > $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> > qemu-system-ppc64: ../../hw/core/machine.c:1290:
> >  qdev_get_machine: Assertion `machine !=3D NULL' failed.
> > Aborted (core dumped)
> >=20
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/core/machine.c        | 14 ++++++++++++++
> >  hw/core/qdev.c           |  2 +-
> >  include/hw/qdev-core.h   |  1 +
> >  stubs/meson.build        |  1 +
> >  stubs/qdev-get-machine.c | 11 +++++++++++
> >  5 files changed, 28 insertions(+), 1 deletion(-)
> >  create mode 100644 stubs/qdev-get-machine.c
> ...
>=20
> > diff --git a/stubs/meson.build b/stubs/meson.build
> > index be6f6d609e58..b99ee2b33e94 100644
> > --- a/stubs/meson.build
> > +++ b/stubs/meson.build
> > @@ -54,3 +54,4 @@ if have_system
> >  else
> >    stub_ss.add(files('qdev.c'))
> >  endif
> > +stub_ss.add(files('qdev-get-machine.c'))
>=20
> Adding this as a stub looks suspicious...
> Why not add it in to user_ss in hw/core/meson.build?
> Maybe name the new file hw/core/qdev-user.c?
>=20

It turns out that this isn't specific to user-mode but rather
to any non-qemu-system-FOO binary built with qdev, e.g.
test-qdev-global-props :

#0  do_qdev_get_machine () at ../../stubs/qdev-get-machine.c:10
#1  0x0000000100017938 in qdev_get_machine () at ../../hw/core/qdev.c:1134
#2  0x000000010001855c in device_set_realized (obj=3D0x100128b60, value=3D<=
optimized out>, errp=3D0x7fffffffd4e0) at ../../hw/core/qdev.c:745
#3  0x000000010001cc5c in property_set_bool (obj=3D0x100128b60, v=3D<optimi=
zed out>, name=3D<optimized out>, opaque=3D0x1000f33f0, errp=3D0x7fffffffd4=
e0) at ../../qom/object.c:2257
#4  0x0000000100020a9c in object_property_set (obj=3D0x100128b60, name=3D0x=
100093f78 "realized", v=3D0x100136d30, errp=3D0x1000e3af8 <error_fatal>) at=
 ../../qom/object.c:1402
#5  0x000000010001c38c in object_property_set_qobject (obj=3D0x100128b60, n=
ame=3D0x100093f78 "realized", value=3D<optimized out>, errp=3D0x1000e3af8 <=
error_fatal>) at ../../qom/qom-qobject.c:28
#6  0x0000000100020e20 in object_property_set_bool (obj=3D0x100128b60, name=
=3D0x100093f78 "realized", value=3D<optimized out>, errp=3D0x1000e3af8 <err=
or_fatal>) at ../../qom/object.c:1472
#7  0x000000010001612c in qdev_realize (dev=3D0x100128b60, bus=3D<optimized=
 out>, errp=3D0x1000e3af8 <error_fatal>) at ../../hw/core/qdev.c:389
#8  0x000000010000fb10 in test_static_prop_subprocess () at /home/greg/Work=
/qemu/qemu-master/include/hw/qdev-core.h:17
#9  0x00007ffff7e95654 in g_test_run_suite_internal () from /lib64/libglib-=
2.0.so.0
#10 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-=
2.0.so.0
#11 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-=
2.0.so.0
#12 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-=
2.0.so.0
#13 0x00007ffff7e954b8 in g_test_run_suite_internal () from /lib64/libglib-=
2.0.so.0
#14 0x00007ffff7e959cc in g_test_run_suite () from /lib64/libglib-2.0.so.0
#15 0x00007ffff7e95a80 in g_test_run () from /lib64/libglib-2.0.so.0
#16 0x000000010000ecec in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>) at ../../tests/unit/test-qdev-global-props.c:316

Is there a meson thingy to handle this dependency ?

> -- >8 --
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -24,6 +24,8 @@
>  common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
>  common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
>=20
> +user_ss.add(files('qdev-user.c'))
> +
>  softmmu_ss.add(files(
>    'fw-path-provider.c',
>    'loader.c',
> ---
>=20
> Thanks,
>=20
> Phil.
>=20


