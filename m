Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D686533ABE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:39:44 +0200 (CEST)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntoQY-0004OS-Vp
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntoN0-0002Yb-KG
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ntoMx-0001Kk-AN
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653474958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q2k+wjvrfLxBNTC29lY9mldzTmhHpyxLBcEyXgo3EaI=;
 b=a3CYBNyg3r8CylI8RYQtwyRxXbR1u5w3bycf7/FbliIFTgFDuVDmZMtxPafUgiK87HdU2B
 LDX/wwCg97J5xcoOqiCZe9T/RaDyq5tl1+r+lJqTg1tIPXk8TTHqI2XXn4eSsKqSUihxin
 FAYj6nQb1AynDcfmpceqgo9CjEAUIYg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-p8VwWn4bOEK6fq7DVicorA-1; Wed, 25 May 2022 06:35:57 -0400
X-MC-Unique: p8VwWn4bOEK6fq7DVicorA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so2676291wmj.0
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 03:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q2k+wjvrfLxBNTC29lY9mldzTmhHpyxLBcEyXgo3EaI=;
 b=jvJx7TA6VzEslNwclJiOU/oYI4R68pmZCMKf9qhEITDcCNrloEjPIZihiNgRcmfj/4
 KGG0qV+2YUttaRYLHjM+kejs7jS0P4bTaEWjq6p8lnXVtipixbMJAzYu22Dc0fwsqOxo
 RpdCK8s0QWEsaH00wrPDYbx/7GumZy0gjAFP7u2oJgrQEFP6v6iXBoivT8YbuAAvP0SO
 wsHZP2XpLBkQhLryCSpm1YMsoQANAQt8XLb9FFi9xo7MuobUMyZMscQV1dsyqu/EKnNJ
 Er2G6u6HNLqBKLiqjwo4N6mWEG87jUnp9jxgzvYQQbJu3FiiANY7n+aFqRkUZfmH42TG
 eJVQ==
X-Gm-Message-State: AOAM532MN9fSIyjUkIBBqP4soNhBJ/3aFShTlXCbhWOFP+DxEqsAwGTS
 7pBbddi6HgRCw3+utCYULiSa7CMzMr5vmfeJMqZ8o3/gvl8elGhhsuFONBs+T3ztKdbzkg06IjL
 7A2hXomK3B+7AAiY=
X-Received: by 2002:a7b:c04d:0:b0:394:61ea:4fa2 with SMTP id
 u13-20020a7bc04d000000b0039461ea4fa2mr7543952wmc.40.1653474956136; 
 Wed, 25 May 2022 03:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1NuZ/0cQFZX1wkE7GBGcvyt7Vxl+mZqe1HbMjX2lAv1UH9Mks2iwRGZ9RkqggL35Su+blqQ==
X-Received: by 2002:a7b:c04d:0:b0:394:61ea:4fa2 with SMTP id
 u13-20020a7bc04d000000b0039461ea4fa2mr7543928wmc.40.1653474955863; 
 Wed, 25 May 2022 03:35:55 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u11-20020a5d6acb000000b0020d06e7c16fsm1703406wrw.84.2022.05.25.03.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 03:35:54 -0700 (PDT)
Date: Wed, 25 May 2022 11:35:52 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v3 6/8] hmp: add filtering of statistics by provider
Message-ID: <Yo4GiLam/J7nBOD/@work-vm>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
 <20220516090234.1195907-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516090234.1195907-5-pbonzini@redhat.com>
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
> Allow the user to request statistics for a single provider of interest.
> Extracted from a patch by Mark Kanda.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hmp-commands-info.hx |  7 ++++---
>  monitor/hmp-cmds.c   | 41 ++++++++++++++++++++++++++++++++++-------
>  2 files changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 221feab8c0..d4d8a1e618 100644
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
> index 15f1743d8c..4fa671fe0a 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2291,6 +2291,7 @@ static StatsSchemaValueList *find_schema_value_list(
>  }
>  
>  static void print_stats_results(Monitor *mon, StatsTarget target,
> +                                bool show_provider,
>                                  StatsResult *result,
>                                  StatsSchemaList *schema)
>  {
> @@ -2305,8 +2306,10 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
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
> @@ -2347,7 +2350,8 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
>  }
>  
>  /* Create the StatsFilter that is needed for an "info stats" invocation.  */
> -static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
> +static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
> +                                 StatsProvider provider)
>  {
>      StatsFilter *filter = g_malloc0(sizeof(*filter));
>  
> @@ -2369,12 +2373,27 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index)
>      default:
>          break;
>      }
> +
> +    if (provider == STATS_PROVIDER__MAX) {
> +        return filter;
> +    }
> +
> +    /* "info stats" can only query either one or all the providers.  */
> +    StatsRequest *request = g_new0(StatsRequest, 1);
> +    request->provider = provider;
> +    StatsRequestList *request_list = g_new0(StatsRequestList, 1);

Why that g_new0 there? isn't that request_list = NULL and let the
PREPEND below do the alloc?

> +    QAPI_LIST_PREPEND(request_list, request);
> +    filter->has_providers = true;
> +    filter->providers = request_list;
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
> @@ -2387,19 +2406,27 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
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
> -    schema = qmp_query_stats_schemas(false, 0, &err);
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
> @@ -2410,7 +2437,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
>          goto exit;
>      }
>      for (entry = stats; entry; entry = entry->next) {
> -        print_stats_results(mon, target, entry->value, schema);
> +        print_stats_results(mon, target, provider_str == NULL, entry->value, schema);
>      }
>  
>  exit:
> -- 
> 2.36.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


