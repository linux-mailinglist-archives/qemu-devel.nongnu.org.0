Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA816BE49
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 11:09:08 +0100 (CET)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6X9H-0003gu-4b
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 05:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6X4n-00083O-H0
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 05:04:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6X4l-0004Wj-9a
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 05:04:29 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48270)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6X4f-0004TB-VH; Tue, 25 Feb 2020 05:04:22 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 84FF296EF0;
 Tue, 25 Feb 2020 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582625060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgaLBBks5ZZzQWh7Jd7y4AZEYDqrZCF2hZEPy/kawew=;
 b=OHuXAw8489CyVxGLWwqLv7lDmtjtqpLBYSfCZiCKgVh7RwjD5a6w2CUXk6R4chccFxjMlg
 2sWO2uFDaaMtHBA1yQRh7ZPRSrgf5M8NE8OxfJLrwdN4b3qvwtW3HyI8xjYsfMcVn7nIp0
 jaiySwH8F4luYAq3LnwWNapnhp36TVs=
Subject: Re: [PATCH v7 3/9] qdev: add clock input&output support to devices.
To: Alistair Francis <alistair23@gmail.com>
References: <20200224170301.246623-1-damien.hedde@greensocs.com>
 <20200224170301.246623-4-damien.hedde@greensocs.com>
 <CAKmqyKPe5Y7zH6-WpnCmcoVqvBJu5m5hynHVcfWy7qb9iWHGzA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <0288f1bb-7272-a78a-1872-2ca13a1e12a3@greensocs.com>
Date: Tue, 25 Feb 2020 11:04:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPe5Y7zH6-WpnCmcoVqvBJu5m5hynHVcfWy7qb9iWHGzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582625060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgaLBBks5ZZzQWh7Jd7y4AZEYDqrZCF2hZEPy/kawew=;
 b=AcNavXmCrhi1oRtkaOWBWuHBo34woszMYuU2Ispua/OvN2UdRWSIk5/7VLt+1jJGQmQtr1
 4I9Yk+FCYGHotut8ZiqI8lVceWTq0OBWIHvWAziru/+IZ5w2JLfohoMDaVkOwre6tvblkW
 x8wIOJZkDn8E4zugL+qq90E2XfFg0ws=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582625060; a=rsa-sha256; cv=none;
 b=YpN7PhHvpZanR733uXINLfN8vWKWoloBI5Ys+wihVA5c3rVAnsaQKU3mstl7WZjCwKUWg6
 ng2Be/b0wrbKHqR9tOXKl9m708iWWLZZLh2VBOYvBWSGZNBxAPQM7YpMTpCsFn2YONqPC7
 ah00l0SCpT0kkC6yEjXYHi4dFd6UAlE=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Edgar Iglesias <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/25/20 2:27 AM, Alistair Francis wrote:
> /On Mon, Feb 24, 2020 at 9:12 AM Damien Hedde <damien.hedde@greensocs.com> wrote
>>
>> Add functions to easily handle clocks with devices.
>> Clock inputs and outputs should be used to handle clock propagation
>> between devices.
>> The API is very similar the GPIO API.
>>
>> This is based on the original work of Frederic Konrad.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>>
>> I did not changed the constness of @name pointer field in
>> NamedClockList structure.
>> There is no obstacle to do it but the fact that we need to free the
>> allocated data it points to. It is possible to make it const and
>> hack/remove the const to call g_free but I don't know if its
>> allowed in qemu.
>>
>> v7:
>> + update ClockIn/Out types
>> + qdev_connect_clock_out function removed / qdev_connect_clock_in added
>>   instead
>> + qdev_pass_clock renamed to qdev_alias_clock
>> + various small fixes (typos, comment, asserts) (Peter)
>> + move device's instance_finalize code related to clock in qdev-clock.c
>> ---
>>  include/hw/qdev-clock.h | 105 +++++++++++++++++++++++++
>>  include/hw/qdev-core.h  |  12 +++
>>  hw/core/qdev-clock.c    | 169 ++++++++++++++++++++++++++++++++++++++++
>>  hw/core/qdev.c          |  12 +++
>>  hw/core/Makefile.objs   |   2 +-
>>  tests/Makefile.include  |   1 +
>>  6 files changed, 300 insertions(+), 1 deletion(-)
>>  create mode 100644 include/hw/qdev-clock.h
>>  create mode 100644 hw/core/qdev-clock.c
>>
>> diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
>> new file mode 100644
>> index 0000000000..899a95ca6a
>> --- /dev/null
>> +++ b/include/hw/qdev-clock.h
>> @@ -0,0 +1,105 @@
>> +/*
>> + * Device's clock input and output
>> + *
>> + * Copyright GreenSocs 2016-2020
>> + *
>> + * Authors:
>> + *  Frederic Konrad
>> + *  Damien Hedde
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef QDEV_CLOCK_H
>> +#define QDEV_CLOCK_H
>> +
>> +#include "hw/clock.h"
>> +
>> +/**
>> + * qdev_init_clock_in:
>> + * @dev: the device to add an input clock to
>> + * @name: the name of the clock (can't be NULL).
>> + * @callback: optional callback to be called on update or NULL.
>> + * @opaque: argument for the callback
>> + * @returns: a pointer to the newly added clock
>> + *
>> + * Add an input clock to device @dev as a clock named @name.
>> + * This adds a child<> property.
>> + * The callback will be called with @opaque as opaque parameter.
>> + */
>> +Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
>> +                          ClockCallback *callback, void *opaque);
>> +
>> +/**
>> + * qdev_init_clock_out:
>> + * @dev: the device to add an output clock to
>> + * @name: the name of the clock (can't be NULL).
>> + * @callback: optional callback to be called on update or NULL.
> 
> qdev_init_clock_out() doesn't have a callback.
> 
>> + * @returns: a pointer to the newly added clock
> 
>> + *
>> + * Add an output clock to device @dev as a clock named @name.
>> + * This adds a child<> property.
>> + */
>> +Clock *qdev_init_clock_out(DeviceState *dev, const char *name);
>> +
>> +/**
>> + * qdev_get_clock_in:
>> + * @dev: the device which has the clock
>> + * @name: the name of the clock (can't be NULL).
>> + * @returns: a pointer to the clock
>> + *
>> + * Get the input clock @name from @dev or NULL if does not exist.
>> + */
>> +Clock *qdev_get_clock_in(DeviceState *dev, const char *name);
>> +
>> +/**
>> + * qdev_get_clock_out:
>> + * @dev: the device which has the clock
>> + * @name: the name of the clock (can't be NULL).
>> + * @returns: a pointer to the clock
>> + *
>> + * Get the output clock @name from @dev or NULL if does not exist.
>> + */
>> +Clock *qdev_get_clock_out(DeviceState *dev, const char *name);
>> +
>> +/**
>> + * qdev_connect_clock_in:
>> + * @dev: a device
>> + * @name: the name of an input clock in @dev
>> + * @source: the source clock (an output clock of another device for example)
>> + *
>> + * Set the source clock of input clock @name of device @dev to @source.
>> + * @source period update will be propagated to @name clock.
>> + */
>> +static inline void qdev_connect_clock_in(DeviceState *dev, const char *name,
>> +                                         Clock *source)
>> +{
>> +    clock_set_source(qdev_get_clock_in(dev, name), source);
>> +}
>> +
>> +/**
>> + * qdev_alias_clock:
>> + * @dev: the device which has the clock
>> + * @name: the name of the clock in @dev (can't be NULL)
>> + * @alias_dev: the device to add the clock
>> + * @alias_name: the name of the clock in @container
>> + * @returns: a pointer to the clock
>> + *
>> + * Add a clock @alias_name in @alias_dev which is an alias of the clock @name
>> + * in @dev. The direction _in_ or _out_ will the same as the original.
>> + * An alias clock must not be modified or used by @alias_dev and should
>> + * typically be only only for device composition purpose.
>> + */
>> +Clock *qdev_alias_clock(DeviceState *dev, const char *name,
>> +                        DeviceState *alias_dev, const char *alias_name);
>> +
>> +/**
>> + * qdev_finalize_clocklist:
>> + * @dev: the device being finalize
> 
> It probably should be:
> 
> @dev: the device being finalized
> 
>> + *
>> + * Clear the clocklist from @dev. Only used internally in qdev.
>> + */
>> +void qdev_finalize_clocklist(DeviceState *dev);
>> +
>> +#endif /* QDEV_CLOCK_H */
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index 1405b8a990..d87d989e72 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -149,6 +149,17 @@ struct NamedGPIOList {
>>      QLIST_ENTRY(NamedGPIOList) node;
>>  };
>>
>> +typedef struct Clock Clock;
>> +typedef struct NamedClockList NamedClockList;
>> +
>> +struct NamedClockList {
>> +    char *name;
>> +    Clock *clock;
>> +    bool output;
>> +    bool alias;
>> +    QLIST_ENTRY(NamedClockList) node;
>> +};
>> +
>>  /**
>>   * DeviceState:
>>   * @realized: Indicates whether the device has been fully constructed.
>> @@ -171,6 +182,7 @@ struct DeviceState {
>>      bool allow_unplug_during_migration;
>>      BusState *parent_bus;
>>      QLIST_HEAD(, NamedGPIOList) gpios;
>> +    QLIST_HEAD(, NamedClockList) clocks;
>>      QLIST_HEAD(, BusState) child_bus;
>>      int num_child_bus;
>>      int instance_id_alias;
>> diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
>> new file mode 100644
>> index 0000000000..9af0159517
>> --- /dev/null
>> +++ b/hw/core/qdev-clock.c
>> @@ -0,0 +1,169 @@
>> +/*
>> + * Device's clock input and output
>> + *
>> + * Copyright GreenSocs 2016-2020
>> + *
>> + * Authors:
>> + *  Frederic Konrad
>> + *  Damien Hedde
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/qdev-clock.h"
>> +#include "hw/qdev-core.h"
>> +#include "qapi/error.h"
>> +
>> +/*
>> + * qdev_init_clocklist:
>> + * Add a new clock in a device
>> + */
>> +static NamedClockList *qdev_init_clocklist(DeviceState *dev, const char *name,
>> +                                           bool output, Clock *clk)
>> +{
>> +    NamedClockList *ncl;
>> +
>> +    /*
>> +     * Clock must be added before realize() so that we can compute the
>> +     * clock's canonical path durint device_realize().
> 
> s/durint/during/g
> 
>> +     */
>> +    assert(!dev->realized);
>> +
>> +    /*
>> +     * The ncl structure is freed by qdev_finalize_clocklist() which will
>> +     * be called during @dev's device_finalize().
>> +     */
>> +    ncl = g_new0(NamedClockList, 1);
>> +    ncl->name = g_strdup(name);
>> +    ncl->output = output;
>> +    ncl->alias = (clk != NULL);
>> +
>> +    /*
>> +     * Trying to create a clock whose name clashes with some other
>> +     * clock or property is a bug in the caller and we will abort().
>> +     */
>> +    if (clk == NULL) {
>> +        clk = CLOCK(object_new(TYPE_CLOCK));
>> +        object_property_add_child(OBJECT(dev), name, OBJECT(clk), &error_abort);
>> +        if (output) {
>> +            /*
>> +             * Remove object_new()'s initial reference.
>> +             * Note that for inputs, the reference created by object_new()
>> +             * will be deleted in qdev_finalize_clocklist().
>> +             */
>> +            object_unref(OBJECT(clk));
>> +        }
>> +    } else {
>> +        object_property_add_link(OBJECT(dev), name,
>> +                                 object_get_typename(OBJECT(clk)),
>> +                                 (Object **) &ncl->clock,
>> +                                 NULL, OBJ_PROP_LINK_STRONG, &error_abort);
>> +    }
>> +
>> +    ncl->clock = clk;
>> +
>> +    QLIST_INSERT_HEAD(&dev->clocks, ncl, node);
>> +    return ncl;
>> +}
>> +
>> +void qdev_finalize_clocklist(DeviceState *dev)
>> +{
>> +    /* called by @dev's device_finalize() */
>> +    NamedClockList *ncl, *ncl_next;
>> +>> +    return NULL;
>> +}
>> +
>> +Clock *qdev_get_clock_in(DeviceState *dev, const char *name)
>> +{
>> +    NamedClockList *ncl;
>> +
>> +    assert(name);
>> +
>> +    ncl = qdev_get_clocklist(dev, name);
>> +    assert(!ncl->output);
>> +
>> +    return ncl->clock;
>> +}
>> +
>> +Clock *qdev_get_clock_out(DeviceState *dev, const char *name)
>> +{
>> +    NamedClockList *ncl;
>> +
>> +    assert(name);
>> +
>> +    ncl = qdev_get_clocklist(dev, name);
>> +    assert(ncl->output);
>> +
>> +    return ncl->clock;
>> +}
>> +
>> +Clock *qdev_alias_clock(DeviceState *dev, const char *name,
>> +                        DeviceState *alias_dev, const char *alias_name)
>> +{
>> +    NamedClockList *ncl;
>> +
>> +    assert(name && alias_name);
>> +
>> +    ncl = qdev_get_clocklist(dev, name);
>> +
>> +    qdev_init_clocklist(alias_dev, alias_name, ncl->output, ncl->clock);
>> +
>> +    return ncl->clock;
>> +}
>> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
>> index 3937d1eb1a..f390697348 100644
>> --- a/hw/core/qdev.c
>> +++ b/hw/core/qdev.c
>> @@ -37,6 +37,7 @@
>>  #include "hw/qdev-properties.h"
>>  #include "hw/boards.h"
>>  #include "hw/sysbus.h"
>> +#include "hw/qdev-clock.h"
>>  #include "migration/vmstate.h"
>>  #include "trace.h"
>>
>> @@ -855,6 +856,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>>      DeviceClass *dc = DEVICE_GET_CLASS(dev);
>>      HotplugHandler *hotplug_ctrl;
>>      BusState *bus;
>> +    NamedClockList *ncl;
>>      Error *local_err = NULL;
>>      bool unattached_parent = false;
>>      static int unattached_count;
>> @@ -902,6 +904,13 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>>           */
>>          g_free(dev->canonical_path);
>>          dev->canonical_path = object_get_canonical_path(OBJECT(dev));
>> +        QLIST_FOREACH(ncl, &dev->clocks, node) {
>> +            if (ncl->alias) {
>> +                continue;
>> +            } else {
>> +                clock_setup_canonical_path(ncl->clock);
>> +            }
>> +        }
>>
>>          if (qdev_get_vmsd(dev)) {
>>              if (vmstate_register_with_alias_id(VMSTATE_IF(dev),
>> @@ -1025,6 +1034,7 @@ static void device_initfn(Object *obj)
>>      dev->allow_unplug_during_migration = false;
>>
>>      QLIST_INIT(&dev->gpios);
>> +    QLIST_INIT(&dev->clocks);
>>  }
>>
>>  static void device_post_init(Object *obj)
>> @@ -1054,6 +1064,8 @@ static void device_finalize(Object *obj)
>>           */
>>      }
>>
>> +    qdev_finalize_clocklist(dev);
>> +
>>      /* Only send event if the device had been completely realized */
>>      if (dev->pending_deleted_event) {
>>          g_assert(dev->canonical_path);
>> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
>> index e3d796fdd4..2fdcb7dd00 100644
>> --- a/hw/core/Makefile.objs
>> +++ b/hw/core/Makefile.objs
>> @@ -7,7 +7,7 @@ common-obj-y += hotplug.o
>>  common-obj-y += vmstate-if.o
>>  # irq.o needed for qdev GPIO handling:
>>  common-obj-y += irq.o
>> -common-obj-y += clock.o
>> +common-obj-y += clock.o qdev-clock.o
>>
>>  common-obj-$(CONFIG_SOFTMMU) += reset.o
>>  common-obj-$(CONFIG_SOFTMMU) += qdev-fw.o
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index edcbd475aa..5a4511a86f 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -436,6 +436,7 @@ tests/test-qdev-global-props$(EXESUF): tests/test-qdev-global-props.o \
>>         hw/core/fw-path-provider.o \
>>         hw/core/reset.o \
>>         hw/core/vmstate-if.o \
>> +       hw/core/clock.o hw/core/qdev-clock.o \
>>         $(test-qapi-obj-y)
>>  tests/test-vmstate$(EXESUF): tests/test-vmstate.o \
>>         migration/vmstate.o migration/vmstate-types.o migration/qemu-file.o \
>> --
>> 2.24.1
>>
>>
>> +    QLIST_FOREACH_SAFE(ncl, &dev->clocks, node, ncl_next) {
>> +        QLIST_REMOVE(ncl, node);
>> +        if (!ncl->output && !ncl->alias) {
>> +            /*
>> +             * We kept a reference on the input clock to ensure it lives up to
>> +             * this point so we can safely remove the callback.
>> +             * It avoids having a callback to a deleted object if ncl->clock
>> +             * is still referenced somewhere else (eg: by a clock output).
>> +             */
>> +            clock_clear_callback(ncl->clock);
>> +            object_unref(OBJECT(ncl->clock));
>> +        }
>> +        g_free(ncl->name);
>> +        g_free(ncl);
>> +    }
>> +}
>> +
>> +Clock *qdev_init_clock_out(DeviceState *dev, const char *name)
>> +{
>> +    NamedClockList *ncl;
>> +
>> +    assert(name);
>> +
>> +    ncl = qdev_init_clocklist(dev, name, true, NULL);
>> +
>> +    return ncl->clock;
>> +}
>> +
>> +Clock *qdev_init_clock_in(DeviceState *dev, const char *name,
>> +                            ClockCallback *callback, void *opaque)
>> +{
>> +    NamedClockList *ncl;
>> +
>> +    assert(name);
>> +
>> +    ncl = qdev_init_clocklist(dev, name, false, NULL);
>> +
>> +    if (callback) {
>> +        clock_set_callback(ncl->clock, callback, opaque);
>> +    }
>> +    return ncl->clock;
>> +}
>> +
>> +static NamedClockList *qdev_get_clocklist(DeviceState *dev, const char *name)
>> +{
>> +    NamedClockList *ncl;
>> +
>> +    QLIST_FOREACH(ncl, &dev->clocks, node) {
>> +        if (strcmp(name, ncl->name) == 0) {
>> +            return ncl;
>> +        }
>> +    }
>> +
>> +    assert(false);
> 
> Remove this.
You're right, It will fail right after anyway if we get there.

> 
> Otherwise it looks good.
> 
> Alistair
> 

Thanks,
Damien

