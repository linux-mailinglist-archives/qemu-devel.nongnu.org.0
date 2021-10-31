Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CD0440DF5
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 12:27:04 +0100 (CET)
Received: from localhost ([::1]:49824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh8zP-0001vS-IN
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 07:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mh8xN-0000dt-0S
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 07:25:00 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mh8xJ-0008PM-SW
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 07:24:56 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hhv106CDyz8tsp;
 Sun, 31 Oct 2021 19:23:16 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sun, 31 Oct 2021 19:24:42 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sun, 31 Oct 2021 19:24:42 +0800
Subject: Re: [PATCH 3/4] hw/core: Extract hotplug-related functions to
 qdev-hotplug.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211028150521.1973821-1-philmd@redhat.com>
 <20211028150521.1973821-4-philmd@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <5617d6fb-e83b-9ad8-7e70-157a39df44c3@huawei.com>
Date: Sun, 31 Oct 2021 19:24:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211028150521.1973821-4-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 2021/10/28 23:05, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/core/qdev-hotplug.c | 73 ++++++++++++++++++++++++++++++++++++++++++
>   hw/core/qdev.c         | 60 ----------------------------------
>   hw/core/meson.build    |  1 +
>   3 files changed, 74 insertions(+), 60 deletions(-)
>   create mode 100644 hw/core/qdev-hotplug.c
>
> diff --git a/hw/core/qdev-hotplug.c b/hw/core/qdev-hotplug.c
> new file mode 100644
> index 00000000000..d495d0e9c70
> --- /dev/null
> +++ b/hw/core/qdev-hotplug.c
> @@ -0,0 +1,73 @@
> +/*
> + * QDev Hotplug handlers
> + *
> + * Copyright (c) Red Hat
I find that this is a bit different from what we have in the
existing files after a git grep in QEMU, maybe better as:

Copyright (c) 2021 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/qdev-core.h"
> +#include "hw/boards.h"
> +
> +HotplugHandler *qdev_get_machine_hotplug_handler(DeviceState *dev)
> +{
> +    MachineState *machine;
> +    MachineClass *mc;
> +    Object *m_obj = qdev_get_machine();
> +
> +    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
> +        machine = MACHINE(m_obj);
> +        mc = MACHINE_GET_CLASS(machine);
> +        if (mc->get_hotplug_handler) {
> +            return mc->get_hotplug_handler(machine, dev);
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
> +{
> +    MachineState *machine;
> +    MachineClass *mc;
> +    Object *m_obj = qdev_get_machine();
> +
> +    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
> +        machine = MACHINE(m_obj);
> +        mc = MACHINE_GET_CLASS(machine);
> +        if (mc->hotplug_allowed) {
> +            return mc->hotplug_allowed(machine, dev, errp);
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev)
> +{
> +    if (dev->parent_bus) {
> +        return dev->parent_bus->hotplug_handler;
> +    }
> +    return NULL;
> +}
> +
> +HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev)
> +{
> +    HotplugHandler *hotplug_ctrl = qdev_get_machine_hotplug_handler(dev);
> +
> +    if (hotplug_ctrl == NULL && dev->parent_bus) {
> +        hotplug_ctrl = qdev_get_bus_hotplug_handler(dev);
> +    }
> +    return hotplug_ctrl;
> +}
> +
> +/* can be used as ->unplug() callback for the simple cases */
> +void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
> +                                  DeviceState *dev, Error **errp)
> +{
> +    qdev_unrealize(dev);
> +}
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 7f06403752d..cede76fce47 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -33,7 +33,6 @@
>   #include "qapi/visitor.h"
>   #include "qemu/error-report.h"
>   #include "qemu/option.h"
> -#include "hw/hotplug.h"
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/boards.h"
> @@ -238,58 +237,6 @@ void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
>       dev->alias_required_for_version = required_for_version;
>   }
>   
> -HotplugHandler *qdev_get_machine_hotplug_handler(DeviceState *dev)
> -{
> -    MachineState *machine;
> -    MachineClass *mc;
> -    Object *m_obj = qdev_get_machine();
> -
> -    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
> -        machine = MACHINE(m_obj);
> -        mc = MACHINE_GET_CLASS(machine);
> -        if (mc->get_hotplug_handler) {
> -            return mc->get_hotplug_handler(machine, dev);
> -        }
> -    }
> -
> -    return NULL;
> -}
> -
> -bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
> -{
> -    MachineState *machine;
> -    MachineClass *mc;
> -    Object *m_obj = qdev_get_machine();
> -
> -    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
> -        machine = MACHINE(m_obj);
> -        mc = MACHINE_GET_CLASS(machine);
> -        if (mc->hotplug_allowed) {
> -            return mc->hotplug_allowed(machine, dev, errp);
> -        }
> -    }
> -
> -    return true;
> -}
> -
> -HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev)
> -{
> -    if (dev->parent_bus) {
> -        return dev->parent_bus->hotplug_handler;
> -    }
> -    return NULL;
> -}
> -
> -HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev)
> -{
> -    HotplugHandler *hotplug_ctrl = qdev_get_machine_hotplug_handler(dev);
> -
> -    if (hotplug_ctrl == NULL && dev->parent_bus) {
> -        hotplug_ctrl = qdev_get_bus_hotplug_handler(dev);
> -    }
> -    return hotplug_ctrl;
> -}
> -
>   static int qdev_prereset(DeviceState *dev, void *opaque)
>   {
>       trace_qdev_reset_tree(dev, object_get_typename(OBJECT(dev)));
> @@ -371,13 +318,6 @@ static void device_reset_child_foreach(Object *obj, ResettableChildCallback cb,
>       }
>   }
>   
> -/* can be used as ->unplug() callback for the simple cases */
> -void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
> -                                  DeviceState *dev, Error **errp)
> -{
> -    qdev_unrealize(dev);
> -}
> -
>   bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
>   {
>       assert(!dev->realized && !dev->parent_bus);
> diff --git a/hw/core/meson.build b/hw/core/meson.build
> index 4d04069f85f..85f2ad1374b 100644
> --- a/hw/core/meson.build
> +++ b/hw/core/meson.build
> @@ -11,6 +11,7 @@
>     'irq.c',
>     'clock.c',
>     'qdev-clock.c',
> +  'qdev-hotplug.c',
>   ))
>   
>   common_ss.add(files('cpu-common.c'))
Besides,
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
.

