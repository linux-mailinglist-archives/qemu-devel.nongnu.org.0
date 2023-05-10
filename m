Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815466FDB67
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 12:13:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgot-0005aM-Ky; Wed, 10 May 2023 06:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwgoq-0005Zy-Rx
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:13:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwgoo-0004f6-VH
 for qemu-devel@nongnu.org; Wed, 10 May 2023 06:13:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f315735514so239690485e9.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683713589; x=1686305589;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hJOPVQ2NJimNxJQ9K33QGqgkJ7Dk+zcG1Ao7aCNfebE=;
 b=HoXCVn00ZMCMeCtVcf449m5AeOfK0GqmSKzMdG86KO512+XDpZJGpPjA+V0uPYTGG6
 wlLGv0j6Ot5YqwWLjI/TaUa8xgC+a6RIeXntQJAmWARixIZaXtz6FVCK8GdUSedDNEHk
 JPNuNiao8+BS9mbS+AGRzy660A8LlGkbXFE+v+B514PXTsrvMkw+s1X5qz8t2DkJ8qU0
 tk8hZYqU4lNznOkR2vrlc5hizpekFMI5MQ8DVOPKiZYNqR14WRarmdtzcWXh+24k1DcX
 2fbPz8LhTa7zkWRp7GZX0m8xqEMKKeCPEpQg7skH1/MuWjLZhZq9qVfLIRGEjm31hdG3
 CamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683713589; x=1686305589;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hJOPVQ2NJimNxJQ9K33QGqgkJ7Dk+zcG1Ao7aCNfebE=;
 b=MVA0FcOyLBNb1GbL1tb/S5X0JsBDXbkSLJ22J4rTqzGXksL0U0mvjaiRr3rMGR5vor
 j+U5WLT1J/bIW/pxO5vB4SlZJ62Pu7TEinU95t+/8VQRzffIkK3nzl4LyPsgUmw5mIjI
 BpUkjjGoIpazVDNR8/zvIui/SgBFhSauniKW+/2Pmr5ISpcw/c4AyR3clwt/EqW7HLpc
 FnGPaZLobAAq4AEAoA5UjShvVdFGH6V4QdN6NwTA4fy7Tb48aVAhJ+IJ2p9srMd/xLvu
 yyxVYCDqHyz03uov5sUcWmQNn2WMS01imMtbM/6J+3a5utn6p4BAg4UkGAyzdpF9oRgL
 MujA==
X-Gm-Message-State: AC+VfDwswZXv18PSyhZCbzYZr12f3/B+tyrnjmCpRm7JaeerqIPf4PbG
 pSUL4TwEfABcJ4X4VH+ILHsMBw==
X-Google-Smtp-Source: ACHHUZ7+xwB+CKvCrVG13zuYtNeu/VgyULwxCwbcteHKtAVuNux2Xh7rzxPKvVCJ8IlgHACOIWZC1A==
X-Received: by 2002:adf:e649:0:b0:306:2aea:466a with SMTP id
 b9-20020adfe649000000b003062aea466amr14733860wrn.28.1683713589011; 
 Wed, 10 May 2023 03:13:09 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d4091000000b003078a3f3a24sm13125108wrp.114.2023.05.10.03.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 03:13:08 -0700 (PDT)
Message-ID: <8a8724d5-d29d-eae5-3440-af089c3b6756@linaro.org>
Date: Wed, 10 May 2023 12:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PULL 45/51] hw/acpi/aml-build: Only generate cluster node in
 PPTT when specified
Content-Language: en-US
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105091310.263867-46-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105091310.263867-46-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Yang,

On 5/1/23 10:16, Michael S. Tsirkin wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently we'll always generate a cluster node no matter user has
> specified '-smp clusters=X' or not. Cluster is an optional level
> and will participant the building of Linux scheduling domains and
> only appears on a few platforms. It's unncessary to always build
> it when it cannot reflect the real topology on platforms having no
> cluster implementation and to avoid affecting the linux scheduling
> domains in the VM. So only generate the cluster topology in ACPI
> PPTT when the user has specified it explicitly in -smp.
> 
> Tested qemu-system-aarch64 with `-smp 8` and linux 6.1-rc1, without
> this patch:
> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
> ff	# cluster_cpus
> 0-7	# cluster_cpus_list
> 56	# cluster_id
> 
> with this patch:
> estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
> ff	# cluster_cpus
> 0-7	# cluster_cpus_list
> 36	# cluster_id, with no cluster node kernel will make it to
> 	  physical package id
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> Tested-by: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Message-Id: <20221229065513.55652-3-yangyicong@huawei.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   include/hw/boards.h   | 3 +++
>   hw/acpi/aml-build.c   | 2 +-
>   hw/core/machine-smp.c | 2 ++
>   qemu-options.hx       | 3 +++
>   4 files changed, 9 insertions(+), 1 deletion(-)


> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 42feb4d4d7..ea331a20d1 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>                   0, socket_id, NULL, 0);
>           }
>   
> -        if (mc->smp_props.clusters_supported) {
> +        if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
>               if (cpus->cpus[n].props.cluster_id != cluster_id) {
>                   assert(cpus->cpus[n].props.cluster_id > cluster_id);
>                   cluster_id = cpus->cpus[n].props.cluster_id;
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index b39ed21e65..c3dab007da 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -158,6 +158,8 @@ void machine_parse_smp_config(MachineState *ms,
>       ms->smp.threads = threads;
>       ms->smp.max_cpus = maxcpus;
>   
> +    mc->smp_props.has_clusters = config->has_clusters;

In another patch Bernhard noticed a QOM class field updated from
a QOM object, which is an anti-OOP pattern:
https://lore.kernel.org/qemu-devel/6E514B4B-9185-424E-832E-01813DE8E83F@gmail.com/

Looking at the codebase I noticed this is what you are doing here.
By doing so, updating the class field from this particular instance
results in all other instances being affected.

Currently this isn't really an issue because there are at most 2
MachineState instances (in a migration case, where we want the same
machine). However it would be nice to have this bad code example
cleaned. (Also eventually this could become an issue with heterogeneous
machines, but I'm not sure yet).

Do you mind sending a patch?

Thanks,

Phil.

>       /* sanity-check of the computed topology */
>       if (sockets * dies * clusters * cores * threads != maxcpus) {
>           g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7f99d15b23..8662568324 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -343,6 +343,9 @@ SRST
>       ::
>   
>           -smp 2
> +
> +    Note: The cluster topology will only be generated in ACPI and exposed
> +    to guest if it's explicitly specified in -smp.
>   ERST
>   
>   DEF("numa", HAS_ARG, QEMU_OPTION_numa,


