Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F202DE6F1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:52:13 +0100 (CET)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqI3A-0002HK-2Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kqHVE-0006Hv-NE
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:17:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kqHVC-0006mU-HQ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gI+XUDrMQPhLzkmFCUwqsxujMhjJO7fZPK8fq7iJCbA=;
 b=cVQ4hXh6egQ3Q3V7xQIJR351eXaXMDW7JFS/11ERtLSlWVnWvPUFD+JrTIdTVZrlb1sJz0
 BmFwSUyh8UYOJI+pL0s3HPL7nIWpbvwNiEYgyQMewQIPfxMaL7Gl5ZQhyAZiTeqJQK40v9
 Cyv4X/muNOrCPZY7vwmRBfu5UheSssY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414--oZdDCYyMdW43fFARENk6A-1; Fri, 18 Dec 2020 10:17:01 -0500
X-MC-Unique: -oZdDCYyMdW43fFARENk6A-1
Received: by mail-lf1-f72.google.com with SMTP id 25so1672383lft.1
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 07:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gI+XUDrMQPhLzkmFCUwqsxujMhjJO7fZPK8fq7iJCbA=;
 b=XH9k8wA65DNB+swAR7vgw+5T8+U2UTz3cvdSENVELBgsqx+F4c/95g/zpjW6TQCMPt
 ZGAtRQ8DZvuW6zjcfxVOIN2VUiElfQMt6Uc+CZgkE5adUKWrC4nBtHhV3ZkvYC2wN/u5
 XaUW2yPoLPeGilThfBs9nJpKZ475GzXXrWRT7ZVis5BQN/y684yzugGRjQzymVrawNsj
 PYL76+fWtmiBTUyrwpm08TMfwyumeUtLlRJFvBjHjjAp9UdCfml7Tc/LYYgDNMRIMktZ
 xjwxCVF+pzpfzl0wndzLgr+rSiKIOgPpsoTtkse0B0s3M9HHCz3FSHYfgHTVSmkI5lyc
 QXUA==
X-Gm-Message-State: AOAM530E/uyFyKbyAyN/xGJ2Vfym/4PCOrZpJv4UQqbwSMg7ilDIwYKf
 ZKbOu/rHs483ZsTG//YsgYgX4gbcQkCPW5uh/N/OOOCRV+9O+zJPxNE4mlx1pnJQFnU0oEGY6OL
 KzcAEgJn4aNuia90=
X-Received: by 2002:a2e:87cb:: with SMTP id v11mr2034067ljj.218.1608304619396; 
 Fri, 18 Dec 2020 07:16:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDgdn//pey0s04M+qtgGT3Lc/+MraczxRiaRWIQ2az969/LlToSe9KLk/pPYMbI1T5H722Dg==
X-Received: by 2002:a2e:87cb:: with SMTP id v11mr2034051ljj.218.1608304619035; 
 Fri, 18 Dec 2020 07:16:59 -0800 (PST)
Received: from [10.101.1.184] ([185.224.57.162])
 by smtp.gmail.com with ESMTPSA id j2sm958606lfm.305.2020.12.18.07.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 07:16:58 -0800 (PST)
Subject: Re: [PATCH] spapr: Fix buffer overflow in
 spapr_numa_associativity_init()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <680d5f91-a0ba-8ee2-0787-877b01d4ab7b@redhat.com>
Date: Fri, 18 Dec 2020 16:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-stable@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 2:53 PM, Greg Kurz wrote:
> Running a guest with 128 NUMA nodes crashes QEMU:
> 
> ../../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
> 
> The crash happens when setting the FWNMI migration blocker:
> 
> 2861	    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI) == SPAPR_CAP_ON) {
> 2862	        /* Create the error string for live migration blocker */
> 2863	        error_setg(&spapr->fwnmi_migration_blocker,
> 2864	            "A machine check is being handled during migration. The handler"
> 2865	            "may run and log hardware error on the destination");
> 2866	    }
> 
> Inspection reveals that papr->fwnmi_migration_blocker isn't NULL:
> 
> (gdb) p spapr->fwnmi_migration_blocker
> $1 = (Error *) 0x8000000004000000
> 
> Since this is the only place where papr->fwnmi_migration_blocker is
> set, this means someone wrote there in our back. Further analysis
> points to spapr_numa_associativity_init(), especially the part
> that initializes the associative arrays for NVLink GPUs:
> 
>     max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
> 
> ie. max_nodes_with_gpus = 128 + 6, but the array isn't sized to
> accommodate the 6 extra nodes:
> 
> #define MAX_NODES 128
> 
> struct SpaprMachineState {
>     .
>     .
>     .
>     uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
> 
>     Error *fwnmi_migration_blocker;
> };
> 
> and the following loops happily overwrite spapr->fwnmi_migration_blocker,
> and probably more:
> 
>     for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {

Along with your fix you can also remove max_nodes_with_gpus
and use the safer ARRAY_SIZE(numa_assoc_array)...

>         spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
> 
>         for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
>             uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
>                                  SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
>             spapr->numa_assoc_array[i][j] = gpu_assoc;
>         }
> 
>         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>     }
> 
> Fix the size of the array. This requires "hw/ppc/spapr.h" to see
> NVGPU_MAX_NUM. Including "hw/pci-host/spapr.h" introduces a
> circular dependency that breaks the build, so this moves the
> definition of NVGPU_MAX_NUM to "hw/ppc/spapr.h" instead.
> 
> Reported-by: Min Deng <mdeng@redhat.com>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1908693
> Fixes: dd7e1d7ae431 ("spapr_numa: move NVLink2 associativity handling to spapr_numa.c")
> Cc: danielhb413@gmail.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/pci-host/spapr.h |    2 --
>  include/hw/ppc/spapr.h      |    5 ++++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> index 4f58f0223b56..bd014823a933 100644
> --- a/include/hw/pci-host/spapr.h
> +++ b/include/hw/pci-host/spapr.h
> @@ -115,8 +115,6 @@ struct SpaprPhbState {
>  #define SPAPR_PCI_NV2RAM64_WIN_BASE  SPAPR_PCI_LIMIT
>  #define SPAPR_PCI_NV2RAM64_WIN_SIZE  (2 * TiB) /* For up to 6 GPUs 256GB each */
>  
> -/* Max number of these GPUsper a physical box */
> -#define NVGPU_MAX_NUM                6
>  /* Max number of NVLinks per GPU in any physical box */
>  #define NVGPU_MAX_LINKS              3
>  
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 06a5b4259f20..1cc19575f548 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -112,6 +112,9 @@ typedef enum {
>  #define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
>  #define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
>  
> +/* Max number of these GPUsper a physical box */
> +#define NVGPU_MAX_NUM                6
> +
>  typedef struct SpaprCapabilities SpaprCapabilities;
>  struct SpaprCapabilities {
>      uint8_t caps[SPAPR_CAP_NUM];
> @@ -240,7 +243,7 @@ struct SpaprMachineState {
>      unsigned gpu_numa_id;
>      SpaprTpmProxy *tpm_proxy;
>  
> -    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
> +    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
>  
>      Error *fwnmi_migration_blocker;
>  };
> 
> 
> 


