Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40EB5431B0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:42:00 +0200 (CEST)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyvwe-0002vj-3E
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyvvk-0002FC-R9
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyvvg-00028G-Vg
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654695659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MtqNU9uY0t5IiGbVmpS3zJO7aTp4v3IJH8vnwcUrUaU=;
 b=WYaRBcV8G5qqedZfRLsOkMHpa/AC/nc/oXs0ZmFL3v4UN8hWOnkVZ+tWnu//4ZbB2n0vhq
 ZjhyvZuQSwOjESJbouu0EPlvC6t2qzrGlQCBNs3oDtDY4+Fu6/ChnTt5ShyXKDkwVnk/fw
 64clL2IBsMesun4TLXTy1OWR1D3s0HU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-xyq5F7UKPN2FYBM8bSt5uQ-1; Wed, 08 Jun 2022 09:40:58 -0400
X-MC-Unique: xyq5F7UKPN2FYBM8bSt5uQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 az7-20020a05600c600700b0039c3ed7fa89so8643277wmb.8
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 06:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MtqNU9uY0t5IiGbVmpS3zJO7aTp4v3IJH8vnwcUrUaU=;
 b=HHbi43bM3IfPfM388g1dZo5eKDAWT/FMB+hape+Ko3/Szkvelj5K/8k80VzzOUXOKH
 FTVUaoRfPFv0Eq2FW/VK/Iss34gKaGWw2qIUo4hHmsH6Y8hMW1mxFt1bYLo2Y+mlaEQe
 lJcEYJY+xb5QA9w6SYTNPX4VC4E8hT+HnHtXcqpPqIDT/IKSLt8D2zB7EGuD5PxwFQPE
 B9m5eRcXHf9o6uaqwMc9FDOp/1kQGvSUu5UXQdmI2sbMkdnOaDY/08pM0NL7gg8lbPL2
 50R7gP8GxlZ/GRtxQMi3SkxsZcT1ziSOQm/kKUgjHsC6fWF/QN7gzbQWRrHei1zNIJDR
 leoA==
X-Gm-Message-State: AOAM532ehTkwt7aF0mccfawQui0WNWUhSSX6CxngqeWjjz44pDzrnJbe
 qBqetKUYwFRAwdOM89bRE68hFiL7lkzUZ6mhp113RYUYMaGCBTluWbKNiQDf+gyT5utPDrIF1jo
 FSLP+JZ22AuPJXlw=
X-Received: by 2002:a5d:47a8:0:b0:217:b5ea:bdfb with SMTP id
 8-20020a5d47a8000000b00217b5eabdfbmr19043406wrb.492.1654695657037; 
 Wed, 08 Jun 2022 06:40:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyD5+gctLv8i+lt+QFADBejtxbiIvZC8fuhxjFB1zC/1BlDo0/k9Ixceyp6GzUEkmAci20fA==
X-Received: by 2002:a5d:47a8:0:b0:217:b5ea:bdfb with SMTP id
 8-20020a5d47a8000000b00217b5eabdfbmr19043392wrb.492.1654695656811; 
 Wed, 08 Jun 2022 06:40:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 i13-20020a05600c354d00b0039c60e33702sm2976003wmq.16.2022.06.08.06.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 06:40:56 -0700 (PDT)
Date: Wed, 8 Jun 2022 14:40:54 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [PATCH v5 10/10] hmp: add filtering of statistics by name
Message-ID: <YqCm5oEyCIrNxYal@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-11-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530150714.756954-11-pbonzini@redhat.com>
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
> Allow the user to request only a specific subset of statistics.
> This can be useful when working on a feature or optimization that is
> known to affect that statistic.
> 
> Extracted from a patch by Mark Kanda.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I think that's OK, if you repost please fix up the commit message with
examples of the command with and without names.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Dave

> ---
>  hmp-commands-info.hx |  8 ++++----
>  monitor/hmp-cmds.c   | 35 ++++++++++++++++++++++++++---------
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index a67040443b..3ffa24bd67 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -897,10 +897,10 @@ ERST
>  
>      {
>          .name       = "stats",
> -        .args_type  = "target:s,provider:s?",
> -        .params     = "target [provider]",
> -        .help       = "show statistics for the given target (vm or vcpu); optionally filter by "
> -                      "provider",
> +        .args_type  = "target:s,names:s?,provider:s?",
> +        .params     = "target [names] [provider]",
> +        .help       = "show statistics for the given target (vm or vcpu); optionally filter by"
> +                      "name (comma-separated list, or * for all) and provider",
>          .cmd        = hmp_info_stats,
>      },
>  
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a71887e54c..8775f69ff1 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2359,10 +2359,12 @@ static void print_stats_results(Monitor *mon, StatsTarget target,
>  }
>  
>  /* Create the StatsFilter that is needed for an "info stats" invocation.  */
> -static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
> -                                 StatsProvider provider)
> +static StatsFilter *stats_filter(StatsTarget target, const char *names,
> +                                 int cpu_index, StatsProvider provider)
>  {
>      StatsFilter *filter = g_malloc0(sizeof(*filter));
> +    StatsProvider provider_idx;
> +    StatsRequestList *request_list = NULL;
>  
>      filter->target = target;
>      switch (target) {
> @@ -2383,15 +2385,29 @@ static StatsFilter *stats_filter(StatsTarget target, int cpu_index,
>          break;
>      }
>  
> -    if (provider == STATS_PROVIDER__MAX) {
> +    if (!names && provider == STATS_PROVIDER__MAX) {
>          return filter;
>      }
>  
> -    /* "info stats" can only query either one or all the providers.  */
> +    /*
> +     * "info stats" can only query either one or all the providers.  Querying
> +     * by name, but not by provider, requires the creation of one filter per
> +     * provider.
> +     */
> +    for (provider_idx = 0; provider_idx < STATS_PROVIDER__MAX; provider_idx++) {
> +        if (provider == STATS_PROVIDER__MAX || provider == provider_idx) {
> +            StatsRequest *request = g_new0(StatsRequest, 1);
> +            request->provider = provider_idx;
> +            if (names && !g_str_equal(names, "*")) {
> +                request->has_names = true;
> +                request->names = strList_from_comma_list(names);
> +            }
> +            QAPI_LIST_PREPEND(request_list, request);
> +        }
> +    }
> +
>      filter->has_providers = true;
> -    filter->providers = g_new0(StatsRequestList, 1);
> -    filter->providers->value = g_new0(StatsRequest, 1);
> -    filter->providers->value->provider = provider;
> +    filter->providers = request_list;
>      return filter;
>  }
>  
> @@ -2399,6 +2415,7 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
>  {
>      const char *target_str = qdict_get_str(qdict, "target");
>      const char *provider_str = qdict_get_try_str(qdict, "provider");
> +    const char *names = qdict_get_try_str(qdict, "names");
>  
>      StatsProvider provider = STATS_PROVIDER__MAX;
>      StatsTarget target;
> @@ -2429,11 +2446,11 @@ void hmp_info_stats(Monitor *mon, const QDict *qdict)
>  
>      switch (target) {
>      case STATS_TARGET_VM:
> -        filter = stats_filter(target, -1, provider);
> +        filter = stats_filter(target, names, -1, provider);
>          break;
>      case STATS_TARGET_VCPU: {}
>          int cpu_index = monitor_get_cpu_index(mon);
> -        filter = stats_filter(target, cpu_index, provider);
> +        filter = stats_filter(target, names, cpu_index, provider);
>          break;
>      default:
>          abort();
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


