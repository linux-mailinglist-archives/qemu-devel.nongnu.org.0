Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882B54077D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 19:49:29 +0200 (CEST)
Received: from localhost ([::1]:54964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nydKa-0003nk-39
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 13:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nydFi-0002LX-9p
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nydFd-0003t0-Ak
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 13:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654623860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ttqNb9kd3B8KibQkKcvtq8xUVq/DwFMgmlRoLdYsSuE=;
 b=WcYgavGSM6BaGZRNJ6f6pptONtfQ3dCQyh2aUQg6QIgjaSmk2Tbv9GD3+1PWsFVUzTgMX0
 NDm/p79rZoOQToTL/Q6qDKp1wBfVRjoopLr9AwM4pT6JjemmRetQBTOZMH6ihkD2T7XjNp
 AmuOb8qlLE57WGlj8moxWkMvDtrnD+o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-xjl1Yo6cM-ygl9LjyWlumw-1; Tue, 07 Jun 2022 13:44:18 -0400
X-MC-Unique: xjl1Yo6cM-ygl9LjyWlumw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v4-20020adfebc4000000b002102c69be5eso4158849wrn.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 10:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ttqNb9kd3B8KibQkKcvtq8xUVq/DwFMgmlRoLdYsSuE=;
 b=OqzSHdCbz9NSuthYAvX5SEbNufn1jmocsB2hskQPlPoCdRCPlAudG4YhJ4yJBv0jQO
 XaC1HxiI820QhvT5sRXEgWrK7o/ikdsNCyOMbVN/CEOdtC1zYpXM416VChUYbYL4ONq1
 sUBSOYP4EfkESGVAmArvtvka3u4KrGaYgvcclUrFW39hLqheQ16Ti6001tQxgTTxdpD4
 oagiN9aGVPKLA4QhFUZNfb+sQnSYMeMwVCdw/JrvVqBdIC6SU58kW0sw8stQJq1CKwFX
 h3B0TO7WxQWJoYiD7YSnswjKDsSIsdgrhIE2+As/7YtIkWyKNm/vgNOd80FW0Qs+Oawk
 xwsA==
X-Gm-Message-State: AOAM533rQt1E+RMBAG4EWGtXSgtw2gdDUv6ddV1m8J0G3+9EiSqlgNoK
 LEJ4qaPjg4j/iTKBgRbCXuEMrwLnoFbWu+f+X4VbLpJZr6T/XM+8cwbp66Ar2WVV1OHYA5oqJzg
 0gMEiKhegqK5wvkU=
X-Received: by 2002:a05:600c:600d:b0:397:3801:3787 with SMTP id
 az13-20020a05600c600d00b0039738013787mr60221118wmb.113.1654623857330; 
 Tue, 07 Jun 2022 10:44:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRpdDle8nWoql7EVJCbdJhI8LfjPb7AUygLzCiKVZW/VpCZpJV4u9kcDs44mqWLT5WnwrFKA==
X-Received: by 2002:a05:600c:600d:b0:397:3801:3787 with SMTP id
 az13-20020a05600c600d00b0039738013787mr60221086wmb.113.1654623856945; 
 Tue, 07 Jun 2022 10:44:16 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h9-20020a5d4309000000b002102af52a2csm23257733wrq.9.2022.06.07.10.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 10:44:16 -0700 (PDT)
Date: Tue, 7 Jun 2022 18:44:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
Subject: Re: [PATCH v5 02/10] kvm: Support for querying fd-based stats
Message-ID: <Yp+ObQxOi/EXc6PZ@work-vm>
References: <20220530150714.756954-1-pbonzini@redhat.com>
 <20220530150714.756954-3-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530150714.756954-3-pbonzini@redhat.com>
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
> Add support for querying fd-based KVM stats - as introduced by Linux kernel
> commit:
> 
> cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")
> 
> This allows the user to analyze the behavior of the VM without access
> to debugfs.
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 397 ++++++++++++++++++++++++++++++++++++++++++++
>  qapi/stats.json     |   2 +-
>  2 files changed, 398 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 32e177bd26..c027536419 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -47,6 +47,7 @@
>  #include "kvm-cpus.h"
>  
>  #include "hw/boards.h"
> +#include "monitor/stats.h"
>  
>  /* This check must be after config-host.h is included */
>  #ifdef CONFIG_EVENTFD
> @@ -2310,6 +2311,9 @@ bool kvm_dirty_ring_enabled(void)
>      return kvm_state->kvm_dirty_ring_size ? true : false;
>  }
>  
> +static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp);
> +static void query_stats_schemas_cb(StatsSchemaList **result, Error **errp);
> +
>  static int kvm_init(MachineState *ms)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> @@ -2638,6 +2642,10 @@ static int kvm_init(MachineState *ms)
>          }
>      }
>  
> +    if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
> +        add_stats_callbacks(query_stats_cb, query_stats_schemas_cb);
> +    }
> +
>      return 0;
>  
>  err:
> @@ -3697,3 +3705,392 @@ static void kvm_type_init(void)
>  }
>  
>  type_init(kvm_type_init);
> +
> +typedef struct StatsArgs {
> +    union StatsResultsType {
> +        StatsResultList **stats;
> +        StatsSchemaList **schema;
> +    } result;
> +    Error **errp;
> +} StatsArgs;
> +
> +static StatsList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
> +                                    uint64_t *stats_data,
> +                                    StatsList *stats_list,
> +                                    Error **errp)
> +{
> +
> +    Stats *stats;
> +    uint64List *val_list = NULL;
> +
> +    /* Only add stats that we understand.  */
> +    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
> +    case KVM_STATS_TYPE_CUMULATIVE:
> +    case KVM_STATS_TYPE_INSTANT:
> +    case KVM_STATS_TYPE_PEAK:
> +    case KVM_STATS_TYPE_LINEAR_HIST:
> +    case KVM_STATS_TYPE_LOG_HIST:
> +        break;
> +    default:
> +        return stats_list;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
> +    case KVM_STATS_UNIT_NONE:
> +    case KVM_STATS_UNIT_BYTES:
> +    case KVM_STATS_UNIT_CYCLES:
> +    case KVM_STATS_UNIT_SECONDS:
> +        break;
> +    default:
> +        return stats_list;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
> +    case KVM_STATS_BASE_POW10:
> +    case KVM_STATS_BASE_POW2:
> +        break;
> +    default:
> +        return stats_list;
> +    }
> +
> +    /* Alloc and populate data list */
> +    stats = g_new0(Stats, 1);
> +    stats->name = g_strdup(pdesc->name);
> +    stats->value = g_new0(StatsValue, 1);;
> +
> +    if (pdesc->size == 1) {
> +        stats->value->u.scalar = *stats_data;
> +        stats->value->type = QTYPE_QNUM;
> +    } else {
> +        int i;
> +        for (i = 0; i < pdesc->size; i++) {
> +            QAPI_LIST_PREPEND(val_list, stats_data[i]);
> +        }
> +        stats->value->u.list = val_list;
> +        stats->value->type = QTYPE_QLIST;
> +    }
> +
> +    QAPI_LIST_PREPEND(stats_list, stats);
> +    return stats_list;
> +}
> +
> +static StatsSchemaValueList *add_kvmschema_entry(struct kvm_stats_desc *pdesc,
> +                                                 StatsSchemaValueList *list,
> +                                                 Error **errp)
> +{
> +    StatsSchemaValueList *schema_entry = g_new0(StatsSchemaValueList, 1);
> +    schema_entry->value = g_new0(StatsSchemaValue, 1);
> +
> +    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
> +    case KVM_STATS_TYPE_CUMULATIVE:
> +        schema_entry->value->type = STATS_TYPE_CUMULATIVE;
> +        break;
> +    case KVM_STATS_TYPE_INSTANT:
> +        schema_entry->value->type = STATS_TYPE_INSTANT;
> +        break;
> +    case KVM_STATS_TYPE_PEAK:
> +        schema_entry->value->type = STATS_TYPE_PEAK;
> +        break;
> +    case KVM_STATS_TYPE_LINEAR_HIST:
> +        schema_entry->value->type = STATS_TYPE_LINEAR_HISTOGRAM;
> +        schema_entry->value->bucket_size = pdesc->bucket_size;
> +        schema_entry->value->has_bucket_size = true;
> +        break;
> +    case KVM_STATS_TYPE_LOG_HIST:
> +        schema_entry->value->type = STATS_TYPE_LOG2_HISTOGRAM;
> +        break;
> +    default:
> +        goto exit;
> +    }
> +
> +    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
> +    case KVM_STATS_UNIT_NONE:
> +        break;
> +    case KVM_STATS_UNIT_BYTES:
> +        schema_entry->value->has_unit = true;
> +        schema_entry->value->unit = STATS_UNIT_BYTES;
> +        break;
> +    case KVM_STATS_UNIT_CYCLES:
> +        schema_entry->value->has_unit = true;
> +        schema_entry->value->unit = STATS_UNIT_CYCLES;
> +        break;
> +    case KVM_STATS_UNIT_SECONDS:
> +        schema_entry->value->has_unit = true;
> +        schema_entry->value->unit = STATS_UNIT_SECONDS;
> +        break;
> +    default:
> +        goto exit;
> +    }
> +
> +    schema_entry->value->exponent = pdesc->exponent;
> +    if (pdesc->exponent) {
> +        switch (pdesc->flags & KVM_STATS_BASE_MASK) {
> +        case KVM_STATS_BASE_POW10:
> +            schema_entry->value->has_base = true;
> +            schema_entry->value->base = 10;
> +            break;
> +        case KVM_STATS_BASE_POW2:
> +            schema_entry->value->has_base = true;
> +            schema_entry->value->base = 2;
> +            break;
> +        default:
> +            goto exit;
> +        }
> +    }
> +
> +    schema_entry->value->name = g_strdup(pdesc->name);
> +    schema_entry->next = list;
> +    return schema_entry;
> +exit:
> +    g_free(schema_entry->value);
> +    g_free(schema_entry);
> +    return list;
> +}
> +
> +/* Cached stats descriptors */
> +typedef struct StatsDescriptors {
> +    char *ident; /* 'vm' or vCPU qom path */
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    QTAILQ_ENTRY(StatsDescriptors) next;
> +} StatsDescriptors;
> +
> +static QTAILQ_HEAD(, StatsDescriptors) stats_descriptors =
> +    QTAILQ_HEAD_INITIALIZER(stats_descriptors);
> +
> +static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd,
> +                                                Error **errp)
> +{
> +    StatsDescriptors *descriptors;
> +    const char *ident;
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    size_t size_desc;
> +    ssize_t ret;
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        ident = StatsTarget_str(STATS_TARGET_VM);
> +        break;
> +    case STATS_TARGET_VCPU:
> +        ident = current_cpu->parent_obj.canonical_path;
> +        break;
> +    default:
> +        abort();
> +    }
> +
> +    QTAILQ_FOREACH(descriptors, &stats_descriptors, next) {
> +        if (g_str_equal(descriptors->ident, ident)) {
> +            return descriptors;
> +        }
> +    }
> +
> +    descriptors = g_new0(StatsDescriptors, 1);
> +
> +    /* Read stats header */
> +    kvm_stats_header = g_malloc(sizeof(*kvm_stats_header));
> +    ret = read(stats_fd, kvm_stats_header, sizeof(*kvm_stats_header));
> +    if (ret != sizeof(*kvm_stats_header)) {
> +        error_setg(errp, "KVM stats: failed to read stats header: "
> +                   "expected %zu actual %zu",
> +                   sizeof(*kvm_stats_header), ret);
> +        return NULL;
> +    }
> +    size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
> +
> +    /* Read stats descriptors */
> +    kvm_stats_desc = g_malloc0_n(kvm_stats_header->num_desc, size_desc);
> +    ret = pread(stats_fd, kvm_stats_desc,
> +                size_desc * kvm_stats_header->num_desc,
> +                kvm_stats_header->desc_offset);
> +
> +    if (ret != size_desc * kvm_stats_header->num_desc) {
> +        error_setg(errp, "KVM stats: failed to read stats descriptors: "
> +                   "expected %zu actual %zu",
> +                   size_desc * kvm_stats_header->num_desc, ret);
> +        g_free(descriptors);

That's missing a free of kvm_stats_desc
(Sorry, I missed that last time)

> +        return NULL;
> +    }
> +    descriptors->kvm_stats_header = kvm_stats_header;
> +    descriptors->kvm_stats_desc = kvm_stats_desc;
> +    descriptors->ident = g_strdup(ident);

There's something that confuses me here; you check your set of
descriptors above to find any with the matching ident, and if you've
already got it you return it; OK.  Now, if you don't match then you
read some stats and store it with that ident - but I don't see
when you read the stats from the fd, what makes it read the stats that
correspond to 'ident' ?

> +    QTAILQ_INSERT_TAIL(&stats_descriptors, descriptors, next);
> +    return descriptors;
> +}
> +
> +static void query_stats(StatsResultList **result, StatsTarget target,
> +                        int stats_fd, Error **errp)
> +{
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    StatsDescriptors *descriptors;
> +    g_autofree uint64_t *stats_data = NULL;
> +    struct kvm_stats_desc *pdesc;
> +    StatsList *stats_list = NULL;
> +    size_t size_desc, size_data = 0;
> +    ssize_t ret;
> +    int i;
> +
> +    descriptors = find_stats_descriptors(target, stats_fd, errp);
> +    if (!descriptors) {
> +        return;
> +    }
> +
> +    kvm_stats_header = descriptors->kvm_stats_header;
> +    kvm_stats_desc = descriptors->kvm_stats_desc;
> +    size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
> +
> +    /* Tally the total data size; read schema data */
> +    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
> +        pdesc = (void *)kvm_stats_desc + i * size_desc;
> +        size_data += pdesc->size * sizeof(*stats_data);
> +    }
> +
> +    stats_data = g_malloc0(size_data);
> +    ret = pread(stats_fd, stats_data, size_data, kvm_stats_header->data_offset);
> +
> +    if (ret != size_data) {
> +        error_setg(errp, "KVM stats: failed to read data: "
> +                   "expected %zu actual %zu", size_data, ret);
> +        return;
> +    }
> +
> +    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
> +        uint64_t *stats;
> +        pdesc = (void *)kvm_stats_desc + i * size_desc;
> +
> +        /* Add entry to the list */
> +        stats = (void *)stats_data + pdesc->offset;
> +        stats_list = add_kvmstat_entry(pdesc, stats, stats_list, errp);
> +    }
> +
> +    if (!stats_list) {
> +        return;
> +    }
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +        add_stats_entry(result, STATS_PROVIDER_KVM, NULL, stats_list);
> +        break;
> +    case STATS_TARGET_VCPU:
> +        add_stats_entry(result, STATS_PROVIDER_KVM,
> +                        current_cpu->parent_obj.canonical_path,
> +                        stats_list);
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static void query_stats_schema(StatsSchemaList **result, StatsTarget target,
> +                               int stats_fd, Error **errp)
> +{
> +    struct kvm_stats_desc *kvm_stats_desc;
> +    struct kvm_stats_header *kvm_stats_header;
> +    StatsDescriptors *descriptors;
> +    struct kvm_stats_desc *pdesc;
> +    StatsSchemaValueList *stats_list = NULL;
> +    size_t size_desc;
> +    int i;
> +
> +    descriptors = find_stats_descriptors(target, stats_fd, errp);
> +    if (!descriptors) {
> +        return;
> +    }
> +
> +    kvm_stats_header = descriptors->kvm_stats_header;
> +    kvm_stats_desc = descriptors->kvm_stats_desc;
> +    size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
> +
> +    /* Tally the total data size; read schema data */
> +    for (i = 0; i < kvm_stats_header->num_desc; ++i) {
> +        pdesc = (void *)kvm_stats_desc + i * size_desc;
> +        stats_list = add_kvmschema_entry(pdesc, stats_list, errp);
> +    }
> +
> +    add_stats_schema(result, STATS_PROVIDER_KVM, target, stats_list);
> +}
> +
> +static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
> +{
> +    StatsArgs *kvm_stats_args = (StatsArgs *) data.host_ptr;
> +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
> +    Error *local_err = NULL;
> +
> +    if (stats_fd == -1) {
> +        error_setg_errno(&local_err, errno, "KVM stats: ioctl failed");
> +        error_propagate(kvm_stats_args->errp, local_err);
> +        return;
> +    }
> +    query_stats(kvm_stats_args->result.stats, STATS_TARGET_VCPU, stats_fd,
> +                kvm_stats_args->errp);
> +    close(stats_fd);
> +}
> +
> +static void query_stats_schema_vcpu(CPUState *cpu, run_on_cpu_data data)
> +{
> +    StatsArgs *kvm_stats_args = (StatsArgs *) data.host_ptr;
> +    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
> +    Error *local_err = NULL;
> +
> +    if (stats_fd == -1) {
> +        error_setg_errno(&local_err, errno, "KVM stats: ioctl failed");
> +        error_propagate(kvm_stats_args->errp, local_err);
> +        return;
> +    }
> +    query_stats_schema(kvm_stats_args->result.schema, STATS_TARGET_VCPU, stats_fd,
> +                       kvm_stats_args->errp);
> +    close(stats_fd);
> +}
> +
> +static void query_stats_cb(StatsResultList **result, StatsTarget target, Error **errp)
> +{
> +    KVMState *s = kvm_state;
> +    CPUState *cpu;
> +    int stats_fd;
> +
> +    switch (target) {
> +    case STATS_TARGET_VM:
> +    {
> +        stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
> +        if (stats_fd == -1) {
> +            error_setg_errno(errp, errno, "KVM errno, stats: ioctl failed");
> +            return;
> +        }
> +        query_stats(result, target, stats_fd, errp);
> +        close(stats_fd);
> +        break;
> +    }
> +    case STATS_TARGET_VCPU:
> +    {
> +        StatsArgs stats_args;
> +        stats_args.result.stats = result;
> +        stats_args.errp = errp;
> +        CPU_FOREACH(cpu) {
> +            run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
> +        }
> +        break;
> +    }
> +    default:
> +        break;
> +    }
> +}
> +
> +void query_stats_schemas_cb(StatsSchemaList **result, Error **errp)
> +{
> +    StatsArgs stats_args;
> +    KVMState *s = kvm_state;
> +    int stats_fd;
> +
> +    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
> +    if (stats_fd == -1) {
> +        error_setg(errp, "KVM stats: ioctl failed");

missed an _errno

> +        return;
> +    }
> +    query_stats_schema(result, STATS_TARGET_VM, stats_fd, errp);
> +    close(stats_fd);
> +
> +    stats_args.result.schema = result;
> +    stats_args.errp = errp;
> +    run_on_cpu(first_cpu, query_stats_schema_vcpu, RUN_ON_CPU_HOST_PTR(&stats_args));
> +}
> diff --git a/qapi/stats.json b/qapi/stats.json
> index ada0fbf26f..df7c4d886c 100644
> --- a/qapi/stats.json
> +++ b/qapi/stats.json
> @@ -52,7 +52,7 @@
>  # Since: 7.1
>  ##
>  { 'enum': 'StatsProvider',
> -  'data': [ ] }
> +  'data': [ 'kvm' ] }
>  
>  ##
>  # @StatsTarget:
> -- 
> 2.36.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


