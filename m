Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6B45F7A59
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:14:50 +0200 (CEST)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogp3p-0003e1-Ms
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogni4-0002t0-KP
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:48:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ogni2-0007KU-Lc
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665150493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xokSwJiVSdgCHzzTvngqCi+5uldC7LrAchKSEdIcP8s=;
 b=aUs8YEJZksgxxdfNw2YMXWh3Ztbnx0qPSTslec/kBzp3x2pH57KcE7JsLjkYMQB+pHOmMZ
 jgJKn+OjuKDR6lR69w2/U0c4rILdyhOAH6d/zuovvWz1nS9GslIF/O4R2Pd+BuL9ep6K/+
 RrxTSK+vt1prpN1kAnUrkDSQTnVJOFM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-ZZU35cGzNDqXsz7z9omu-A-1; Fri, 07 Oct 2022 09:48:12 -0400
X-MC-Unique: ZZU35cGzNDqXsz7z9omu-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a05600c339200b003bf24961658so2709299wmp.6
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 06:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xokSwJiVSdgCHzzTvngqCi+5uldC7LrAchKSEdIcP8s=;
 b=QFZDle9ub5sW3EIUE8h3xwMFSk6tGs+p6ngTmt1RJCywehxZqKEQ/hMtINyDzO/lmK
 ZyRYK5+RexcDYOSvxOScHZFBcpg3ODAeCreIhT2meJIIaxk2Ni4lplYmtCGxb2unssDv
 4/W0oySTzvvU1feiRirQGvPmCBFG4pq7lkX61FjdhLkNtKUwcWI75CgkPFf6xh+cj6k7
 KvW9kac0Qd0W3g/msvTlB6IVqpaoD2jak7JV9dyku1RRrsljp65SeQrs8y+SdcT6BB8H
 zS5sSqNqdc2Vv6Y2nIYu3+iz+V1v34orDIClck4peZ195OQC7c2keU+4jRWf5vLax0+o
 3OCw==
X-Gm-Message-State: ACrzQf0Pyg4In6KrP8ZCuBcuN9xvWK2hNBfSQ3i22neU5BuPVrtmUStH
 w56uFznmiE6D98+h4zY10RxAJkBMSJFWKWWm8kxao2PGAhk58roFaN+MTQqffwr5O8PP7Q6g+76
 vepUnZdTIdScCLSc=
X-Received: by 2002:a05:6000:2a3:b0:226:dff3:b031 with SMTP id
 l3-20020a05600002a300b00226dff3b031mr3309384wry.495.1665150490420; 
 Fri, 07 Oct 2022 06:48:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nRvhcKsXcuNhE6FvEeolccoh8ZN+yKv5QSxteFQMQOAC2RYGrphXtNhAsZNIbkjRG215TWA==
X-Received: by 2002:a05:6000:2a3:b0:226:dff3:b031 with SMTP id
 l3-20020a05600002a300b00226dff3b031mr3309358wry.495.1665150490169; 
 Fri, 07 Oct 2022 06:48:10 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c2ccc00b003b47e8a5d22sm4428360wmc.23.2022.10.07.06.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 06:48:09 -0700 (PDT)
Date: Fri, 7 Oct 2022 09:48:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, yangyicong@hisilicon.com,
 prime.zeng@huawei.com, hesham.almatary@huawei.com,
 ionela.voinescu@arm.com, darren@os.amperecomputing.com
Subject: Re: [PATCH 1/4] hw/acpi/aml-build: Only generate cluster node in
 PPTT when specified
Message-ID: <20221007094701-mutt-send-email-mst@kernel.org>
References: <20220922131143.58003-1-yangyicong@huawei.com>
 <20220922131143.58003-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922131143.58003-2-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 22, 2022 at 09:11:40PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently we'll always generate a cluster node no matter user has
> specified '-smp clusters=X' or not. Cluster is an optional level
> and it's unncessary to build it if user don't need. So only generate
> it when user specify explicitly.
> 
> Also update the test ACPI tables.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

This is an example of a commit log repeating what the patch does.
Which is ok but the important thing is to explain the motivation -
why is it a bug to generate a cluster node without '-smp clusters'?


> ---
>  hw/acpi/aml-build.c   | 2 +-
>  hw/core/machine-smp.c | 3 +++
>  include/hw/boards.h   | 2 ++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index e6bfac95c7..aab73af66d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                  0, socket_id, NULL, 0);
>          }
>  
> -        if (mc->smp_props.clusters_supported) {
> +        if (mc->smp_props.clusters_supported && ms->smp.build_cluster) {
>              if (cpus->cpus[n].props.cluster_id != cluster_id) {
>                  assert(cpus->cpus[n].props.cluster_id > cluster_id);
>                  cluster_id = cpus->cpus[n].props.cluster_id;
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index b39ed21e65..5d37e8d07a 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -158,6 +158,9 @@ void machine_parse_smp_config(MachineState *ms,
>      ms->smp.threads = threads;
>      ms->smp.max_cpus = maxcpus;
>  
> +    if (config->has_clusters)
> +        ms->smp.build_cluster = true;
> +
>      /* sanity-check of the computed topology */
>      if (sockets * dies * clusters * cores * threads != maxcpus) {
>          g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 7b416c9787..24aafc213d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -305,6 +305,7 @@ typedef struct DeviceMemoryState {
>   * @cores: the number of cores in one cluster
>   * @threads: the number of threads in one core
>   * @max_cpus: the maximum number of logical processors on the machine
> + * @build_cluster: build cluster topology or not
>   */
>  typedef struct CpuTopology {
>      unsigned int cpus;
> @@ -314,6 +315,7 @@ typedef struct CpuTopology {
>      unsigned int cores;
>      unsigned int threads;
>      unsigned int max_cpus;
> +    bool build_cluster;
>  } CpuTopology;
>  
>  /**
> -- 
> 2.24.0


