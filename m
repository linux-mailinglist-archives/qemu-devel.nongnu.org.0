Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5A4665DE8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:31:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFc5P-0002PE-5B; Wed, 11 Jan 2023 09:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pFc5N-0002OO-3X
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:28:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pFc5K-0000Oy-Tq
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673447289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIMaFMtAJzZ0lZdpPNuYrBTYMzDY6bUqLinPN3k4Hpo=;
 b=C1z4ojUch1UuDzoArYANG8HcvwxrPUSP6LrkYfMLegmYQygc8XtAsPa8QGmbTA3XRI1szt
 u4A/t6hlosRihXkQ5EcmcyM9ZYXHWGeEnDe2KanDyhPBdrTdULbDmUBBiSRMR4f4NT7zse
 7WU20wVZC66drckWnYbt4v1a8lgY82o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-Zm5D6Q16OeWa0CMhR5DO3A-1; Wed, 11 Jan 2023 09:28:08 -0500
X-MC-Unique: Zm5D6Q16OeWa0CMhR5DO3A-1
Received: by mail-wr1-f70.google.com with SMTP id
 l18-20020adfa392000000b002bbd5c680a3so2283545wrb.14
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 06:28:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fIMaFMtAJzZ0lZdpPNuYrBTYMzDY6bUqLinPN3k4Hpo=;
 b=8HkfTV8oIrZP/V6wKnCftJ+5h937NzhbtPduk4Ocsq0HzkjSZLdlXeJ1noJgFR6Yiu
 WvZv7zBim8HrYrpv4lRls2kcq+/zFVnbmvO6kVCgcUEqMyCoDUY+uWcHkAJtLzZ++pxi
 d5MzsdaYRsFvlAHxDmj89vJeDvqDv1a2oe9xPaNlO20ym8+5+yVWULV869wFBsnl9kPV
 0EOargwA8YHeqjxkSxVuu4iiOQHGS4QcUc3uM4PzaYl7/eDGsfSKvZNMb9EE6vhQvNf/
 M/si0BzzqbC10qLZSWPr9iSicWO4st4uUQhA/FdnTNdIDzPIdXB5cw9PL+nE+QAcuWyI
 x4aA==
X-Gm-Message-State: AFqh2krs476QEvy7gMJs2bxxe2C/x+g/drXkGAJH1R22APKbkAmqBMrA
 HRtMppBMuGsc1/YnqRuoFVvMVpCqQDdlz4XltdBROuEsdlrbX8wKIZ4a60lcMAUzylSuBlp4p4I
 OZWqButsZJxT26q4=
X-Received: by 2002:a5d:4b42:0:b0:2bc:804a:d1bb with SMTP id
 w2-20020a5d4b42000000b002bc804ad1bbmr6533181wrs.49.1673447287346; 
 Wed, 11 Jan 2023 06:28:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLzQJ4l2Btar1dz7k2Xxq/Yu/4S/PZU8tdbl4UPOYzXSRo1XyWuMMF7yFMoxnmi7iccZodIg==
X-Received: by 2002:a5d:4b42:0:b0:2bc:804a:d1bb with SMTP id
 w2-20020a5d4b42000000b002bc804ad1bbmr6533162wrs.49.1673447287053; 
 Wed, 11 Jan 2023 06:28:07 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a5d6b0c000000b002366553eca7sm13882317wrw.83.2023.01.11.06.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 06:28:06 -0800 (PST)
Date: Wed, 11 Jan 2023 14:28:04 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>, armbru@redhat.com
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 38/51] i386/xen: add monitor commands to test event
 injection
Message-ID: <Y77HdMypq01YspY5@work-vm>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-39-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110122042.1562155-39-dwmw2@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* David Woodhouse (dwmw2@infradead.org) wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Specifically add listing, injection of event channels.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hmp-commands.hx          |  29 ++++++++
>  hw/i386/kvm/meson.build  |   4 ++
>  hw/i386/kvm/xen-stubs.c  |  25 +++++++
>  hw/i386/kvm/xen_evtchn.c | 138 +++++++++++++++++++++++++++++++++++++++
>  hw/i386/kvm/xen_evtchn.h |   3 +
>  monitor/misc.c           |   4 ++
>  qapi/misc.json           |  91 ++++++++++++++++++++++++++
>  7 files changed, 294 insertions(+)
>  create mode 100644 hw/i386/kvm/xen-stubs.c
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 673e39a697..fd77c432c0 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1815,3 +1815,32 @@ SRST
>    Dump the FDT in dtb format to *filename*.
>  ERST
>  #endif
> +
> +#if defined(CONFIG_XEN_EMU)
> +    {
> +        .name       = "xen-event-inject",
> +        .args_type  = "port:i",
> +        .params     = "port",
> +        .help       = "inject event channel",
> +        .cmd        = hmp_xen_event_inject,
> +    },
> +
> +SRST
> +``xen-event-inject`` *port*
> +  Notify guest via event channel on port *port*.
> +ERST
> +
> +
> +    {
> +        .name       = "xen-event-list",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "list event channel state",
> +        .cmd        = hmp_xen_event_list,
> +    },
> +
> +SRST
> +``xen-event-list``
> +  List event channels in the guest
> +ERST
> +#endif
> diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
> index cab64df339..577eb50a18 100644
> --- a/hw/i386/kvm/meson.build
> +++ b/hw/i386/kvm/meson.build
> @@ -10,3 +10,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
>    ))
>  
>  i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
> +
> +specific_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
> +  'xen-stubs.c',
> +))
> diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
> new file mode 100644
> index 0000000000..523cb5a831
> --- /dev/null
> +++ b/hw/i386/kvm/xen-stubs.c
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU Xen emulation: QMP stubs
> + *
> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * Authors: David Woodhouse <dwmw2@infradead.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-misc.h"
> +
> +EvtchnInfoList *qmp_xen_event_list(Error **errp)
> +{
> +    error_setg(errp, "Xen event channel emulation not enabled\n");
> +    return NULL;
> +}
> +
> +void qmp_xen_event_inject(uint32_t port, Error **errp)
> +{
> +    error_setg(errp, "Xen event channel emulation not enabled\n");

Those \n's are hanging in for dear life :-)

Other than that, I think fromt he HMP side we're OK, so 

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

cc'ing in armbru for QMP stuff.

Dave

> +}
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index 6b6df39978..a73db5d2bc 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -14,7 +14,11 @@
>  #include "qemu/module.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/log.h"
> +#include "monitor/monitor.h"
> +#include "monitor/hmp.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-misc.h"
> +#include "qapi/qmp/qdict.h"
>  #include "qom/object.h"
>  #include "exec/target_page.h"
>  #include "exec/address-spaces.h"
> @@ -1059,3 +1063,137 @@ int xen_evtchn_send_op(struct evtchn_send *send)
>      return ret;
>  }
>  
> +static const char *type_names[] = {
> +    "closed",
> +    "unbound",
> +    "interdomain",
> +    "pirq",
> +    "virq",
> +    "ipi"
> +};
> +
> +EvtchnInfoList *qmp_xen_event_list(Error **errp)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    EvtchnInfoList *head = NULL, **tail = &head;
> +    void *shinfo, *pending, *mask;
> +    int i;
> +
> +    if (!s) {
> +        error_setg(errp, "Xen event channel emulation not enabled");
> +        return NULL;
> +    }
> +
> +    shinfo = xen_overlay_get_shinfo_ptr();
> +    if (!shinfo) {
> +        error_setg(errp, "Xen shared info page not allocated");
> +        return NULL;
> +    }
> +    if (xen_is_long_mode()) {
> +        pending = shinfo + offsetof(struct shared_info, evtchn_pending);
> +        mask = shinfo + offsetof(struct shared_info, evtchn_mask);
> +    } else {
> +        pending = shinfo + offsetof(struct compat_shared_info, evtchn_pending);
> +        mask = shinfo + offsetof(struct compat_shared_info, evtchn_mask);
> +    }
> +
> +    QEMU_LOCK_GUARD(&s->port_lock);
> +
> +    for (i = 0; i < s->nr_ports; i++) {
> +        XenEvtchnPort *p = &s->port_table[i];
> +        EvtchnInfo *info;
> +
> +        if (p->type == EVTCHNSTAT_closed) {
> +            continue;
> +        }
> +
> +        info = g_new0(EvtchnInfo, 1);
> +
> +        info->port = i;
> +        info->type = g_strdup(type_names[p->type]);
> +        if (p->type == EVTCHNSTAT_interdomain) {
> +            info->remote_domain = g_strdup((p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) ?
> +                                           "qemu" : "loopback");
> +            info->target = p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
> +        } else {
> +            info->target = p->type_val;
> +        }
> +        info->vcpu = p->vcpu;
> +        info->pending = test_bit(i, pending);
> +        info->masked = test_bit(i, mask);
> +
> +        QAPI_LIST_APPEND(tail, info);
> +    }
> +
> +    return head;
> +}
> +
> +void qmp_xen_event_inject(uint32_t port, Error **errp)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +
> +    if (!s) {
> +        error_setg(errp, "Xen event channel emulation not enabled");
> +        return;
> +    }
> +
> +    if (!valid_port(port)) {
> +        error_setg(errp, "Invalid port %u", port);
> +    }
> +
> +    QEMU_LOCK_GUARD(&s->port_lock);
> +
> +    if (set_port_pending(s, port)) {
> +        error_setg(errp, "Failed to set port %u", port);
> +        return;
> +    }
> +}
> +
> +void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
> +{
> +    EvtchnInfoList *iter, *info_list;
> +    Error *err = NULL;
> +
> +    info_list = qmp_xen_event_list(&err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +
> +    for (iter = info_list; iter; iter = iter->next) {
> +        EvtchnInfo *info = iter->value;
> +
> +        monitor_printf(mon, "port %4lu: vcpu: %ld %s", info->port, info->vcpu,
> +                       info->type);
> +        if (strcmp(info->type, "ipi")) {
> +            monitor_printf(mon,  "(");
> +            if (info->remote_domain) {
> +                monitor_printf(mon, "%s:", info->remote_domain);
> +            }
> +            monitor_printf(mon, "%ld)", info->target);
> +        }
> +        if (info->pending) {
> +            monitor_printf(mon, " PENDING");
> +        }
> +        if (info->masked) {
> +            monitor_printf(mon, " MASKED");
> +        }
> +        monitor_printf(mon, "\n");
> +    }
> +
> +    qapi_free_EvtchnInfoList(info_list);
> +}
> +
> +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
> +{
> +    int port = qdict_get_int(qdict, "port");
> +    Error *err = NULL;
> +
> +    qmp_xen_event_inject(port, &err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +    } else {
> +        monitor_printf(mon, "Delivered port %d\n", port);
> +    }
> +}
> +
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> index 5d3e03553f..670f8b3f7d 100644
> --- a/hw/i386/kvm/xen_evtchn.h
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -16,6 +16,9 @@ void xen_evtchn_create(void);
>  int xen_evtchn_soft_reset(void);
>  int xen_evtchn_set_callback_param(uint64_t param);
>  
> +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
> +void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
> +
>  struct evtchn_status;
>  struct evtchn_close;
>  struct evtchn_unmask;
> diff --git a/monitor/misc.c b/monitor/misc.c
> index bf3f1c67ca..7d8c473ffb 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -82,6 +82,10 @@
>  /* Make devices configuration available for use in hmp-commands*.hx templates */
>  #include CONFIG_DEVICES
>  
> +#ifdef CONFIG_XEN_EMU
> +#include "hw/i386/kvm/xen_evtchn.h"
> +#endif
> +
>  /* file descriptors passed via SCM_RIGHTS */
>  typedef struct mon_fd_t mon_fd_t;
>  struct mon_fd_t {
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 27ef5a2b20..6284f86a5b 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -584,3 +584,94 @@
>  { 'event': 'VFU_CLIENT_HANGUP',
>    'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
>              'dev-id': 'str', 'dev-qom-path': 'str' } }
> +
> +##
> +# @EvtchnInfo:
> +#
> +# Information about a Xen event channel port
> +#
> +# @port: the port number
> +#
> +# @vcpu: target vCPU for this port
> +#
> +# @type: the port type
> +#
> +# @remote-domain: remote domain for interdomain ports
> +#
> +# @target: remote port ID, or virq/pirq number
> +#
> +# @pending: port is currently active pending delivery
> +#
> +# @masked: port is masked
> +#
> +# Since: x.xx
> +##
> +{ 'struct': 'EvtchnInfo',
> +  'data': {'port': 'int',
> +	   'vcpu': 'int',
> +	   'type': 'str',
> +	   'remote-domain': 'str',
> +	   'target': 'int',
> +	   'pending': 'bool',
> +	   'masked': 'bool'}}
> +
> +
> +##
> +# @xen-event-list:
> +#
> +# Query the Xen event channels opened by the guest.
> +#
> +# Returns: list of open event channel ports.
> +#
> +# Since: x.xx
> +#
> +# Example:
> +#
> +# -> { "execute": "xen-event-list" }
> +# <- { "return": [
> +#         {
> +#             "pending": false,
> +#             "port": 1,
> +#             "vcpu": 1,
> +#             "remote-domain": "qemu",
> +#             "masked": false,
> +#             "type": "interdomain",
> +#             "target": 1
> +#         },
> +#         {
> +#             "pending": false,
> +#             "port": 2,
> +#             "vcpu": 0,
> +#             "remote-domain": "",
> +#             "masked": false,
> +#             "type": "virq",
> +#             "target": 0
> +#         }
> +#      ]
> +#    }
> +#
> +##
> +{ 'command': 'xen-event-list',
> +  'returns': ['EvtchnInfo']
> +}
> +
> +##
> +# @xen-event-inject:
> +#
> +# Inject a Xen event channel port to the guest.
> +#
> +# @port: The port number
> +#
> +# Returns: - Nothing on success.
> +#
> +# Since: x.xx
> +#
> +# Example:
> +#
> +# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
> +# <- { "return": { } }
> +#
> +##
> +{ 'command': 'xen-event-inject',
> +  'data': { 'port': 'uint32' }
> +}
> -- 
> 2.35.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


