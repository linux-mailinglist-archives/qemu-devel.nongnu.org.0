Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235664DDF7B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:58:15 +0100 (CET)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFva-0005Vl-8s
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:58:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVFtv-0004Go-DM
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:56:31 -0400
Received: from [2607:f8b0:4864:20::52e] (port=45714
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nVFtt-0004kF-Sq
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:56:31 -0400
Received: by mail-pg1-x52e.google.com with SMTP id o13so5436146pgc.12
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gePMaavqVc7aMCJv7Sy8LS7HNWGHWMrg3RoSxAFxOEI=;
 b=MJtPdhEU5oQSJNmjHjctPiIbHqVwsfsqjkJU2yfbPhCq/C0Ks8sPolTG4KkMfeBU0f
 vBbreTBvO980Ue4IYAcAZCUeTuFzCjKyg0SXI3VPxLUmvvlcJb8KNTzJ2sI+oHpXGwVD
 OFIdQ3f3PkbDd5r3yTorUqRC00oAUIXC+SYPcxCCAIsdCscTkS6N9SHrdDpXlFGP52gG
 IsJmxxg7sr0J8W45/t3g9yD0AhRZBsCeln7ZG10oHnWAE3pWneFrKRdp3VrlkKSRpkRK
 SFpjzMr1J2jWFKw0vhkqBD413ENpkMKF+RZF13SJnju0Z6J2XxG+Qs+I4FRymb0nJs/u
 QQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gePMaavqVc7aMCJv7Sy8LS7HNWGHWMrg3RoSxAFxOEI=;
 b=k6EQqSov7iagfJubEDCFC0cD1FAc1TnYgMzVIuH8vDcdDBtW/k99A/RyDPCuR+GdOZ
 RtWXWa35kbFuYEJ1e5gQLyGmzpGKXm6MCN5RQvOxKvqjPaeQ+vOwqzh4qxWz+kBz7IYg
 iGjllIk+BewBIRlPf5QP7rPvYNetcoOJI2nr4T4hMPmhaNYCdYK4ht6Y1UD+6Tb1ae5K
 x9l3lVwjTVQTOWzfXGfM7+jorECeL5OFPJAWU23eYwyNS0FBrvucc3v8txKr0wL6tQe6
 7qPPLgwGHj/cBHq85n6LdL1CQwg5L95b38vKOztqtaxHz7ErkHPcP7XdT1jmh10J7DAL
 GtGg==
X-Gm-Message-State: AOAM532a3Sw8mt6ZvswZrmCyPG7ropHYsC/OJbQPnILPKRIoRpptrwHf
 nB1A+4ppj+yjvGhPfUmDn6s=
X-Google-Smtp-Source: ABdhPJwCKkd4oD8/ksvahj/nXz3LgsZx8/RgQTnPC96APZYRn5sF/E2JpQmfdX33//ri1uz7JxHf7g==
X-Received: by 2002:a63:41c5:0:b0:378:3b1e:7ac7 with SMTP id
 o188-20020a6341c5000000b003783b1e7ac7mr8470547pga.266.1647622588613; 
 Fri, 18 Mar 2022 09:56:28 -0700 (PDT)
Received: from localhost ([192.55.54.52]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm10167674pfv.87.2022.03.18.09.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 09:56:28 -0700 (PDT)
Date: Fri, 18 Mar 2022 09:56:27 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [RFC PATCH v3 09/36] KVM: Introduce kvm_arch_pre_create_vcpu()
Message-ID: <20220318165627.GB4049379@ls.amr.corp.intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-10-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317135913.2166202-10-xiaoyao.li@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x52e.google.com
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

On Thu, Mar 17, 2022 at 09:58:46PM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> Introduce kvm_arch_pre_create_vcpu(), to perform arch-dependent
> work prior to create any vcpu. This is for i386 TDX because it needs
> call TDX_INIT_VM before creating any vcpu.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  accel/kvm/kvm-all.c    | 7 +++++++
>  include/sysemu/kvm.h   | 1 +
>  target/arm/kvm64.c     | 5 +++++
>  target/i386/kvm/kvm.c  | 5 +++++
>  target/mips/kvm.c      | 5 +++++
>  target/ppc/kvm.c       | 5 +++++
>  target/s390x/kvm/kvm.c | 5 +++++
>  7 files changed, 33 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 27864dfaeaaa..a4bb449737a6 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -465,6 +465,13 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
>  
>      trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
>  
> +    ret = kvm_arch_pre_create_vcpu(cpu);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret,
> +                         "kvm_init_vcpu: kvm_arch_pre_create_vcpu() failed");
> +        goto err;
> +    }
> +
>      ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index a783c7886811..0e94031ab7c7 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -373,6 +373,7 @@ int kvm_arch_put_registers(CPUState *cpu, int level);
>  
>  int kvm_arch_init(MachineState *ms, KVMState *s);
>  
> +int kvm_arch_pre_create_vcpu(CPUState *cpu);
>  int kvm_arch_init_vcpu(CPUState *cpu);
>  int kvm_arch_destroy_vcpu(CPUState *cpu);
>  
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index ccadfbbe72be..ae7336851c62 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -935,6 +935,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      return kvm_arm_init_cpreg_list(cpu);
>  }
>  
> +int kvm_arch_pre_create_vcpu(CPUState *cpu)
> +{
> +    return 0;
> +}
> +

Weak symbol can be used to avoid update all the arch.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

