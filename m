Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7F508C1D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:29:30 +0200 (CEST)
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCGn-0005OU-UP
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhBlO-0006bi-Ph
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:57:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nhBlN-0002rO-2f
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650466620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vUmNI5P1JrsokO6Dt5IscJD22FqjjkquZewf3zM2Lmk=;
 b=ZkSbf4WZLmhe0jtXiJIdDzEgHF5GIQRfoSXUo/1/5eqD0hi7JlQP+SdoRiFE9RWlKOuAHj
 7O8LXjyPUvrL8q6Zn/6zDwMJ0HvxMm/gfJKSLXzvS+gM6nk2keA/0+0UKVB9CxqyC4L1uj
 y2RlTBu62LVGFfh/cEw0Nv+djitP09c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-Q6QI3nToPfWUzTbK0hGtGg-1; Wed, 20 Apr 2022 10:56:58 -0400
X-MC-Unique: Q6QI3nToPfWUzTbK0hGtGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 e2-20020adfa442000000b0020a91fa37b9so476254wra.10
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vUmNI5P1JrsokO6Dt5IscJD22FqjjkquZewf3zM2Lmk=;
 b=Qc0XrTN+ZgBFdmV7z+mZLFHLyRVlW4mYAt6lpW0oE3KhoLzVC3AkRVGBWyxwnRYX/X
 WwhgjMyTxua+GHizLtiRy7mS5ocPEGZQhXqm524rwl23KSaIrz8PAg4WMLEHG8GuMIv6
 Y3j41tt+MegyfhgwqNcEZP+RM2tzFxJ0SAvGFUwTlV6jN8/uucXkBvfK7gTqUdW0gHsR
 v0ru6gfCQB1giV0PBdUDKlV/RrvTP1rqsKbYqjp8ND3GPQXcKWQFsI8onGNq+q1YK8aq
 QcixUUU/aogcCcUwr+zynvx1ot9MDlwGio75Q2hMWJbxoYk0w+gSB3LXIVH9H8jhGfqI
 HqNA==
X-Gm-Message-State: AOAM5339wpjBH2vqQ2DkadaBjtxvWbqpmVgUkf+G13PzP2I8Bn94e/2s
 6WM7BLGRkUCRHQsK8KmspJGiDvawbWTwcG8kxM8TZXNdXCNkFLFapFwF+vswRwKmdWN3w8ofDqv
 R+iaJ6QoPks3DIPY=
X-Received: by 2002:adf:f00d:0:b0:207:a6a6:a0c9 with SMTP id
 j13-20020adff00d000000b00207a6a6a0c9mr15580607wro.459.1650466617646; 
 Wed, 20 Apr 2022 07:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw0PhC1uuvQS/GB7IWEYlaC1Yq/FOfmB8A0ET66NvuyQPaQ7D9NeJ+cGG8nB4qhNx73sloaw==
X-Received: by 2002:adf:f00d:0:b0:207:a6a6:a0c9 with SMTP id
 j13-20020adff00d000000b00207a6a6a0c9mr15580580wro.459.1650466617426; 
 Wed, 20 Apr 2022 07:56:57 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm40027wma.21.2022.04.20.07.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 07:56:57 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:56:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v7 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220420165655.5e83b381@redhat.com>
In-Reply-To: <20220420104909.233058-5-gshan@redhat.com>
References: <20220420104909.233058-1-gshan@redhat.com>
 <20220420104909.233058-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, shan.gavin@gmail.com, peter.maydell@linaro.org,
 zhenyzha@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, pbonzini@redhat.com, drjones@redhat.com, eblake@redhat.com,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 18:49:09 +0800
Gavin Shan <gshan@redhat.com> wrote:

> When the PPTT table is built, the CPU topology is re-calculated, but
> it's unecessary because the CPU topology has been populated in
> virt_possible_cpu_arch_ids() on arm/virt machine.
> 
> This reworks build_pptt() to avoid by reusing the existing IDs in
> ms->possible_cpus. Currently, the only user of build_pptt() is
> arm/virt machine.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

Looks fine to me, so

Acked-by: Igor Mammedov <imammedo@redhat.com>


Also do we have a bios-tables tests that watches over/tests PPTT table?
if not please add one as a patch on top.

> ---
>  hw/acpi/aml-build.c | 109 +++++++++++++++++++-------------------------
>  1 file changed, 47 insertions(+), 62 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 4086879ebf..73f4e69c29 100644
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
> +    /*
> +     * This works with the assumption that cpus[n].props.*_id has been
> +     * sorted from top to down levels in mc->possible_cpu_arch_ids().
> +     * Otherwise, the unexpected and duplicate containers will be
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
> +        }
>  
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
> -        int core;
> -
> -        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
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
>                      (0 << 0), /* not a physical package */
> -                    parent_offset, core, NULL, 0);
> -            } else {
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (1 << 1) | /* ACPI Processor ID valid */
> -                    (1 << 3),  /* Node is a Leaf */
> -                    parent_offset, uid++, NULL, 0);
> +                    cluster_offset, core_id, NULL, 0);
>              }
> -        }
> -    }
> -
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int thread;
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


