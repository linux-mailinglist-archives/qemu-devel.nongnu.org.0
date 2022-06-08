Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D23F542FFC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 14:13:13 +0200 (CEST)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyuYh-0003DN-UA
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 08:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyuSP-0000G0-G0
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyuSK-00011U-OT
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 08:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654689995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b8/zH6MS9yQwb4NmSvsUz+fPxUFQQZzFC8VM4Vp7QIY=;
 b=CHuhg0+mU6qC6S8M84p7pMmypacVN43ati72QYXJWq9oJeGsFpm7qpl+BLFXLZtLN76Uxh
 Gbk4YoIrve+AiP7mZUo1VGXnVOb7BDxuIgPZZhxzFPjAD1dz8uE8tzuL7V+WWwm9Y8jmGL
 OEzOz2NzlXsa3d1zXvSQOemeTOyKmQM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-ZBCM9H-qPzeqe0vVJUBRrQ-1; Wed, 08 Jun 2022 08:06:33 -0400
X-MC-Unique: ZBCM9H-qPzeqe0vVJUBRrQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so6457963wmq.7
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 05:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b8/zH6MS9yQwb4NmSvsUz+fPxUFQQZzFC8VM4Vp7QIY=;
 b=CJuvY3dKe97eVX+T+yq3pUIp+vjDdOC+0cEl8dLyug3P9o+VjR+xyEFdw0AxrS6PIZ
 qZSFP+m7+8mkQuce9QSa9XX/GtQQiH9carXqheM2OMuwL/7k6FfGogbFtpcHkrUciRJo
 RhbuNzxKLB1vP7bANYceKOxBtsWspBEBReY9qTQaiidaBSR+WuV+f2PMvQXbKtT2ZWJX
 REw5megH7Rc5Hb2rsrX2b5DBk3tgGwtOAXKYptpdcQMnjqeK7WhRo/bRmUGus8KLgxip
 44n495XaZijA1C3H8j9VNvmzm3NWC6XakxPWXv3CFyjn0sG0dQ0X5hbjsvJ1A/7qPxRz
 FIWA==
X-Gm-Message-State: AOAM531em5+xGZt7PrqYg27REQ3TUnOgrHWx6jZBI/xYDJpiO5mDkcJx
 ss3cGHGmzpbo8ndQG/HnHI35O6yuwX4cO4KbULtTBI1mK/VC+VpFAAfrIJt34HVYx0Hxom150D9
 vHEFsn2G/jzYLxz4=
X-Received: by 2002:a7b:c341:0:b0:37b:ed90:7dad with SMTP id
 l1-20020a7bc341000000b0037bed907dadmr33256207wmj.138.1654689991853; 
 Wed, 08 Jun 2022 05:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTrlx8YaN8F9DWKfmc9Zb1pmeWbVdzcqv4zO8t/gpaEckQtK7DfjNVJJFYj/SHLxYRhoq/bQ==
X-Received: by 2002:a7b:c341:0:b0:37b:ed90:7dad with SMTP id
 l1-20020a7bc341000000b0037bed907dadmr33256179wmj.138.1654689991514; 
 Wed, 08 Jun 2022 05:06:31 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 c2-20020adffb42000000b00210326c4a90sm21281354wrs.49.2022.06.08.05.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:06:30 -0700 (PDT)
Date: Wed, 8 Jun 2022 13:06:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [PATCH v5 08/10] hmp: add filtering of statistics by provider
Message-ID: <YqCQxdIQTxPrbDka@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-9-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530150714.756954-9-pbonzini@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
> Allow the user to request statistics for a single provider of interest.
> Extracted from a patch by Mark Kanda.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hmp-commands-info.hx |  7 ++++---
>  monitor/hmp-cmds.c   | 39 ++++++++++++++++++++++++++++++++-------
>  2 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 28757768f7..a67040443b 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -897,9 +897,10 @@ ERST
>  
>      {
>          .name       = "stats",
> -        .args_type  = "target:s",
> -        .params     = "target",
> -        .help       = "show statistics; target is either vm or vcpu",
> +        .args_type  = "target:s,provider:s?",
> +        .params     = "target [provider]",
> +        .help       = "show statistics for the given target (vm or vcpu); optionally filter by "
> +                      "provider",
>          .cmd        = hmp_info_stats,
>      },
>  
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c501d1fa2b..a71887e54c 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2300,6 +2300,7 @@ static StatsSchemaValueList *find_schema_value_list(
>  }
>  
>  static void print_stats_results(Monitor *mon, StatsTarget target,
> +                                bool show_provider,
>                                  StatsResult *result,
>                                  StatsSchemaList *schema)
>  {
> @@ -2314,8 +2315,10 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
>          return;
>      }
>  
> -    monitor_printf(mon, "provider: %s\n",
> -                   StatsProvider_str(result->provider));
> +    if (show_provider) {
> +        monitor_printf(mon, "provider: %s\n",
> +                       StatsProvider_str(result->provider));
> +    }
>  
>      for (stats_list = result->stats; stats_list;
>               stats_list = stats_list->next,
> @@ -2356,7 +2359,8 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
>  }
>  
>  /* Create the StatsFilter that is needed for an "info stats" invocation.  */
> -static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
> +static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
> +                                 StatsProvider provider)
>  {
>      StatsFilter *filter = g_malloc0(sizeof(*filter));
>  
> @@ -2378,12 +2382,25 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
>      default:
>          break;
>      }
> +
> +    if (provider == STATS_PROVIDER__MAX) {
> +        return filter;
> +    }
> +
> +    /* "info stats" can only query either one or all the providers.  */
> +    filter->has_providers = true;
> +    filter->providers = g_new0(StatsRequestList, 1);
> +    filter->providers->value = g_new0(StatsRequest, 1);
> +    filter->providers->value->provider = provider;
>      return filter;
>  }
>  
>  void hmp_info_stats(Monitor *mon, const QDict *qdict)
>  {
>      const char *target_str = qdict_get_str(qdict, "target");
> +    const char *provider_str = qdict_get_try_str(qdict, "provider");
> +
> +    StatsProvider provider = STATS_PROVIDER__MAX;
>      StatsTarget target;
>      Error *err = NULL;
>      g_autoptr(StatsSchemaList) schema = NULL;
> @@ -2396,19 +2413,27 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
>          monitor_printf(mon, "invalid stats target %s\n", target_str);
>          goto exit_no_print;
>      }
> +    if (provider_str) {
> +        provider = qapi_enum_parse(&StatsProvider_lookup, provider_str, -1, &err);
> +        if (err) {
> +            monitor_printf(mon, "invalid stats provider %s\n", provider_str);
> +            goto exit_no_print;
> +        }
> +    }
>  
> -    schema = qmp_query_stats_schemas(false, STATS_PROVIDER__MAX, &err);
> +    schema = qmp_query_stats_schemas(provider_str ? true : false,
> +                                     provider, &err);
>      if (err) {
>          goto exit;
>      }
>  
>      switch (target) {
>      case STATS_TARGET_VM:
> -        filter = stats_filter(target, -1);
> +        filter = stats_filter(target, -1, provider);
>          break;
>      case STATS_TARGET_VCPU: {}
>          int cpu_index = monitor_get_cpu_index(mon);
> -        filter = stats_filter(target, cpu_index);
> +        filter = stats_filter(target, cpu_index, provider);
>          break;
>      default:
>          abort();
> @@ -2419,7 +2444,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
>          goto exit;
>      }
>      for (entry = stats; entry; entry = entry->next) {
> -        print_stats_results(mon, target, entry->value, schema);
> +        print_stats_results(mon, target, provider_str == NULL, entry->value, schema);
>      }
>  
>  exit:
> -- 
> 2.36.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


