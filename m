Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2C406415
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 02:55:00 +0200 (CEST)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOUok-0007MD-Vb
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 20:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOUn8-0005oM-QM; Thu, 09 Sep 2021 20:53:18 -0400
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:45023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1mOUn6-0008LJ-NY; Thu, 09 Sep 2021 20:53:18 -0400
Received: by mail-oo1-xc33.google.com with SMTP id
 k18-20020a4abd92000000b002915ed21fb8so44767oop.11; 
 Thu, 09 Sep 2021 17:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=tshU4XDo3hmiXQCLLozH0C6gk17IYKv00GQH6NCDqsg=;
 b=dhQdCm1Z1KF5ZvPsn7Ykv7r3oRtbgQh0rshuCx3r3frQkLfhs9K3EzQuRPB5AI+Rl7
 tcteyRxup/b/mzCuym0bnhkFEZEiszaPhkj7Oe6ShqDi2ryxan8XNFectjnGFYqlVjhm
 xlrftrSnlNkyIIiGWtSndpcPv1sFAIAN3+8i9h87iQlPnm+oSDENuYCEJx6DTsZ9T0+k
 GQ1JaDYLuiHCuzj/dtFQKqEJsAY43Q2OL0U2e8ewtIHS0qTLdfsmdqQ6oYu75m/ycVjv
 NNHAUcPJE/HH/0HPvBViHGBOsXlEBJRmd9oSxjL4K0mImOBX1zO/vxQ084hZsQXorNzl
 skpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=tshU4XDo3hmiXQCLLozH0C6gk17IYKv00GQH6NCDqsg=;
 b=qufxsHu6spN1et8m7yLsbDp+c7aMTDa3UnCI4g0ve4QBsoK/njuzwL/XYJXEb0tQ6n
 JzinvK3TIU1/x1F2ZZ3ho0XqoZRnD2KoGYxFzFZzNHLelnix3Vqz9U4J3g3eQurTA9U5
 LgxjeR+1CpeWkqhTeHgpd5wUX5igecV9X5QdKP4xI8NKGv9ybcmkR+ggCPwoqW+1Pe2g
 3pwYGjTG0FMNF1B7NWnkXGr+EievqzxnLzjS0Hu0Pg9NjJoFvOXvyIM4OCPki7T9BKjQ
 yNzH7g9GPbhSridyUc671IXBNDDTRxDDx4QISR+hTxcMX5Ar48eRRdj+mJEB9RXLjjAs
 lX1A==
X-Gm-Message-State: AOAM530oc0KVK4/Y1I12d+gaqBDr68fS9LgB9WFUxPJZC+T7szTEFDJV
 yFjkHmYYXCWKG6n+LP/g6g==
X-Google-Smtp-Source: ABdhPJwlE/beYo67nat3VTGq4eaHsVUQ3KviyZKnE25i36/yBDx7cQZRcGolT9CczJsrU5htmKHMAw==
X-Received: by 2002:a4a:245c:: with SMTP id v28mr2168739oov.3.1631235194838;
 Thu, 09 Sep 2021 17:53:14 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id t30sm854719oiw.42.2021.09.09.17.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 17:53:13 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:c5ab:34b3:4e95:9c80])
 by serve.minyard.net (Postfix) with ESMTPSA id D8DF81800ED;
 Fri, 10 Sep 2021 00:53:12 +0000 (UTC)
Date: Thu, 9 Sep 2021 19:53:11 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 7/8] hw/ipmi: Add an IPMI external host device
Message-ID: <20210910005311.GR545073@minyard.net>
References: <20210909230620.511815-1-wuhaotsh@google.com>
 <20210909230620.511815-8-wuhaotsh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909230620.511815-8-wuhaotsh@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: peter.maydell@linaro.org, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 04:06:19PM -0700, Hao Wu wrote:
> The IPMI external host device works for Baseband Management Controller
> (BMC) emulations. It works as a representation of a host class that
> connects to a given BMC.  It can connect to a real host hardware or a
> emulated or simulated host device. In particular it can connect to a
> host QEMU instance with device ipmi-bmc-extern.

This is reasonable, I think.

The terminology here is confusing, though.  I'm not sure exactly what to
do about it.  So we have right now:

  host interfaces - KCS, BT, SSIF
  bmc - either an emulated or extern BMC the host talks to

And what you are proposing is:

  core - anything that supplies IPMI message for processing by
    the code in the VM.  So this is the internal/external BMC
    and the bmc-side of things.
  bmc - either an emulated or extern BMC the host talks to
  bmc-side - Receives messages from a host running ipmi_bmc_extern
  interfaces - KCS, BT, SSIF, and the interface to the bmc-side
    VM.

What I would propose is something like:

  core - anything that supplies IPMI message for processing by
    the code in the VM.  So this is the internal/external BMC
    and the bmc-side of things.
  bmc-host - either an emulated or extern BMC the host talks to
  bmc-client - Receives messages from a host running ipmi_bmc_extern
  interfaces - All IPMI interfaces
  interfaces-host - KCS, BT, SSIF
  interfaces-client - the interface to the bmc-side VM.

I'm not too excited about the name "client", though.  But I think a
class hierarchy like above would be more clear about what things are,
and it's not that different than what you are proposing.

I'm really just thinking out loud, though.

-corey

> 
> For more details of IPMI host device in BMC emulation, see
> docs/specs/ipmi.rst.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  configs/devices/arm-softmmu/default.mak |   2 +
>  hw/ipmi/Kconfig                         |   5 +
>  hw/ipmi/ipmi_extern.c                   |  18 ++-
>  hw/ipmi/ipmi_host_extern.c              | 170 ++++++++++++++++++++++++
>  hw/ipmi/meson.build                     |   1 +
>  5 files changed, 194 insertions(+), 2 deletions(-)
>  create mode 100644 hw/ipmi/ipmi_host_extern.c
> 
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index 6985a25377..82f0c6f8c3 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -25,6 +25,8 @@ CONFIG_GUMSTIX=y
>  CONFIG_SPITZ=y
>  CONFIG_TOSA=y
>  CONFIG_Z2=y
> +CONFIG_IPMI=y
> +CONFIG_IPMI_HOST=y
>  CONFIG_NPCM7XX=y
>  CONFIG_COLLIE=y
>  CONFIG_ASPEED_SOC=y
> diff --git a/hw/ipmi/Kconfig b/hw/ipmi/Kconfig
> index 9befd4f422..6722b1fbb0 100644
> --- a/hw/ipmi/Kconfig
> +++ b/hw/ipmi/Kconfig
> @@ -11,6 +11,11 @@ config IPMI_EXTERN
>      default y
>      depends on IPMI
>  
> +config IPMI_HOST
> +    bool
> +    default y
> +    depends on IPMI
> +
>  config ISA_IPMI_KCS
>      bool
>      depends on ISA_BUS
> diff --git a/hw/ipmi/ipmi_extern.c b/hw/ipmi/ipmi_extern.c
> index 97dfed085f..0952dc5992 100644
> --- a/hw/ipmi/ipmi_extern.c
> +++ b/hw/ipmi/ipmi_extern.c
> @@ -145,11 +145,25 @@ void ipmi_extern_handle_command(IPMIExtern *ibe,
>      if (err) {
>          IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
>          unsigned char rsp[3];
> +
>          rsp[0] = cmd[0] | 0x04;
>          rsp[1] = cmd[1];
>          rsp[2] = err;
> -        ibe->waiting_rsp = false;
> -        k->handle_msg(s, msg_id, rsp, 3);
> +
> +        if (ibe->bmc_side) {
> +            /* For BMC Side, send out an error message. */
> +            addchar(ibe, msg_id);
> +            for (i = 0; i < 3; ++i) {
> +                addchar(ibe, rsp[i]);
> +            }
> +            csum = ipmb_checksum(&msg_id, 1, 0);
> +            addchar(ibe, -ipmb_checksum(rsp, 3, csum));
> +            continue_send(ibe);
> +        } else {
> +            /* For Core side, handle an error message. */
> +            ibe->waiting_rsp = false;
> +            k->handle_msg(s, msg_id, rsp, 3);
> +        }
>          goto out;
>      }
>  
> diff --git a/hw/ipmi/ipmi_host_extern.c b/hw/ipmi/ipmi_host_extern.c
> new file mode 100644
> index 0000000000..4530631901
> --- /dev/null
> +++ b/hw/ipmi/ipmi_host_extern.c
> @@ -0,0 +1,170 @@
> +/*
> + * IPMI Host external connection
> + *
> + * Copyright 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +/*
> + * This is designed to connect to a host QEMU VM that runs ipmi_bmc_extern.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +#include "chardev/char-fe.h"
> +#include "hw/ipmi/ipmi.h"
> +#include "hw/ipmi/ipmi_extern.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "migration/vmstate.h"
> +#include "qom/object.h"
> +
> +#define TYPE_IPMI_HOST_EXTERN "ipmi-host-extern"
> +OBJECT_DECLARE_SIMPLE_TYPE(IPMIHostExtern, IPMI_HOST_EXTERN)
> +
> +typedef struct IPMIHostExtern {
> +    IPMICore parent;
> +
> +    IPMIExtern conn;
> +
> +    IPMIInterface *responder;
> +
> +    uint8_t capability;
> +} IPMIHostExtern;
> +
> +/*
> + * Handle a command (typically IPMI response) from IPMI interface
> + * and send it out to the external host.
> + */
> +static void ipmi_host_extern_handle_command(IPMICore *h, uint8_t *cmd,
> +        unsigned cmd_len, unsigned max_cmd_len, uint8_t msg_id)
> +{
> +    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(h);
> +
> +    ipmi_extern_handle_command(&ihe->conn, cmd, cmd_len, max_cmd_len, msg_id);
> +}
> +
> +/* This function handles a control command from the host. */
> +static void ipmi_host_extern_handle_hw_op(IPMICore *ic, uint8_t cmd,
> +                                          uint8_t operand)
> +{
> +    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(ic);
> +
> +    switch (cmd) {
> +    case VM_CMD_VERSION:
> +        /* The host informs us the protocol version. */
> +        if (unlikely(operand != VM_PROTOCOL_VERSION)) {
> +            ipmi_debug("Host protocol version %u is different from our version"
> +                    " %u\n", operand, VM_PROTOCOL_VERSION);
> +        }
> +        break;
> +
> +    case VM_CMD_RESET:
> +        /* The host tells us a reset has happened. */
> +        break;
> +
> +    case VM_CMD_CAPABILITIES:
> +        /* The host tells us its capability. */
> +        ihe->capability = operand;
> +        break;
> +
> +    default:
> +        /* The host shouldn't send us this command. Just ignore if they do. */
> +        ipmi_debug("Host cmd type %02x is invalid.\n", cmd);
> +        break;
> +    }
> +}
> +
> +static void ipmi_host_extern_realize(DeviceState *dev, Error **errp)
> +{
> +    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(dev);
> +    IPMIInterfaceClass *rk;
> +
> +    if (ihe->responder == NULL) {
> +        error_setg(errp, "IPMI host extern requires responder attribute");
> +        return;
> +    }
> +    rk = IPMI_INTERFACE_GET_CLASS(ihe->responder);
> +    rk->set_ipmi_handler(ihe->responder, IPMI_CORE(ihe));
> +    ihe->conn.core->intf = ihe->responder;
> +
> +    if (!qdev_realize(DEVICE(&ihe->conn), NULL, errp)) {
> +        return;
> +    }
> +}
> +
> +static int ipmi_host_extern_post_migrate(void *opaque, int version_id)
> +{
> +    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(opaque);
> +
> +    return ipmi_extern_post_migrate(&ihe->conn, version_id);
> +}
> +
> +static const VMStateDescription vmstate_ipmi_host_extern = {
> +    .name = TYPE_IPMI_HOST_EXTERN,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .post_load = ipmi_host_extern_post_migrate,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_UINT8(capability, IPMIHostExtern),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void ipmi_host_extern_init(Object *obj)
> +{
> +    IPMICore *ic = IPMI_CORE(obj);
> +    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(obj);
> +
> +    object_initialize_child(obj, "extern", &ihe->conn,
> +                            TYPE_IPMI_EXTERN);
> +    ihe->conn.core = ic;
> +    ihe->conn.bmc_side = true;
> +    vmstate_register(NULL, 0, &vmstate_ipmi_host_extern, ihe);
> +}
> +
> +static Property ipmi_host_extern_properties[] = {
> +    DEFINE_PROP_CHR("chardev", IPMIHostExtern, conn.chr),
> +    DEFINE_PROP_LINK("responder", IPMIHostExtern, responder,
> +                     TYPE_IPMI_INTERFACE, IPMIInterface *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ipmi_host_extern_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
> +
> +    device_class_set_props(dc, ipmi_host_extern_properties);
> +
> +    ck->handle_command = ipmi_host_extern_handle_command;
> +    ck->handle_hw_op = ipmi_host_extern_handle_hw_op;
> +    dc->hotpluggable = false;
> +    dc->realize = ipmi_host_extern_realize;
> +}
> +
> +static const TypeInfo ipmi_host_extern_type = {
> +    .name          = TYPE_IPMI_HOST_EXTERN,
> +    .parent        = TYPE_IPMI_CORE,
> +    .instance_size = sizeof(IPMIHostExtern),
> +    .instance_init = ipmi_host_extern_init,
> +    .class_init    = ipmi_host_extern_class_init,
> +};
> +
> +static void ipmi_host_extern_register_types(void)
> +{
> +    type_register_static(&ipmi_host_extern_type);
> +}
> +
> +type_init(ipmi_host_extern_register_types)
> diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
> index edd0bf9af9..b1dd4710dc 100644
> --- a/hw/ipmi/meson.build
> +++ b/hw/ipmi/meson.build
> @@ -7,5 +7,6 @@ ipmi_ss.add(when: 'CONFIG_PCI_IPMI_KCS', if_true: files('pci_ipmi_kcs.c'))
>  ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
>  ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
>  ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
> +ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host_extern.c'))
>  
>  softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
> -- 
> 2.33.0.309.g3052b89438-goog
> 

