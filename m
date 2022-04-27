Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C8511687
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:04:35 +0200 (CEST)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgPK-0001Tb-AJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njgMb-0008Rt-QN
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njgMY-0006TG-Av
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651060900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZhD7b8H4+0pANHB4RX/u0ENPTDCkkdT7J/gEZlUj72E=;
 b=TiBuGercNcmgj0CcYbCuwOID1qkg+J2EnDK/0iSBEdicbyzhweGQWYipDKEoUZYhAGHCBX
 6K5bKgT4BxKSjYmF5Cw88WJf2jQan3sPbvTIvHrLx24hhESERw/XlR/Kql+sFRE8UAsaTR
 Wz1Jce9ihMhrZz3bXYFcS6O9RvyM8EY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-hVzu8wubMEer15zBqtALxA-1; Wed, 27 Apr 2022 08:01:39 -0400
X-MC-Unique: hVzu8wubMEer15zBqtALxA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g7-20020adfbc87000000b0020ac76d254bso677253wrh.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 05:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZhD7b8H4+0pANHB4RX/u0ENPTDCkkdT7J/gEZlUj72E=;
 b=HkpU9n+rsE3cuk13ztHax28OFVYC09mBT+oSUXVVB3piNquzYf0gE3+2y7LRNy5Wzj
 Xt5/oLl9Afa8YvuJ5wRb1HGZrKbDnDgYnUO+yxrl3TzMl8uAwEPx7G0kC+CJvDmoZlPK
 hZ2EN8EIN81+03zjXGar5lMjAI1LCiYufTIVml5Clp62AHh6kGyr4y9MEY8OvPzE+v1r
 4PTo1GfcVK2ca4lwZocxnmhNRJROK67JIYZiQ0iS2Si83o93PtxmX0Ws/UVA1xzjC0E8
 EqOvYxik8w7/3SAo+hcJ0NY+IRnm5+xmCMcEkiVDywkGNLcazJURvtrVsTwPsV1jJ91Q
 yc/Q==
X-Gm-Message-State: AOAM531zwOfGMezkOR7ztnn3CkObpX0Eo/5zO2Uyzv1FoIJLKHhLzK7b
 N1fL2TY0bwYMWXgswSzRE2Ebx3MEirH7fphhz52vHHOF+GEm7q5mrfUSUjiEkEVemjRvaW3nJbI
 PvCk9uxJeoXg8sQg=
X-Received: by 2002:a5d:4645:0:b0:20a:db5d:258f with SMTP id
 j5-20020a5d4645000000b0020adb5d258fmr11737840wrs.135.1651060897155; 
 Wed, 27 Apr 2022 05:01:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeiocU+cnQOA3sT/+gn1+0sku0Eo+T96d02BwlzRZIZbJqr3GaqWvT+moxFlWBLfDr6ZBFvg==
X-Received: by 2002:a5d:4645:0:b0:20a:db5d:258f with SMTP id
 j5-20020a5d4645000000b0020adb5d258fmr11737810wrs.135.1651060896813; 
 Wed, 27 Apr 2022 05:01:36 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 w5-20020a7bc105000000b0038eb9932dacsm1354833wmi.48.2022.04.27.05.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 05:01:36 -0700 (PDT)
Date: Wed, 27 Apr 2022 13:01:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Message-ID: <YmkwndPwSDxqqdZA@work-vm>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426141619.304611-8-pbonzini@redhat.com>
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> Allow retrieving only a subset of statistics.  This can be useful
> for example in order to plot a subset of the statistics many times
> a second.
> 
> KVM publishes ~40 statistics for each vCPU on x86; retrieving and
> serializing all of them would be useless
> 
> Another use will be in HMP in the following patch; implementing the
> filter in the backend is easy enough that it was deemed okay to make
> this a public interface.
> 
> Example:
> 
> { "execute": "query-stats",
>   "arguments": {
>     "target": "vcpu",
>     "vcpus": [ "/machine/unattached/device[2]",
>                "/machine/unattached/device[4]" ],
>     "providers": [
>       { "provider": "kvm",
>         "names": [ "l1d_flush", "exits" ] } } }

That looks inconsistent to me; I realise that 'names' has to be a child
of providers (since the names are only relevant to a given provider) but
how about making the "target" work similarly:

  
{ "execute": "query-stats",
  "arguments": {
    "target": {
      "vcpus": [ "/machine/unattached/device[2]",
                 "/machine/unattached/device[4]" ] },
   
    "providers": [
       { "provider": "kvm",
         "names": [ "l1d_flush", "exits" ] } } }

It's not clear to me whether the "target" should also be specific
to a given provider.

Dave

> { "return": {
>     "vcpus": [
>       { "path": "/machine/unattached/device[2]"
>         "providers": [
>           { "provider": "kvm",
>             "stats": [ { "name": "l1d_flush", "value": 41213 },
>                        { "name": "exits", "value": 74291 } ] } ] },
>       { "path": "/machine/unattached/device[4]"
>         "providers": [
>           { "provider": "kvm",
>             "stats": [ { "name": "l1d_flush", "value": 16132 },
>                        { "name": "exits", "value": 57922 } ] } ] } ] } }
> 
> Extracted from a patch by Mark Kanda.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c     | 18 +++++++++++-------
>  include/monitor/stats.h |  4 ++--
>  monitor/qmp-cmds.c      | 10 +++++++---
>  qapi/stats.json         |  4 +++-
>  4 files changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index b42008ac07..67253c5a5c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2311,7 +2311,7 @@ bool kvm_dirty_ring_enabled(void)
>      return kvm_state->kvm_dirty_ring_size ? true : false;
>  }
>  
> -static void query_stats_cb(StatsResultList **result, StatsTarget target,
> +static void query_stats_cb(StatsResultList **result, StatsTarget target, strList *names,
>                             strList *targets, Error **errp);
>  static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
>  
> @@ -3713,6 +3713,7 @@ typedef struct StatsArgs {
>          StatsResultList **stats;
>          StatsSchemaList **schema;
>      } result;
> +    strList *names;
>      Error **errp;
>  } StatsArgs;
>  
> @@ -3926,7 +3927,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
>      return descriptors;
>  }
>  
> -static void query_stats(StatsResultList **result, StatsTarget target,
> +static void query_stats(StatsResultList **result, StatsTarget target, strList *names,
>                          int stats_fd, Error **errp)
>  {
>      struct kvm_stats_desc *kvm_stats_desc;
> @@ -3969,6 +3970,9 @@ static void query_stats(StatsResultList **result, StatsTarget target,
>  
>          /* Add entry to the list */
>          stats = (void *)stats_data + pdesc->offset;
> +        if (!str_in_list(pdesc->name, names)) {
> +            continue;
> +        }
>          stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
>      }
>  
> @@ -4030,8 +4034,8 @@ static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
>          error_propagate(kvm_stats_args->errp, local_err);
>          return;
>      }
> -    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU, stats_fd,
> -                kvm_stats_args->errp);
> +    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU,
> +                kvm_stats_args->names, stats_fd, kvm_stats_args->errp);
>      close(stats_fd);
>  }
>  
> @@ -4052,7 +4056,7 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
>  }
>  
>  static void query_stats_cb(StatsResultList **result, StatsTarget target,
> -                           strList *targets, Error **errp)
> +                           strList *names, strList *targets, Error **errp)
>  {
>      KVMState *s = kvm_state;
>      CPUState *cpu;
> @@ -4066,14 +4070,15 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
>              error_setg(errp, "KVM stats: ioctl failed");
>              return;
>          }
> -        query_stats(result, target, stats_fd, errp);
> +        query_stats(result, target, names, stats_fd, errp);
>          close(stats_fd);
>          break;
>      }
>      case STATS_TARGET_VCPU:
>      {
>          StatsArgs stats_args;
>          stats_args.result.stats = result;
> +        stats_args.names = names;
>          stats_args.errp = errp;
>          CPU_FOREACH(cpu) {
>              if (!str_in_list(cpu->parent_obj.canonical_path, targets)) {
> diff --git a/include/monitor/stats.h b/include/monitor/stats.h
> index acfd975df9..b4123044f7 100644
> --- a/include/monitor/stats.h
> +++ b/include/monitor/stats.h
> @@ -11,8 +11,8 @@
>  #include "qapi/qapi-types-stats.h"
>  
>  typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
> -                              strList *targets, Error **errp);
> -typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
> +                              strList *names, strList *targets, Error **errp);
> +typedef void SchemaRetrieveFunc(StatsSchemaList **, Error **);
>  
>  /*
>   * Register callbacks for the QMP query-stats command.
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 25962d8bb4..d0fdb17c82 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -468,15 +468,18 @@ static strList *stats_target_filter(StatsFilter *filter)
>  }
>  
>  static bool stats_provider_requested(StatsProvider provider,
> -                                     StatsFilter *filter)
> +                                     StatsFilter *filter,
> +                                     strList **p_names)
>  {
>      StatsRequestList *request;
>  
>      if (!filter->has_providers) {
> +        *p_names = NULL;
>          return true;
>      }
>      for (request = filter->providers; request; request = request->next) {
>          if (request->value->provider == provider) {
> +            *p_names = request->value->has_names ? request->value->names : NULL;
>              return true;
>          }
>      }
> @@ -490,8 +493,9 @@ StatsResultList *qmp_query_stats(StatsFilter *filter, Error **errp)
>      StatsCallbacks *entry;
>  
>      QTAILQ_FOREACH(entry, &stats_callbacks, next) {
> -        if (stats_provider_requested(entry->provider, filter)) {
> -            entry->stats_cb(&stats_results, filter->target, targets, errp);
> +        strList *names = NULL;
> +        if (stats_provider_requested(entry->provider, filter, &names)) {
> +            entry->stats_cb(&stats_results, filter->target, names, targets, errp);
>          }
>      }
>  
> diff --git a/qapi/stats.json b/qapi/stats.json
> index 33ff6ea7a9..234fbcb7ca 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -71,11 +71,14 @@
>  # Indicates a set of statistics that should be returned by query-stats.
>  #
>  # @provider: provider for which to return statistics.
> +
> +# @names: statistics to be returned (all if omitted).
>  #
>  # Since: 7.1
>  ##
>  { 'struct': 'StatsRequest',
> -  'data': { 'provider': 'StatsProvider' } }
> +  'data': { 'provider': 'StatsProvider',
> +            '*names': [ 'str' ] } }
>  
>  ##
>  # @StatsVCPUFilter:
> -- 
> 2.35.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


