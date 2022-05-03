Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5F51904C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:38:38 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0E8-0008GD-9z
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nlyva-00020N-SF
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nlyvZ-0002x3-05
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y9dgwcvRm6fut9xvX4VrsEQlicampPN29seXdU1Fxdw=;
 b=B8DKVwn1V/W/ijNqUbxvZoyiymXibL1N7omJm7W94GrMJHZi/TXKgOswztY/S92UrBxj4T
 33wv6jFf4nFHX2jvTfefBOmkVqsd2CB8iMEzZ0lXKv9IZkm/CsCVY5SgUdz5UNqt9KJ5wG
 8fv4HLSflHJiHFtMLp6oi4HvktgztN4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-p3yWrOq7OKqiarORx8lVJg-1; Tue, 03 May 2022 13:43:45 -0400
X-MC-Unique: p3yWrOq7OKqiarORx8lVJg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so6602822wra.15
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 10:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y9dgwcvRm6fut9xvX4VrsEQlicampPN29seXdU1Fxdw=;
 b=WLJqmTwbQLGaO3QTBr/jAi1+J8rQULMqTzSGpG5fCQ0fOOmKEy6RS6+S4iMqAldIqt
 ZKDanQbonSu6xgaJqsizecsSkd7Nd9S1XTeIzd9haLhp34bzNwCV83Trzx5EdvbYo4tg
 rgFWLgN0NSHJ76la6Zfu/6Tj595lAhIGJSEjKLrNWRO1BQ9cg9xymQnSOcBpEoQj/De1
 fRc6dp3I8mBvCsCnNwZ+MUNS72rY+TGl+uMmkQmG81/LPBsLh7Cso6jd01BBJ+FzQ+dJ
 p43XIOaWfQjOa0qHUFAmOc9sjCBlibVLi2TNR6cdKeUNcszsCZ1NAmqIX4wIIzGNQmGS
 DNzQ==
X-Gm-Message-State: AOAM5306hAQY0jvYqrDYmKWc6JemU9qXuhNThADfnBf67zSPKDdQjgml
 UcJjdsrHmmpkxsAWwDFnWA8aMrxGZZxqF9dsryrYNIY5/cGp00r7MVZPqYFvLgHII2LyNKgcihP
 L+amcQmNtKh+JxoU=
X-Received: by 2002:a7b:c30e:0:b0:37f:a63d:3d1f with SMTP id
 k14-20020a7bc30e000000b0037fa63d3d1fmr4213949wmj.178.1651599824335; 
 Tue, 03 May 2022 10:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnVQ1d/vgTiUQBfmdTOpjZhJKlg+AJNzP5Xh8DcVfIcP+wRNURwPF7hVV48vG89MBAdkX+OQ==
X-Received: by 2002:a7b:c30e:0:b0:37f:a63d:3d1f with SMTP id
 k14-20020a7bc30e000000b0037fa63d3d1fmr4213921wmj.178.1651599824065; 
 Tue, 03 May 2022 10:43:44 -0700 (PDT)
Received: from redhat.com ([2.54.62.85]) by smtp.gmail.com with ESMTPSA id
 n29-20020a05600c3b9d00b0038cf0796675sm1468674wms.0.2022.05.03.10.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 10:43:43 -0700 (PDT)
Date: Tue, 3 May 2022 13:43:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 Jonathan.Cameron@huawei.com, drjones@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v9 6/6] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220503134330-mutt-send-email-mst@kernel.org>
References: <20220503140304.855514-1-gshan@redhat.com>
 <20220503140304.855514-7-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503140304.855514-7-gshan@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, May 03, 2022 at 10:03:04PM +0800, Gavin Shan wrote:
> When the PPTT table is built, the CPU topology is re-calculated, but
> it's unecessary because the CPU topology has been populated in
> virt_possible_cpu_arch_ids() on arm/virt machine.
> 
> This reworks build_pptt() to avoid by reusing the existing IDs in
> ms->possible_cpus. Currently, the only user of build_pptt() is
> arm/virt machine.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/acpi/aml-build.c | 111 +++++++++++++++++++-------------------------
>  1 file changed, 48 insertions(+), 63 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4086879ebf..e6bfac95c7 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2002,86 +2002,71 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
> -    GQueue *list = g_queue_new();
> -    guint pptt_start = table_data->len;
> -    guint parent_offset;
> -    guint length, i;
> -    int uid = 0;
> -    int socket;
> +    CPUArchIdList *cpus = ms->possible_cpus;
> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> +    uint32_t socket_offset = 0, cluster_offset = 0, core_offset = 0;
> +    uint32_t pptt_start = table_data->len;
> +    int n;
>      AcpiTable table = { .sig = "PPTT", .rev = 2,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
>  
> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> -        g_queue_push_tail(list,
> -            GUINT_TO_POINTER(table_data->len - pptt_start));
> -        build_processor_hierarchy_node(
> -            table_data,
> -            /*
> -             * Physical package - represents the boundary
> -             * of a physical package
> -             */
> -            (1 << 0),
> -            0, socket, NULL, 0);
> -    }
> -
> -    if (mc->smp_props.clusters_supported) {
> -        length = g_queue_get_length(list);
> -        for (i = 0; i < length; i++) {
> -            int cluster;
> -
> -            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    parent_offset, cluster, NULL, 0);
> -            }
> +    /*
> +     * This works with the assumption that cpus[n].props.*_id has been
> +     * sorted from top to down levels in mc->possible_cpu_arch_ids().
> +     * Otherwise, the unexpected and duplicated containers will be
> +     * created.
> +     */
> +    for (n = 0; n < cpus->len; n++) {
> +        if (cpus->cpus[n].props.socket_id != socket_id) {
> +            assert(cpus->cpus[n].props.socket_id > socket_id);
> +            socket_id = cpus->cpus[n].props.socket_id;
> +            cluster_id = -1;
> +            core_id = -1;
> +            socket_offset = table_data->len - pptt_start;
> +            build_processor_hierarchy_node(table_data,
> +                (1 << 0), /* Physical package */
> +                0, socket_id, NULL, 0);
>          }
> -    }
>  
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int core;
> -
> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    parent_offset, core, NULL, 0);
> -            } else {
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (1 << 1) | /* ACPI Processor ID valid */
> -                    (1 << 3),  /* Node is a Leaf */
> -                    parent_offset, uid++, NULL, 0);
> +        if (mc->smp_props.clusters_supported) {
> +            if (cpus->cpus[n].props.cluster_id != cluster_id) {
> +                assert(cpus->cpus[n].props.cluster_id > cluster_id);
> +                cluster_id = cpus->cpus[n].props.cluster_id;
> +                core_id = -1;
> +                cluster_offset = table_data->len - pptt_start;
> +                build_processor_hierarchy_node(table_data,
> +                    (0 << 0), /* Not a physical package */
> +                    socket_offset, cluster_id, NULL, 0);
>              }
> +        } else {
> +            cluster_offset = socket_offset;
>          }
> -    }
>  
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int thread;
> +        if (ms->smp.threads == 1) {
> +            build_processor_hierarchy_node(table_data,
> +                (1 << 1) | /* ACPI Processor ID valid */
> +                (1 << 3),  /* Node is a Leaf */
> +                cluster_offset, n, NULL, 0);
> +        } else {
> +            if (cpus->cpus[n].props.core_id != core_id) {
> +                assert(cpus->cpus[n].props.core_id > core_id);
> +                core_id = cpus->cpus[n].props.core_id;
> +                core_offset = table_data->len - pptt_start;
> +                build_processor_hierarchy_node(table_data,
> +                    (0 << 0), /* Not a physical package */
> +                    cluster_offset, core_id, NULL, 0);
> +            }
>  
> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (thread = 0; thread < ms->smp.threads; thread++) {
> -            build_processor_hierarchy_node(
> -                table_data,
> +            build_processor_hierarchy_node(table_data,
>                  (1 << 1) | /* ACPI Processor ID valid */
>                  (1 << 2) | /* Processor is a Thread */
>                  (1 << 3),  /* Node is a Leaf */
> -                parent_offset, uid++, NULL, 0);
> +                core_offset, n, NULL, 0);
>          }
>      }
>  
> -    g_queue_free(list);
>      acpi_table_end(linker, &table);
>  }
>  
> -- 
> 2.23.0


