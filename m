Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503AC6AEA45
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:32:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbA4-00011O-7P; Tue, 07 Mar 2023 12:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZb9g-0000zK-BI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZb9e-0001zu-77
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678210273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rZoXv/RLOB2RYcV3vBQ8YzEHfHiglJTrFbi3zKP1SMM=;
 b=Jppt+dOIperGRToT6ziIeNxnKqG2VfhPXNNlihGPEGBGOC+rzMHp9a21qge/zAiP9oZLhy
 JOIZBlJugh6KAm7Z7VJ+iYgsJ7j21L2l7YuyWsC1VnJD4ftj7PEnwxmZd3JKVaGOycZ8uF
 dlq0UJ6ic2DW4ogok7/MJEBR+W4GzKU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-xVTwPNo9NcCZUtmLLfsOng-1; Tue, 07 Mar 2023 12:31:11 -0500
X-MC-Unique: xVTwPNo9NcCZUtmLLfsOng-1
Received: by mail-wm1-f69.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso8544493wmc.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678210269;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZoXv/RLOB2RYcV3vBQ8YzEHfHiglJTrFbi3zKP1SMM=;
 b=CG4GSSDMXDw0rmOYzIjJ50gfFls5gaJZrPvJr8FQ9FLSjVHK8sp6iBWFeFJEhk0QLH
 KkvE7AK7lbnjQmFuYjFMmVduDZ5FAXTkHcr1QTSnki2fsdQe+gD0SnOeoILTxBnkh2ta
 mS4ip4b+ZTxDKw6szc0s6uBTt4do4HF3GuJvHpZl2+A/L9AMD7WC8F4YYRJF3C4zAhM6
 rKhq1DzETwKWokHiWjyQcIHtgBzs+6Mei6YvjmaXEL0AluCB9tOpa+HA4M8FUq8T5cDv
 6ekdIOnHqMz0GjiwNJ6+5KG2o0OLOAEjfjHuGhQLOfkCEbDl8vt0IZQn7D2QbX/4KMOO
 aCSg==
X-Gm-Message-State: AO0yUKXriqZIWNgXRaeAPs3oXcXw/8JH6XKgS77W4dSGRum9ely7j3kA
 HQKeto0Jcn0T0V2CdfpWF6AlsgY5rVuCnjyk1aenFPQ16AzAJfVnFQbD8AnFPMgsqz/flfGaVW1
 iUf9KBq0gfZFZb+k=
X-Received: by 2002:a05:600c:548e:b0:3eb:248f:a13e with SMTP id
 iv14-20020a05600c548e00b003eb248fa13emr14435487wmb.22.1678210268846; 
 Tue, 07 Mar 2023 09:31:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8XvnmkE6XNAhbaIV9jCBe8ZIGgc0crRvQqqbs5L57Yy2KoODOlLnAivEdFzKsJ3olW9UHuHw==
X-Received: by 2002:a05:600c:548e:b0:3eb:248f:a13e with SMTP id
 iv14-20020a05600c548e00b003eb248fa13emr14435459wmb.22.1678210268431; 
 Tue, 07 Mar 2023 09:31:08 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c431500b003daf672a616sm13249691wme.22.2023.03.07.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:31:07 -0800 (PST)
Date: Tue, 7 Mar 2023 12:31:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, den-plotnikov@yandex-team.ru,
 antonkuchin@yandex-team.ru, philmd@linaro.org
Subject: Re: [PATCH v6 2/4] qapi: add DEVICE_ON and query-hotplug
 infrastructure
Message-ID: <20230307122821-mutt-send-email-mst@kernel.org>
References: <20230307160537.2261803-1-vsementsov@yandex-team.ru>
 <20230307160537.2261803-3-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307160537.2261803-3-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 07, 2023 at 07:05:35PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We have DEVICE_DELETED event, that signals that device_del command is
> actually completed. But we don't have a counter-part for device_add.
> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
> when the device in some intermediate state. Let's add an event that say
> that the device is finally powered on, power indicator is on and
> everything is OK for next manipulation on that device.
> 
> Motivations:
> 1. To be sure that device is "accepted" by guest. Guest may ignore
> hotplugged device for some reason (for example during OS booting).
> Management wants to catch this and handle the problem, instead of
> silent assume that everything is OK. So, if we don't get the event by
> some timeout, we can report an error, try to unplug/plug the disk again
> or do some other things to handle the problem.
> 
> 2. The device can't be removed (by blockdev-del) while power indicator
> of hotplug controller is blinking (QEMU reports "guest is busy (power
> indicator blinking)"). So, management should avoid removing the device
> until it gets the DEVICE_ON event.
> (Probably, better solution for this point is to automatically postpone
> deletion until power indicator stops blinking)
> 
> 3. Also, management tool may make a GUI visualization of power
> indicator with help of this event.
> 
> As a counter-part add query-hotplug command, that shows "device-on"
> state as well as some addtional information.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

From commit log it sounds you are just adding one new event.
In fact there's more new stuff in qdev.json

Pls document in commit log too.


> ---
>  qapi/qdev.json         | 144 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/hotplug.h   |  12 ++++
>  include/hw/qdev-core.h |   1 +
>  include/monitor/qdev.h |   2 +
>  hw/core/hotplug.c      |  13 ++++
>  softmmu/qdev-monitor.c |  41 ++++++++++++
>  6 files changed, 213 insertions(+)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 135cd81586..e37286da78 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -173,3 +173,147 @@
>  #
>  ##
>  { 'event': 'DEVICE_UNPLUG_GUEST_ERROR', 'data': 'DeviceAndPath' }
> +
> +##
> +# @LedActivity:
> +#
> +# Three-state led indicator state.
> +#
> +# @on: Indicator is on.
> +#
> +# @blink: Indicator is blinking.
> +#
> +# @off: Indicator is off.
> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'LedActivity',
> +  'data': [ 'on', 'blink', 'off' ] }
> +
> +##
> +# @HotplugSHPCSlotState:
> +#
> +# Standard Hot-Plug Controller slot state.
> +#
> +# @power-only: Slot is powered on but neither clock nor bus are connected.
> +#
> +# @enabled: Slot is powered on, clock and bus are connected, the card is
> +#           fully functional from a hardware standpoint.
> +#
> +# @disabled: Slot is disabled, card is safe to be removed.
> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugSHPCSlotState',
> +  'data': [ 'power-only', 'enabled', 'disabled' ] }
> +
> +##
> +# @HotplugBaseState:
> +#
> +# Base structure for SHPC and PCIe-native hotplug.
> +#
> +# @power-led: Power indicator. When power indicator is on the device is
> +#             ready and accepted by guest. Off status means that device
> +#             is safe to remove and blinking is an intermediate state of
> +#             hot-plug or hot-unplug.
> +#
> +# @attention-led: Attention indicator. Off status means normal operation,
> +#                 On signals about operational problem, Blinking is for
> +#                 locating the slot.
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'HotplugBaseState',
> +  'data': { '*power-led': 'LedActivity',
> +            '*attention-led': 'LedActivity' } }
> +
> +##
> +# @HotplugSHPCState:
> +#
> +# Standard Hot Plug Controller state.
> +#
> +# @slot-state: The slot state field of Slot Status.
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'HotplugSHPCState',
> +  'base': 'HotplugBaseState',
> +  'data': { '*slot-state': 'HotplugSHPCSlotState' } }
> +
> +##
> +# @HotplugPCIeNativeState:
> +#
> +# PCIe Native hotplug slot state.
> +#
> +# @power-on: PCIe Power Controller Control of Slot Control Register.
> +#            True means Power On (Power Controller Control bit is 0),
> +#            False means Power Off (Power Controller Control bit is 1).
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'HotplugPCIeNativeState',
> +  'base': 'HotplugBaseState',
> +  'data': { '*power-on': 'bool' } }
> +
> +##
> +# @HotplugType:
> +#
> +# Type of hotplug controller / provider.
> +#
> +# @shpc: Standard Hot Plug Controller
> +#
> +# @pcie-native: PCIe Native hotplug
> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugType',
> +  'data': ['shpc', 'pcie-native'] }
> +
> +##
> +# @HotplugInfo:
> +#
> +# Generic hotplug slot state.
> +#
> +# @type: type of the hotplug (shpc or pcie-native)
> +#
> +# @bus: The QOM path of the parent bus where device is hotplugged.
> +#
> +# @addr: The bus address for hotplugged device if applicable.
> +#
> +# @child: the hotplugged device
> +#
> +# @device-on: Device is powered-on by guest. This state changes at most
> +#             once for the device and corresponds to DEVICE_ON event.
> +#
> +# Single: 8.0
> +##
> +{ 'union': 'HotplugInfo',
> +  'base': { 'type': 'HotplugType',
> +            'bus': 'DeviceAndPath',
> +            '*addr': 'str',
> +            'child': 'DeviceAndPath',
> +            'device-on': 'bool' },
> +  'discriminator': 'type',
> +  'data': { 'shpc': 'HotplugSHPCState',
> +            'pcie-native': 'HotplugPCIeNativeState' } }
> +
> +##
> +# @query-hotplug:
> +#
> +# Query the state of hotplug controller.
> +#
> +# Since: 8.0
> +##
> +{ 'command': 'query-hotplug',
> +  'data': { 'id': 'str' },
> +  'returns': 'HotplugInfo' }
> +
> +##
> +# @DEVICE_ON:
> +#
> +# Emitted whenever the device insertion completion is acknowledged by the guest.
> +# For now only emitted for SHPC and PCIe-native hotplug.
> +#
> +# Since: 8.0
> +##
> +{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }
> diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
> index e15f59c8b3..b82261d91e 100644
> --- a/include/hw/hotplug.h
> +++ b/include/hw/hotplug.h
> @@ -13,6 +13,7 @@
>  #define HOTPLUG_H
>  
>  #include "qom/object.h"
> +#include "qapi/qapi-types-qdev.h"
>  
>  #define TYPE_HOTPLUG_HANDLER "hotplug-handler"
>  
> @@ -58,6 +59,8 @@ struct HotplugHandlerClass {
>      hotplug_fn plug;
>      hotplug_fn unplug_request;
>      hotplug_fn unplug;
> +    HotplugInfo *(*get_hotplug_state)(HotplugHandler *plug_handler,
> +                                      DeviceState *plugged_dev, Error **errp);
>  };
>  
>  /**
> @@ -94,4 +97,13 @@ void hotplug_handler_unplug_request(HotplugHandler *plug_handler,
>  void hotplug_handler_unplug(HotplugHandler *plug_handler,
>                              DeviceState *plugged_dev,
>                              Error **errp);
> +
> +/**
> + * hotplug_handler_get_hotplug_state:
> + *
> + * Calls #HotplugHandlerClass.get_hotplug_state callback of @plug_handler.
> + */
> +HotplugInfo *hotplug_handler_get_hotplug_state(HotplugHandler *plug_handler,
> +                                               DeviceState *plugged_dev,
> +                                               Error **errp);
>  #endif
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index f5b3b2f89a..dc2f91a2e2 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -180,6 +180,7 @@ struct DeviceState {
>      char *id;
>      char *canonical_path;
>      bool realized;
> +    bool device_on_sent; /* set once by SHPC or PCIE-hotplug */
>      bool pending_deleted_event;
>      int64_t pending_deleted_expires_ms;
>      QDict *opts;
> diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
> index 1d57bf6577..c1c8798e89 100644
> --- a/include/monitor/qdev.h
> +++ b/include/monitor/qdev.h
> @@ -36,4 +36,6 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>   */
>  const char *qdev_set_id(DeviceState *dev, char *id, Error **errp);
>  
> +void qdev_hotplug_device_on_event(DeviceState *dev);
> +
>  #endif
> diff --git a/hw/core/hotplug.c b/hw/core/hotplug.c
> index 17ac986685..08d6d03760 100644
> --- a/hw/core/hotplug.c
> +++ b/hw/core/hotplug.c
> @@ -57,6 +57,19 @@ void hotplug_handler_unplug(HotplugHandler *plug_handler,
>      }
>  }
>  
> +HotplugInfo *hotplug_handler_get_hotplug_state(HotplugHandler *plug_handler,
> +                                               DeviceState *plugged_dev,
> +                                               Error **errp)
> +{
> +    HotplugHandlerClass *hdc = HOTPLUG_HANDLER_GET_CLASS(plug_handler);
> +
> +    if (hdc->get_hotplug_state) {
> +        return hdc->get_hotplug_state(plug_handler, plugged_dev, errp);
> +    }
> +
> +    return NULL;
> +}
> +
>  static const TypeInfo hotplug_handler_info = {
>      .name          = TYPE_HOTPLUG_HANDLER,
>      .parent        = TYPE_INTERFACE,
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index b8d2c4dadd..e4956bbd94 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -25,6 +25,7 @@
>  #include "sysemu/arch_init.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-qdev.h"
> +#include "qapi/qapi-events-qdev.h"
>  #include "qapi/qmp/dispatch.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qerror.h"
> @@ -956,6 +957,36 @@ void qmp_device_del(const char *id, Error **errp)
>      }
>  }
>  
> +HotplugInfo *qmp_query_hotplug(const char *id, Error **errp)
> +{
> +    DeviceState *dev = find_device_state(id, errp);
> +    HotplugHandler *hotplug_ctrl;
> +
> +    if (!dev) {
> +        return NULL;
> +    }
> +
> +    if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
> +        error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
> +        return NULL;
> +    }
> +
> +    if (!DEVICE_GET_CLASS(dev)->hotpluggable) {
> +        error_setg(errp, QERR_DEVICE_NO_HOTPLUG,
> +                   object_get_typename(OBJECT(dev)));
> +        return NULL;
> +    }
> +
> +    hotplug_ctrl = qdev_get_hotplug_handler(dev);
> +    /*
> +     * hotpluggable device MUST have HotplugHandler, if it doesn't
> +     * then something is very wrong with it.
> +     */
> +    g_assert(hotplug_ctrl);
> +
> +    return hotplug_handler_get_hotplug_state(hotplug_ctrl, dev, errp);
> +}
> +
>  void hmp_device_add(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
> @@ -1146,3 +1177,13 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>      }
>      return true;
>  }
> +
> +void qdev_hotplug_device_on_event(DeviceState *dev)
> +{
> +    if (dev->device_on_sent) {
> +        return;
> +    }
> +
> +    dev->device_on_sent = true;
> +    qapi_event_send_device_on(dev->id, dev->canonical_path);
> +}
> -- 
> 2.34.1


