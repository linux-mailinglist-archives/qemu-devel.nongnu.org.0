Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F286665F4FA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 21:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDWYe-0004oR-Gi; Thu, 05 Jan 2023 15:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pDWYd-0004oH-00
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pDWYa-00051R-E7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672949383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YM8ncv6XZh9vHVKI+kUZsS0Nm/DebyyPwjZqUEc1c+A=;
 b=DgBHlf3MQD1x0A8PxuPmChRt63ttDu/BywWjEJt4/ToNDsYYpRxywo+03rdV/YTC2ux+uj
 Nb5g9plBeNReo+mD6pp/jP50xm1nPE4S9Uh1IiuUVtwdW02Cuaxm+blpsZv3kPnkNLhiSZ
 UNB7QWn9XLRvq9WbzxZu2vZX7NkX8vs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-mDmR3wh4Pmq_puJ9DgqwHA-1; Thu, 05 Jan 2023 15:09:39 -0500
X-MC-Unique: mDmR3wh4Pmq_puJ9DgqwHA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso18401379wms.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 12:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YM8ncv6XZh9vHVKI+kUZsS0Nm/DebyyPwjZqUEc1c+A=;
 b=Qu32VJflsSz45s3V76qmS1iaUuQG37Q99X1FCkPypUHhgHutvEqF0YctTb64HrsxgA
 /FsSAbwvISqEY9LYP22tL05bhq2KltKpzrSWuHGmMvLWpQiSCeq+ok7c/ykhdhnY5KAr
 J8iS00Pyzd/q2bieqIycgpk+dQ0vjQNGhKLMXmcKhkLXkj+OIkPQuw1jH9LGBCsg38gp
 iT/gyOShrZih4zWeYZHoYmXQtveQ64qq0qn8mh9wSnZBBNvCjFjkBe0C34eTArmdtc+k
 SkOYg3dNhQuJdkp08j3lQwVmwWVjCBpD0JURFMYeQcnPujzzVn2Ox2A+GZc4FlLd/hYj
 SnMQ==
X-Gm-Message-State: AFqh2ko2cdGOe6KrxtUSvjouwjQ6QjfwZTMe9nK6xLTvFwGAdMYwGKXz
 R6iKdh0m6bhYgjXiEHQ6sEf06VED3e9yV9sSobem1+kbVuqQ/pfh+MMTjXwJEZpxfwQ5kuHudrV
 Dy7y7ODgu3w0PChM=
X-Received: by 2002:a05:600c:246:b0:3d3:3deb:d91f with SMTP id
 6-20020a05600c024600b003d33debd91fmr39914160wmj.5.1672949378245; 
 Thu, 05 Jan 2023 12:09:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvEMZZ20Rur0XqLxCE7rkZB7VFbsWBndMnyvQrWUEfsEW4ZaYiM5+c9ZbBx8AOj/IjZ5b0xw==
X-Received: by 2002:a05:600c:246:b0:3d3:3deb:d91f with SMTP id
 6-20020a05600c024600b003d33debd91fmr39914137wmj.5.1672949377979; 
 Thu, 05 Jan 2023 12:09:37 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n126-20020a1ca484000000b003d21759db42sm3599207wme.5.2023.01.05.12.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 12:09:37 -0800 (PST)
Date: Thu, 5 Jan 2023 20:09:34 +0000
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
Message-ID: <Y7cufupAAeGnaIDg@work-vm>
References: <20221230121235.1282915-1-dwmw2@infradead.org>
 <20221230121235.1282915-40-dwmw2@infradead.org>
 <Y7V1sdhAlhhSKp2F@work-vm>
 <10d798e3959dbeaacd67cc9cefa78b16ee524462.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d798e3959dbeaacd67cc9cefa78b16ee524462.camel@infradead.org>
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
> On Wed, 2023-01-04 at 12:48 +0000, Dr. David Alan Gilbert wrote:
> > * David Woodhouse (dwmw2@infradead.org) wrote:
> > > From: Joao Martins <joao.m.martins@oracle.com>
> > > 
> > > Specifically add listing, injection of event channels.
> > 
> > These are all for debug only aren't they?
> 
> Mostly. Injecting VIRQ_DEBUG into a guest is useful for debugging the
> guest too. Slightly inclined just to drop it as there's plenty of more
> useful things to implement, but let's have a go...

Note also, please put an x_ in the name (like qmp_x_query_ramblock)
to indicate that it's debug and you want the freedom to change the
structure/behaviour rather than carving the API in stone.

> > Even so, see docs/devel/writing-monitor-commands.rst, people like
> > commands to be built around qmp if possible now; there's a thing for
> > dumping text through it anyway for debug.
> 
> OK... something like this?

No; that's a bit of a mix:
The idea is that you either:
  a) Build the QMP with the data structure well defined like you've done
     and then make the HMP code monitor_printf that.

  b) Or you decide the data is mostly for debug and you can change it
when you like, and so the structure is unimportant; then you make the
  QMP side generate the HumanReadableText and just get the HMP side
  to print it.

An example of 'b' is qmp_x_query_ramblock' - note there's no actual HMP
code there and the qmp_x_query_ramblock is doing the HRT creation.

An example of 'a' is 'hmp_info_mice' which calls qmp_query_mice
and then prints it out.

Dave


> From ef1d7d08ee544921c056cc8f8c38bdd691cf71b4 Mon Sep 17 00:00:00 2001
> From: David Woodhouse <dwmw@amazon.co.uk>
> Date: Thu, 5 Jan 2023 19:34:15 +0000
> Subject: [PATCH] Convert xen-event-list to qmp
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  hmp-commands.hx          |  2 +-
>  hw/i386/kvm/xen_evtchn.c | 70 +++++++++++++++++++++++++++++++++++-----
>  hw/i386/kvm/xen_evtchn.h |  4 ++-
>  qapi/misc.json           | 68 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 134 insertions(+), 10 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index fd77c432c0..eac182307c 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1836,7 +1836,7 @@ ERST
>          .args_type  = "",
>          .params     = "",
>          .help       = "list event channel state",
> -        .cmd        = hmp_xen_event_list,
> +        .cmd_info_hrt = hmp_xen_event_list,
>      },
>  
>  SRST
> diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
> index c58237cdd2..ee50839804 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -15,6 +15,7 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-misc.h"
>  #include "qom/object.h"
>  #include "exec/target_page.h"
>  #include "exec/address-spaces.h"
> @@ -1539,21 +1540,22 @@ static const char *type_names[] = {
>      "ipi"
>  };
>  
> -void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
> +EvtchnInfoList *qmp_xen_event_list(Error **errp)
>  {
>      XenEvtchnState *s = xen_evtchn_singleton;
> +    EvtchnInfoList *head = NULL, **tail = &head;
>      void *shinfo, *pending, *mask;
>      int i;
>  
>      if (!s) {
> -        monitor_printf(mon, "Xen event channel emulation not enabled\n");
> -        return;
> +        error_setg(errp, "Xen event channel emulation not enabled\n");
> +        return NULL;
>      }
>  
>      shinfo = xen_overlay_get_shinfo_ptr();
>      if (!shinfo) {
> -        monitor_printf(mon, "Xen shared info page not allocated\n");
> -        return;
> +        error_setg(errp, "Xen shared info page not allocated\n");
> +        return NULL;
>      }
>      if (xen_is_long_mode()) {
>          pending = shinfo + offsetof(struct shared_info, evtchn_pending);
> @@ -1567,17 +1569,69 @@ void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
>  
>      for (i = 0; i < s->nr_ports; i++) {
>          XenEvtchnPort *p = &s->port_table[i];
> +        EvtchnInfo *info;
>  
>          if (p->type == EVTCHNSTAT_closed) {
>              continue;
>          }
>  
> -        monitor_printf(mon, "port %4u %s/%d vcpu:%d pending:%d mask:%d\n", i,
> -                       type_names[p->type], p->type_val, p->vcpu,
> -                       test_bit(i, pending), test_bit(i, mask));
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
>      }
>  
>      qemu_mutex_unlock(&s->port_lock);
> +
> +    return head;
> +}
> +
> +HumanReadableText *hmp_xen_event_list(Error **errp)
> +{
> +    EvtchnInfoList *iter, *info_list;
> +    g_autoptr(GString) buf = g_string_new("");
> +
> +
> +    info_list = qmp_xen_event_list(errp);
> +    if (*errp) {
> +        return NULL;
> +    }
> +
> +    for (iter = info_list; iter; iter = iter->next) {
> +        EvtchnInfo *info = iter->value;
> +
> +        g_string_append_printf(buf, "port %4lu: %s", info->port, info->type);
> +        if (strcmp(info->type, "ipi")) {
> +            g_string_append_printf(buf,  "(");
> +            if (info->remote_domain) {
> +                g_string_append_printf(buf, "%s:", info->remote_domain);
> +            }
> +            g_string_append_printf(buf, "%ld)", info->target);
> +        }
> +        g_string_append_printf(buf, " vcpu:%ld", info->vcpu);
> +        if (info->pending) {
> +            g_string_append_printf(buf, " PENDING");
> +        }
> +        if (info->masked) {
> +            g_string_append_printf(buf, " MASKED");
> +        }
> +        g_string_append_printf(buf, "\n");
> +    }
> +
> +    qapi_free_EvtchnInfoList(info_list);
> +    return human_readable_text_from_str(buf);
>  }
>  
>  void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
> diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
> index 146c504773..1d1ca64e6f 100644
> --- a/hw/i386/kvm/xen_evtchn.h
> +++ b/hw/i386/kvm/xen_evtchn.h
> @@ -12,6 +12,8 @@
>  #ifndef QEMU_XEN_EVTCHN_H
>  #define QEMU_XEN_EVTCHN_H
>  
> +#include "qapi/type-helpers.h"
> +
>  #include "hw/sysbus.h"
>  
>  typedef uint32_t evtchn_port_t;
> @@ -42,8 +44,8 @@ int xen_be_evtchn_pending(struct xenevtchn_handle *xc);
>  /* Apart from this which is a local addition */
>  int xen_be_evtchn_get_guest_port(struct xenevtchn_handle *xc);
>  
> -void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
>  void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
> +HumanReadableText *hmp_xen_event_list(Error **errp);
>  
>  struct evtchn_status;
>  struct evtchn_close;
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 27ef5a2b20..5c0f53cbc7 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -584,3 +584,70 @@
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
> +# Returns: list of open event channel ports
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
> +  'returns': ['EvtchnInfo'] }
> -- 
> 2.34.1
> 
> 


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


