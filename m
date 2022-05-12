Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFA5255B9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:30:50 +0200 (CEST)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEWO-0000Ak-KX
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npDAf-0006wv-BN
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:04:17 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npDAd-0002iO-H5
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:04:16 -0400
Received: by mail-pf1-x42f.google.com with SMTP id p12so5556704pfn.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 11:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v1QbIZe1SWTSb2l4Go+bRTbBo3uijeYEo8m/JNDJBEs=;
 b=gF0JytBSn9OhDNNyaH7h/qZX8B/TiR7oUO+WU4d8Dj6f64VGLF5WWitf/goD0iiO0l
 3o3l8PUxqhmxKB3ppHX/7LftcwckySrKjd+l+yAWxTmd91aY9XndmVU6ae4DRoiNtV76
 EUf1G3aE68Hn+V9P90YZxVS4FWU3QPNoxmWi6NekaUttD1f9OkYtaV4NW5grdewzKxqo
 0f4zmsaHrXzKVtVqgFlu10P/ml+VrELz61ij4QnL13SVjkDHrFte865ibXOv6+dnbv1O
 /17kLKUG2MYmlpXijx1YWH4BRrTbsij2tagqA4GOSTNXNaw+CYLRUmCC6IpOFJXmDZfc
 h8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v1QbIZe1SWTSb2l4Go+bRTbBo3uijeYEo8m/JNDJBEs=;
 b=y2P4sQPH0tJQfS9rerufDmH6ZkOrVc3uIaG4kAN8aLbWPb2YU36Lk3fjjL4ZMWi30r
 xyH3xIuSDh1hbjPZ51gvzrS4PR44BuzhT548k7gZ7peE4hSBo6p/SCtoU/X9+B5xaZ2Y
 kK9z0fLGrv0zWZATyB2qak22i6qGS96qI5YuI7DY28KcE5j7TxnazcwsiMjLe4xDWl/Z
 QxqNjbTFXmNFmXVFmhNkUdRf1XDXaT1P+27kmEI1NJYv03O6QrVJVgPcOhyPY4E0G9H4
 mZXdBj+fARyeRzVk8NoaXT2fT1aqJtPIovizmzREctKO+B04Z2Yw9wL2EukJyv4E3LHS
 kPlQ==
X-Gm-Message-State: AOAM5332+eriEQ2qENGxNDoDzy7TRhPBNCyGNifriXX3Wv/moBjDAG8B
 RAo8BLAChRHBbzv5m9XWC6Q=
X-Google-Smtp-Source: ABdhPJyYOt+c7xcAOJvhFu/ZqvxN8I7kt2BUj/EwmmxCXTxMhoFaM0hVaIvAhuhob50D/SDcdwo9rg==
X-Received: by 2002:a63:80c6:0:b0:3c2:88f0:9035 with SMTP id
 j189-20020a6380c6000000b003c288f09035mr674497pgd.606.1652378654142; 
 Thu, 12 May 2022 11:04:14 -0700 (PDT)
Received: from localhost ([192.55.54.48]) by smtp.gmail.com with ESMTPSA id
 g12-20020aa796ac000000b0050dc76281a8sm118573pfk.130.2022.05.12.11.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 11:04:13 -0700 (PDT)
Date: Thu, 12 May 2022 11:04:12 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 14/36] i386/tdx: Implement user specified tsc
 frequency
Message-ID: <20220512180412.GG2789321@ls.amr.corp.intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-15-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-15-xiaoyao.li@intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 11:17:41AM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> Reuse "-cpu,tsc-frequency=" to get user wanted tsc frequency and pass it
> to KVM_TDX_INIT_VM.
> 
> Besides, sanity check the tsc frequency to be in the legal range and
> legal granularity (required by TDX module).

Just to make it sure.
You didn't use VM-scoped KVM_SET_TSC_KHZ because KVM side patch is still in
kvm/queue?  Once the patch lands, we should use it.

Thanks,

> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/kvm/kvm.c |  8 ++++++++
>  target/i386/kvm/tdx.c | 18 ++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index f2d7c3cf59ac..c51125ab200f 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -818,6 +818,14 @@ static int kvm_arch_set_tsc_khz(CPUState *cs)
>      int r, cur_freq;
>      bool set_ioctl = false;
>  
> +    /*
> +     * TD guest's TSC is immutable, it cannot be set/changed via
> +     * KVM_SET_TSC_KHZ, but only be initialized via KVM_TDX_INIT_VM
> +     */
> +    if (is_tdx_vm()) {
> +        return 0;
> +    }
> +
>      if (!env->tsc_khz) {
>          return 0;
>      }
> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index 9f2cdf640b5c..622efc409438 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -35,6 +35,9 @@
>  #define TDX_TD_ATTRIBUTES_PKS               BIT_ULL(30)
>  #define TDX_TD_ATTRIBUTES_PERFMON           BIT_ULL(63)
>  
> +#define TDX_MIN_TSC_FREQUENCY_KHZ   (100 * 1000)
> +#define TDX_MAX_TSC_FREQUENCY_KHZ   (10 * 1000 * 1000)
> +
>  static TdxGuest *tdx_guest;
>  
>  /* It's valid after kvm_confidential_guest_init()->kvm_tdx_init() */
> @@ -211,6 +214,20 @@ int tdx_pre_create_vcpu(CPUState *cpu)
>          goto out;
>      }
>  
> +    r = -EINVAL;
> +    if (env->tsc_khz && (env->tsc_khz < TDX_MIN_TSC_FREQUENCY_KHZ ||
> +                         env->tsc_khz > TDX_MAX_TSC_FREQUENCY_KHZ)) {
> +        error_report("Invalid TSC %ld KHz, must specify cpu_frequency between [%d, %d] kHz",
> +                      env->tsc_khz, TDX_MIN_TSC_FREQUENCY_KHZ,
> +                      TDX_MAX_TSC_FREQUENCY_KHZ);
> +        goto out;
> +    }
> +
> +    if (env->tsc_khz % (25 * 1000)) {
> +        error_report("Invalid TSC %ld KHz, it must be multiple of 25MHz", env->tsc_khz);
> +        goto out;
> +    }
> +
>      r = setup_td_guest_attributes(x86cpu);
>      if (r) {
>          goto out;
> @@ -221,6 +238,7 @@ int tdx_pre_create_vcpu(CPUState *cpu)
>  
>      init_vm.attributes = tdx_guest->attributes;
>      init_vm.max_vcpus = ms->smp.cpus;
> +    init_vm.tsc_khz = env->tsc_khz;
>  
>      r = tdx_vm_ioctl(KVM_TDX_INIT_VM, 0, &init_vm);
>      if (r < 0) {
> -- 
> 2.27.0
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

