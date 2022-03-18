Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74B4DDF74
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:57:01 +0100 (CET)
Received: from localhost ([::1]:60262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFuO-0003yt-0j
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:57:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVFt0-0003IF-F7
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:55:34 -0400
Received: from [2607:f8b0:4864:20::1031] (port=39633
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVFsy-0004g7-Vg
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:55:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so6370220pjb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=85DsX9iAoK+Khgdz60GqS5EZIHIVR2Lk1qUZhsxGck4=;
 b=EWThS7pMmJmQgmqSCZt9bVbV1I6+i3QqeGMPIPhBVDE4X14ssW35/E8zX3u4nfZRgk
 xPckckr0H3JQgbMcIl8KfzND7vsO5ycvzyzOBgdpQC65omr58eEmOsl1M6eHa5kTy+x/
 P98Bsn4I06VTvu/6U1h+HPZ+PSjyBEOK2FLolDfv4ibfdLORLc2v21ZrxnP1kUVcMmLq
 cmrQe4gxwf+15jucScLdESpf9IQlgxiIUO0hC1XViH+nVkngRUpE6aM4jpTotI9y5Y+N
 adPj547GKsLMmwTKjqgBT4Z/mGKBBJ0wsgsYw1S3v1XGFpEnWqMeow/UEDjxlxh0l6lr
 6iWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85DsX9iAoK+Khgdz60GqS5EZIHIVR2Lk1qUZhsxGck4=;
 b=PnpWczQcvHi0Q1XKn00JqjIAO1ybGONBC5TMmWx4a56ndJ1ioDqEw2XVuaaVfjvYJP
 ovWqO6HlRBgOhzU2Ughvf4Kay0R2UhrOF2P8zggxLVzXmq78B9z+nwWwxM0uZkQY8ZTp
 VQpwzfr+bTyeXU39a8wtPyMmSWn2LGWcHYMgvPR9RJ4lZzcZL0iJxa9BfR+sh6t6OFUo
 7IutxQIse0ei5X75oyBYk4LSEJCmHN+Ze6BbMYMXyRV9iGbh2PuuwQQpSUbic2RM3C3W
 7LutORsdI53d7kdezfIwd4x/NNOmac32Mkrixmq8BmNNtR3cbsWluAxNMoRm20bRB5HI
 +KFQ==
X-Gm-Message-State: AOAM530eWwtkmJ3YmjINs00usxYoM3Rrqv8gpBIb1kB+JXSTOFBHf21Z
 l/DTdMBEZqOkJ6QqMM0bVVg=
X-Google-Smtp-Source: ABdhPJwacY4yXiPfU7XNJqw3YTmgi6wntHkHwGLOlua0+WHEulFIM+YFXX7I/hT8oAd1l0g6hhm0lA==
X-Received: by 2002:a17:902:b113:b0:153:1d99:9cc7 with SMTP id
 q19-20020a170902b11300b001531d999cc7mr389590plr.6.1647622531307; 
 Fri, 18 Mar 2022 09:55:31 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 m10-20020a17090a858a00b001c6a874142esm2395094pjn.17.2022.03.18.09.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 09:55:30 -0700 (PDT)
Date: Fri, 18 Mar 2022 09:55:29 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 08/36] i386/tdx: Adjust get_supported_cpuid() for
 TDX VM
Message-ID: <20220318165529.GA4049379@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-9-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-9-xiaoyao.li@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 09:58:45PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> For TDX, the allowable CPUID configuration differs from what KVM
> reports for KVM scope via KVM_GET_SUPPORTED_CPUID.
> 
> - Some CPUID bits are not supported for TDX VM while KVM reports the
>   support. Mask them off for TDX VM. e.g., CPUID_EXT_VMX, some PV
>   featues.
> 
> - The supported XCR0 and XSS bits needs to be caped by tdx_caps, because
>   KVM uses them to setup XFAM of TD.
> 
> Introduce tdx_get_supported_cpuid() to adjust the
> kvm_arch_get_supported_cpuid() for TDX VM.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/cpu.h     |  5 +++++
>  target/i386/kvm/kvm.c |  4 ++++
>  target/i386/kvm/tdx.c | 39 +++++++++++++++++++++++++++++++++++++++
>  target/i386/kvm/tdx.h |  2 ++
>  4 files changed, 50 insertions(+)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 5e406088a91a..7fa30f4ed7db 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -566,6 +566,11 @@ typedef enum X86Seg {
>  #define ESA_FEATURE_XFD_MASK            (1U << ESA_FEATURE_XFD_BIT)
>  
>  
> +#define XCR0_MASK       (XSTATE_FP_MASK | XSTATE_SSE_MASK | XSTATE_YMM_MASK | \
> +                         XSTATE_BNDREGS_MASK | XSTATE_BNDCSR_MASK | \
> +                         XSTATE_OPMASK_MASK | XSTATE_ZMM_Hi256_MASK | \
> +                         XSTATE_Hi16_ZMM_MASK | XSTATE_PKRU_MASK)
> +
>  /* CPUID feature words */
>  typedef enum FeatureWord {
>      FEAT_1_EDX,         /* CPUID[1].EDX */
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 26ed5faf07b8..ddbe8f64fadb 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -486,6 +486,10 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>          ret |= 1U << KVM_HINTS_REALTIME;
>      }
>  
> +    if (is_tdx_vm()) {
> +        tdx_get_supported_cpuid(function, index, reg, &ret);
> +    }
> +
>      return ret;
>  }
>  
> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index 846511b299f4..e4ee55f30c79 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -14,6 +14,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qom/object_interfaces.h"
> +#include "standard-headers/asm-x86/kvm_para.h"
>  #include "sysemu/kvm.h"
>  
>  #include "hw/i386/x86.h"
> @@ -110,6 +111,44 @@ int tdx_kvm_init(MachineState *ms, Error **errp)
>      return 0;
>  }
>  
> +void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
> +                             uint32_t *ret)
> +{
> +    switch (function) {
> +    case 1:
> +        if (reg == R_ECX) {
> +            *ret &= ~CPUID_EXT_VMX;
> +        }
> +        break;
> +    case 0xd:
> +        if (index == 0) {
> +            if (reg == R_EAX) {
> +                *ret &= (uint32_t)tdx_caps->xfam_fixed0 & XCR0_MASK;
> +                *ret |= (uint32_t)tdx_caps->xfam_fixed1 & XCR0_MASK;
> +            } else if (reg == R_EDX) {
> +                *ret &= (tdx_caps->xfam_fixed0 & XCR0_MASK) >> 32;
> +                *ret |= (tdx_caps->xfam_fixed1 & XCR0_MASK) >> 32;
> +            }
> +        } else if (index == 1) {
> +            /* TODO: Adjust XSS when it's supported. */
> +        }
> +        break;
> +    case KVM_CPUID_FEATURES:
> +        if (reg == R_EAX) {
> +            *ret &= ~((1ULL << KVM_FEATURE_CLOCKSOURCE) |
> +                      (1ULL << KVM_FEATURE_CLOCKSOURCE2) |
> +                      (1ULL << KVM_FEATURE_CLOCKSOURCE_STABLE_BIT) |
> +                      (1ULL << KVM_FEATURE_ASYNC_PF) |
> +                      (1ULL << KVM_FEATURE_ASYNC_PF_VMEXIT) |
> +                      (1ULL << KVM_FEATURE_ASYNC_PF_INT));

Because new feature bit may be introduced in future (it's unlikely though),
*ret &= (supported_bits) is better than *ret &= ~(unsupported_bits)

Thanks,

> +        }
> +        break;
> +    default:
> +        /* TODO: Use tdx_caps to adjust CPUID leafs. */
> +        break;
> +    }
> +}
> +
>  /* tdx guest */
>  OBJECT_DEFINE_TYPE_WITH_INTERFACES(TdxGuest,
>                                     tdx_guest,
> diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
> index 4036ca2f3f99..06599b65b827 100644
> --- a/target/i386/kvm/tdx.h
> +++ b/target/i386/kvm/tdx.h
> @@ -27,5 +27,7 @@ bool is_tdx_vm(void);
>  #endif /* CONFIG_TDX */
>  
>  int tdx_kvm_init(MachineState *ms, Error **errp);
> +void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
> +                             uint32_t *ret);
>  
>  #endif /* QEMU_I386_TDX_H */
> -- 
> 2.27.0
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

