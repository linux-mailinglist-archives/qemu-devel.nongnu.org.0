Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED14A59B9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:14:42 +0100 (CET)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqBM-0004KX-VG
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEq5o-00021o-Ok
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEq5k-0002Ie-U6
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643710132;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ckHRNYeDDAFoRwAenP3cCbqgVe3tzZHCPFBlR9VIo4w=;
 b=WHaUfTPIuf3bg3rNr3PQ50b7h6hZCVL/yK5txwo8sS1euPXYpUswCsMEM8ym8TYSCZShwd
 jOFYYLztRBEXrhJW5BWbUKintDcRvJ6AxJRpAHTmAmMBTqoKupzZvPjIT4tnM5sc/6rUXA
 oqbfFRt9RozDm0WNM8BnLlR0hSmUoXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-Y_LjKc7pNEmkjnSbydx6EA-1; Tue, 01 Feb 2022 05:08:45 -0500
X-MC-Unique: Y_LjKc7pNEmkjnSbydx6EA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE29B100E32B;
 Tue,  1 Feb 2022 10:08:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6C9910841E2;
 Tue,  1 Feb 2022 10:08:42 +0000 (UTC)
Date: Tue, 1 Feb 2022 10:08:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v3 3/3] kvm: Support for querying fd-based stats
Message-ID: <YfkGp3SqVK5P3SoH@redhat.com>
References: <20220131194312.1192626-1-mark.kanda@oracle.com>
 <20220131194312.1192626-4-mark.kanda@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20220131194312.1192626-4-mark.kanda@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 01:43:12PM -0600, Mark Kanda wrote:
> Add support for querying fd-based KVM stats - as introduced by Linux kernel
> commit:
> 
> cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>  accel/kvm/kvm-all.c | 308 ++++++++++++++++++++++++++++++++++++++++++++
>  qapi/misc.json      |   2 +-
>  2 files changed, 309 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0e66ebb497..e43e1f1c1c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -47,6 +47,8 @@
>  #include "kvm-cpus.h"
>  
>  #include "hw/boards.h"
> +#include "qapi/qapi-commands-misc.h"
> +#include "monitor/stats.h"
>  
>  /* This check must be after config-host.h is included */
>  #ifdef CONFIG_EVENTFD
> @@ -2309,6 +2311,9 @@ bool kvm_dirty_ring_enabled(void)
>      return kvm_state->kvm_dirty_ring_size ? true : false;
>  }
>  
> +static void query_stats_cb(StatsResults *, StatsFilter *, Error **);
> +static void query_stats_schemas_cb(StatsSchemaResult *, Error **);
> +
>  static int kvm_init(MachineState *ms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -2637,6 +2642,11 @@ static int kvm_init(MachineState *ms)
>          }
>      }
>  
> +    if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
> +        add_stats_callbacks(STATS_PROVIDER_KVM, &query_stats_cb,
> +                            &query_stats_schemas_cb);
> +    }
> +
>      return 0;
>  
>  err:
> @@ -3696,3 +3706,301 @@ static void kvm_type_init(void)
>  }
>  
>  type_init(kvm_type_init);
> +
> +typedef struct StatsArgs {
> +    StatsFilter *filter;
> +    bool is_schema;
> +    union {
> +        StatsResults *stats;
> +        StatsSchemaResult *schema;
> +    } result;
> +    Error **errp;
> +} StatsArgs;
> +
> +static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
> +                                    uint64_t *stats_data,
> +                                    StatsList *stats_list,
> +                                    Error **errp)
> +{
> +    StatsList *stats_entry = g_malloc0(sizeof(*stats_entry));
> +    Stats *stats = g_malloc0(sizeof(*stats));
> +    uint64List *val_list = NULL;
> +    int i;
> +
> +    stats->name = g_strdup(pdesc->name);
> +    stats->value = g_malloc0(sizeof(*stats->value));
> +
> +    /* Alloc and populate data list */
> +    if (pdesc->size == 1) {
> +        stats->value->u.scalar = *stats_data;
> +        stats->value->type = QTYPE_QNUM;
> +    } else {
> +        for (i = 0; i < pdesc->size; i++) {
> +            uint64List *val_entry = g_malloc0(sizeof(*val_entry));
> +            val_entry->value = stats_data[i];
> +            val_entry->next = val_list;
> +            val_list = val_entry;
> +        }
> +        stats->value->u.list.list = val_list;
> +        stats->value->type = QTYPE_QDICT;
> +    }
> +
> +    stats_entry->value = stats;
> +    stats_entry->next = stats_list;
> +
> +    return stats_entry;
> +}
> +
> +static StatsSchemaValueList *add_kvmschema_entry(struct kvm_stats_desc *pdesc,
> +                                                 StatsSchemaValueList *list,
> +                                                 Error **errp)
> +{
> +    StatsSchemaValueList *schema_entry;
> +
> +    schema_entry = g_malloc0(sizeof(*schema_entry));
> +    schema_entry->value = g_malloc0(sizeof(*schema_entry->value));
> +    schema_entry->value->name = g_strdup(pdesc->name);
> +
> +    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
> +    case KVM_STATS_TYPE_CUMULATIVE:
> +        schema_entry->value->type = STAT_TYPE_CUMULATIVE;
> +        break;
> +    case KVM_STATS_TYPE_INSTANT:
> +        schema_entry->value->type = STAT_TYPE_INSTANT;
> +        break;
> +    case KVM_STATS_TYPE_PEAK:
> +        schema_entry->value->type = STAT_TYPE_PEAK;
> +        break;
> +    case KVM_STATS_TYPE_LINEAR_HIST:
> +        schema_entry->value->type = STAT_TYPE_LINEAR_HIST;
> +        break;
> +    case KVM_STATS_TYPE_LOG_HIST:
> +        schema_entry->value->type = STAT_TYPE_LOG_HIST;
> +        break;
> +    default:
> +        schema_entry->value->type = STAT_TYPE_UNKNOWN;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
> +    case KVM_STATS_UNIT_NONE:
> +        schema_entry->value->unit = STAT_UNIT_NONE;
> +        break;
> +    case KVM_STATS_UNIT_BYTES:
> +        schema_entry->value->unit = STAT_UNIT_BYTES;
> +        break;
> +    case KVM_STATS_UNIT_CYCLES:
> +        schema_entry->value->unit = STAT_UNIT_CYCLES;
> +        break;
> +    case KVM_STATS_UNIT_SECONDS:
> +        schema_entry->value->unit = STAT_UNIT_SECONDS;
> +        break;
> +    default:
> +        schema_entry->value->unit = STAT_UNIT_UNKNOWN;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
> +    case KVM_STATS_BASE_POW10:
> +        schema_entry->value->base = STAT_BASE_POW10;
> +        break;
> +    case KVM_STATS_BASE_POW2:
> +        schema_entry->value->base = STAT_BASE_POW2;
> +        break;
> +    default:
> +        schema_entry->value->base = STAT_BASE_UNKNOWN;
> +    }
> +
> +    schema_entry->value->exponent = pdesc->exponent;
> +    schema_entry->next = list;
> +    return schema_entry;
> +}
> +
> +static void query_stats(StatsArgs *kvm_stat_args, int stats_fd)

Pass "Error **errp". For that matter, just pass in all fields
directly - no need for 'StatsArgs' indirection here - that's
only needed in the VCPU stats case due to need to pass many
values via the run_on_cpu callback.

> +{
> +    size_t size_desc, size_data;
> +    struct kvm_stats_header *header;

  g_autofree struct kvm_stats_header *header = NULL;

> +    struct kvm_stats_desc *stats_desc = NULL;

  g_autofree

> +    Error *local_err = NULL;

Should not be required if errp is passed in

> +    void *stats_list = NULL;
> +    char *id = NULL;

  g_autofree

> +    ssize_t ret;
> +    int i;
> +
> +    /* Read KVM stats header */
> +    header = g_malloc(sizeof(*header));
> +    ret = read(stats_fd, header, sizeof(*header));
> +    if (ret != sizeof(*header)) {
> +        error_setg(&local_err, "KVM stats: failed to read stats header: "
> +                   "expected %zu actual %zu", sizeof(*header), ret);
> +        goto exit;
> +    }
> +    size_desc = sizeof(*stats_desc) + header->name_size;
> +
> +    /* Read KVM stats id string */
> +    id = g_malloc(header->name_size);
> +    ret = read(stats_fd, id, header->name_size);
> +    if (ret != header->name_size) {
> +        error_setg(&local_err, "KVM stats: failed to read id string: "
> +                   "expected %zu actual %zu", (size_t) header->name_size, ret);
> +        goto exit;
> +    }
> +
> +    /* Read KVM stats descriptors */
> +    stats_desc = g_malloc0(header->num_desc * size_desc);
> +    ret = pread(stats_fd, stats_desc,
> +                size_desc * header->num_desc, header->desc_offset);
> +
> +    if (ret != size_desc * header->num_desc) {
> +        error_setg(&local_err, "KVM stats: failed to read stats descriptors: "
> +                   "expected %zu actual %zu",
> +                   size_desc * header->num_desc, ret);
> +        goto exit;
> +    }
> +
> +    for (i = 0; i < header->num_desc; ++i) {
> +        struct kvm_stats_desc *pdesc = (void *)stats_desc + i * size_desc;
> +        size_data = pdesc->size * sizeof(uint64_t);
> +
> +        uint64_t *stats_data = g_malloc(size_data);
> +
> +        ret = pread(stats_fd, stats_data, size_data,
> +                    header->data_offset + pdesc->offset);
> +
> +        if (ret != pdesc->size * sizeof(*stats_data)) {
> +            error_setg(&local_err, "KVM stats: failed to read data: "
> +                       "expected %zu actual %zu",
> +                       pdesc->size * sizeof(*stats_data), ret);
> +            g_free(stats_data);
> +            goto exit;
> +        }
> +
> +        /* Add entry to the list */
> +        if (kvm_stat_args->is_schema) {
> +            stats_list = add_kvmschema_entry(pdesc, (StatsSchemaValueList *)
> +                                             stats_list, &local_err);
> +        } else {
> +            if (stat_name_filter(kvm_stat_args->filter,
> +                                 kvm_stat_args->filter->target, pdesc->name)) {
> +                g_free(stats_data);
> +                continue;
> +            }
> +            stats_list = add_kvmstat_entry(pdesc, stats_data,
> +                                           (StatsList *) stats_list,
> +                                           &local_err);
> +        }
> +        g_free(stats_data);
> +    }
> +
> +    if (!stats_list) {
> +        goto exit;
> +    }
> +
> +    if (kvm_stat_args->is_schema) {
> +        StatsSchemaProvider *provider;
> +        if (kvm_stat_args->filter->target == STATS_TARGET_VM) {
> +            provider = add_vm_stats_schema(kvm_stat_args->result.schema,
> +                                           STATS_PROVIDER_KVM);
> +        } else if (kvm_stat_args->filter->target == STATS_TARGET_VCPU) {
> +            provider = add_vcpu_stats_schema(kvm_stat_args->result.schema,
> +                                             STATS_PROVIDER_KVM);
> +        }
> +        provider->stats = (StatsSchemaValueList *)stats_list;

The compiler warns about provider being used uninitialized.

This would be better as a switch

       StatsSchemaProvider *provider = NULL;
       switch (kvm_stat_args->filter->target){
         case STATS_TARGET_VM:
           provider = add_vm_stats_schema(kvm_stat_args->result.schema,
                                          STATS_PROVIDER_KVM);
           break;
         case STATS_TARGET_VCPU:
           provider = add_vcpu_stats_schema(kvm_stat_args->result.schema,
                                            STATS_PROVIDER_KVM);
           break;
	 default:
	   break;
       }
       if (provider) {
           provider->stats = (StatsSchemaValueList *)stats_list;
       }


> +    } else {
> +        StatsResultsEntry *results;
> +        if (kvm_stat_args->filter->target == STATS_TARGET_VM) {
> +            results = add_vm_stats_entry(kvm_stat_args->result.stats,
> +                                         STATS_PROVIDER_KVM);
> +        } else if (kvm_stat_args->filter->target == STATS_TARGET_VCPU) {
> +            results =
> +                add_vcpu_stats_entry(kvm_stat_args->result.stats,
> +                                     STATS_PROVIDER_KVM,
> +                                     current_cpu->parent_obj.canonical_path);
> +        }
> +        results->stats = (StatsList *)stats_list;

Same compiler around as previous block

> +    }
> +exit:
> +    error_propagate(kvm_stat_args->errp, local_err);

Not required if we use errp from the caller directly.

> +    g_free(stats_desc);
> +    g_free(id);
> +    g_free(header);

Not needed with g_autofree usage, so we don't need the 'exit:'
label at all.

> +}
> +
> +static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
> +{
> +    StatsArgs *kvm_stats_args = (StatsArgs *) data.host_ptr;
> +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
> +    Error *local_err = NULL;
> +
> +    if (stats_fd == -1) {
> +        error_setg(&local_err, "KVM stats: ioctl failed");
> +        error_propagate(kvm_stats_args->errp, local_err);

Get rid of local_err and pass  kvm_stat_args->errp straight to error_setg

> +        return;
> +    }
> +    query_stats(kvm_stats_args, stats_fd);

Pass kvm_stats_args->errp into this.

> +    close(stats_fd);
> +}
> +
> +static void query_stats_cb(StatsResults *stats_result, StatsFilter *filter,
> +                           Error **errp)
> +{



> +    KVMState *s = kvm_state;
> +    CPUState *cpu;
> +    int stats_fd;
> +    StatsArgs *stats_args = g_malloc0(sizeof(*stats_args));

  g_autofree

> +    stats_args->filter = filter;
> +    stats_args->errp = errp;
> +    stats_args->result.stats = stats_result;

> +
> +    switch (filter->target) {
> +    case STATS_TARGET_VM:
> +        stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
> +        if (stats_fd == -1) {
> +            error_setg(errp, "KVM stats: ioctl failed");
> +            goto done;
> +        }
> +
> +        query_stats(stats_args, stats_fd);

Pass errp into this.

> +        break;
> +    case STATS_TARGET_VCPU:
> +        CPU_FOREACH(cpu) {
> +            if (stat_cpu_filter(filter, cpu->parent_obj.canonical_path)) {
> +                continue;
> +            }
> +            run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +done:
> +    g_free(stats_args);

No need for this label / g_free, if we use g_autofree

> +}
> +
> +void query_stats_schemas_cb(StatsSchemaResult *stats_result, Error **errp)
> +{
> +    KVMState *s = kvm_state;
> +    int stats_fd;
> +    StatsArgs *stats_args =  g_malloc0(sizeof(*stats_args));

  g_autofree + g_new0

> +    stats_args->filter = g_malloc0(sizeof(*stats_args->filter));

  g_autofree StatsFilter *filter = g_new(StatsFilter, 1);

  stats_args->filter = filter;

> +    stats_args->errp = errp;
> +
> +    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
> +    if (stats_fd == -1) {
> +        error_setg(errp, "KVM stats: ioctl failed");
> +        goto done;
> +    }
> +
> +    stats_args->result.schema = stats_result;
> +    stats_args->is_schema = true;
> +
> +    /* Query VM */
> +    stats_args->filter->target = STATS_TARGET_VM;
> +    query_stats(stats_args, stats_fd);
> +
> +    /* Query vCPU */
> +    stats_args->filter->target = STATS_TARGET_VCPU;
> +    run_on_cpu(first_cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
> +done:
> +    g_free(stats_args->filter);
> +    g_free(stats_args);

The label & g_free can be removed with g_autofree usage.

> +}
> +
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 8d326464f0..39a7d172cb 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -574,7 +574,7 @@
>  # Since: 7.0
>  ##
>  { 'enum': 'StatsProvider',
> -  'data': [ ] }
> +  'data': [ 'kvm' ] }
>  
>  ##
>  # @StatsTarget:
> -- 
> 2.27.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


