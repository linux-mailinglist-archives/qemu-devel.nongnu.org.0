Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F23827CE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:08:32 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZEg-0007BX-H0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liZDZ-0006BY-Bn
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liZDX-0007li-H5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621242434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/AwbT1o8x4LK9y06yHXiYUlDQnftMDiKSuFN6QDyzb0=;
 b=Dboz7EWcqtNvbwWdszI3j3mUfOD860rrvMuJYjp8gL9gMxULuhkwNCivF5llYNr+p/Oqa1
 MS+7+qUWb8H7AS6GA9Zy5cx5+vz/40kyTmaxAwtCCzCH6JEkzzOVni1naOcOE7vriWygmZ
 SSjFBFgChvU+N3+W8TtvDEGvtS3xJzg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-oY51K0oIN4SAexWlj5F8Zg-1; Mon, 17 May 2021 05:07:12 -0400
X-MC-Unique: oY51K0oIN4SAexWlj5F8Zg-1
Received: by mail-ed1-f69.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so2778724edv.3
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 02:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/AwbT1o8x4LK9y06yHXiYUlDQnftMDiKSuFN6QDyzb0=;
 b=efe3lSWZbnd/1WzCjCPv5FaCLb3tdh8qXjqWgonsH4KHdyP8RDX3l8zFpDpX5rz5cA
 DPjq0nzrYo1XN6hMa/M3rtk2KAj3/quV5DSxM5r6543VizBOR8eRdVvZsLj3PErJiBxC
 HUlaQXSunzYKoc+3SQJX4uQP1xbQfVITaWbV2YVRhGza+wxiVHGpPU7WXGIpy8dnBm1h
 mr8Q2Krfpcv3RRf+BggjC0uFh7TyzqVdZIEuNnD9NFmIe5eiJdNqYWxE3WVM9w5r+aFt
 U+il7qjsxKbFX2JQePCWq24l1JgjTAr9QasGfbY2NwefImwZ/J8vZTpiG7rSTOLMpV3S
 18Cw==
X-Gm-Message-State: AOAM533OAllNCsPNRWMd+nY4s9jp/cpayjRsre6mJdOTppiPBXswf33i
 RNbJUco5FAmDru0Ty4SA8Ipo0Ldft/UpylsJv5JcyY4DWxNRBHu4uz7oKJT9mYHZT5UMeYZb1X9
 y+stI1qjdKFNDDOI=
X-Received: by 2002:aa7:c0c4:: with SMTP id j4mr11493260edp.168.1621242431646; 
 Mon, 17 May 2021 02:07:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHVcD8jyeiaA3udPovk20MeE5z2ltqY+5a2isyiTh5Zbw9V9wztUyaASUtJmNKh91gZEc9lw==
X-Received: by 2002:aa7:c0c4:: with SMTP id j4mr11493228edp.168.1621242431410; 
 Mon, 17 May 2021 02:07:11 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id p14sm6934045ejz.51.2021.05.17.02.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 02:07:11 -0700 (PDT)
Date: Mon, 17 May 2021 11:07:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v3 1/4] vl.c: Add -smp, clusters=* command line
 support for ARM cpu
Message-ID: <20210517090709.u5fjdmarrpeb345y@gator.home>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
 <20210516103228.37792-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210516103228.37792-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 prime.zeng@hisilicon.com, Paolo Bonzini <pbonzini@redhat.com>,
 yuzenghui@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 16, 2021 at 06:32:25PM +0800, Yanan Wang wrote:
> In implementations of ARM architecture, at most there could be a
> cpu hierarchy like "sockets/dies/clusters/cores/threads" defined.
> For example, ARM64 server chip Kunpeng 920 totally has 2 sockets,
> 2 NUMA nodes (also means cpu dies) in each socket, 6 clusters in
> each NUMA node, 4 cores in each cluster, and doesn't support SMT.
> Clusters within the same NUMA share a L3 cache and cores within
> the same cluster share a L2 cache.
> 
> The cache affinity of ARM cluster has been proved to improve the
> kernel scheduling performance and a patchset has been posted, in
> which a general sched_domain for clusters was added and a cluster
> level was added in the arch-neutral cpu topology struct like below.
> 
> struct cpu_topology {
>     int thread_id;
>     int core_id;
>     int cluster_id;
>     int package_id;
>     int llc_id;
>     cpumask_t thread_sibling;
>     cpumask_t core_sibling;
>     cpumask_t cluster_sibling;
>     cpumask_t llc_sibling;
> }
> 
> In virtuallization, exposing the cluster level topology to guest
> kernel may also improve the scheduling performance. So let's add
> the -smp, clusters=* command line support for ARM cpu, then users
> will be able to define a four-level cpu hierarchy for machines
> and it will be sockets/clusters/cores/threads.
> 
> Because we only support clusters for ARM cpu currently, a new member
> "smp_clusters" is only added to the VirtMachineState structure.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  include/hw/arm/virt.h |  1 +
>  qemu-options.hx       | 26 +++++++++++++++-----------
>  softmmu/vl.c          |  3 +++
>  3 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index f546dd2023..74fff9667b 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -156,6 +156,7 @@ struct VirtMachineState {
>      char *pciehb_nodename;
>      const int *irqmap;
>      int fdt_size;
> +    unsigned smp_clusters;
>      uint32_t clock_phandle;
>      uint32_t gic_phandle;
>      uint32_t msi_phandle;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index bd97086c21..245eb415a6 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -184,25 +184,29 @@ SRST
>  ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
> +    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,clusters=clusters][,dies=dies][,sockets=sockets]\n"
>      "                set the number of CPUs to 'n' [default=1]\n"
>      "                maxcpus= maximum number of total cpus, including\n"
>      "                offline CPUs for hotplug, etc\n"
> -    "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
> +    "                cores= number of CPU cores on one socket\n"
> +    "                (it's on one die for PC, and on one cluster for ARM)\n"
>      "                threads= number of threads on one CPU core\n"
> +    "                clusters= number of CPU clusters on one socket (for ARM only)\n"
>      "                dies= number of CPU dies on one socket (for PC only)\n"
>      "                sockets= number of discrete sockets in the system\n",
>          QEMU_ARCH_ALL)
>  SRST
> -``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
> -    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
> -    are supported. On Sparc32 target, Linux limits the number of usable
> -    CPUs to 4. For the PC target, the number of cores per die, the
> -    number of threads per cores, the number of dies per packages and the
> -    total number of sockets can be specified. Missing values will be
> -    computed. If any on the three values is given, the total number of
> -    CPUs n can be omitted. maxcpus specifies the maximum number of
> -    hotpluggable CPUs.
> +``-smp [cpus=]n[,cores=cores][,threads=threads][,clusters=clusters][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
> +    Simulate an SMP system with n CPUs. On the PC target, up to 255
> +    CPUs are supported. On the Sparc32 target, Linux limits the number
> +    of usable CPUs to 4. For the PC target, the number of threads per
> +    core, the number of cores per die, the number of dies per package
> +    and the total number of sockets can be specified. For the ARM target,
> +    the number of threads per core, the number of cores per cluster, the
> +    number of clusters per socket and the total number of sockets can be
> +    specified. And missing values will be computed. If any of the five
                  ^ Why did you add this 'And'?
> +    values is given, the total number of CPUs n can be omitted.

The last two sentences are not valid for Arm, which requires most of its
parameters to be given.

> Maxcpus
> +    specifies the maximum number of hotpluggable CPUs.
>  
>      For the ARM target, at least one of cpus or maxcpus must be provided.
>      Threads will default to 1 if not provided. Sockets and cores must be
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 307944aef3..69a5c73ef7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -719,6 +719,9 @@ static QemuOptsList qemu_smp_opts = {
>          }, {
>              .name = "dies",
>              .type = QEMU_OPT_NUMBER,
> +        }, {
> +            .name = "clusters",
> +            .type = QEMU_OPT_NUMBER,
>          }, {
>              .name = "cores",
>              .type = QEMU_OPT_NUMBER,
> -- 
> 2.19.1
>

Thanks,
drew


