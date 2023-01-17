Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A702766DAA0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:10:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHiu7-0006EW-Dd; Tue, 17 Jan 2023 05:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHitr-0006CI-DC
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHitp-0004rn-0G
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673950139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybf9l0f+awjFr6016m5lSLMzPKS/1e1fu7X/HosN7X4=;
 b=WGcUoQoxkHLpoLkDoxAhmibewJ1kHYMLedOzQzxWcgy0XySXPAN69jzEzuOyQFntc6/Jbo
 lT8maL1S2ojIrXhFMFz1+rl4dZZ/pyUvQmO2WbbK1OTgIDt+kGK3JEeYxGsRvp3BfOu/TJ
 xpjYE88p8wf5xdceBYt0JsJpiZf4KEc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-dweALZGsN6SmZNR82-k00w-1; Tue, 17 Jan 2023 05:08:56 -0500
X-MC-Unique: dweALZGsN6SmZNR82-k00w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 000111C426AB;
 Tue, 17 Jan 2023 10:08:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C4782026D4B;
 Tue, 17 Jan 2023 10:08:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E06B21E6A28; Tue, 17 Jan 2023 11:08:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Paul
 Durrant <paul@xen.org>,  Joao Martins <joao.m.martins@oracle.com>,  Ankur
 Arora <ankur.a.arora@oracle.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Thomas Huth <thuth@redhat.com>,  Alex =?utf-8?Q?Ben?=
 =?utf-8?Q?n=C3=A9e?=
 <alex.bennee@linaro.org>,  Juan Quintela <quintela@redhat.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Claudio Fontana
 <cfontana@suse.de>,  Julien Grall <julien@xen.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 armbru@redhat.com
Subject: Re: [PATCH v7 38/51] i386/xen: add monitor commands to test event
 injection
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-39-dwmw2@infradead.org>
Date: Tue, 17 Jan 2023 11:08:54 +0100
In-Reply-To: <20230116215805.1123514-39-dwmw2@infradead.org> (David
 Woodhouse's message of "Mon, 16 Jan 2023 21:57:52 +0000")
Message-ID: <87mt6h4gnd.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

David Woodhouse <dwmw2@infradead.org> writes:

> From: Joao Martins <joao.m.martins@oracle.com>
>
> Specifically add listing, injection of event channels.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
> +        .name       =3D "xen-event-inject",
> +        .args_type  =3D "port:i",
> +        .params     =3D "port",
> +        .help       =3D "inject event channel",
> +        .cmd        =3D hmp_xen_event_inject,
> +    },
> +
> +SRST
> +``xen-event-inject`` *port*
> +  Notify guest via event channel on port *port*.
> +ERST
> +
> +
> +    {
> +        .name       =3D "xen-event-list",
> +        .args_type  =3D "",
> +        .params     =3D "",
> +        .help       =3D "list event channel state",
> +        .cmd        =3D hmp_xen_event_list,
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
>=20=20
>  i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
> +
> +specific_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
> +  'xen-stubs.c',
> +))
> diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
> new file mode 100644
> index 0000000000..6f433dc995
> --- /dev/null
> +++ b/hw/i386/kvm/xen-stubs.c
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU Xen emulation: QMP stubs
> + *
> + * Copyright =C2=A9 2023 Amazon.com, Inc. or its affiliates. All Rights =
Reserved.
> + *
> + * Authors: David Woodhouse <dwmw2@infradead.org>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-misc.h"
> +
> +EvtchnInfoList *qmp_xen_event_list(Error **errp)
> +{
> +    error_setg(errp, "Xen event channel emulation not enabled");
> +    return NULL;
> +}
> +
> +void qmp_xen_event_inject(uint32_t port, Error **errp)
> +{
> +    error_setg(errp, "Xen event channel emulation not enabled");
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
>=20=20
> +static const char *type_names[] =3D {
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
> +    XenEvtchnState *s =3D xen_evtchn_singleton;
> +    EvtchnInfoList *head =3D NULL, **tail =3D &head;
> +    void *shinfo, *pending, *mask;
> +    int i;
> +
> +    if (!s) {
> +        error_setg(errp, "Xen event channel emulation not enabled");
> +        return NULL;
> +    }
> +
> +    shinfo =3D xen_overlay_get_shinfo_ptr();
> +    if (!shinfo) {
> +        error_setg(errp, "Xen shared info page not allocated");
> +        return NULL;
> +    }

Suggest a blank line here.

> +    if (xen_is_long_mode()) {
> +        pending =3D shinfo + offsetof(struct shared_info, evtchn_pending=
);
> +        mask =3D shinfo + offsetof(struct shared_info, evtchn_mask);
> +    } else {
> +        pending =3D shinfo + offsetof(struct compat_shared_info, evtchn_=
pending);
> +        mask =3D shinfo + offsetof(struct compat_shared_info, evtchn_mas=
k);
> +    }
> +
> +    QEMU_LOCK_GUARD(&s->port_lock);
> +
> +    for (i =3D 0; i < s->nr_ports; i++) {
> +        XenEvtchnPort *p =3D &s->port_table[i];
> +        EvtchnInfo *info;
> +
> +        if (p->type =3D=3D EVTCHNSTAT_closed) {
> +            continue;
> +        }
> +
> +        info =3D g_new0(EvtchnInfo, 1);
> +
> +        info->port =3D i;
> +        info->type =3D g_strdup(type_names[p->type]);

What ensures p->type is in bounds?

> +        if (p->type =3D=3D EVTCHNSTAT_interdomain) {
> +            info->remote_domain =3D g_strdup((p->type_val & PORT_INFO_TY=
PEVAL_REMOTE_QEMU) ?
> +                                           "qemu" : "loopback");
> +            info->target =3D p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT=
_MASK;
> +        } else {
> +            info->target =3D p->type_val;
> +        }
> +        info->vcpu =3D p->vcpu;
> +        info->pending =3D test_bit(i, pending);
> +        info->masked =3D test_bit(i, mask);
> +
> +        QAPI_LIST_APPEND(tail, info);
> +    }
> +
> +    return head;
> +}
> +
> +void qmp_xen_event_inject(uint32_t port, Error **errp)
> +{
> +    XenEvtchnState *s =3D xen_evtchn_singleton;
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
> +    Error *err =3D NULL;
> +
> +    info_list =3D qmp_xen_event_list(&err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +
> +    for (iter =3D info_list; iter; iter =3D iter->next) {
> +        EvtchnInfo *info =3D iter->value;
> +
> +        monitor_printf(mon, "port %4lu: vcpu: %ld %s", info->port, info-=
>vcpu,
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
> +    int port =3D qdict_get_int(qdict, "port");
> +    Error *err =3D NULL;
> +
> +    qmp_xen_event_inject(port, &err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +    } else {
> +        monitor_printf(mon, "Delivered port %d\n", port);
> +    }
> +}
> +

In general, I prefer to keep HMP commands separate, say in
i386-kvm-hmp-cmds.c.  Not sure it's worth the trouble here.

> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> index 5d3e03553f..670f8b3f7d 100644
> --- a/hw/i386/kvm/xen_evtchn.h
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -16,6 +16,9 @@ void xen_evtchn_create(void);
>  int xen_evtchn_soft_reset(void);
>  int xen_evtchn_set_callback_param(uint64_t param);
>=20=20
> +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
> +void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
> +

Have you considered include/monitor/hmp.h?

>  struct evtchn_status;
>  struct evtchn_close;
>  struct evtchn_unmask;
> diff --git a/monitor/misc.c b/monitor/misc.c
> index bf3f1c67ca..7d8c473ffb 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -82,6 +82,10 @@
>  /* Make devices configuration available for use in hmp-commands*.hx temp=
lates */
>  #include CONFIG_DEVICES
>=20=20
> +#ifdef CONFIG_XEN_EMU
> +#include "hw/i386/kvm/xen_evtchn.h"
> +#endif
> +

Uh... what for?

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

"Since: 8.0.0" (with any luck).  More of the same below.

> +##
> +{ 'struct': 'EvtchnInfo',
> +  'data': {'port': 'int',
> +	   'vcpu': 'int',
> +	   'type': 'str',

Could we make this a QAPI enum?

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

Uh, "" is possible?  @remote-domain's doc string didn't prepare me for
that.  What does it mean?

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

Would it be useful to explain what it means to "inject a Xen event
channel port to the guest"?  I have no idea, but perhaps we believe
interested in this command should be able to explain it in their sleep.

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

Did you consider 'if': 'CONFIG_XEN'?

Hmm, it's target-dependent, so it would have to go into
misc-target.json.  qmp_xen_event_inject() then needs target-dependent
header qapi/qapi-commands-misc-target.h.  Fine if it's in a
target-dependent .c anyway.  Else it could be more trouble than it's
worth.


