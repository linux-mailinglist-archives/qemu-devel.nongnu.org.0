Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64E5331BA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 21:24:06 +0200 (CEST)
Received: from localhost ([::1]:49968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nta8S-0006wO-RO
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 15:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntZvZ-0002wz-6x
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:10:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntZvV-000853-Fb
 for qemu-devel@nongnu.org; Tue, 24 May 2022 15:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653419440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HMmnEawrkOe8QdKW+jhuw4ZQYTmiu1HquhQEEPhjXAI=;
 b=K5H++vhPcIpb//ROr7qQEkMyKmccnBW0cdBsklXu0eDFzrVjeM17ZX2DeqgKyVuFggu0vr
 ZARIJZTL2DXhPD1m+59tW2OpNe3qXwGKU72xKndOy/+vxs26jlFsnyyr4flXmDm6f0Eauu
 RfovDfzCpepEr4A4hjJBEGyq4yzcIhw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-HCJycFtzOYKq8mSAqjbJOA-1; Tue, 24 May 2022 15:10:35 -0400
X-MC-Unique: HCJycFtzOYKq8mSAqjbJOA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l34-20020a05600c1d2200b003973a50c1e4so1656108wms.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 12:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HMmnEawrkOe8QdKW+jhuw4ZQYTmiu1HquhQEEPhjXAI=;
 b=vAVUoldLa0/JZyS8+6vbT//bjHY6x5HrfBoFHjv+wrHwnJKyekVzkHmm9PCqtwilfy
 Y3OSNaxRXdjGetscYzYM9UrGm/983kv1afOQtA5EsNrAjmxBZyWlBrsExgP/l6EdQfvm
 FI0r0JIhp3siKih8mkc7Ed95AVi4WoKMwPiB6MqVDd4SOkOJgQmhkfPgq6PWDyDbOnly
 Zf1JNi7XyN7HyCsoBuU1p3SnaLFsRCYDE2yHYz6SqvGgIWJGL/doPVZc4J3Xpbka19OG
 ynEzeG41eUpm0Aj5Llks0apTY2UMMUzH+PNNIZLr1oHDdQNhHD/5BLr6uYcdVLAtAe48
 /eSg==
X-Gm-Message-State: AOAM531cavJAAxQls4b1piuO/ODEdBUSZnZxFb1+sU5EB6LZQCw30fyK
 BEIyG4SBq5r2UxN3tbBpoocojd4het9EmG0XrZoXMjd1U8wd9rQb1UTD0HaqIzy2+K3ZhWPtfLK
 oygH2SpiyjIbtshA=
X-Received: by 2002:a1c:44c3:0:b0:397:3fb8:664b with SMTP id
 r186-20020a1c44c3000000b003973fb8664bmr5095182wma.163.1653419433636; 
 Tue, 24 May 2022 12:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz3JGH+D/htuZCfQCW65cJClWnQrJjDDflxAKBKELu3KnxLdT8ms+NpYgy0/sQPjhF51Gt8w==
X-Received: by 2002:a1c:44c3:0:b0:397:3fb8:664b with SMTP id
 r186-20020a1c44c3000000b003973fb8664bmr5095159wma.163.1653419433313; 
 Tue, 24 May 2022 12:10:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b0039744bd664esm294854wmq.13.2022.05.24.12.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 12:10:32 -0700 (PDT)
Date: Tue, 24 May 2022 20:10:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v3 4/8] hmp: add basic "info stats" implementation
Message-ID: <Yo0tpveeg7r1tv/q@work-vm>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
 <20220516090234.1195907-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516090234.1195907-3-pbonzini@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
>  monitor/hmp-cmds.c    | 187 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 201 insertions(+)

One minor comment below...

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index adfa085a9b..221feab8c0 100644
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
> index 93061a11af..5950133a11 100644
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
> @@ -2233,3 +2235,188 @@ void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict)
>      }
>      hmp_handle_error(mon, err);
>  }
> +
> +static void print_stats_schema_value(Monitor *mon, StatsSchemaValue *value)
> +{
> +    const char *prefix = "";
> +    monitor_printf(mon, "    %s (%s", value->name, StatsType_str(value->type));
> +
> +    if (value->has_unit && value->unit == STATS_UNIT_SECONDS &&
> +        (value->exponent == 0 || value->base == 10) &&
> +        value->exponent >= -9 && value->exponent <= 0 &&
> +        value->exponent % 3 == 0) {
> +
> +        static const char *si_prefix[] = { "", "milli", "micro", "nano" };
> +        prefix = si_prefix[value->exponent / -3];
> +
> +    } else if (value->has_unit && value->unit == STATS_UNIT_BYTES &&
> +               (value->exponent == 0 || value->base == 2) &&
> +               value->exponent >= 0 && value->exponent <= 40 &&
> +               value->exponent % 10 == 0) {
> +
> +        static const char *si_prefix[] = {
> +            "", "kilo", "mega", "giga", "tera" };

Could we add this list, and the second scale one to something general,
say util/cutils.c?  There's already a size_to_str and freq_to_str in
there.

Dave

> +        prefix = si_prefix[value->exponent / 10];
> +
> +    } else if (value->exponent) {
> +        /* Print the base and exponent as "x <base>^<exp>" */
> +        monitor_printf(mon, ", * %d^%d", value->base,
> +                       value->exponent);
> +    }
> +
> +    if (value->has_unit) {
> +        monitor_printf(mon, " %s%s", prefix, StatsUnit_str(value->unit));
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
> 2.36.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


