Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA436C720
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 15:38:59 +0200 (CEST)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbNvW-0006pp-OC
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 09:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbNuI-0006Hi-Mv
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbNu7-0006um-Dh
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619530648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FyXqyptnSyqvxUVR/2dT9FnJxlTqMyPKlzV0+jrfjDE=;
 b=brkk0M7rvOInAWhVoneRoEEUK3MxN0uYbRZXzWH5d0uQvdaXc91uQTVMFhxUgaUvRqXsA1
 T+d0adNCr6Sogzbn/rKXMAteObknbs+gi7eF7B4psYpv1+wv0gnA3oxWNkLBALzXpxVmXz
 FFNjsiS1jXDAMgTWZ+VOLLltweLdXcA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-Uzb6_LqdNd-wIosKgn0SVQ-1; Tue, 27 Apr 2021 09:37:24 -0400
X-MC-Unique: Uzb6_LqdNd-wIosKgn0SVQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 jl27-20020a17090775dbb029037ccdce96e6so11182646ejc.21
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 06:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FyXqyptnSyqvxUVR/2dT9FnJxlTqMyPKlzV0+jrfjDE=;
 b=JQapqMqd4i4a2q2etqJmeTvcW80TOD/EntpLu9H5x2Eq+ZYxQXajZ0ZEvRDJ7WnaEq
 VG3ekOlPrJeiDm9oNfTMDXoqSMdbMhP9lhhoMDNtLOdjuoWRTdHZBQggCsSQ/8PxnSDp
 a9hxerHVUsIyl8PF67mZRM0tbNPqLzJQs1yPuy6bAvxTs/w/E7pkoLhJf4Os0WjtXllJ
 oTvfFJkTAlW89JlK6KtE8hKV7J0qv0QmdEa7zsiX/P+1zBqWDOns/aRO1kc66Bzv8lRU
 9tlHgOwu6p710tb7GEnKqVCYTlUoqSBmveN7PMz+o7jPNC71O+Hf/O8CNxhRhy072cmf
 IW5A==
X-Gm-Message-State: AOAM532s02ZgaOps4NljXjydBgeemItgWiHVn2bMKSvcdTX6c6BgfCKE
 ouuj/pXj8TZVQ4UWfPeJmi9VsLCL6wvGuqH1Pq0oLqcgI/pyj1/k/nLG9fos+4ngptOXKs3GyR3
 W3qaqjknRlKU8dGg=
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr4442154edd.387.1619530643241; 
 Tue, 27 Apr 2021 06:37:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMmlbdjussoIdhKlpn5FjtBGY6pU3+21fTas5i9uNbnsXI3WTynyFktAVaYuQMOH9ZWgqb7g==
X-Received: by 2002:a05:6402:270a:: with SMTP id
 y10mr4442120edd.387.1619530643063; 
 Tue, 27 Apr 2021 06:37:23 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id i1sm2461693edt.33.2021.04.27.06.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 06:37:22 -0700 (PDT)
Date: Tue, 27 Apr 2021 15:37:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 4/6] hw/acpi/aml-build: Add processor hierarchy
 node structure
Message-ID: <20210427133720.xxwx6caln6dze5dm@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-5-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Henglong Fan <fanhenglong@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 04:07:43PM +0800, Yanan Wang wrote:
> Add a generic API to build Processor Hierarchy Node Structure(Type 0),
> which is strictly consistent with descriptions in ACPI 6.3: 5.2.29.1.
> 
> This function will be used to build ACPI PPTT table for cpu topology.
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 27 +++++++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  4 ++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index d33ce8954a..75e01aea17 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1916,6 +1916,33 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   table_data->len - slit_start, 1, oem_id, oem_table_id);
>  }
>  
> +/*
> + * ACPI 6.3: 5.2.29.1 Processor Hierarchy Node Structure (Type 0)
             ^ Doesn't this table show up in 6.2 first? We should always
use the oldest specification we can.

Also, please don't capitalize Hierarchy, Node, and Structure. Those words
are not capitalized in the spec section name and we want an exact match
here.

> + */
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num)
> +{
> +    int i;
> +
> +    build_append_byte(tbl, 0);                 /* Type 0 - processor */
> +    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
> +    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
> +    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
> +    build_append_int_noprefix(tbl, parent, 4); /* Parent */
> +    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
                                                          ^ should be
capitalized like in the spec
                        
> +
> +    /* Number of private resources */
> +    build_append_int_noprefix(tbl, priv_num, 4);
> +
> +    /* Private resources[N] */
> +    if (priv_num > 0 && priv_rsrc != NULL) {

Since we should never have priv_num > 0 and priv_rsrc == NULL, then we can
do

   if (priv_num > 0) {
       assert(priv_rsrc);
       ...

> +        for (i = 0; i < priv_num; i++) {
> +            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
> +        }
> +    }
> +}
> +
>  /* build rev1/rev3/rev5.1 FADT */ 
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id)
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 471266d739..ea74b8f6ed 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -462,6 +462,10 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>  void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  const char *oem_id, const char *oem_table_id);
>  
> +void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
> +                                    uint32_t parent, uint32_t id,
> +                                    uint32_t *priv_rsrc, uint32_t priv_num);
> +
>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>                  const char *oem_id, const char *oem_table_id);
>  
> -- 
> 2.19.1
>

Thanks,
drew 


