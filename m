Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E102C66E6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:34:55 +0100 (CET)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kidtm-0003ro-J4
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kidpf-00013M-Dz
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kidpT-000113-4v
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606483826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vtK5ZX+qNTus+qF0YE7fN2YwQUSG6QLzBmlGcn96vnE=;
 b=eKbRigZzDT+o5GuQ+7R5+hHn9qo3+qZJpO7YIwqVhJV/oD2c/cW6hESrtGkb5/+jMtUE54
 7Sn8aNaS86RT3lFSvwpLEFcHYJbwEfFJoQ2jq+26XsDPdu4woihAFCY03BViGc6YI/5jP+
 p3ePRPYgG9TDTH+4W5Eq53navdhjsi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-oeja48v5Mau2ox7vZ2xCZQ-1; Fri, 27 Nov 2020 08:30:23 -0500
X-MC-Unique: oeja48v5Mau2ox7vZ2xCZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 726938030C0
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 13:30:22 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883491A88B;
 Fri, 27 Nov 2020 13:30:21 +0000 (UTC)
Date: Fri, 27 Nov 2020 14:30:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 36/36] vl: move all generic initialization out of vl.c
Message-ID: <20201127143020.2fe2d877@redhat.com>
In-Reply-To: <20201123141435.2726558-37-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-37-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 09:14:35 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> qdev_machine_creation_done is only setting a flag now.  Extend it to
> move more code out of vl.c.  Leave only consistency checks and gdbserver
> processing in qemu_machine_creation_done.
> 
> gdbserver_start can be moved after qdev_machine_creation_done because
> it only does listen on the socket and creates some internal data
> structures; it does not send any data (e.g. guest state) over the socket.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: 

> ---
>  hw/core/machine.c      | 47 +++++++++++++++++++++++++++++++++++++++++-
>  hw/core/qdev.c         | 12 +++--------
>  include/hw/qdev-core.h |  1 +
>  softmmu/vl.c           | 37 +--------------------------------
>  4 files changed, 51 insertions(+), 46 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 5659b1f49c..025c4f9749 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -16,16 +16,21 @@
>  #include "sysemu/replay.h"
>  #include "qemu/units.h"
>  #include "hw/boards.h"
> +#include "hw/loader.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-common.h"
>  #include "qapi/visitor.h"
>  #include "hw/sysbus.h"
> +#include "sysemu/cpus.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
>  #include "sysemu/numa.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
>  #include "hw/pci/pci.h"
>  #include "hw/mem/nvdimm.h"
> +#include "migration/global_state.h"
>  #include "migration/vmstate.h"
>  
>  GlobalProperty hw_compat_5_1[] = {
> @@ -1186,10 +1191,50 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
>      notifier_remove(notify);
>  }
>  
> -void qemu_run_machine_init_done_notifiers(void)
> +void qdev_machine_creation_done(void)
>  {
> +    cpu_synchronize_all_post_init();
> +
> +    if (current_machine->boot_once) {
> +        qemu_boot_set(current_machine->boot_once, &error_fatal);
> +        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
> +    }
> +
> +    /*
> +     * ok, initial machine setup is done, starting from now we can
> +     * only create hotpluggable devices
> +     */
> +    qdev_hotplug = true;
> +    qdev_assert_realized_properly();
> +
> +    /* TODO: once all bus devices are qdevified, this should be done
> +     * when bus is created by qdev.c */
> +    /*
> +     * TODO: If we had a main 'reset container' that the whole system
> +     * lived in, we could reset that using the multi-phase reset
> +     * APIs. For the moment, we just reset the sysbus, which will cause
> +     * all devices hanging off it (and all their child buses, recursively)
> +     * to be reset. Note that this will *not* reset any Device objects
> +     * which are not attached to some part of the qbus tree!
> +     */
> +    qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
> +
>      machine_init_done = true;
>      notifier_list_notify(&machine_init_done_notifiers, NULL);
> +
> +    if (rom_check_and_register_reset() != 0) {
> +        error_report("rom check and register reset failed");
> +        exit(1);
> +    }
> +
> +    replay_start();
> +
> +    /* This checkpoint is required by replay to separate prior clock
> +       reading from the other reads, because timer polling functions query
> +       clock values from the log. */
> +    replay_checkpoint(CHECKPOINT_RESET);
> +    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
> +    register_global_state();
>  }
>  
>  static const TypeInfo machine_info = {
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 262bca716f..bc5df8ce69 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -413,7 +413,7 @@ void qdev_unrealize(DeviceState *dev)
>      object_property_set_bool(OBJECT(dev), "realized", false, &error_abort);
>  }
>  
> -static int qdev_assert_realized_properly(Object *obj, void *opaque)
> +static int qdev_assert_realized_properly_cb(Object *obj, void *opaque)
>  {
>      DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
>      DeviceClass *dc;
> @@ -426,16 +426,10 @@ static int qdev_assert_realized_properly(Object *obj, void *opaque)
>      return 0;
>  }
>  
> -void qdev_machine_creation_done(void)
> +void qdev_assert_realized_properly(void)
>  {
> -    /*
> -     * ok, initial machine setup is done, starting from now we can
> -     * only create hotpluggable devices
> -     */
> -    qdev_hotplug = true;
> -
>      object_child_foreach_recursive(object_get_root(),
> -                                   qdev_assert_realized_properly, NULL);
> +                                   qdev_assert_realized_properly_cb, NULL);
>  }
>  
>  bool qdev_machine_modified(void)
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index b77a2f1da7..6446846752 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -815,6 +815,7 @@ const VMStateDescription *qdev_get_vmsd(DeviceState *dev);
>  
>  const char *qdev_fw_name(DeviceState *dev);
>  
> +void qdev_assert_realized_properly(void);
>  Object *qdev_get_machine(void);
>  
>  /* FIXME: make this a link<> */
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index aeb988bcad..1fde4a17a9 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -72,7 +72,6 @@
>  #include "hw/i386/pc.h"
>  #include "migration/misc.h"
>  #include "migration/snapshot.h"
> -#include "migration/global_state.h"
>  #include "sysemu/tpm.h"
>  #include "sysemu/dma.h"
>  #include "hw/audio/soundhw.h"
> @@ -2426,8 +2425,6 @@ static void qemu_create_cli_devices(void)
>  
>  static void qemu_machine_creation_done(void)
>  {
> -    cpu_synchronize_all_post_init();
> -
>      /* Did we create any drives that we failed to create a device for? */
>      drive_check_orphaned();
>  
> @@ -2445,43 +2442,11 @@ static void qemu_machine_creation_done(void)
>  
>      qdev_prop_check_globals();
>  
> -    if (current_machine->boot_once) {
> -        qemu_boot_set(current_machine->boot_once, &error_fatal);
> -        qemu_register_reset(restore_boot_order, g_strdup(current_machine->boot_order));
> -    }
> -
> -    if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
> -        exit(1);
> -    }
> -
>      qdev_machine_creation_done();
>  
> -    /* TODO: once all bus devices are qdevified, this should be done
> -     * when bus is created by qdev.c */
> -    /*
> -     * TODO: If we had a main 'reset container' that the whole system
> -     * lived in, we could reset that using the multi-phase reset
> -     * APIs. For the moment, we just reset the sysbus, which will cause
> -     * all devices hanging off it (and all their child buses, recursively)
> -     * to be reset. Note that this will *not* reset any Device objects
> -     * which are not attached to some part of the qbus tree!
> -     */
> -    qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
> -    qemu_run_machine_init_done_notifiers();
> -
> -    if (rom_check_and_register_reset() != 0) {
> -        error_report("rom check and register reset failed");
> +    if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
>          exit(1);
>      }
> -
> -    replay_start();
> -
> -    /* This checkpoint is required by replay to separate prior clock
> -       reading from the other reads, because timer polling functions query
> -       clock values from the log. */
> -    replay_checkpoint(CHECKPOINT_RESET);
> -    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
> -    register_global_state();
>  }
>  
>  void qmp_x_exit_preconfig(Error **errp)


