Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C3543192
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 15:39:19 +0200 (CEST)
Received: from localhost ([::1]:60498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyvu1-0000kO-Kn
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 09:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyvrL-000781-IX
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nyvrD-0001BQ-O2
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654695381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UWLJNBDdnDRSFsy2k/f9Z7dfJlTebpLVp08d3I2rbxI=;
 b=dT+ONoyBtI6+rTJy7+cynUJZ65+yNq2DldL39KPa3/Dlk8ggAfqzttcdf2Jad/V8Pz1rrO
 JfuyyyIRTN9IC/HcQnJg7EeNuQ0z/MxKARPs6zQ6FGXE2KxPPq/4Vb7e/5tyuGIvStknty
 OFBERx/DRfz3KBy+bw5jQVkYehbeh5A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-mNefW8FKMPC4wvXwcJEPEQ-1; Wed, 08 Jun 2022 09:36:20 -0400
X-MC-Unique: mNefW8FKMPC4wvXwcJEPEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so2584411wms.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 06:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UWLJNBDdnDRSFsy2k/f9Z7dfJlTebpLVp08d3I2rbxI=;
 b=mN8x0gAcTJ94TS13h/XepMzfdZloGmrwEwQ6OTI4AxAPUczbxe/L3f4hJNQyOCm6yc
 5tmC7B7qGDWR80aAZUFJ/bVdCVQ3T7qYVjaVpUk1powqnrvBvKgtqJUsB9W1QScOH0tP
 L3kDCrXe5qMF4wFEAFl2zh9EHpOeXjmB8f7Ha+JjW8tv4q2c2ScoPvD4qPNtmtpw1a9C
 HD3wx+7LS3DLPt+bM+RePPZP/DEZ1mXv2kw+8ySk/gW7SfEfnnsQND6Ok542nZ1HFhL8
 LPV856u2gI71sjDqE3oK2/tazYMkAk/wzUZYQAn+OkKLAeR06N3S8444L+ywbTjKJWE2
 aUvw==
X-Gm-Message-State: AOAM532i9emlb8GVJSpa86cQ9qzKRe+WS2QSFJ4ppDHFBkF3vBDBvdZR
 gdOr/aVXEp2Xs2F6F63bnwiHPJOTbM3OM5M6+q8zHpb9oLM3GoTl0/mH7poSMQTw9XzNgy48VD5
 JlJjQF67MMw9eSJI=
X-Received: by 2002:a5d:46cc:0:b0:214:2d66:2d51 with SMTP id
 g12-20020a5d46cc000000b002142d662d51mr28685496wrs.349.1654695379289; 
 Wed, 08 Jun 2022 06:36:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV4vmvhGsbC9wSmxIe+ufhQwAn1rvEdAqQCC1aqjnCa7iVkVicOHnkel8Yw4j924Zvr+beNQ==
X-Received: by 2002:a5d:46cc:0:b0:214:2d66:2d51 with SMTP id
 g12-20020a5d46cc000000b002142d662d51mr28685469wrs.349.1654695378953; 
 Wed, 08 Jun 2022 06:36:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c501400b003971fc23185sm3721632wmr.20.2022.06.08.06.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 06:36:18 -0700 (PDT)
Date: Wed, 8 Jun 2022 14:36:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [PATCH v5 09/10] qmp: add filtering of statistics by name
Message-ID: <YqCl0D0ZHaFZR9mM@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-10-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530150714.756954-10-pbonzini@redhat.com>
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
> 
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  accel/kvm/kvm-all.c     | 17 +++++++++++------
>  include/monitor/stats.h |  2 +-
>  monitor/qmp-cmds.c      |  7 ++++++-
>  qapi/stats.json         |  6 +++++-
>  4 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 66c4ac1ac6..f90f0602bc 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2312,7 +2312,7 @@ bool kvm_dirty_ring_enabled(void)
>  }
>  
>  static void query_stats_cb(StatsResultList **result, StatsTarget target,
> -                           strList *targets, Error **errp);
> +                           strList *names, strList *targets, Error **errp);
>  static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
>  
>  static int kvm_init(MachineState *ms)
> @@ -3713,6 +3713,7 @@ typedef struct StatsArgs {
>          StatsResultList **stats;
>          StatsSchemaList **schema;
>      } result;
> +    strList *names;
>      Error **errp;
>  } StatsArgs;
>  
> @@ -3921,7 +3922,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
>  }
>  
>  static void query_stats(StatsResultList **result, StatsTarget target,
> -                        int stats_fd, Error **errp)
> +                        strList *names, int stats_fd, Error **errp)
>  {
>      struct kvm_stats_desc *kvm_stats_desc;
>      struct kvm_stats_header *kvm_stats_header;
> @@ -3963,6 +3964,9 @@ static void query_stats(StatsResultList **result, StatsTarget target,
>  
>          /* Add entry to the list */
>          stats = (void *)stats_data + pdesc->offset;
> +        if (!apply_str_list_filter(pdesc->name, names)) {
> +            continue;
> +        }
>          stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
>      }
>  
> @@ -4024,8 +4028,8 @@ static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
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
> @@ -4046,7 +4050,7 @@ static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
>  }
>  
>  static void query_stats_cb(StatsResultList **result, StatsTarget target,
> -                           strList *targets, Error **errp)
> +                           strList *names, strList *targets, Error **errp)
>  {
>      KVMState *s = kvm_state;
>      CPUState *cpu;
> @@ -4060,7 +4064,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
>              error_setg_errno(errp, errno, "KVM errno, stats: ioctl failed");
>              return;
>          }
> -        query_stats(result, target, stats_fd, errp);
> +        query_stats(result, target, names, stats_fd, errp);
>          close(stats_fd);
>          break;
>      }
> @@ -4068,6 +4072,7 @@ static void query_stats_cb(StatsResultList **result, StatsTarget target,
>      {
>          StatsArgs stats_args;
>          stats_args.result.stats = result;
> +        stats_args.names = names;
>          stats_args.errp = errp;
>          CPU_FOREACH(cpu) {
>              if (!apply_str_list_filter(cpu->parent_obj.canonical_path, targets)) {
> diff --git a/include/monitor/stats.h b/include/monitor/stats.h
> index 80a523dd29..fcf0983154 100644
> --- a/include/monitor/stats.h
> +++ b/include/monitor/stats.h
> @@ -11,7 +11,7 @@
>  #include "qapi/qapi-types-stats.h"
>  
>  typedef void StatRetrieveFunc(StatsResultList **result, StatsTarget target,
> -                              strList *targets, Error **errp);
> +                              strList *names, strList *targets, Error **errp);
>  typedef void SchemaRetrieveFunc(StatsSchemaList **result, Error **errp);
>  
>  /*
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index e49ab345d7..7314cd813d 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -472,12 +472,17 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
>                              Error **errp)
>  {
>      strList *targets = NULL;
> +    strList *names = NULL;
>      ERRP_GUARD();
>  
>      if (request) {
>          if (request->provider != entry->provider) {
>              return true;
>          }
> +        if (request->has_names && !request->names) {
> +            return true;
> +        }
> +        names = request->has_names ? request->names : NULL;
>      }
>  
>      switch (filter->target) {
> @@ -496,7 +501,7 @@ static bool invoke_stats_cb(StatsCallbacks *entry,
>          abort();
>      }
>  
> -    entry->stats_cb(stats_results, filter->target, targets, errp);
> +    entry->stats_cb(stats_results, filter->target, names, targets, errp);
>      if (*errp) {
>          qapi_free_StatsResultList(*stats_results);
>          *stats_results = NULL;
> diff --git a/qapi/stats.json b/qapi/stats.json
> index 503918ea4c..2f8bfe8fdb 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -75,11 +75,14 @@
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
> @@ -99,6 +102,7 @@
>  # that target:
>  # - which vCPUs to request statistics for
>  # - which providers to request statistics from
> +# - which named values to return within each provider
>  #
>  # Since: 7.1
>  ##
> -- 
> 2.36.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


