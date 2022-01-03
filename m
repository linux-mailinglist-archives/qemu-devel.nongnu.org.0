Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647EE483090
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:32:31 +0100 (CET)
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4LZm-00052S-Gi
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:32:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LXb-0003b8-7E
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1n4LXY-00032x-GK
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641209411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k907x5l6JxXK6z/9gcxrygQWXqGOU6MTDqiXpMnmCa4=;
 b=Rtykuj6vggefd6jpYgSkHkE0zA7JWL4WBGnHF0foI68ae1T55t/SUDZujkEoCERrQDbKw9
 e+2md02aZ9hucT2Cae0PDw54IWvLnB7zyy3tP/1mvpGvPfqZGWx38YK2RVlooeJEuwgexR
 Jufk59GUlKq3gGjzzmEWkVlyypA/Hv0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-coPB8FrENYqE57EOCNIovg-1; Mon, 03 Jan 2022 06:30:10 -0500
X-MC-Unique: coPB8FrENYqE57EOCNIovg-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz8-20020a0564021d4800b003f897935eb3so22684336edb.12
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 03:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k907x5l6JxXK6z/9gcxrygQWXqGOU6MTDqiXpMnmCa4=;
 b=fE1GhpAK5cSQwHQU1Hgt8EwW/5bvxWZHMQc1mLsGKXL0mfW/JpyQ4U53tMGbeZ9sSI
 SlRAE1gMF2MtdI9AHHNe4ilz5AQhPZGChlpOZfBK/ulUFTpuLjmCOhpmsBThdSJ7rXvn
 4/FQimOs+PSfIxgUrzC+nNu3CmZFL6ZIjXKbZWZnzMIlNq6DtubXowTgpV3SYssnFX3v
 i/LK408rHLPaxoDTIPYmgxQGlJpNIGDizq4e93Vj4UN4W2/gBhCjzIkL7Aw8tQ+GALy8
 xx+PMwjWbbept1Y5ypoBcOdBuEU2F3Y+3s48DB17Nmbd4F2FbPBs7CjwPY6fnTwFR2Cc
 KiqQ==
X-Gm-Message-State: AOAM5319MR8IvVw+zrgAplMGg9ieEMXBLsSTq4xQkVvz2YQgo/LhtpUe
 fUy32XBbOPwXqtx7tIJjpgIctAs/XjFDRYPeapai2OUlpHTWeyjuIfJmxt/7mTbaoLT+D5+OsEv
 BfX/Nze7korxLDiQ=
X-Received: by 2002:a17:906:b151:: with SMTP id
 bt17mr36244729ejb.193.1641209409344; 
 Mon, 03 Jan 2022 03:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhV1utpnGDqsfLUc8qyOvJg+3ObVDJfw55grWipmq664JywIR3+G8Kagp3iAVK9prfaXZVTw==
X-Received: by 2002:a17:906:b151:: with SMTP id
 bt17mr36244712ejb.193.1641209409077; 
 Mon, 03 Jan 2022 03:30:09 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id 1sm6680204ejo.192.2022.01.03.03.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:30:08 -0800 (PST)
Date: Mon, 3 Jan 2022 12:30:06 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 4/7] hw/arm/virt-acpi-build: Make an ARM specific PPTT
 generator
Message-ID: <20220103113006.yp3kmaqoh7darhnq@gator>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220103084636.2496-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 03, 2022 at 04:46:33PM +0800, Yanan Wang wrote:
> We have a generic build_pptt() in hw/acpi/aml-build.c but it's
> currently only used in ARM acpi initialization. Now we are going
> to support the new CPU cluster parameter which is currently only
> supported by ARM, it won't be a very good idea to add it to the
> generic build_pptt() as it will make the code complex and hard
> to maintain especially when we also support CPU cache topology
> hierarchy in build_pptt() too. Note that the cache topology
> design also varies between different CPU targets.

It's a shame to remove generic ACPI table. I'm not sure what
will be best when addressing the cache topology, but for the
clusters it seems like we should be able to easily skip them
when has_clusters is false.

> 
> So an ARM specific PPTT generator becomes necessary now. Given
> that the generic one is currently only used by ARM, let's just
> move build_pptt() from aml-build.c to virt-acpi-build.c with
> minor update.

Please state what the minor update is? I see the oem parameter
change, but I want to be sure that's the one you're referring
to.

> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 80 ++-----------------------------------
>  hw/arm/virt-acpi-build.c    | 77 ++++++++++++++++++++++++++++++++++-
>  include/hw/acpi/aml-build.h |  5 ++-
>  3 files changed, 81 insertions(+), 81 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index be3851be36..040fbc9b4b 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1968,10 +1968,9 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>   * ACPI spec, Revision 6.3
>   * 5.2.29.1 Processor hierarchy node structure (Type 0)
>   */
> -static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> -                                           uint32_t parent, uint32_t id,
> -                                           uint32_t *priv_rsrc,
> -                                           uint32_t priv_num)
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num)
>  {
>      int i;
>  
> @@ -1994,79 +1993,6 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>      }
>  }
>  
> -/*
> - * ACPI spec, Revision 6.3
> - * 5.2.29 Processor Properties Topology Table (PPTT)
> - */
> -void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> -                const char *oem_id, const char *oem_table_id)
> -{
> -    GQueue *list = g_queue_new();
> -    guint pptt_start = table_data->len;
> -    guint father_offset;
> -    guint length, i;
> -    int uid = 0;
> -    int socket;
> -    AcpiTable table = { .sig = "PPTT", .rev = 2,
> -                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> -
> -    acpi_table_begin(&table, table_data);
> -
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
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int core;
> -
> -        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (core = 0; core < ms->smp.cores; core++) {
> -            if (ms->smp.threads > 1) {
> -                g_queue_push_tail(list,
> -                    GUINT_TO_POINTER(table_data->len - pptt_start));
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (0 << 0), /* not a physical package */
> -                    father_offset, core, NULL, 0);
> -            } else {
> -                build_processor_hierarchy_node(
> -                    table_data,
> -                    (1 << 1) | /* ACPI Processor ID valid */
> -                    (1 << 3),  /* Node is a Leaf */
> -                    father_offset, uid++, NULL, 0);
> -            }
> -        }
> -    }
> -
> -    length = g_queue_get_length(list);
> -    for (i = 0; i < length; i++) {
> -        int thread;
> -
> -        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> -        for (thread = 0; thread < ms->smp.threads; thread++) {
> -            build_processor_hierarchy_node(
> -                table_data,
> -                (1 << 1) | /* ACPI Processor ID valid */
> -                (1 << 2) | /* Processor is a Thread */
> -                (1 << 3),  /* Node is a Leaf */
> -                father_offset, uid++, NULL, 0);
> -        }
> -    }
> -
> -    g_queue_free(list);
> -    acpi_table_end(linker, &table);
> -}
> -
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d0f4867fdf..3ce7680393 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -808,6 +808,80 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_end(linker, &table);
>  }
>  
> +/*
> + * ACPI spec, Revision 6.3
> + * 5.2.29 Processor Properties Topology Table (PPTT)
> + */
> +static void
> +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +{
> +    MachineState *ms = MACHINE(vms);
> +    GQueue *list = g_queue_new();
> +    guint pptt_start = table_data->len;
> +    guint father_offset;
> +    guint length, i;
> +    int uid = 0;
> +    int socket;
> +    AcpiTable table = { .sig = "PPTT", .rev = 2, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
> +
> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
> +        g_queue_push_tail(list,
> +            GUINT_TO_POINTER(table_data->len - pptt_start));
> +        build_processor_hierarchy_node(
> +            table_data,
> +            /*
> +             * Physical package - represents the boundary
> +             * of a physical package
> +             */
> +            (1 << 0),
> +            0, socket, NULL, 0);
> +    }
> +
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int core;
> +
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (core = 0; core < ms->smp.cores; core++) {
> +            if (ms->smp.threads > 1) {
> +                g_queue_push_tail(list,
> +                    GUINT_TO_POINTER(table_data->len - pptt_start));
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (0 << 0), /* not a physical package */
> +                    father_offset, core, NULL, 0);
> +            } else {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI Processor ID valid */
> +                    (1 << 3),  /* Node is a Leaf */
> +                    father_offset, uid++, NULL, 0);
> +            }
> +        }
> +    }
> +
> +    length = g_queue_get_length(list);
> +    for (i = 0; i < length; i++) {
> +        int thread;
> +
> +        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
> +        for (thread = 0; thread < ms->smp.threads; thread++) {
> +            build_processor_hierarchy_node(
> +                table_data,
> +                (1 << 1) | /* ACPI Processor ID valid */
> +                (1 << 2) | /* Processor is a Thread */
> +                (1 << 3),  /* Node is a Leaf */
> +                father_offset, uid++, NULL, 0);
> +        }
> +    }
> +
> +    g_queue_free(list);
> +    acpi_table_end(linker, &table);
> +}
> +
>  /* FADT */
>  static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>                              VirtMachineState *vms, unsigned dsdt_tbl_offset)
> @@ -953,8 +1027,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      if (!vmc->no_cpu_topology) {
>          acpi_add_table(table_offsets, tables_blob);
> -        build_pptt(tables_blob, tables->linker, ms,
> -                   vms->oem_id, vms->oem_table_id);
> +        build_pptt(tables_blob, tables->linker, vms);
>      }
>  
>      acpi_add_table(table_offsets, tables_blob);
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 8346003a22..2c457c8f17 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -489,8 +489,9 @@ void build_srat_memory(GArray *table_data, uint64_t base,
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id);
>  
> -void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> -                const char *oem_id, const char *oem_table_id);
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num);
>  
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
> -- 
> 2.27.0
>

Thanks,
drew 


