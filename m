Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697F540C97
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 20:38:06 +0200 (CEST)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nye5d-0005VF-0q
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 14:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nye3d-0004WY-K2
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 14:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nye3Y-0004sN-UG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 14:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654626955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qmZvP5Z7vUdxHOlMWG6GfPo/UmTnSXx/bwLgG4T29bg=;
 b=M0H3Rf0WlcS9CMG+P/gsMOe43XxJu3WDpGLj5eaHnFXqzuCAF+wSwGTVPFaqDYmVO369RG
 2O8NdJSCN1JgFIrS92jvtYlL1ytgJbkQq/OYeM1fA0vSSSZXlqwyzUT33yktN8x5FjiE2W
 wWNp2bzDusFv+kyERG8cE8dW+JFoMbQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-NGEGPkEKNRi8Ct8ICVVRyg-1; Tue, 07 Jun 2022 14:35:54 -0400
X-MC-Unique: NGEGPkEKNRi8Ct8ICVVRyg-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi22-20020a05600c3d9600b0039c4144992cso5158019wmb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 11:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qmZvP5Z7vUdxHOlMWG6GfPo/UmTnSXx/bwLgG4T29bg=;
 b=dKNOIitwjLxKa7rognbF44SjNtXVfn3CCf0ilobDCOvWCzbcq2jTlF+IF1B/jYBUD6
 RxjDX0ZupRIo2LkUplO1gOhQAgR7+jDVq8W1FkFnUnTI69/weKDcgcqYsJYmXicDrd4k
 dQAG4LkzlDCcTm2wmdDc9PjezAYsVzK66Ku3m5DsWhcaAoLlvata+UZHRcm806vbnHDy
 kd4dAWAB8xOrW6HJhu3uWNN2rWUYc+gFTc7bVVmCB/7eUstqxMPPF4T2A+rxkSA7wIkJ
 KgSJ+xehVGcC+svX7z69JnptAU5KQlOfh4qECrKvtZa1C+pO0NJAJpaT9gwzP/Bc0m56
 6K9g==
X-Gm-Message-State: AOAM5316MdbPYzFEq1a0MOQwYslio6LRBHA7bpJ1gbIQCYIEW0ehuJBR
 vuV2bZCPNfwPJnGnj2YQLnU9tyAIFuj8Z7KxfOSW/uvFda8ZVNEaOGuvrKhpatC6TWy2Pn4UgEJ
 O/jnY7GdpRONBlQc=
X-Received: by 2002:a5d:5181:0:b0:20f:fc49:6b88 with SMTP id
 k1-20020a5d5181000000b0020ffc496b88mr28469472wrv.596.1654626953125; 
 Tue, 07 Jun 2022 11:35:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW+m7ZVOjg/dJN0EFikAO3KTbxgVIKUJ/SxSBb0J/V9sw0cCTxKkbx/RwQwFi7sgTSXzWcww==
X-Received: by 2002:a5d:5181:0:b0:20f:fc49:6b88 with SMTP id
 k1-20020a5d5181000000b0020ffc496b88mr28469445wrv.596.1654626952814; 
 Tue, 07 Jun 2022 11:35:52 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 b8-20020a056000054800b002137b2a233fsm19252115wrf.36.2022.06.07.11.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:35:51 -0700 (PDT)
Date: Tue, 7 Jun 2022 19:35:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v5 06/10] hmp: add basic "info stats" implementation
Message-ID: <Yp+aha8olzKWwOCz@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-7-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530150714.756954-7-pbonzini@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> From: Mark Kanda <mark.kanda@oracle.com>
> 
> Add an HMP command to retrieve statistics collected at run-time.
> The command will retrieve and print either all VM-level statistics,
> or all vCPU-level statistics for the currently selected CPU.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hmp-commands-info.hx  |  13 +++
>  include/monitor/hmp.h |   1 +
>  monitor/hmp-cmds.c    | 190 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 204 insertions(+)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 834bed089e..28757768f7 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -894,3 +894,16 @@ SRST
>    ``info via``
>      Show guest mos6522 VIA devices.
>  ERST
> +
> +    {
> +        .name       = "stats",
> +        .args_type  = "target:s",
> +        .params     = "target",
> +        .help       = "show statistics; target is either vm or vcpu",
> +        .cmd        = hmp_info_stats,
> +    },
> +
> +SRST
> +  ``stats``
> +    Show runtime-collected statistics
> +ERST
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 96d014826a..2e89a97bd6 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -133,5 +133,6 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict);
>  void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Error **));
> +void hmp_info_stats(Monitor *mon, const QDict *qdict);
>  
>  #endif
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 622c783c32..55b83c0a3a 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -40,6 +40,7 @@
>  #include "qapi/qapi-commands-pci.h"
>  #include "qapi/qapi-commands-rocker.h"
>  #include "qapi/qapi-commands-run-state.h"
> +#include "qapi/qapi-commands-stats.h"
>  #include "qapi/qapi-commands-tpm.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/qapi-visit-net.h"
> @@ -52,6 +53,7 @@
>  #include "ui/console.h"
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
> +#include "hw/core/cpu.h"
>  #include "hw/intc/intc.h"
>  #include "migration/snapshot.h"
>  #include "migration/misc.h"
> @@ -2239,3 +2241,191 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
>      }
>      hmp_handle_error(mon, err);
>  }
> +
> +static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
> +{
> +    const char *unit = NULL;
> +    monitor_printf(mon, "    %s (%s%s", value->name, StatsType_str(value->type),
> +                   value->has_unit || value->exponent ? ", " : "");
> +
> +    if (value->has_unit) {
> +        if (value->unit == STATS_UNIT_SECONDS) {
> +            unit = "s";
> +        } else if (value->unit == STATS_UNIT_BYTES) {
> +            unit = "B";
> +        }
> +    }
> +
> +    if (unit && value->base == 10 &&
> +        value->exponent >= -9 && value->exponent <= 0 &&
> +        value->exponent % 3 == 0) {
> +        monitor_printf(mon, "%s", si_prefix(value->exponent));
> +    } else if (unit && value->base == 2 &&
> +               value->exponent >= 0 && value->exponent <= 40 &&
> +               value->exponent % 10 == 0) {
> +
> +        monitor_printf(mon, "%s", iec_binary_prefix(value->exponent));

OK that's better; but it's a shame the limits don't come from something
shared; iec_binary_prefix goes upto 60 and si_prefix goes way below -9

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +    } else if (value->exponent) {
> +        /* Use exponential notation and write the unit's English name */
> +        monitor_printf(mon, "* %d^%d%s",
> +                       value->base, value->exponent,
> +                       value->has_unit ? " " : "");
> +        unit = NULL;
> +    }
> +
> +    if (value->has_unit) {
> +        monitor_printf(mon, "%s", unit ? unit : StatsUnit_str(value->unit));
> +    }
> +
> +    /* Print bucket size for linear histograms */
> +    if (value->type == STATS_TYPE_LINEAR_HISTOGRAM && value->has_bucket_size) {
> +        monitor_printf(mon, ", bucket size=%d", value->bucket_size);
> +    }
> +    monitor_printf(mon, ")");
> +}
> +
> +static StatsSchemaValueList *find_schema_value_list(
> +    StatsSchemaList *list, StatsProvider provider,
> +    StatsTarget target)
> +{
> +    StatsSchemaList *node;
> +
> +    for (node = list; node; node = node->next) {
> +        if (node->value->provider == provider &&
> +            node->value->target == target) {
> +            return node->value->stats;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +static void print_stats_results(Monitor *mon, StatsTarget target,
> +                                StatsResult *result,
> +                                StatsSchemaList *schema)
> +{
> +    /* Find provider schema */
> +    StatsSchemaValueList *schema_value_list =
> +        find_schema_value_list(schema, result->provider, target);
> +    StatsList *stats_list;
> +
> +    if (!schema_value_list) {
> +        monitor_printf(mon, "failed to find schema list for %s\n",
> +                       StatsProvider_str(result->provider));
> +        return;
> +    }
> +
> +    monitor_printf(mon, "provider: %s\n",
> +                   StatsProvider_str(result->provider));
> +
> +    for (stats_list = result->stats; stats_list;
> +             stats_list = stats_list->next,
> +             schema_value_list = schema_value_list->next) {
> +
> +        Stats *stats = stats_list->value;
> +        StatsValue *stats_value = stats->value;
> +        StatsSchemaValue *schema_value = schema_value_list->value;
> +
> +        /* Find schema entry */
> +        while (!g_str_equal(stats->name, schema_value->name)) {
> +            if (!schema_value_list->next) {
> +                monitor_printf(mon, "failed to find schema entry for %s\n",
> +                               stats->name);
> +                return;
> +            }
> +            schema_value_list = schema_value_list->next;
> +            schema_value = schema_value_list->value;
> +        }
> +
> +        print_stats_schema_value(mon, schema_value);
> +
> +        if (stats_value->type == QTYPE_QNUM) {
> +            monitor_printf(mon, ": %" PRId64 "\n", stats_value->u.scalar);
> +        } else if (stats_value->type == QTYPE_QLIST) {
> +            uint64List *list;
> +            int i;
> +
> +            monitor_printf(mon, ": ");
> +            for (list = stats_value->u.list, i = 1;
> +                 list;
> +                 list = list->next, i++) {
> +                monitor_printf(mon, "[%d]=%" PRId64 " ", i, list->value);
> +            }
> +            monitor_printf(mon, "\n");
> +        }
> +    }
> +}
> +
> +/* Create the StatsFilter that is needed for an "info stats" invocation.  */
> +static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
> +{
> +    StatsFilter *filter = g_malloc0(sizeof(*filter));
> +
> +    filter->target = target;
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        break;
> +    case STATS_TARGET_VCPU:
> +    {
> +        strList *vcpu_list = NULL;
> +        CPUState *cpu = qemu_get_cpu(cpu_index);
> +        char *canonical_path = object_get_canonical_path(OBJECT(cpu));
> +
> +        QAPI_LIST_PREPEND(vcpu_list, canonical_path);
> +        filter->u.vcpu.has_vcpus = true;
> +        filter->u.vcpu.vcpus = vcpu_list;
> +        break;
> +    }
> +    default:
> +        break;
> +    }
> +    return filter;
> +}
> +
> +void hmp_info_stats(Monitor *mon, const QDict *qdict)
> +{
> +    const char *target_str = qdict_get_str(qdict, "target");
> +    StatsTarget target;
> +    Error *err = NULL;
> +    g_autoptr(StatsSchemaList) schema = NULL;
> +    g_autoptr(StatsResultList) stats = NULL;
> +    g_autoptr(StatsFilter) filter = NULL;
> +    StatsResultList *entry;
> +
> +    target = qapi_enum_parse(&StatsTarget_lookup, target_str, -1, &err);
> +    if (err) {
> +        monitor_printf(mon, "invalid stats target %s\n", target_str);
> +        goto exit_no_print;
> +    }
> +
> +    schema = qmp_query_stats_schemas(&err);
> +    if (err) {
> +        goto exit;
> +    }
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        filter = stats_filter(target, -1);
> +        break;
> +    case STATS_TARGET_VCPU: {}
> +        int cpu_index = monitor_get_cpu_index(mon);
> +        filter = stats_filter(target, cpu_index);
> +        break;
> +    default:
> +        abort();
> +    }
> +
> +    stats = qmp_query_stats(filter, &err);
> +    if (err) {
> +        goto exit;
> +    }
> +    for (entry = stats; entry; entry = entry->next) {
> +        print_stats_results(mon, target, entry->value, schema);
> +    }
> +
> +exit:
> +    if (err) {
> +        monitor_printf(mon, "%s\n", error_get_pretty(err));
> +    }
> +exit_no_print:
> +    error_free(err);
> +}
> -- 
> 2.36.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


