Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB874DDAC8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:44:45 +0100 (CET)
Received: from localhost ([::1]:44278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCuK-00089e-6G
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:44:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVCeP-0006jD-PU
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nVCeN-0002yP-TN
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647610095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlVw6a1wKPAc6hYhrSgjcU7V2jdpNCTUDzCw5YpZsvA=;
 b=EUOgsb149xd+g2TeYj9MMF9hYbvuXnKjzrFG5eZDaaTXIAZB/Nlp6Q+9ze+VrCWb8NQt3j
 YAhlfk06uXNs1HvHTLrGldPu0849BG6TTkCgcflhl6ZchcyhH1fspirr0kzZNgDh3Q4yjT
 coB2uBoajk5wSzzf2sd8HvHTVB6LHNc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-klZzACaQNC2MoY1YIbvEUg-1; Fri, 18 Mar 2022 09:28:14 -0400
X-MC-Unique: klZzACaQNC2MoY1YIbvEUg-1
Received: by mail-ej1-f71.google.com with SMTP id
 ml20-20020a170906cc1400b006df8c9357efso3055297ejb.21
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PlVw6a1wKPAc6hYhrSgjcU7V2jdpNCTUDzCw5YpZsvA=;
 b=aYslPOpd0ZS1CvoPHpYKQhOTTn6BB92sD3/r8+t7F6aXjStGhOcYE4uV4QC5KTsZQH
 BOgQvb4ec60T/52Kqf7+3oO9BHeaD+5LOGO3WU90bM7u4fZp5SZtvJrgQ7oO8KuYbudk
 HL5zj00egcQmVdi/bVWHNU0Ce9oJYYfrPcd9lQF9qIaCvevLCJ/4dvEVWyXECy+o9HpL
 I85AVDnGm5CKi3j4NBe8qIxYgpcaw2pwZ+/2KvgCnilbb5sc5ys9VsVe3SvUo4pWhUmd
 XgOUL1o4j1C7twg3wPJgZfiSEhcbjvPEtuUAdua0j+SxlOegZvEzSDpTc+0Wq5bQRUiE
 ZVzw==
X-Gm-Message-State: AOAM532Z5r1Qkr0Hsd1fJJqQSuEk/ykAr+MktyGBT4scesjjSzOllNnB
 t17NUNKDuZm/yTnsSlD+NxkDL4sXEIyGFTXIVxMDabwd9jCKoFqAoniJLjH5CT31LqXSx6NxJfM
 r/kZIvHJHndx3RYw=
X-Received: by 2002:a05:6402:518a:b0:416:b50e:3c7d with SMTP id
 q10-20020a056402518a00b00416b50e3c7dmr9550446edd.177.1647610093061; 
 Fri, 18 Mar 2022 06:28:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+d23oZa3MMf+Jrx2XnJdXdNM6jRXZpL3jFqHMvA+hxj9Qbwig3JON6LtM5er/zzHM7VP3wg==
X-Received: by 2002:a05:6402:518a:b0:416:b50e:3c7d with SMTP id
 q10-20020a056402518a00b00416b50e3c7dmr9550406edd.177.1647610092840; 
 Fri, 18 Mar 2022 06:28:12 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a17090694c100b006da91d57e93sm3568968ejy.207.2022.03.18.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:28:12 -0700 (PDT)
Date: Fri, 18 Mar 2022 14:28:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 2/3] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220318142811.1d8eb072@redhat.com>
In-Reply-To: <12b4a089-b01f-f536-499e-d6029d0b1dea@huawei.com>
References: <20220303031152.145960-1-gshan@redhat.com>
 <20220303031152.145960-3-gshan@redhat.com>
 <12b4a089-b01f-f536-499e-d6029d0b1dea@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, Gavin Shan <gshan@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, zhenyzha@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Mar 2022 14:34:12 +0800
"wangyanan (Y)" <wangyanan55@huawei.com> wrote:

> Hi Gavin,
> 
> On 2022/3/3 11:11, Gavin Shan wrote:
> > When the PPTT table is built, the CPU topology is re-calculated, but
> > it's unecessary because the CPU topology, except the cluster IDs,
> > has been populated in virt_possible_cpu_arch_ids() on arm/virt machine.
> >
> > This avoids to re-calculate the CPU topology by reusing the existing
> > one in ms->possible_cpus. However, the cluster ID for the CPU instance
> > has to be calculated dynamically because there is no corresponding
> > field in struct CpuInstanceProperties. Currently, the only user of
> > build_pptt() is arm/virt machine.
> >
> > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > ---
> >   hw/acpi/aml-build.c | 106 ++++++++++++++++++++++++++++++++++----------
> >   1 file changed, 82 insertions(+), 24 deletions(-)
> >
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index 8966e16320..572cf5fc00 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >                   const char *oem_id, const char *oem_table_id)
> >   {
> >       MachineClass *mc = MACHINE_GET_CLASS(ms);
> > +    CPUArchIdList *cpus = ms->possible_cpus;
> > +    GQueue *socket_list = g_queue_new();
> > +    GQueue *cluster_list = g_queue_new();
> > +    GQueue *core_list = g_queue_new();
> >       GQueue *list = g_queue_new();
> >       guint pptt_start = table_data->len;
> >       guint parent_offset;
> >       guint length, i;
> > -    int uid = 0;
> > -    int socket;
> > +    int n, id, socket_id, cluster_id, core_id, thread_id;
> >       AcpiTable table = { .sig = "PPTT", .rev = 2,
> >                           .oem_id = oem_id, .oem_table_id = oem_table_id };
> >   
> >       acpi_table_begin(&table, table_data);
> >   
> > -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> > +    for (n = 0; n < cpus->len; n++) {
> > +        socket_id = cpus->cpus[n].props.socket_id;
> > +        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
> > +            continue;
> > +        }
> > +
> > +        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
> >           g_queue_push_tail(list,
> >               GUINT_TO_POINTER(table_data->len - pptt_start));
> >           build_processor_hierarchy_node(
> > @@ -2023,65 +2032,114 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >                * of a physical package
> >                */
> >               (1 << 0),
> > -            0, socket, NULL, 0);
> > +            0, socket_id, NULL, 0);
> >       }
> >   
> >       if (mc->smp_props.clusters_supported) {
> >           length = g_queue_get_length(list);
> >           for (i = 0; i < length; i++) {
> > -            int cluster;
> > -
> >               parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> > -            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
> > +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> > +
> > +            for (n = 0; n < cpus->len; n++) {
> > +                if (cpus->cpus[n].props.socket_id != socket_id) {
> > +                    continue;
> > +                }
> > +
> > +                /*
> > +                 * We have to calculate the cluster ID because it isn't
> > +                 * available in the CPU instance properties.
> > +                 */  
> Since we need cluster ID now, maybe we can simply make it supported
> in the CPU instance properties.

agreed

> 
> Thanks,
> Yanan
> > +                cluster_id = cpus->cpus[n].props.thread_id /
> > +                             (ms->smp.cores * ms->smp.threads);
> > +                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
> > +                    continue;
> > +                }
> > +
> > +                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
> >                   g_queue_push_tail(list,
> >                       GUINT_TO_POINTER(table_data->len - pptt_start));
> >                   build_processor_hierarchy_node(
> >                       table_data,
> >                       (0 << 0), /* not a physical package */
> > -                    parent_offset, cluster, NULL, 0);
> > +                    parent_offset, cluster_id, NULL, 0);
> >               }
> >           }
> >       }
> >   
> >       length = g_queue_get_length(list);
> >       for (i = 0; i < length; i++) {
> > -        int core;
> > -
> >           parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> > -        for (core = 0; core < ms->smp.cores; core++) {
> > -            if (ms->smp.threads > 1) {
> > -                g_queue_push_tail(list,
> > -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> > -                build_processor_hierarchy_node(
> > -                    table_data,
> > -                    (0 << 0), /* not a physical package */
> > -                    parent_offset, core, NULL, 0);
> > -            } else {
> > +        if (!mc->smp_props.clusters_supported) {
> > +            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
> > +        } else {
> > +            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
> > +        }
> > +
> > +        for (n = 0; n < cpus->len; n++) {
> > +            if (!mc->smp_props.clusters_supported &&
> > +                cpus->cpus[n].props.socket_id != socket_id) {
> > +                continue;
> > +            }
> > +
> > +            /*
> > +             * We have to calculate the cluster ID because it isn't
> > +             * available in the CPU instance properties.
> > +             */
> > +            id = cpus->cpus[n].props.thread_id /
> > +                (ms->smp.cores * ms->smp.threads);
> > +            if (mc->smp_props.clusters_supported && id != cluster_id) {
> > +                continue;
> > +            }
> > +
> > +            core_id = cpus->cpus[n].props.core_id;
> > +            if (ms->smp.threads <= 1) {
> >                   build_processor_hierarchy_node(
> >                       table_data,
> >                       (1 << 1) | /* ACPI Processor ID valid */
> >                       (1 << 3),  /* Node is a Leaf */
> > -                    parent_offset, uid++, NULL, 0);
> > +                    parent_offset, core_id, NULL, 0);
> > +                continue;
> >               }
> > +
> > +            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
> > +                continue;
> > +            }
> > +
> > +            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
> > +            g_queue_push_tail(list,
> > +                GUINT_TO_POINTER(table_data->len - pptt_start));
> > +            build_processor_hierarchy_node(
> > +                table_data,
> > +                (0 << 0), /* not a physical package */
> > +                parent_offset, core_id, NULL, 0);
> >           }
> >       }
> >   
> >       length = g_queue_get_length(list);
> >       for (i = 0; i < length; i++) {
> > -        int thread;
> > -
> >           parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> > -        for (thread = 0; thread < ms->smp.threads; thread++) {
> > +        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
> > +
> > +        for (n = 0; n < cpus->len; n++) {
> > +            if (cpus->cpus[n].props.core_id != core_id) {
> > +                continue;
> > +            }
> > +
> > +            thread_id = cpus->cpus[n].props.thread_id;
> >               build_processor_hierarchy_node(
> >                   table_data,
> >                   (1 << 1) | /* ACPI Processor ID valid */
> >                   (1 << 2) | /* Processor is a Thread */
> >                   (1 << 3),  /* Node is a Leaf */
> > -                parent_offset, uid++, NULL, 0);
> > +                parent_offset, thread_id, NULL, 0);
> >           }
> >       }
> >   
> >       g_queue_free(list);
> > +    g_queue_free(core_list);
> > +    g_queue_free(cluster_list);
> > +    g_queue_free(socket_list);
> >       acpi_table_end(linker, &table);
> >   }
> >     
> 


