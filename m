Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC722DE39F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:02:44 +0100 (CET)
Received: from localhost ([::1]:55150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGLD-0000zq-JL
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kqGHp-00081w-Og; Fri, 18 Dec 2020 08:59:14 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:45793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kqGHm-0004X3-7N; Fri, 18 Dec 2020 08:59:13 -0500
Received: by mail-qt1-x836.google.com with SMTP id g24so1257830qtq.12;
 Fri, 18 Dec 2020 05:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QPcBuKMjlPV9+rXNLG3pzufaUT3MLt/VA66HPc9Kdr4=;
 b=B2IbwusAMAqjL+enOfKDF7OLTUGylGv7QJTmyJgI1il2jc/GAPCXPqoYrxVfkDPJ9D
 yLbIdlV1ctxpq63kFa1Vpr78uc3A77NGUTq5PIV/zhi9yjezlPInp9m2QTcCknCLaLgz
 2RO8QMCWSKrnZiG+CmnvwovetZ8UjerWANoNHZrEx4/KvPMUFR+uQG36ZKgX9Hy7f5ZI
 l1uXcTLPFv4lJyA7859Q0M+Mhpgpp0vADVZ+EUlpOm7nYMItFJAISix2l0f6oGHn+z/y
 972jfeOnSyu/QO+nxt+S2FDx9aGtuPcMBVui51ke3ioWGkNYWuPQhxXtmGZGi6ZMudBl
 DV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QPcBuKMjlPV9+rXNLG3pzufaUT3MLt/VA66HPc9Kdr4=;
 b=G1rty9RdGk0Kh+wpy8TY8TVY5/+xuHLwNZQcefUFH6ohjKR2EW+LW7B6my0Ri/GXa+
 AAIZkM8neq1C75vAr38Bi705pzk04XkruCV81qKkJUjn7lAbAi8D2E0KNguCOzPSTwfP
 nfxgb7bV8jJNFaKsjrGqZBKys6ZUgpgzlY1FqJGTkQvdjy+MLHS5rmYjxDq6w0vXZs0k
 P7zzeIalX2wjzArzmgT84cwbYFco+5YUjPnw4fQANPmwNWwpR1JjW+mmvvzvlVAvo0Yp
 i8mFL4X1Q/knBmPrM5X84n9HeoveWWIGRhVSCNqWCHXtOxxeDtudGiobxz5WNFL+0AXw
 OnKA==
X-Gm-Message-State: AOAM531jOz7jBVLZjodMibZc1VVzw1UflNtD6mITJ/FcS2BjO7IqxYoO
 BkuAlhNUwh/R5xl4/Ut2inuSqD6Ds5Q=
X-Google-Smtp-Source: ABdhPJy2xkW9eEDDxD4O5e88OCVn2KPgaCmAxPfoQu69CPvORVLTAHhv+kGRarjjiSvAxUQjps+I5w==
X-Received: by 2002:ac8:6b95:: with SMTP id z21mr3962054qts.353.1608299947957; 
 Fri, 18 Dec 2020 05:59:07 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:9e32:a7fb:6602:e8c2:3c0f?
 ([2804:431:c7c6:9e32:a7fb:6602:e8c2:3c0f])
 by smtp.gmail.com with ESMTPSA id o4sm4981393qkc.93.2020.12.18.05.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 05:59:07 -0800 (PST)
Subject: Re: [PATCH] spapr: Fix buffer overflow in
 spapr_numa_associativity_init()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <cd24bc8a-6ca6-385e-8171-ba84ff17187b@gmail.com>
Date: Fri, 18 Dec 2020 10:59:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



On 12/18/20 10:53 AM, Greg Kurz wrote:
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
>      max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;
> 
> ie. max_nodes_with_gpus = 128 + 6, but the array isn't sized to
> accommodate the 6 extra nodes:
> 
> #define MAX_NODES 128
> 
> struct SpaprMachineState {
>      .
>      .
>      .
>      uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
> 
>      Error *fwnmi_migration_blocker;
> };
> 
> and the following loops happily overwrite spapr->fwnmi_migration_blocker,
> and probably more:
> 
>      for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
>          spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);
> 
>          for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
>              uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
>                                   SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
>              spapr->numa_assoc_array[i][j] = gpu_assoc;
>          }
> 
>          spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
>      }
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


Good catch. Thanks for fixing it!

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


>   include/hw/pci-host/spapr.h |    2 --
>   include/hw/ppc/spapr.h      |    5 ++++-
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> index 4f58f0223b56..bd014823a933 100644
> --- a/include/hw/pci-host/spapr.h
> +++ b/include/hw/pci-host/spapr.h
> @@ -115,8 +115,6 @@ struct SpaprPhbState {
>   #define SPAPR_PCI_NV2RAM64_WIN_BASE  SPAPR_PCI_LIMIT
>   #define SPAPR_PCI_NV2RAM64_WIN_SIZE  (2 * TiB) /* For up to 6 GPUs 256GB each */
>   
> -/* Max number of these GPUsper a physical box */
> -#define NVGPU_MAX_NUM                6
>   /* Max number of NVLinks per GPU in any physical box */
>   #define NVGPU_MAX_LINKS              3
>   
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 06a5b4259f20..1cc19575f548 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -112,6 +112,9 @@ typedef enum {
>   #define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
>   #define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
>   
> +/* Max number of these GPUsper a physical box */
> +#define NVGPU_MAX_NUM                6
> +
>   typedef struct SpaprCapabilities SpaprCapabilities;
>   struct SpaprCapabilities {
>       uint8_t caps[SPAPR_CAP_NUM];
> @@ -240,7 +243,7 @@ struct SpaprMachineState {
>       unsigned gpu_numa_id;
>       SpaprTpmProxy *tpm_proxy;
>   
> -    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
> +    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
>   
>       Error *fwnmi_migration_blocker;
>   };
> 
> 
> 

