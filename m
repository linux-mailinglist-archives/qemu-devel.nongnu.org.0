Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3653D69212C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:55:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUnP-00065Z-U8; Fri, 10 Feb 2023 09:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUnN-000658-Qf
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:54:37 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQUnL-00056L-FR
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:54:37 -0500
Received: by mail-wr1-x431.google.com with SMTP id co8so1576058wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MHYx6/XJNHeqvGdyUtlD7LsYlEPTsCrmiHtW3RmbCeM=;
 b=oSJY8PvLIqDL+5lma4SIUMI7LLQphCmrnzHJ+ZLyQTckE8vuSTzOn7zOd+kMGpCKY2
 4DRYZwi/akqTK+irabmFNAyDpe+Yx/N6J/JuI3OokFHKGm1fIp/+1vRom6sZI21kABi3
 08SUZcfvR6uW2TzhT/r6VEPl9qPj5FurkOAFY1dRNu5TmK7grMmn1NRjqizyEVGfRonJ
 wcAKJm0X13uMFV3wqiw0IQloOnc9T1X8r+DLwVAH9e8S+vBMIZ4yjbSy/c7ddyoB0Pd7
 CMijuipAt6k7kPo6jD8ybbJIcvu6metkY3bPjNnpawpSo0d9IOXQsgQHjRrhFSFxYQfA
 gRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHYx6/XJNHeqvGdyUtlD7LsYlEPTsCrmiHtW3RmbCeM=;
 b=5U5wkuhMyMcPPNlSJmqo+WM69e6G6YQytp2bcoUP+t+hxDbLnohJLmR1sv+bjkKEWr
 QYLfUkbcbLqcutaGBbvEj4vl44m3Ox4K63iDx6J+AVofkKUly3xJobJFq463Pp/wHTkB
 iPl01+XeDG5ikwr/z29Nawi6naKvmZtXwyU8QF3gYP8RH583W0nF1bPngxlRgOo4wP/O
 N2Mc5ZvD1sh7B6Vjw2JDrSRp4SOI9Xwge+z4e4RUjLfpkmpZMifKIyWzZ6o6BihroF9S
 FXSljXUtqSeUBR1tQmRiEWj2HT4nxydrVk4z4zAjyUoEKJ0qBjD1BK6uv5pqtUlIdjUq
 h27Q==
X-Gm-Message-State: AO0yUKVmSdF+87JHFeVr9MY7uxKwLaeHzcf+Z1bCFnKVuAykZGpR5g30
 UHw80IcydYLS+Hjkc7ex3fE=
X-Google-Smtp-Source: AK7set8AqhaVZb9gMaD+4AYJgbZX8FzTjueLi8FmfOhUkHA7xXVGWRUL6kUqM2aK2bg4G/uF2iTiyw==
X-Received: by 2002:a5d:4e0f:0:b0:2c3:be89:7c36 with SMTP id
 p15-20020a5d4e0f000000b002c3be897c36mr7508598wrt.25.1676040873729; 
 Fri, 10 Feb 2023 06:54:33 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a5d63cd000000b002c3f0e94e94sm3789845wrw.14.2023.02.10.06.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:54:33 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <be2420d5-b267-9e9b-d3e6-cdfa30d57640@xen.org>
Date: Fri, 10 Feb 2023 14:54:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 39/59] i386/xen: add monitor commands to test event
 injection
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-40-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-40-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Specifically add listing, injection of event channels.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   hmp-commands.hx          |  29 +++++++++
>   hw/i386/kvm/xen_evtchn.c | 137 +++++++++++++++++++++++++++++++++++++++
>   include/monitor/hmp.h    |   2 +
>   qapi/misc-target.json    | 116 +++++++++++++++++++++++++++++++++
>   4 files changed, 284 insertions(+)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 673e39a697..fd77c432c0 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1815,3 +1815,32 @@ SRST
>     Dump the FDT in dtb format to *filename*.
>   ERST
>   #endif
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
> index 9b1fb47e85..fa54d185cd 100644
> --- a/hw/i386/kvm/xen_evtchn.c
> +++ b/hw/i386/kvm/xen_evtchn.c
> @@ -15,7 +15,11 @@
>   #include "qemu/lockable.h"
>   #include "qemu/main-loop.h"
>   #include "qemu/log.h"
> +#include "monitor/monitor.h"
> +#include "monitor/hmp.h"
>   #include "qapi/error.h"
> +#include "qapi/qapi-commands-misc-target.h"
> +#include "qapi/qmp/qdict.h"
>   #include "qom/object.h"
>   #include "exec/target_page.h"
>   #include "exec/address-spaces.h"
> @@ -1067,3 +1071,136 @@ int xen_evtchn_send_op(struct evtchn_send *send)
>       return ret;
>   }
>   
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
> +
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
> +        qemu_build_assert(EVTCHN_PORT_TYPE_CLOSED == EVTCHNSTAT_closed);
> +        qemu_build_assert(EVTCHN_PORT_TYPE_UNBOUND == EVTCHNSTAT_unbound);
> +        qemu_build_assert(EVTCHN_PORT_TYPE_INTERDOMAIN == EVTCHNSTAT_interdomain);
> +        qemu_build_assert(EVTCHN_PORT_TYPE_PIRQ == EVTCHNSTAT_pirq);
> +        qemu_build_assert(EVTCHN_PORT_TYPE_VIRQ == EVTCHNSTAT_virq);
> +        qemu_build_assert(EVTCHN_PORT_TYPE_IPI == EVTCHNSTAT_ipi);
> +
> +        info->type = p->type;
> +        if (p->type == EVTCHNSTAT_interdomain) {
> +            info->remote_domain = g_strdup((p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) ?
> +                                           "qemu" : "loopback");
> +            info->target = p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
> +        } else {
> +            info->target = p->type_val;
> +        }

Given that this patch only provides a command to inject an event on a 
specific port, I think it's be useful to have the target field report 
the type of a VIRQ. PV drivers often hook VIRQ_DEBUG for dumping debug 
info, so knowing which of the VIRQ ports that is would be useful.

   Paul

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
> +                       EvtchnPortType_str(info->type));
> +        if (info->type != EVTCHN_PORT_TYPE_IPI) {
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
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 1b3bdcb446..cbc6e9bb91 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -108,6 +108,8 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict);
>   void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
>   void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
>   void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
> +void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
> +void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
>   void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
>   void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
>   void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 5b6a8e9185..652e6e0b37 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -380,3 +380,119 @@
>   #
>   ##
>   { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
> +
> +
> +##
> +# @EvtchnPortType:
> +#
> +# An enumeration of Xen event channel port types.
> +#
> +# @closed: The port is unused.
> +#
> +# @unbound: The port is allocated and ready to be bound.
> +#
> +# @interdomain: The port is connected as an interdomain interrupt.
> +#
> +# @pirq: The port is bound to a physical IRQ (PIRQ).
> +#
> +# @virq: The port is bound to a virtual IRQ (VIRQ).
> +#
> +# @ipi: The post is an inter-processor interrupt (IPI).
> +#
> +# Since: 8.0.0
> +##
> +{ 'enum': 'EvtchnPortType',
> +  'data': ['closed', 'unbound', 'interdomain', 'pirq', 'virq', 'ipi'],
> +  'if': 'TARGET_I386' }
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
> +# Since: 8.0.0
> +##
> +{ 'struct': 'EvtchnInfo',
> +  'data': {'port': 'int',
> +           'vcpu': 'int',
> +           'type': 'EvtchnPortType',
> +           'remote-domain': 'str',
> +           'target': 'int',
> +           'pending': 'bool',
> +           'masked': 'bool'},
> +  'if': 'TARGET_I386' }
> +
> +
> +##
> +# @xen-event-list:
> +#
> +# Query the Xen event channels opened by the guest.
> +#
> +# Returns: list of open event channel ports.
> +#
> +# Since: 8.0.0
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
> +  'returns': ['EvtchnInfo'],
> +  'if': 'TARGET_I386' }
> +
> +##
> +# @xen-event-inject:
> +#
> +# Inject a Xen event channel port (interrupt) to the guest.
> +#
> +# @port: The port number
> +#
> +# Returns: - Nothing on success.
> +#
> +# Since: 8.0.0
> +#
> +# Example:
> +#
> +# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
> +# <- { "return": { } }
> +#
> +##
> +{ 'command': 'xen-event-inject',
> +  'data': { 'port': 'uint32' },
> +  'if': 'TARGET_I386' }


