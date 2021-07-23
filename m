Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B53D3B66
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 15:48:17 +0200 (CEST)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vXD-0005GY-NY
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 09:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6vVo-0004ZS-3m
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:46:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6vVk-0007zO-Bv
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627048001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3XBQHN4Rch89SPhwqX3siDaxHK3EbIS5JbtdZ+XPpvs=;
 b=XJlPHdLgKWlhJ5wS1TAzYDQq7iq34X/ruMg6DmtIplBqJUqfPlkGxqmQp5uyp7aHMw6JB3
 L0kopdhyeMTUKeNQf9YGdFcXopA4RLfju1pDlt8t8xG/TzVIAFcG7QlDMaqS9qHbVMjNE0
 lbjUnUplT/PFxAvI0RI3/WuF1yWYfWU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-seEAcaSnO7SBgff2a3leYw-1; Fri, 23 Jul 2021 09:46:40 -0400
X-MC-Unique: seEAcaSnO7SBgff2a3leYw-1
Received: by mail-ed1-f71.google.com with SMTP id
 j22-20020a50ed160000b02903ab03a06e86so754524eds.14
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 06:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3XBQHN4Rch89SPhwqX3siDaxHK3EbIS5JbtdZ+XPpvs=;
 b=Emj51fzCzc3akMidT0vmv9PjiF8BlCtyYf0T1Nl6K1aq83KXbqd60IFnyKBFWgmXKn
 E8T2wphrLJnMaGxtdDqEC+A8uDeqHs1d/z5beeBgnbxddEsRx1RrUSrhrESMutQulv1a
 qYZs7rTf3OvwlVqR40VT68wZuzePwSmdrZ7ItPC62Pv8Bv7CWQvgF3xjz8NzB9EYxwp+
 TfgXOGwZsK+VQdp7d0TtmQWg9p57fEGh/T9G45v1s3KpaB85SUCi/TPC50JIjRdzusp4
 7YQj4rFf9Jb7bCh747ECKY9VuU/53rS+Yh/VdMCN3LD+cDVQXIPheupcdnnlbwq17gFA
 nyrA==
X-Gm-Message-State: AOAM531VF/Pu95NMDIQ+yxXmSWDnKGvTS0Mw/tlWS0qv730vgHx3BVKr
 wexjtKgiCHPSKGfLhxJiWwpFqoJXmqcubGoJDZUeSaLONiYGorkkk+VS0oskB4+5HXohZ7xe/qe
 MxVqUoPVCJec7XYmy7lCm+ilmOXTPHGF+ubvg+XgrqrA7V4cnSj7mNuRqkv0DnQ6g42Q=
X-Received: by 2002:a50:8e19:: with SMTP id 25mr5762951edw.11.1627047998681;
 Fri, 23 Jul 2021 06:46:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXDsb2FUWfmKVfTk+K4nmqiMHmOuLQX1idTKoygc179hKT09igpKIpDeEUFEdAMSFwr0U40Q==
X-Received: by 2002:a50:8e19:: with SMTP id 25mr5762929edw.11.1627047998459;
 Fri, 23 Jul 2021 06:46:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id n15sm655141edw.70.2021.07.23.06.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 06:46:37 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Added consistency checks for CR3
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210723112740.45962-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5ef81edc-867c-cde0-995d-fc0e0a0915d4@redhat.com>
Date: Fri, 23 Jul 2021 15:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723112740.45962-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/07/21 13:27, Lara Lazier wrote:
> All MBZ in CR3 must be zero (APM2 15.5)
> Added checks in both helper_vmrun and helper_write_crN.
> When EFER.LMA is zero the upper 32 bits needs to be zeroed.
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>   target/i386/tcg/sysemu/misc_helper.c |  7 +++++++
>   target/i386/tcg/sysemu/svm_helper.c  | 10 +++++++---
>   2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index a2af2c9bba..d347af2a99 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -96,6 +96,13 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
>           cpu_x86_update_cr0(env, t0);
>           break;
>       case 3:
> +        if ((env->efer & MSR_EFER_LMA) &&
> +                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
> +            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +        }
> +        if (!(env->efer & MSR_EFER_LMA)) {
> +            t0 &= 0xffffffffUL;
> +        }
>           cpu_x86_update_cr3(env, t0);
>           break;
>       case 4:
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 37dbe8e434..8b1ba53c64 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -111,6 +111,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>       uint32_t int_ctl;
>       uint32_t asid;
>       uint64_t new_cr0;
> +    uint64_t new_cr3;
>       uint64_t new_cr4;
>   
>       cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
> @@ -252,6 +253,11 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>       if ((new_cr0 & CR0_NW_MASK) && !(new_cr0 & CR0_CD_MASK)) {
>           cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>       }
> +    new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
> +    if ((env->efer & MSR_EFER_LMA) &&
> +            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }
>       new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
>       if (new_cr4 & cr4_reserved_bits(env)) {
>           cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> @@ -262,9 +268,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>   
>       cpu_x86_update_cr0(env, new_cr0);
>       cpu_x86_update_cr4(env, new_cr4);
> -    cpu_x86_update_cr3(env, x86_ldq_phys(cs,
> -                                     env->vm_vmcb + offsetof(struct vmcb,
> -                                                             save.cr3)));
> +    cpu_x86_update_cr3(env, new_cr3);
>       env->cr[2] = x86_ldq_phys(cs,
>                             env->vm_vmcb + offsetof(struct vmcb, save.cr2));
>       int_ctl = x86_ldl_phys(cs,
> 

Queued, thanks.

Paolo


