Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD0D35F4CF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:28:39 +0200 (CEST)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfZO-0007lU-LN
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWfXa-0006q5-4E
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lWfXX-0002n9-C7
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618406802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hr/8F5u5HHy4sxCztPk1kTgs+W4uLKNm20t6sHI9iOc=;
 b=iw84Yj6Zb1sNU3TE9Lmqqq/q9dM6Q6FVpiLrpQ9auh2jgmIpEqc5C2rhlDeE6X7kVdHDb5
 GazeP1NIODnOBR7QXTfjqpMLdiCZcnYci3Neq+fsgVc63RO/8dXxY5XrCY9BAvcf0ctkuB
 tvIq5/SNv+th9/Le0OigLrnklCf6EoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-gDrv45coPYWy_fa9oP2xdQ-1; Wed, 14 Apr 2021 09:26:40 -0400
X-MC-Unique: gDrv45coPYWy_fa9oP2xdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFD366D4E6;
 Wed, 14 Apr 2021 13:26:39 +0000 (UTC)
Received: from localhost (ovpn-114-144.rdu2.redhat.com [10.10.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D77006E6F5;
 Wed, 14 Apr 2021 13:26:37 +0000 (UTC)
Date: Tue, 13 Apr 2021 18:25:42 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of qdev_get_machine()
 for user and system
Message-ID: <20210413222542.dstz26tgoyaltt44@habkost.net>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210409160339.500167-2-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 06:03:38PM +0200, Greg Kurz wrote:
> Despite its simple name and common usage of "getting a pointer to
> the machine" in system-mode emulation, qdev_get_machine() has some
> subtilities.
> 
> First, it can be called when running user-mode emulation : this is
> because user-mode partly relies on qdev to instantiate its CPU
> model.

Do we know exactly which user mode emulation code needs to call
qdev_get_machine(), and why?

If there's no real MachineState object in user mode, what the
return value of qdev_get_machine() is used for?

> 
> Second, but not least, it has a side-effect : if it cannot find an
> object at "/machine" in the QOM tree, it creates a dummy "container"
> object and put it there. A simple check on the type returned by
> qdev_get_machine() allows user-mode to run the common qdev code,
> skipping the parts that only make sense for system-mode.
> 
> This side-effect turns out to complicate the use of qdev_get_machine()
> for the system-mode case though. Most notably, qdev_get_machine() must
> not be called before the machine object is added to the QOM tree by
> qemu_create_machine(), otherwise the existing dummy "container" object
> would cause qemu_create_machine() to fail with something like :
> 
> Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
> qemu-system-ppc64: attempt to add duplicate property 'machine' to
>  object (type 'container')
> Aborted (core dumped)
> 
> This situation doesn't exist in the current code base, mostly because
> of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
> and e2fb3fbbf9c for details).
> 
> A new kind of breakage was spotted very recently though :
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> /home/thuth/devel/qemu/include/hw/boards.h:24:
>  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> Aborted (core dumped)
> 
> This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> added a new condition for qdev_get_machine() to be called too early,
> breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> time.
> 
> In order to avoid further subtle breakages like this, change the
> implentation of qdev_get_machine() to:
> - keep the existing behaviour of creating the dummy "container"
>   object for the user-mode case only ;
> - abort() if the machine doesn't exist yet in the QOM tree for
>   the system-mode case. This gives a precise hint to developpers
>   that calling qdev_get_machine() too early is a programming bug.
> 
> This is achieved with a new do_qdev_get_machine() function called
> from qdev_get_machine(), with different implementations for system
> and user mode.
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> qemu-system-ppc64: ../../hw/core/machine.c:1290:
>  qdev_get_machine: Assertion `machine != NULL' failed.
> Aborted (core dumped)
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/core/machine.c        | 14 ++++++++++++++
>  hw/core/qdev.c           |  2 +-
>  include/hw/qdev-core.h   |  1 +
>  stubs/meson.build        |  1 +
>  stubs/qdev-get-machine.c | 11 +++++++++++
>  5 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 stubs/qdev-get-machine.c
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 40def78183a7..fecca4023105 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1293,6 +1293,20 @@ void qdev_machine_creation_done(void)
>      register_global_state();
>  }
>  
> +Object *do_qdev_get_machine(void)
> +{
> +    Object *machine;
> +
> +    machine = object_resolve_path_component(object_get_root(), "machine");

What about just replacing this expression with `current_machine`?

> +    /*
> +     * qdev_get_machine() shouldn't be called before qemu_create_machine()
> +     * has created the "/machine" path.
> +     */
> +    assert(machine != NULL);
> +
> +    return machine;

> +}
> +
>  static const TypeInfo machine_info = {
>      .name = TYPE_MACHINE,
>      .parent = TYPE_OBJECT,
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a92..1122721b2bf0 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1131,7 +1131,7 @@ Object *qdev_get_machine(void)
>      static Object *dev;

It's interesting how this variable simply duplicates the purpose
of `current_machine`.

>  
>      if (dev == NULL) {
> -        dev = container_get(object_get_root(), "/machine");
> +        dev = do_qdev_get_machine();
>      }
>  
>      return dev;
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1b..90e295e0bc1a 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -782,6 +782,7 @@ const char *qdev_fw_name(DeviceState *dev);
>  
>  void qdev_assert_realized_properly(void);
>  Object *qdev_get_machine(void);
> +Object *do_qdev_get_machine(void);
>  
>  /* FIXME: make this a link<> */
>  bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
> diff --git a/stubs/meson.build b/stubs/meson.build
> index be6f6d609e58..b99ee2b33e94 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -54,3 +54,4 @@ if have_system
>  else
>    stub_ss.add(files('qdev.c'))
>  endif
> +stub_ss.add(files('qdev-get-machine.c'))
> diff --git a/stubs/qdev-get-machine.c b/stubs/qdev-get-machine.c
> new file mode 100644
> index 000000000000..ed4cdaa01900
> --- /dev/null
> +++ b/stubs/qdev-get-machine.c
> @@ -0,0 +1,11 @@
> +#include "qemu/osdep.h"
> +#include "hw/qdev-core.h"
> +
> +Object *do_qdev_get_machine(void)
> +{
> +    /*
> +     * This will create a "container" and add it to the QOM tree, if there
> +     * isn't one already.
> +     */
> +    return container_get(object_get_root(), "/machine");
> +}

I'm curious to understand when exactly this stub is useful.

-- 
Eduardo


