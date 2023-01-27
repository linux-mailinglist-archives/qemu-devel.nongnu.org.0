Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D8667F280
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:55:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYYC-0007AO-Ph; Fri, 27 Jan 2023 18:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYYB-0007A4-HG
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:54:31 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLYY9-0007MO-BR
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:54:31 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 nm12-20020a17090b19cc00b0022c2155cc0bso6175852pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 15:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gDjsa6Be6xu6VPIEFCIRNlG+GJ4n4w2muPpDz56soNM=;
 b=cTOYlEsrQKyPkxIgBB0y1QX9BY+8zvG6LXarpVt8WVoah9lLYEMdm8eKiBN+7X15+C
 PO+eLtcz0JlJRSHCKUPyFQ0kEl1wUWhPvmgS4r8o9WJ0xUKIJ6GFxaiSCL/AAgMdKki+
 wGr4GIi74cTPXZ+tFSICvqbQwzqa7LzY7xjoSeOcmdddoHH5GCmAGiPFAoWVOycrTdXV
 Y7aUSYgLlOH7HWtRGuNB+4xkdo+C5bMTRsifBwBMiEQiqu329tUppMRHPxQD4Q6VJuTK
 roRaaURcEX9NVAONl2oBlJ5Z5eVYLPQmQ1v0Owjljf01tpoigls6MYBEIEXQ8l9SjmoS
 ip+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gDjsa6Be6xu6VPIEFCIRNlG+GJ4n4w2muPpDz56soNM=;
 b=irfeKiKxR92DiYQuleem1fTsHR4vrPAcdZEtdBPmZYaCC4Rj8qGWxvgWmaqFOsOWZc
 rvmBkwDRm6XxQcu9qw344dVUrJYwFbGaT5rvkULqQUcy9/wzilLVY4Inh/R149E9MXjr
 nmMWKhbwlHSsiVi5wbcicWKn0sHsfvfVVRCFeNT9/tlYH1NaJHaMvtjrqcdxu7ro9dwc
 UcqzqSy2KKuLt8Dl8ac125GhRipYHQTpOXKLHw9+LYxKMPcB7PYOmX3MClo4+X/5VJfI
 qFp0144bISkY3aGInkxw70MSLzka4VyzT8EYTR1DwjigT+89yWwjQ4x7WvDmlZpN5D6/
 QJ9A==
X-Gm-Message-State: AFqh2koOm4UHUNDTltnV3PgHiXcTiBqAzryd/zoeeorcrHGhQJJ0eM1E
 uKJanC6MpiK3o9fLzfBmskEZDQ==
X-Google-Smtp-Source: AMrXdXvZEcgdd0AX46pnDvZtRiMGpDq4PbaNMMHrgzQExHhBJReFmjnbn1JOWFwJOVTZYj/m5ZFiIw==
X-Received: by 2002:a17:90a:9283:b0:226:30c5:3e61 with SMTP id
 n3-20020a17090a928300b0022630c53e61mr43185043pjo.6.1674863667723; 
 Fri, 27 Jan 2023 15:54:27 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 z6-20020a637e06000000b00496317241f9sm1970649pgc.51.2023.01.27.15.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:54:27 -0800 (PST)
Message-ID: <e43446dd-e6d9-3591-aea8-c77dc83dcd8b@linaro.org>
Date: Fri, 27 Jan 2023 13:54:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 08/16] target/arm/kvm-rme: Populate the realm with
 boot images
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-9-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-9-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> Initialize the GPA space and populate it with boot images (kernel,
> initrd, firmware, etc). Populating has to be done at VM start time,
> because the images are loaded during reset by rom_reset()
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   target/arm/kvm_arm.h |  6 ++++
>   target/arm/kvm-rme.c | 79 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 85 insertions(+)
> 
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index e4dc7fbb8d..cec6500603 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -371,6 +371,7 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
>   
>   int kvm_arm_rme_init(ConfidentialGuestSupport *cgs, Error **errp);
>   int kvm_arm_rme_vm_type(MachineState *ms);
> +void kvm_arm_rme_add_blob(hwaddr start, hwaddr src_size, hwaddr dst_size);
>   
>   bool kvm_arm_rme_enabled(void);
>   int kvm_arm_rme_vcpu_init(CPUState *cs);
> @@ -458,6 +459,11 @@ static inline int kvm_arm_rme_vm_type(MachineState *ms)
>   {
>       return 0;
>   }
> +
> +static inline void kvm_arm_rme_add_blob(hwaddr start, hwaddr src_size,
> +                                        hwaddr dst_size)
> +{
> +}
>   #endif
>   
>   static inline const char *gic_class_name(void)
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index 3833b187f9..c8c019f78a 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -9,6 +9,7 @@
>   #include "exec/confidential-guest-support.h"
>   #include "hw/boards.h"
>   #include "hw/core/cpu.h"
> +#include "hw/loader.h"
>   #include "kvm_arm.h"
>   #include "migration/blocker.h"
>   #include "qapi/error.h"
> @@ -19,12 +20,22 @@
>   #define TYPE_RME_GUEST "rme-guest"
>   OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
>   
> +#define RME_PAGE_SIZE qemu_real_host_page_size()
> +
>   typedef struct RmeGuest RmeGuest;
>   
>   struct RmeGuest {
>       ConfidentialGuestSupport parent_obj;
>   };
>   
> +struct RmeImage {
> +    hwaddr base;
> +    hwaddr src_size;
> +    hwaddr dst_size;
> +};
> +
> +static GSList *rme_images;
> +
>   static RmeGuest *cgs_to_rme(ConfidentialGuestSupport *cgs)
>   {
>       if (!cgs) {
> @@ -51,6 +62,38 @@ static int rme_create_rd(RmeGuest *guest, Error **errp)
>       return ret;
>   }
>   
> +static void rme_populate_realm(gpointer data, gpointer user_data)
> +{
> +    int ret;
> +    struct RmeImage *image = data;
> +    struct kvm_cap_arm_rme_init_ipa_args init_args = {
> +        .init_ipa_base = image->base,
> +        .init_ipa_size = image->dst_size,
> +    };
> +    struct kvm_cap_arm_rme_populate_realm_args populate_args = {
> +        .populate_ipa_base = image->base,
> +        .populate_ipa_size = image->src_size,
> +    };
> +
> +    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
> +                            KVM_CAP_ARM_RME_INIT_IPA_REALM,
> +                            (intptr_t)&init_args);
> +    if (ret) {
> +        error_setg_errno(&error_fatal, -ret,
> +                         "RME: failed to initialize GPA range (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
> +                         image->base, image->dst_size);
> +    }

Using error_fatal with error_setg is discouraged.
This should be error_report(), exit().


> +
> +    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_RME, 0,
> +                            KVM_CAP_ARM_RME_POPULATE_REALM,
> +                            (intptr_t)&populate_args);
> +    if (ret) {
> +        error_setg_errno(&error_fatal, -ret,
> +                         "RME: failed to populate realm (0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
> +                         image->base, image->src_size);
> +    }
> +}
> +
>   static void rme_vm_state_change(void *opaque, bool running, RunState state)
>   {
>       int ret;
> @@ -72,6 +115,9 @@ static void rme_vm_state_change(void *opaque, bool running, RunState state)
>           }
>       }
>   
> +    g_slist_foreach(rme_images, rme_populate_realm, NULL);
> +    g_slist_free_full(g_steal_pointer(&rme_images), g_free);

I suppose this technically works because you clear the list, and thus the hook is called 
only on the first transition to RUNNING.  On all subsequent transitions the list is empty.

I see that i386 sev does this immediately during machine init, alongside the kernel setup. 
  Since kvm_init has already been called, that seems workable, rather than queuing 
anything for later.

But I think ideally this would be handled generically in (approximately) 
kvm_cpu_synchronize_post_init, looping over all blobs.  This would handle any usage of 
'-device loader,...', instead of the 4 specific things you handle in the next patch.


r~

