Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D6D662F8B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:52:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExF6-00063I-Lr; Mon, 09 Jan 2023 13:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pExF0-00061L-Hl
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:51:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pExEy-0004qS-9G
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673290283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IUNeOdcA58VtHNO+tSessh+5naJNt/7dOuh6f+n9YsU=;
 b=YGKdAvCuxQvnpYMpARzOhDaW7+500k4c7onzBlW17z+GpDzci0IoPRHd8tLfVIW27fxMLL
 F3KQY6+f4KfBgAJ1Fir+JWAofU4jOOraCDFCqXYwbQOyvHpYPpe5+OQwFzp6e2uNPwQjmo
 gr35To2jMNgfSNMhcDcOxYSYgHEQ3QI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-kbmv5WaOPGqfrL1C3hKESw-1; Mon, 09 Jan 2023 13:51:22 -0500
X-MC-Unique: kbmv5WaOPGqfrL1C3hKESw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v23-20020a05600c215700b003d9e9974a05so2889066wml.8
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 10:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUNeOdcA58VtHNO+tSessh+5naJNt/7dOuh6f+n9YsU=;
 b=Jleeq0E3mxB5U2DAVYH40fYBE38PxcKVLToXd8vpA85Hof9R9EmlUI256fcUQnhjdR
 BuHqPo+wgzyyaOQEEO1ghA8OxYbXgwUuoFEB7rX52ugb1jF6U7acd8l6DCUC75YqfQ57
 4j+w4cNfkb+XZiv8AG6hh/xRTNyK74qA3HMRj1aD8oclzqx/9pXNE46InUqEgQZ0Eljt
 h/A5UzM7Vs7umjQCG+CLSUxMULc96XnnyTC6dIv1EJjRd8h3KNBMAI6IZR1JNT7PRgm1
 UYzJtPVLKjR3eJvclSXnAy+h0gVa0dRqecySCUtjy2lRJYoRnofYLO0qLMGFNX2gibas
 /xVw==
X-Gm-Message-State: AFqh2krLgh6EcJoerpPLCGmrdv6IQiuj8UMWgcs4CpZDp4JmZllvbS0s
 ip3awqN1n9grdlZRmaJhcx36ymv8+uBDKT+QwR1fgHLvxVdG0BSyxbg5Zjl5vek7hxwGXN9MR4T
 32ZnY0pcKNpWEZnE=
X-Received: by 2002:a05:600c:34d4:b0:3cf:a39f:eb2a with SMTP id
 d20-20020a05600c34d400b003cfa39feb2amr47073922wmq.11.1673290280954; 
 Mon, 09 Jan 2023 10:51:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8wjpQeVWkgnaB8FlcHZD81RtVjRrqnh7FhcmyC2Sx26ce8Yp7sEjW0a9nTNYNggNLVLNcAQ==
X-Received: by 2002:a05:600c:34d4:b0:3cf:a39f:eb2a with SMTP id
 d20-20020a05600c34d400b003cfa39feb2amr47073909wmq.11.1673290280754; 
 Mon, 09 Jan 2023 10:51:20 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c510800b003d9862ec435sm13398555wms.20.2023.01.09.10.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 10:51:20 -0800 (PST)
Date: Mon, 9 Jan 2023 18:51:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v5 39/52] i386/xen: add monitor commands to test
 event injection
Message-ID: <Y7xiJd1zpEktSaw7@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-40-dwmw2@infradead.org>
 <Y7V1sdhAlhhSKp2F@work-vm>
 <10d798e3959dbeaacd67cc9cefa78b16ee524462.camel@infradead.org>
 <Y7cufupAAeGnaIDg@work-vm>
 <e368402653af0d81593d892ab03ad9ed8f9540de.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e368402653af0d81593d892ab03ad9ed8f9540de.camel@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> On Thu, 2023-01-05 at 20:09 +0000, Dr. David Alan Gilbert wrote:
> > 
> > > OK... something like this?
> > 
> > No; that's a bit of a mix:
> > The idea is that you either:
> >   a) Build the QMP with the data structure well defined like you've done
> >      and then make the HMP code monitor_printf that.
> > 
> >   b) Or you decide the data is mostly for debug and you can change it
> > when you like, and so the structure is unimportant; then you make the
> >   QMP side generate the HumanReadableText and just get the HMP side
> >   to print it.
> > 
> > An example of 'b' is qmp_x_query_ramblock' - note there's no actual HMP
> > code there and the qmp_x_query_ramblock is doing the HRT creation.
> > 
> > An example of 'a' is 'hmp_info_mice' which calls qmp_query_mice
> > and then prints it out.
> 
> Thanks. Taking option 'a' then...

Yes that's mostly right, some minor comments on it:

> From bfe1273b17ea76c4f4087bd79f2b52ab6556ea80 Mon Sep 17 00:00:00 2001
> From: Joao Martins <joao.m.martins@oracle.com>
> Date: Tue, 21 Aug 2018 12:16:19 -0400
> Subject: [PATCH 38/64] i386/xen: add monitor commands to test event
> injection
> 
> Specifically add listing, injection of event channels.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hmp-commands.hx          |  29 +++++++++
>  hw/i386/kvm/meson.build  |   4 ++
>  hw/i386/kvm/xen-stubs.c  |  25 +++++++
>  hw/i386/kvm/xen_evtchn.c | 136 +++++++++++++++++++++++++++++++++++++++
>  hw/i386/kvm/xen_evtchn.h |   3 +
>  monitor/misc.c           |   4 ++
>  qapi/misc.json           | 109 +++++++++++++++++++++++++++++++
>  7 files changed, 310 insertions(+)
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

No \n on error_setg (and below)

> +    return NULL;
> +}
> +
> +void qmp_xen_event_inject(uint32_t port, Error **errp)
> +{
> +    error_setg(errp, "Xen event channel emulation not enabled\n");
> +}
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index 6b6df39978..d63ebe46df 100644
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
> @@ -1059,3 +1063,135 @@ int xen_evtchn_send_op(struct evtchn_send *send)
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

return;   ?

> +    }
> +
> +    if (!valid_port(port)) {
> +        error_setg(errp, "Invalid port %u", port);

and there?

> +    }
> +
> +    QEMU_LOCK_GUARD(&s->port_lock);
> +
> +    if (set_port_pending(s, port)) {
> +        error_setg(errp, "Failed to set port %d", port);

%u ?

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
> index 27ef5a2b20..1c3829c008 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -584,3 +584,92 @@
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
> +# @type: the port type
> +#
> +# @remote-domain: remote domain for interdomain ports

Missed vcpu?

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
> +	   'type': 'str',
> +	   'remote-domain': 'str',
> +	   'vcpu': 'int',
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
> 2.34.1
> 
> 


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


