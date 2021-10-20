Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C202943466C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 10:05:09 +0200 (CEST)
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6ay-0008UC-UY
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 04:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6YM-0005Hg-Nb
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1md6YJ-0006PC-3T
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 04:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634716942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjobW3Ux1g3xCm/3QWoL9mvBYUJqzPPdEaOmv0bHXfY=;
 b=b2Ps42nYu+zLFNPm+PWjtNsl+sf9lh9wNFzS6hDmXx1/VsIUfSRJUsSouM/0eItYWDrTQR
 PI8HYuTcbQWa51qy9iQRILuPvoPJTPqy93oUqmGfWtC1HO8Qdgb31axue9JCxcasdQPesr
 s7wm+RtlLezXaacIT2CoUSL4qEE83UM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-KPjXBFSIPXm71YnGKOB33Q-1; Wed, 20 Oct 2021 04:02:21 -0400
X-MC-Unique: KPjXBFSIPXm71YnGKOB33Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so2668833wmg.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 01:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fjobW3Ux1g3xCm/3QWoL9mvBYUJqzPPdEaOmv0bHXfY=;
 b=Z4UcB0+UC2SydiAAIJCvxm9nrDk9bE6LXot69KpRn3MreOtu0T5R4t44UxgmmQUKOx
 sJZuYXk0sjtIWvIXfGF+05pcl8saiyqOrFwOUOsVBc/IYkdA+MDNbVMVZakoXaLYUkKy
 cuqI8vyiYssp2K8kv445D3uQe6BTiFUfnYjfn3bjFcGByzC6lGLoUeQT8ZZJXImj/u3y
 G3wIae0n/9geGbbUY/jKLKGvykHq7JaobVcab7ytxNPvb4Ghte+dFBnNDCUsfmZiMHjb
 EKnHQrNpUVck8BwdgggY7XDgmBGvN0w2Sn/hJyVMMNlsIa03TUk3HyTHxvhM7/YBClyu
 ntQQ==
X-Gm-Message-State: AOAM533P4eGpjRbzfJ1UJlhcj7HWM0vDr3CBxXdbfNiFmAYduA/N1p1K
 TqLOVB4u0Uyd0CWYOg40L0jvVwlRSnRGJfsG9hCZokO7xYN6q8zoyzhciXtX10h/hL5k/Ziz3fP
 XE/nMCL3nCU3xUtk=
X-Received: by 2002:a1c:7d91:: with SMTP id y139mr12399264wmc.57.1634716937228; 
 Wed, 20 Oct 2021 01:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRaFfCZm3KQkC/SNBquyWIekz5HBdo8kCXbiIEB27gYJZ0iB77Txh9ZEtEi8tGWJwfo09Kgg==
X-Received: by 2002:a1c:7d91:: with SMTP id y139mr12399209wmc.57.1634716936815; 
 Wed, 20 Oct 2021 01:02:16 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f10sm1405289wri.84.2021.10.20.01.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 01:02:16 -0700 (PDT)
Subject: Re: [PATCH v8 5/8] hw/acpi/aml-build: Add PPTT table
To: Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-6-wangyanan55@huawei.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <316edbd3-2235-efb1-7176-e3f477aec6a4@redhat.com>
Date: Wed, 20 Oct 2021 10:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014132206.19220-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 10/14/21 3:22 PM, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Add the Processor Properties Topology Table (PPTT) used to
> describe CPU topology information to ACPI guests.
> 
> Note, a DT-boot Linux guest with a non-flat CPU topology will
> see socket and core IDs being sequential integers starting
> from zero, which is different from ACPI-boot Linux guest,
> e.g. with -smp 4,sockets=2,cores=2,threads=1
> 
> a DT boot produces:
> 
>  cpu:  0 package_id:  0 core_id:  0
>  cpu:  1 package_id:  0 core_id:  1
>  cpu:  2 package_id:  1 core_id:  0
>  cpu:  3 package_id:  1 core_id:  1
> 
> an ACPI boot produces:
> 
>  cpu:  0 package_id: 36 core_id:  0
>  cpu:  1 package_id: 36 core_id:  1
>  cpu:  2 package_id: 96 core_id:  2
>  cpu:  3 package_id: 96 core_id:  3
> 
> This is due to several reasons:
> 
>  1) DT cpu nodes do not have an equivalent field to what the PPTT
>     ACPI Processor ID must be, i.e. something equal to the MADT CPU
>     UID or equal to the UID of an ACPI processor container. In both
>     ACPI cases those are platform dependant IDs assigned by the
>     vendor.
> 
>  2) While QEMU is the vendor for a guest, if the topology specifies
>     SMT (> 1 thread), then, with ACPI, it is impossible to assign a
>     core-id the same value as a package-id, thus it is not possible
>     to have package-id=0 and core-id=0. This is because package and
>     core containers must be in the same ACPI namespace and therefore
>     must have unique UIDs.
> 
>  3) ACPI processor containers are not mandatorily required for PPTT
>     tables to be used and, due to the limitations of which IDs are
>     selected described above in (2), they are not helpful for QEMU,
>     so we don't build them with this patch. In the absence of them,
>     Linux assigns its own unique IDs. The maintainers have chosen not
>     to use counters from zero, but rather ACPI table offsets, which
>     explains why the numbers are so much larger than with DT.
> 
>  4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
>     match the logical CPU IDs, because these IDs must be equal to the
>     MADT CPU UID (as no processor containers are present), and QEMU
>     uses the logical CPU ID for these MADT IDs.
> 
> So in summary, with QEMU as the vendor for the guests, we simply
> use sequential integers starting from zero for the non-leaf nodes
> but with ID-valid flag unset, so that guest will ignore them and
> use table offsets as unique container IDs. And we use logical CPU
> IDs for the leaf nodes with the ID-valid flag set, which will be
> consistent with MADT.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/acpi/aml-build.c         | 60 +++++++++++++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  3 ++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index b7b9db6888..0d50e88e9d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1990,6 +1990,66 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>      }
>  }
>  
> +/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> +                const char *oem_id, const char *oem_table_id)
> +{
> +    int pptt_start = table_data->len;
> +    int uid = 0;
> +    int socket;
> +    AcpiTable table = { .sig = "PPTT", .rev = 2,
> +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
Table 5-149 of 6.2 spec (6.2 May 2017) tells the rev shall be 1. Or is
it an erratum somewhere I did miss?

I would also add the spec version in the commit msg.
> +
> +    acpi_table_begin(&table, table_data);
> +
> +    for (socket = 0; socket < ms->smp.sockets; socket++) {
> +        uint32_t socket_offset = table_data->len - pptt_start;
> +        int core;
> +
> +        build_processor_hierarchy_node(
> +            table_data,
> +            /*
> +             * ACPI 6.2 - Physical package
> +             * represents the boundary of a physical package
> +             */
> +            (1 << 0),
> +            0, socket, NULL, 0);
I see we set an ACPI process ID but in the meantime the ACPI processor
ID valid flag is not set. I am not sure I fully catch the meaning of
this latter but just to double check if this is done on purpose. Maybe
wort a general comment as this also happens below.
> +
> +        for (core = 0; core < ms->smp.cores; core++) {
> +            uint32_t core_offset = table_data->len - pptt_start;
> +            int thread;
> +
> +            if (ms->smp.threads > 1) {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    /*
> +                     * ACPI 6.2 - Physical package
> +                     * doesn't represent the boundary of a physical package
> +                     */
> +                    (0 << 0),
would rather say (0 << 0) /* not a physical package */ and same elsewhere
> +                    socket_offset, core, NULL, 0);
> +
> +                for (thread = 0; thread < ms->smp.threads; thread++) {
> +                    build_processor_hierarchy_node(
> +                        table_data,
> +                        (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
> +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
So the references look globaly confusing to me. Either it complies to
6.2 or to 6.3. Looks ir rather complies with 6.3. To me, this needs to
be clarified. I would also add the reference it complies to in the
commit msg.
> +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                        core_offset, uid++, NULL, 0);
> +                }
> +            } else {
> +                build_processor_hierarchy_node(
> +                    table_data,
> +                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
> +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> +                    socket_offset, uid++, NULL, 0);
> +            }
> +        }
> +    }
> +
> +    acpi_table_end(linker, &table);
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 2c457c8f17..b92706388c 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -493,6 +493,9 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>                                      uint32_t parent, uint32_t id,
>                                      uint32_t *priv_rsrc, uint32_t priv_num);
>  
> +void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> +                const char *oem_id, const char *oem_table_id);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> 
Thanks

Eric


