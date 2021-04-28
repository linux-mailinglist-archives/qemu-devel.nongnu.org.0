Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A5236D5C2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:25:32 +0200 (CEST)
Received: from localhost ([::1]:34264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhNr-0002pP-M7
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhMP-0002Nx-PF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhMN-0007eD-Nb
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619605438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uwMRBwnvqkmhpDezZYn5EKlz+pUMI4hSovctNmwVWao=;
 b=QuZaGYKgL0hZ2ktdlm6Q9aWYVGSMJqpyvxn5/qgSVFQ+77SNREYb2EtScr5n0t5XxThYDo
 +PJnX0X3U3P1v6xwQrG3nmpxFvyfHc+PaP7OH14DMmEjqDYZhvLnKtKYs3oJq0c05lH+F8
 Hkt/HkP73NnwNAAAKzNAUsuGexhTpsE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-yQRWLndAOXeY2BnbuHPHPQ-1; Wed, 28 Apr 2021 06:23:57 -0400
X-MC-Unique: yQRWLndAOXeY2BnbuHPHPQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 i2-20020a0564020542b02903875c5e7a00so7157133edx.6
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uwMRBwnvqkmhpDezZYn5EKlz+pUMI4hSovctNmwVWao=;
 b=ttxNrAKFz+XNwpC6uSNw1SBWNRp3Cy590zSRdrXFnkgmeX4Crzj3sP6hRwu6MPPNRt
 Y7WEodiVRYTf6zB61rPKXHEnne//Hu5S29cK7rXsS7TC6maYGuCaU1VoWPOde7VUBnnt
 fBvBusciCSW0pz04jCS7CioyN8S8U5zs4OXAqZQqacs8MhqGLQkH7BikxoTWhvje33lE
 FgBYA77wVj4W49nZ5VvtQ8LqEkb2Va3lUEZhzgxQLBE33KNGqjQoHDPYKbcYp/+Z7/bv
 Z6WyMrrEQhJRhakl/HEgQNstyCe6W/Q0GrQcWoKK4sA+Ysnl9Sdeduniz6B6cCiIowQX
 6c0Q==
X-Gm-Message-State: AOAM532MrdF09lxGMau8lA93/DEdbIAa95adDDnx5xlL3y5UL9Y7egsH
 p9vCHd4cK+OwkxYl4AYYhSL0rrqssRCqXAAlxgijkGxqdxSRKIUzrKmiXtM2Ydp7CcsHRqqeMy8
 F6AdKXdTHrkeD/Yo=
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr10213017edv.363.1619605436212; 
 Wed, 28 Apr 2021 03:23:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3f/+8TYPWlTg5ZmNY6Che/5zgO+Jo2evLnaB96oBFW5dpjTmykPmiy5hqhOfrmE3C8cXqjg==
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr10212960edv.363.1619605435867; 
 Wed, 28 Apr 2021 03:23:55 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j20sm1642810ejc.110.2021.04.28.03.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:23:55 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:23:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 1/4] vl.c: Add -smp, clusters=* command line
 support for ARM cpu
Message-ID: <20210428102353.cfjvzss56c4zwb4y@gator>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413083147.34236-2-wangyanan55@huawei.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 04:31:44PM +0800, Yanan Wang wrote:
> A cluster means a group of cores that share some resources (e.g. cache)
> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
> share L3 cache data while cores within each cluster share the L2 cache.
> 
> The cache affinity of cluster has been proved to improve the Linux kernel
> scheduling performance and a patchset has been posted, in which a general
> sched_domain for clusters was added and a cluster level was added in the
> arch-neutral cpu topology struct like below.
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
> Also the Kernel Doc: Documentation/devicetree/bindings/cpu/cpu-topology.txt
> defines a four-level CPU topology hierarchy like socket/cluster/core/thread.
> According to the context, a socket node's child nodes must be one or more
> cluster nodes and a cluster node's child nodes must be one or more cluster
> nodes/one or more core nodes.
> 
> So let's add the -smp, clusters=* command line support for ARM cpu, so that
> future guest os could make use of cluster cpu topology for better scheduling
> performance. For ARM machines, a four-level cpu hierarchy can be defined and
> it will be sockets/clusters/cores/threads. Because we only support clusters
> for ARM cpu currently, a new member "unsigned smp_clusters" is added to the
> VirtMachineState structure.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  include/hw/arm/virt.h |  1 +
>  qemu-options.hx       | 26 +++++++++++++++-----------
>  softmmu/vl.c          |  3 +++
>  3 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4a4b98e4a7..5d5d156924 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -155,6 +155,7 @@ struct VirtMachineState {
>      char *pciehb_nodename;
>      const int *irqmap;
>      int fdt_size;
> +    unsigned smp_clusters;
>      uint32_t clock_phandle;
>      uint32_t gic_phandle;
>      uint32_t msi_phandle;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd21002bd6..65343ea23c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -184,25 +184,29 @@ SRST
>  ERST
>  
>  DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
> +    "-smp [cpus=]n[,maxcpus=cpus][,clusters=clusters][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"

Please put clusters directly in front of dies in the above list, like it
is in the list description below

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
> +``-smp [cpus=]n[,maxcpus=cpus][,clusters=clusters][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]``

Also move clusters in this list over in front of dies to match the
suggested change above.

> +    Simulate an SMP system with n CPUs. On the PC target, up to 255
> +    CPUs are supported. On the Sparc32 target, Linux limits the number
> +    of usable CPUs to 4. For the PC target, the number of threads per
> +    core, the number of cores per die, the number of dies per package
> +    and the total number of sockets can be specified. For the ARM target,
> +    the number of threads per core, the number of cores per cluster, the
> +    number of clusters per socket and the total number of sockets can be
> +    specified. And missing values will be computed. If any of the five
> +    values is given, the total number of CPUs n can be omitted. Maxcpus
> +    specifies the maximum number of hotpluggable CPUs.
>  ERST
>  
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index aadb526138..46f5b6b575 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -720,6 +720,9 @@ static QemuOptsList qemu_smp_opts = {
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


