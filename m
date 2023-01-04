Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181265D301
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD3Cb-00009Z-0H; Wed, 04 Jan 2023 07:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD3CU-00005L-Id
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pD3CS-0004CC-HR
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672836535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lFL8EDyNLgzQJU4JFvHFI+mvKfdYK56f9cKsn7e3tdM=;
 b=D5NXG20DOHvVQSzRgFxSeGZ7ru+Kbhh7joDgy0zM7dFViNXSL5/AYlsOLzhTDFklcv9Sk5
 7HOyBefE3wQ1c11+8dfaSgbAPPZphkIniIgpqUTHaF9ck0IysPPFGiXFcWFA0W0TkezgZ0
 CeoohUcavz8+el92b+MNbgXoEBQ4RPc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-_aOs7edcP1CNZEYFIkgPug-1; Wed, 04 Jan 2023 07:48:54 -0500
X-MC-Unique: _aOs7edcP1CNZEYFIkgPug-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020adfa10e000000b002631c56fe26so4175952wro.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:48:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lFL8EDyNLgzQJU4JFvHFI+mvKfdYK56f9cKsn7e3tdM=;
 b=3cyQ61Pws8s1zSBq37ncS3X3l57YBrwsCdjahFr8SjB1X0I0FFbk7SEiazRuHAP4G8
 xriWcvNbnkWvIdZsEm9Z+2UQmCm5C0iQISFod0Wi3uDbYVwLmB2jTSnFYS3tAN8I94jN
 q1rLrYPlAmL4ZI59uSZoGYi/zTLyE0OGT1SocZ1+i91a5+DbgNDT/b2KNaga+bTw9A/a
 CA0Z+u/wzHNfHq3avuFyOqbUxR2HigUoJLSRm1B3XqorYymijXPxO6+bSFcjbO+bnFaG
 sud7YerTfwIBa0JQj+vGRSK2f4jKBcbgHTzTH07KbvhTrF7gQN54u2gStIFYbSG0iQcz
 ys8A==
X-Gm-Message-State: AFqh2kq4UEsES87YWSFGfasUysC3knhA7OkI2jzp02g0QAd4un2QTYK3
 O8BAE8jFehsyWGLtYIXp2aWsNUZ9I6cA/rKfojAk/Cg2984tUarSv0SYMks0jHT7bwp+nh3rXZG
 EnwS8OT3mz/FC+CI=
X-Received: by 2002:a5d:6049:0:b0:2a6:4dfb:80c8 with SMTP id
 j9-20020a5d6049000000b002a64dfb80c8mr981901wrt.19.1672836532431; 
 Wed, 04 Jan 2023 04:48:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu95KVzgdJ9XnaIEZmsaGZ0YkEJ9qGnp3Gb4aY1AXRet0rPu0EebXOk3g+Eg88x9Qze3ylsxQ==
X-Received: by 2002:a5d:6049:0:b0:2a6:4dfb:80c8 with SMTP id
 j9-20020a5d6049000000b002a64dfb80c8mr981879wrt.19.1672836532152; 
 Wed, 04 Jan 2023 04:48:52 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b00241d544c9b1sm20244787wrj.90.2023.01.04.04.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 04:48:51 -0800 (PST)
Date: Wed, 4 Jan 2023 12:48:49 +0000
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
Message-ID: <Y7V1sdhAlhhSKp2F@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-40-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230121235.1282915-40-dwmw2@infradead.org>
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

These are all for debug only aren't they?

Even so, see docs/devel/writing-monitor-commands.rst, people like
commands to be built around qmp if possible now; there's a thing for
dumping text through it anyway for debug.


> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hmp-commands.hx          | 29 ++++++++++++++
>  hw/i386/kvm/xen_evtchn.c | 83 ++++++++++++++++++++++++++++++++++++++++
>  hw/i386/kvm/xen_evtchn.h |  3 ++
>  monitor/misc.c           |  4 ++
>  4 files changed, 119 insertions(+)
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
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index cdf7d86da8..87136334f5 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -19,6 +19,8 @@
>  #include "exec/target_page.h"
>  #include "exec/address-spaces.h"
>  #include "migration/vmstate.h"
> +#include "monitor/monitor.h"
> +#include "qapi/qmp/qdict.h"
>  
>  #include "hw/sysbus.h"
>  #include "hw/xen/xen.h"
> @@ -1061,3 +1063,84 @@ int xen_evtchn_send_op(struct evtchn_send *send)
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
> +void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    void *shinfo, *pending, *mask;
> +    int i;
> +
> +    if (!s) {
> +        monitor_printf(mon, "Xen event channel emulation not enabled\n");
> +        return;
> +    }
> +
> +    shinfo = xen_overlay_get_shinfo_ptr();
> +    if (!shinfo) {
> +        monitor_printf(mon, "Xen shared info page not allocated\n");
> +        return;
> +    }
> +    if (xen_is_long_mode()) {
> +        pending = shinfo + offsetof(struct shared_info, evtchn_pending);
> +        mask = shinfo + offsetof(struct shared_info, evtchn_mask);
> +    } else {
> +        pending = shinfo + offsetof(struct compat_shared_info, evtchn_pending);
> +        mask = shinfo + offsetof(struct compat_shared_info, evtchn_mask);
> +    }
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    for (i = 0; i < s->nr_ports; i++) {
> +        XenEvtchnPort *p = &s->port_table[i];
> +
> +        if (p->type == EVTCHNSTAT_closed) {
> +            continue;
> +        }
> +
> +        monitor_printf(mon, "port %4u %s/%d vcpu:%d pending:%d mask:%d\n", i,
> +                       type_names[p->type], p->type_val, p->vcpu,
> +                       test_bit(i, pending), test_bit(i, mask));
> +    }
> +
> +    qemu_mutex_unlock(&s->port_lock);
> +}
> +
> +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
> +{
> +    XenEvtchnState *s = xen_evtchn_singleton;
> +    int port = qdict_get_int(qdict, "port");
> +    XenEvtchnPort *p;
> +
> +    if (!s) {
> +        monitor_printf(mon, "Xen event channel emulation not enabled\n");
> +        return;
> +    }
> +
> +    if (!valid_port(port)) {
> +        monitor_printf(mon, "Invalid port %d\n", port);
> +        return;
> +    }
> +    p = &s->port_table[port];
> +
> +    qemu_mutex_lock(&s->port_lock);
> +
> +    monitor_printf(mon, "port %4u %s/%d vcpu:%d\n", port,
> +                   type_names[p->type], p->type_val, p->vcpu);

Do you want a helper to check p->type before looking it up in the array?

Dave

> +
> +    if (set_port_pending(s, port)) {
> +        monitor_printf(mon, "Failed to set port %d\n", port);
> +    } else {
> +        monitor_printf(mon, "Delivered port %d\n", port);
> +    }
> +
> +    qemu_mutex_unlock(&s->port_lock);
> +}
> +
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> index 5d3e03553f..1de53daa52 100644
> --- a/hw/i386/kvm/xen_evtchn.h
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -16,6 +16,9 @@ void xen_evtchn_create(void);
>  int xen_evtchn_soft_reset(void);
>  int xen_evtchn_set_callback_param(uint64_t param);
>  
> +void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
> +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
> +
>  struct evtchn_status;
>  struct evtchn_close;
>  struct evtchn_unmask;
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 205487e2b9..2b11c0f86a 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -88,6 +88,10 @@
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
> -- 
> 2.35.3
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


