Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F6236D5F0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:48:23 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhjy-00030k-RB
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhhw-0002QS-EN
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbhht-000494-Nh
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619606773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dkYwtjYQp9GbaATbUTgk4o5+Cte5U7wMpoOzlm+VwJQ=;
 b=dn9iO2nMWEq2kUYRQ0toqX4cA79/fo4zsIH2Z0MKfR4/A+ibmG+ISqN0ymuvje6qUXUV/2
 SiAXfFBLtNXhyL7UmCLrFPHJe4SIJs4ngxGA6iFxUm7c5GuIBKTvP0dRrXl1f7BF5IFIzD
 NHojrC0qqF9fFWzgGO9yhYTP461sPEE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-f3J3MFVhMom6YoyI-q7f4Q-1; Wed, 28 Apr 2021 06:46:09 -0400
X-MC-Unique: f3J3MFVhMom6YoyI-q7f4Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 l7-20020aa7c3070000b029038502ffe9f2so20776299edq.16
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dkYwtjYQp9GbaATbUTgk4o5+Cte5U7wMpoOzlm+VwJQ=;
 b=FyOxHQ0XTT49eY5F+S+gRhIGzmX/Ut9r/QAQkjdM/pqhTGPW+wLXs+a5pHgXn2W61o
 vS9n6zSshk0pkeb6qNqMX+XUQA859qonAO1SN68dx0Fs9/gVAtu4xE93E0piM7z1Zo1h
 Ot5amzt2s+bDs7t7kDu+xlJgFFbZsyLQz7lkC3w53isUNQakJKDTwU0mDOHeZTRFmhcB
 AyCJ4T7v2bEvc/Rhcoak8AgjlCdueY7aMw7NC21H7Br4uuuryCrZfh9qIZwn0NkZCJNf
 w6ggRe40k5fah/mph8QNmPM77fuMyGzQ1wSn+VCeOAaYXUbaiJnWi0/bEMGnaJndYpe4
 4HfA==
X-Gm-Message-State: AOAM530Yf/EdNThKS0D+PP34ZeJuLCLTFQ1NqOuLUEbO/vRpi++HJChv
 EYIpXtVtCAXjm8us2Kql8znSY2I0pwkQXMW8qVEJmhQMxmMjbyGZ6zPI6pPRC1a0lHvo5HcO7Ts
 CVW2anx6hxO/DYDQ=
X-Received: by 2002:a17:906:5487:: with SMTP id
 r7mr28409034ejo.550.1619606768020; 
 Wed, 28 Apr 2021 03:46:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkCuuGLTB1jLfRK74P/3vdhhNtsvbPUPIpKsI4JBSV3IELY/PTCa0g8FQ/th0nT5xpFpwHaQ==
X-Received: by 2002:a17:906:5487:: with SMTP id
 r7mr28409018ejo.550.1619606767840; 
 Wed, 28 Apr 2021 03:46:07 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j4sm1004087ejk.37.2021.04.28.03.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 03:46:07 -0700 (PDT)
Date: Wed, 28 Apr 2021 12:46:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 4/4] hw/arm/virt: Add cluster level for device tree
Message-ID: <20210428104605.nt7274cduqjk376g@gator>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-5-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413083147.34236-5-wangyanan55@huawei.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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

On Tue, Apr 13, 2021 at 04:31:47PM +0800, Yanan Wang wrote:
> Add a cluster level between core level and package level for
> ARM device tree.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 51797628db..4468a4734b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -434,14 +434,18 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>  
>              if (ms->smp.threads > 1) {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> -                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d/%s%d",
> +                    "socket", cpu / (vms->smp_clusters * ms->smp.cores *
> +                    ms->smp.threads),
> +                    "cluster", (cpu / (ms->smp.cores * ms->smp.threads)) %
> +                    vms->smp_clusters,
>                      "core", (cpu / ms->smp.threads) % ms->smp.cores,
>                      "thread", cpu % ms->smp.threads);
>              } else {
>                  map_path = g_strdup_printf(
> -                    "/cpus/cpu-map/%s%d/%s%d",
> -                    "socket", cpu / ms->smp.cores,
> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> +                    "socket", cpu / (vms->smp_clusters * ms->smp.cores),
> +                    "cluster", (cpu / ms->smp.cores) % vms->smp_clusters,
>                      "core", cpu % ms->smp.cores);
>              }
>              qemu_fdt_add_path(ms->fdt, map_path);
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


