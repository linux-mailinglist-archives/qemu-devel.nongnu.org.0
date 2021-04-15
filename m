Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685223607CA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:54:06 +0200 (CEST)
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzdN-0003nq-Hp
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lWzcb-0003Nx-GH
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:53:17 -0400
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:44204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lWzcY-0000Az-Ac
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:53:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id DC43625C297;
 Thu, 15 Apr 2021 12:53:10 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Apr
 2021 12:53:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00668e12278-cf22-41a5-8330-743ca767d35a,
 6691293821731CB7DBA648D2D7B51D476DB59CA9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 15 Apr 2021 12:53:08 +0200
From: Greg Kurz <groug@kaod.org>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of
 qdev_get_machine() for user and system
Message-ID: <20210415125308.37b965f9@bahia.lan>
In-Reply-To: <20210413222542.dstz26tgoyaltt44@habkost.net>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
 <20210413222542.dstz26tgoyaltt44@habkost.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 92996159-4a9a-4d51-8dd7-bf999cea5adf
X-Ovh-Tracer-Id: 1951747490327599398
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgfeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 18:25:42 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Fri, Apr 09, 2021 at 06:03:38PM +0200, Greg Kurz wrote:
> > Despite its simple name and common usage of "getting a pointer to
> > the machine" in system-mode emulation, qdev_get_machine() has some
> > subtilities.
> > 
> > First, it can be called when running user-mode emulation : this is
> > because user-mode partly relies on qdev to instantiate its CPU
> > model.
> 
> Do we know exactly which user mode emulation code needs to call
> qdev_get_machine(), and why?
> 

User mode emulation uses qdev for the CPU model, thus indirectly calling
qdev_get_machine() in several paths during startup:

#0  qdev_get_machine () at ../../hw/core/qdev.c:1133
#1  0x0000000100209ddc in device_set_realized (obj=0x100485040, value=<optimized out>, errp=0x7fffffffd640) at ../../hw/core/qdev.c:745
#2  0x00000001001faa1c in property_set_bool (obj=0x100485040, v=<optimized out>, name=<optimized out>, opaque=0x100424410, errp=0x7fffffffd640) at ../../qom/object.c:2257
#3  0x00000001001fe85c in object_property_set (obj=0x100485040, name=0x1002be788 "realized", v=0x10049a430, errp=0x7fffffffd750) at ../../qom/object.c:1402
#4  0x00000001001f9f6c in object_property_set_qobject (obj=0x100485040, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffd750) at ../../qom/qom-qobject.c:28
#5  0x00000001001febe0 in object_property_set_bool (obj=0x100485040, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffd750) at ../../qom/object.c:1472
#6  0x00000001002079ac in qdev_realize (dev=0x100485040, bus=<optimized out>, errp=0x7fffffffd750) at ../../hw/core/qdev.c:389
#7  0x0000000100076db8 in cpu_create (typename=<optimized out>) at /home/greg/Work/qemu/qemu-master/include/hw/qdev-core.h:17
#8  0x0000000100072a04 in main (argc=<optimized out>, argv=0x7fffffffe318, envp=<optimized out>) at ../../linux-user/main.c:736


#0  qdev_get_machine () at ../../hw/core/qdev.c:1133
#1  0x0000000100209220 in qdev_get_machine_hotplug_handler (dev=<optimized out>) at ../../hw/core/qdev.c:241
#2  0x0000000100209340 in qdev_get_hotplug_handler (dev=<optimized out>) at ../../hw/core/qdev.c:281
#3  0x0000000100209a1c in device_set_realized (obj=0x100485040, value=<optimized out>, errp=0x7fffffffd640) at ../../hw/core/qdev.c:752
#4  0x00000001001faa1c in property_set_bool (obj=0x100485040, v=<optimized out>, name=<optimized out>, opaque=0x100424410, errp=0x7fffffffd640) at ../../qom/object.c:2257
#5  0x00000001001fe85c in object_property_set (obj=0x100485040, name=0x1002be788 "realized", v=0x10049a430, errp=0x7fffffffd750) at ../../qom/object.c:1402
#6  0x00000001001f9f6c in object_property_set_qobject (obj=0x100485040, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffd750) at ../../qom/qom-qobject.c:28
#7  0x00000001001febe0 in object_property_set_bool (obj=0x100485040, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffd750) at ../../qom/object.c:1472
#8  0x00000001002079ac in qdev_realize (dev=0x100485040, bus=<optimized out>, errp=0x7fffffffd750) at ../../hw/core/qdev.c:389
#9  0x0000000100076db8 in cpu_create (typename=<optimized out>) at /home/greg/Work/qemu/qemu-master/include/hw/qdev-core.h:17
#10 0x0000000100072a04 in main (argc=<optimized out>, argv=0x7fffffffe318, envp=<optimized out>) at ../../linux-user/main.c:736


#0  qdev_get_machine () at ../../hw/core/qdev.c:1133
#1  0x0000000100076700 in cpu_common_realizefn (dev=<optimized out>, errp=<optimized out>) at ../../hw/core/cpu.c:311
#2  0x00000001000c7a2c in ppc_cpu_realize (dev=0x100485040, errp=0x7fffffffd530) at ../../target/ppc/translate_init.c.inc:10199
#3  0x0000000100209ae0 in device_set_realized (obj=0x100485040, value=<optimized out>, errp=0x7fffffffd640) at ../../hw/core/qdev.c:761
#4  0x00000001001faa1c in property_set_bool (obj=0x100485040, v=<optimized out>, name=<optimized out>, opaque=0x100424410, errp=0x7fffffffd640) at ../../qom/object.c:2257
#5  0x00000001001fe85c in object_property_set (obj=0x100485040, name=0x1002be788 "realized", v=0x10049a430, errp=0x7fffffffd750) at ../../qom/object.c:1402
#6  0x00000001001f9f6c in object_property_set_qobject (obj=0x100485040, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffd750) at ../../qom/qom-qobject.c:28
#7  0x00000001001febe0 in object_property_set_bool (obj=0x100485040, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffd750) at ../../qom/object.c:1472
#8  0x00000001002079ac in qdev_realize (dev=0x100485040, bus=<optimized out>, errp=0x7fffffffd750) at ../../hw/core/qdev.c:389
#9  0x0000000100076db8 in cpu_create (typename=<optimized out>) at /home/greg/Work/qemu/qemu-master/include/hw/qdev-core.h:17
#10 0x0000000100072a04 in main (argc=<optimized out>, argv=0x7fffffffe318, envp=<optimized out>) at ../../linux-user/main.c:736

All these paths are also followed when the target spawns a new thread:

#0  qdev_get_machine () at ../../hw/core/qdev.c:1133
#1  0x0000000100209ddc in device_set_realized (obj=0x10051e3f0, value=<optimized out>, errp=0x7fffffffbc40) at ../../hw/core/qdev.c:745
#2  0x00000001001faa1c in property_set_bool (obj=0x10051e3f0, v=<optimized out>, name=<optimized out>, opaque=0x100424410, errp=0x7fffffffbc40) at ../../qom/object.c:2257
#3  0x00000001001fe85c in object_property_set (obj=0x10051e3f0, name=0x1002be788 "realized", v=0x1005317e0, errp=0x7fffffffbd50) at ../../qom/object.c:1402
#4  0x00000001001f9f6c in object_property_set_qobject (obj=0x10051e3f0, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffbd50) at ../../qom/qom-qobject.c:28
#5  0x00000001001febe0 in object_property_set_bool (obj=0x10051e3f0, name=0x1002be788 "realized", value=<optimized out>, errp=0x7fffffffbd50) at ../../qom/object.c:1472
#6  0x00000001002079ac in qdev_realize (dev=0x10051e3f0, bus=<optimized out>, errp=0x7fffffffbd50) at ../../hw/core/qdev.c:389
#7  0x0000000100076db8 in cpu_create (typename=<optimized out>) at /home/greg/Work/qemu/qemu-master/include/hw/qdev-core.h:17
#8  0x00000001001b57a4 in cpu_copy (env=0x10048d4f0) at ../../linux-user/main.c:206
#9  0x000000010018e844 in do_fork (env=0x10048d4f0, flags=flags@entry=4001536, newsp=newsp@entry=274897824272, parent_tidptr=parent_tidptr@entry=274897826368, newtls=newtls@entry=274897856736, 
    child_tidptr=child_tidptr@entry=274897826368) at ../../linux-user/syscall.c:6500
#10 0x000000010019e7e0 in do_syscall1 (cpu_env=cpu_env@entry=0x10048d4f0, num=num@entry=120, arg1=arg1@entry=4001536, arg2=arg2@entry=274897824272, arg3=arg3@entry=274897826368, arg4=arg4@entry=274897856736, 
    arg5=arg5@entry=274897826368, arg6=arg6@entry=274897856736, arg8=<optimized out>, arg7=<optimized out>) at ../../linux-user/syscall.c:10267
#11 0x00000001001a6374 in do_syscall (cpu_env=0x10048d4f0, num=<optimized out>, arg1=4001536, arg2=274897824272, arg3=274897826368, arg4=274897856736, arg5=274897826368, arg6=274897856736, arg7=0, arg8=0)
    at ../../linux-user/syscall.c:13302
#12 0x0000000100079bd8 in cpu_loop (env=0x10048d4f0) at ../../linux-user/ppc/cpu_loop.c:440
#13 0x0000000100072cdc in main (argc=<optimized out>, argv=0x7fffffffe2f8, envp=<optimized out>) at ../../linux-user/main.c:889


> If there's no real MachineState object in user mode, what the
> return value of qdev_get_machine() is used for?
> 

It is used to rule out paths that are meaningless for user-mode, 
in qdev_get_machine_hotplug_handler() :

    Object *m_obj = qdev_get_machine();

    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {

and in cpu_common_realizefn() :

    Object *machine = qdev_get_machine();

    /* qdev_get_machine() can return something that's not TYPE_MACHINE
     * if this is one of the user-only emulators; in that case there's
     * no need to check the ignore_memory_transaction_failures board flag.
     */
    if (object_dynamic_cast(machine, TYPE_MACHINE)) {

Then comes device_set_realized() :

        if (!obj->parent) {
            gchar *name = g_strdup_printf("device[%d]", unattached_count++);

            object_property_add_child(container_get(qdev_get_machine(),
                                                    "/unattached"),
                                      name, obj);
            unattached_parent = true;
            g_free(name);
        }

This perfectly makes sense for system-mode again, but I can't tell
what it buys for user-mode...

> > 
> > Second, but not least, it has a side-effect : if it cannot find an
> > object at "/machine" in the QOM tree, it creates a dummy "container"
> > object and put it there. A simple check on the type returned by
> > qdev_get_machine() allows user-mode to run the common qdev code,
> > skipping the parts that only make sense for system-mode.
> > 
> > This side-effect turns out to complicate the use of qdev_get_machine()
> > for the system-mode case though. Most notably, qdev_get_machine() must
> > not be called before the machine object is added to the QOM tree by
> > qemu_create_machine(), otherwise the existing dummy "container" object
> > would cause qemu_create_machine() to fail with something like :
> > 
> > Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
> > qemu-system-ppc64: attempt to add duplicate property 'machine' to
> >  object (type 'container')
> > Aborted (core dumped)
> > 
> > This situation doesn't exist in the current code base, mostly because
> > of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
> > and e2fb3fbbf9c for details).
> > 
> > A new kind of breakage was spotted very recently though :
> > 
> > $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> > /home/thuth/devel/qemu/include/hw/boards.h:24:
> >  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> > Aborted (core dumped)
> > 
> > This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> > added a new condition for qdev_get_machine() to be called too early,
> > breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> > time.
> > 
> > In order to avoid further subtle breakages like this, change the
> > implentation of qdev_get_machine() to:
> > - keep the existing behaviour of creating the dummy "container"
> >   object for the user-mode case only ;
> > - abort() if the machine doesn't exist yet in the QOM tree for
> >   the system-mode case. This gives a precise hint to developpers
> >   that calling qdev_get_machine() too early is a programming bug.
> > 
> > This is achieved with a new do_qdev_get_machine() function called
> > from qdev_get_machine(), with different implementations for system
> > and user mode.
> > 
> > $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> > qemu-system-ppc64: ../../hw/core/machine.c:1290:
> >  qdev_get_machine: Assertion `machine != NULL' failed.
> > Aborted (core dumped)
> > 
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
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 40def78183a7..fecca4023105 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1293,6 +1293,20 @@ void qdev_machine_creation_done(void)
> >      register_global_state();
> >  }
> >  
> > +Object *do_qdev_get_machine(void)
> > +{
> > +    Object *machine;
> > +
> > +    machine = object_resolve_path_component(object_get_root(), "machine");
> 
> What about just replacing this expression with `current_machine`?
> 

Yes, this is an option.

> > +    /*
> > +     * qdev_get_machine() shouldn't be called before qemu_create_machine()
> > +     * has created the "/machine" path.
> > +     */
> > +    assert(machine != NULL);
> > +
> > +    return machine;
> 
> > +}
> > +
> >  static const TypeInfo machine_info = {
> >      .name = TYPE_MACHINE,
> >      .parent = TYPE_OBJECT,
> > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > index cefc5eaa0a92..1122721b2bf0 100644
> > --- a/hw/core/qdev.c
> > +++ b/hw/core/qdev.c
> > @@ -1131,7 +1131,7 @@ Object *qdev_get_machine(void)
> >      static Object *dev;
> 
> It's interesting how this variable simply duplicates the purpose
> of `current_machine`.
> 

Agreed for system-mode. User-mode doesn't have current_machine
though : we cannot use it in hw/core/qdev.c .

> >  
> >      if (dev == NULL) {
> > -        dev = container_get(object_get_root(), "/machine");
> > +        dev = do_qdev_get_machine();
> >      }
> >  
> >      return dev;
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index bafc311bfa1b..90e295e0bc1a 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -782,6 +782,7 @@ const char *qdev_fw_name(DeviceState *dev);
> >  
> >  void qdev_assert_realized_properly(void);
> >  Object *qdev_get_machine(void);
> > +Object *do_qdev_get_machine(void);
> >  
> >  /* FIXME: make this a link<> */
> >  bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
> > diff --git a/stubs/meson.build b/stubs/meson.build
> > index be6f6d609e58..b99ee2b33e94 100644
> > --- a/stubs/meson.build
> > +++ b/stubs/meson.build
> > @@ -54,3 +54,4 @@ if have_system
> >  else
> >    stub_ss.add(files('qdev.c'))
> >  endif
> > +stub_ss.add(files('qdev-get-machine.c'))
> > diff --git a/stubs/qdev-get-machine.c b/stubs/qdev-get-machine.c
> > new file mode 100644
> > index 000000000000..ed4cdaa01900
> > --- /dev/null
> > +++ b/stubs/qdev-get-machine.c
> > @@ -0,0 +1,11 @@
> > +#include "qemu/osdep.h"
> > +#include "hw/qdev-core.h"
> > +
> > +Object *do_qdev_get_machine(void)
> > +{
> > +    /*
> > +     * This will create a "container" and add it to the QOM tree, if there
> > +     * isn't one already.
> > +     */
> > +    return container_get(object_get_root(), "/machine");
> > +}
> 
> I'm curious to understand when exactly this stub is useful.
> 

It gets called from the code snippet in device_set_realized() already
mentioned above:

            object_property_add_child(container_get(qdev_get_machine(),
                                                    "/unattached"),

The only usefulness I see in this case is to accommodate container_get()
which expects an actual object and crashes if passed NULL :

#0  object_get_class (obj=0x0) at ../../qom/object.c:1001
#1  0x00000001002084d8 in object_property_find (obj=<optimized out>, name=<optimized out>) at ../../qom/object.c:1283
#2  0x000000010020ae68 in object_resolve_path_component (parent=<optimized out>, part=<optimized out>) at ../../qom/object.c:2046
#3  0x000000010020c528 in container_get (root=<optimized out>, path=<optimized out>) at ../../qom/container.c:38
#4  0x000000010020088c in device_set_realized (obj=0x100485080, value=<optimized out>, errp=0x7fffffffd620) at ../../hw/core/qdev.c:745

but as said above, I cannot tell if the subset of qdev/qom code used in
user-mode assumes that any device must have a parent... Any input in
this area would be appreciated.

Cheers,

--
Greg

