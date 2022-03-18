Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC344DD2C9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 03:08:39 +0100 (CET)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV22f-0004ZS-Hl
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 22:08:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nV21C-0003t2-9r
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 22:07:06 -0400
Received: from [2607:f8b0:4864:20::62f] (port=45600
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nV21A-0008Qk-JT
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 22:07:05 -0400
Received: by mail-pl1-x62f.google.com with SMTP id q13so5912698plk.12
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 19:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZXiy/C7hMwMxLnwuA1L60XS6noDYSqCJLi2XWmMShJY=;
 b=HdAYBQsaGCzzw8E2AYi3GkH8GMKUT0DIEZMfuEghBVQrnHPqg/87BmWOSjn7T/E+qt
 MbKnfNg9Xp6FUvdmca3Bsv5NJQeLaU9/OEsVtSTVvLhng/Ssm75/mkxU05iNjBf2CwpG
 9nyIdivEHI97g6FabsCOQPIOIMbf95Pt4y+NlIwdbiBSMXXCEboNjmj0rsoKQh/DQQ1R
 Qc4+sNsTggvpcX0/AQQPBu105EeFUbsbs82xFaK78NJ/X44e4TwN8trnrG/SRf9GcTA/
 nP1KNmgs9G2ipgURIxNX1okWfe6hSVoj1ttzRm8T8YeljrgVwYBNIQWO0rdS0e2FhKuP
 qNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZXiy/C7hMwMxLnwuA1L60XS6noDYSqCJLi2XWmMShJY=;
 b=I5TWdzlpbBZ50OPqXLOvF0g9A2hExXy5DukLOakf57r08fCDUXWwVjETGiVdBuej+N
 lntFcF0d8p5Hb0sdYPCwPKIMRxnuPD+CyuZvIe2nJxyEAIl0fW4x9pa1XQwLEGLBRJNw
 t3cXjCXaPH/o4r8n47buhscKQReKMK/VFvcLnH/spDCMCwlyk6iOjI5ujobemGAHnNNQ
 DAgNpZzGMS0NAU2SN/WpiV4VjheG3SatGHK7zdiKAcZxO1XtNFNJ0Mvi92cmC3F2lN9L
 jfjkZ1SrfiqDEB4pgzq1TEisLsoPGxMhqcyZ3Jq+GEUCypUpnYUBtyYeGoAwi3iiQXh4
 6bow==
X-Gm-Message-State: AOAM531r9oSaxBirnkIA6gTRSBoshEYd8tfM1sU2Hm6/5h0ScbEJb3mF
 QWgHNILxISzdVXinhfo1jbQ=
X-Google-Smtp-Source: ABdhPJzrIITKIs04Bav53tODGnX7+92k0YLk1AlAiz7xzpR9xRBtJkSyo9jcFpuKl/TiUrTuZEYdcQ==
X-Received: by 2002:a17:90b:3ece:b0:1bf:16ac:7a1b with SMTP id
 rm14-20020a17090b3ece00b001bf16ac7a1bmr8636107pjb.236.1647569222575; 
 Thu, 17 Mar 2022 19:07:02 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 na8-20020a17090b4c0800b001bf191ee347sm11362529pjb.27.2022.03.17.19.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 19:07:02 -0700 (PDT)
Date: Thu, 17 Mar 2022 19:07:00 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 05/36] i386/tdx: Implement tdx_kvm_init() to
 initialize TDX VM context
Message-ID: <20220318020700.GA4006347@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-6-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-6-xiaoyao.li@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x62f.google.com
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

On Thu, Mar 17, 2022 at 09:58:42PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> Introduce tdx_kvm_init() and invoke it in kvm_confidential_guest_init()
> if it's a TDX VM. More initialization will be added later.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/kvm/kvm.c       | 15 ++++++---------
>  target/i386/kvm/meson.build |  2 +-
>  target/i386/kvm/tdx-stub.c  |  9 +++++++++
>  target/i386/kvm/tdx.c       | 13 +++++++++++++
>  target/i386/kvm/tdx.h       |  2 ++
>  5 files changed, 31 insertions(+), 10 deletions(-)
>  create mode 100644 target/i386/kvm/tdx-stub.c
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 70454355f3bf..26ed5faf07b8 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -54,6 +54,7 @@
>  #include "migration/blocker.h"
>  #include "exec/memattrs.h"
>  #include "trace.h"
> +#include "tdx.h"
>  
>  //#define DEBUG_KVM
>  
> @@ -2360,6 +2361,8 @@ static int kvm_confidential_guest_init(MachineState *ms, Error **errp)
>  {
>      if (object_dynamic_cast(OBJECT(ms->cgs), TYPE_SEV_GUEST)) {
>          return sev_kvm_init(ms->cgs, errp);
> +    } else if (object_dynamic_cast(OBJECT(ms->cgs), TYPE_TDX_GUEST)) {
> +        return tdx_kvm_init(ms, errp);
>      }
>  
>      return 0;
> @@ -2374,16 +2377,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      Error *local_err = NULL;
>  
>      /*
> -     * Initialize SEV context, if required
> +     * Initialize confidential guest (SEV/TDX) context, if required
>       *
> -     * If no memory encryption is requested (ms->cgs == NULL) this is
> -     * a no-op.
> -     *
> -     * It's also a no-op if a non-SEV confidential guest support
> -     * mechanism is selected.  SEV is the only mechanism available to
> -     * select on x86 at present, so this doesn't arise, but if new
> -     * mechanisms are supported in future (e.g. TDX), they'll need
> -     * their own initialization either here or elsewhere.
> +     * It's a no-op if a non-SEV/non-tdx confidential guest support
> +     * mechanism is selected, i.e., ms->cgs == NULL
>       */
>      ret = kvm_confidential_guest_init(ms, &local_err);
>      if (ret < 0) {
> diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
> index b2d7d41acde2..fd30b93ecec9 100644
> --- a/target/i386/kvm/meson.build
> +++ b/target/i386/kvm/meson.build
> @@ -9,7 +9,7 @@ i386_softmmu_kvm_ss.add(files(
>  
>  i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
>  
> -i386_softmmu_kvm_ss.add(when: 'CONFIG_TDX', if_true: files('tdx.c'))
> +i386_softmmu_kvm_ss.add(when: 'CONFIG_TDX', if_true: files('tdx.c'), if_false: files('tdx-stub.c'))
>  
>  i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
>  
> diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
> new file mode 100644
> index 000000000000..1df24735201e
> --- /dev/null
> +++ b/target/i386/kvm/tdx-stub.c
> @@ -0,0 +1,9 @@
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "tdx.h"
> +
> +int tdx_kvm_init(MachineState *ms, Error **errp)
> +{
> +    return -EINVAL;
> +}
> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index d3792d4a3d56..e3b94373b316 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -12,10 +12,23 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "qom/object_interfaces.h"
>  
> +#include "hw/i386/x86.h"
>  #include "tdx.h"
>  
> +int tdx_kvm_init(MachineState *ms, Error **errp)
> +{
> +    TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
> +                                                    TYPE_TDX_GUEST);

The caller already checks it.  This is redundant. Maybe assert?


-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

