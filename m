Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4136525561
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:08:16 +0200 (CEST)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEAZ-0002FC-Q2
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npDlx-0006xa-Tu
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:42:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npDlu-0001SV-NT
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:42:48 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5682366pjq.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 11:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CsdZ4lF67CixQDU+lvg63qvqiE5/zMHvgOJEqPfS9Nc=;
 b=XmWlNyzG6WgNJqB+96QJizkPaejYmjLU+CWCFmwyYo18FV9CJDSeWEONuQGOiJbWaF
 UAngLI2XbbeLeffuDIGCJlyILPDoLj25LCMbK4Azgqyq9MGireMP+81gWSNP1dOWxMKw
 9uPzJjuV9MHfXwTEPtdm5JI0p5pj7V3K85VOvMKWSpGiimXuD4RdKXTcqrinGe1Il3h8
 dTuYc99+CB8zGJBXMOnnEx5R1sVsvYEHbU+/bMCaGEp2tRTux8AZatYDOdy0S7keF4TM
 v1KkQ+Q5pwlZduqMoOOc9MPqoSzCQo4GY5UEHN/M+DhM/jpf5Q1VpfohMO4rcI/MgrQC
 hFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CsdZ4lF67CixQDU+lvg63qvqiE5/zMHvgOJEqPfS9Nc=;
 b=jnBfrrOI2OupXZBJfHLlNFp1wtcAMtBCMG4rR6oWe9FJ9C9fd7Zkf7smfeBU3D9b2q
 VB1E8XnCpcgekp3VPhJLY4Dz8zYhLjy7sRd/zNFRS7rDiFsIt/p4RxByY90alZzUKtha
 vBFy6wz4auBXBzgllkSdNdnBx8FR++Mu5VUEx7G3gCWrZ1R8O5Ot2AAlNKBFGKaA2afD
 7gpj1qnf6f3/43j4cqlGenztQM34+74+mgXTa9bWtGWwydhLeE/ZQSzwd+cZJXdgqne9
 KWeXOhBLPHOUm2/4NAEItwtYid92OLyKpED62n3Pl3Vc3rJ1KtNJzTqgswsehh36f86k
 EAyQ==
X-Gm-Message-State: AOAM533BZIbIW66maYnTUaLRKccxQe8sjXDquceYwPK6o0JRatQGFWVY
 opFnff6YVKIt/NJN26mfhZ4=
X-Google-Smtp-Source: ABdhPJzTjx64m3fBiHtMyB5sdJZZlfw0vBcVwY5sHq4qNmRCGx/AkQhYsCb24CrQk8ncDbQEnM61yg==
X-Received: by 2002:a17:903:41cb:b0:15e:b1f4:352f with SMTP id
 u11-20020a17090341cb00b0015eb1f4352fmr1022659ple.56.1652380964566; 
 Thu, 12 May 2022 11:42:44 -0700 (PDT)
Received: from localhost ([192.55.54.48]) by smtp.gmail.com with ESMTPSA id
 a18-20020aa79712000000b0050dc76281e5sm136704pfg.191.2022.05.12.11.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 11:42:44 -0700 (PDT)
Date: Thu, 12 May 2022 11:42:42 -0700
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
Subject: Re: [RFC PATCH v4 36/36] docs: Add TDX documentation
Message-ID: <20220512184242.GJ2789321@ls.amr.corp.intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-37-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-37-xiaoyao.li@intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pj1-x1035.google.com
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

On Thu, May 12, 2022 at 11:18:03AM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> Add docs/system/i386/tdx.rst for TDX support, and add tdx in
> confidential-guest-support.rst
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  docs/system/confidential-guest-support.rst |   1 +
>  docs/system/i386/tdx.rst                   | 103 +++++++++++++++++++++
>  docs/system/target-i386.rst                |   1 +
>  3 files changed, 105 insertions(+)
>  create mode 100644 docs/system/i386/tdx.rst
> 
> diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
> index 0c490dbda2b7..66129fbab64c 100644
> --- a/docs/system/confidential-guest-support.rst
> +++ b/docs/system/confidential-guest-support.rst
> @@ -38,6 +38,7 @@ Supported mechanisms
>  Currently supported confidential guest mechanisms are:
>  
>  * AMD Secure Encrypted Virtualization (SEV) (see :doc:`i386/amd-memory-encryption`)
> +* Intel Trust Domain Extension (TDX) (see :doc:`i386/tdx`)
>  * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
>  * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
>  
> diff --git a/docs/system/i386/tdx.rst b/docs/system/i386/tdx.rst
> new file mode 100644
> index 000000000000..96d91fea5516
> --- /dev/null
> +++ b/docs/system/i386/tdx.rst
> @@ -0,0 +1,103 @@
> +Intel Trusted Domain eXtension (TDX)
> +====================================
> +
> +Intel Trusted Domain eXtensions (TDX) refers to an Intel technology that extends
> +Virtual Machine Extensions (VMX) and Multi-Key Total Memory Encryption (MKTME)
> +with a new kind of virtual machine guest called a Trust Domain (TD). A TD runs
> +in a CPU mode that is designed to protect the confidentiality of its memory
> +contents and its CPU state from any other software, including the hosting
> +Virtual Machine Monitor (VMM), unless explicitly shared by the TD itself.
> +
> +Prerequisites
> +-------------
> +
> +To run TD, the physical machine needs to have TDX module loaded and initialized
> +while KVM hypervisor has TDX support and has TDX enabled. If those requirements
> +are met, the ``KVM_CAP_VM_TYPES`` will report the support of ``KVM_X86_TDX_VM``.
> +
> +Trust Domain Virtual Firmware (TDVF)
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Trust Domain Virtual Firmware (TDVF) is required to provide TD services to boot
> +TD Guest OS. TDVF needs to be copied to guest private memory and measured before
> +a TD boots.
> +
> +The VM scope ``MEMORY_ENCRYPT_OP`` ioctl provides command ``KVM_TDX_INIT_MEM_REGION``
> +to copy the TDVF image to TD's private memory space.
> +
> +Since TDX doesn't support readonly memslot, TDVF cannot be mapped as pflash
> +device and it actually works as RAM. "-bios" option is chosen to load TDVF.
> +
> +OVMF is the opensource firmware that implements the TDVF support. Thus the
> +command line to specify and load TDVF is `-bios OVMF.fd`
> +
> +Feature Control
> +---------------
> +
> +Unlike non-TDX VM, the CPU features (enumerated by CPU or MSR) of a TD is not
> +under full control of VMM. VMM can only configure part of features of a TD on
> +``KVM_TDX_INIT_VM`` command of VM scope ``MEMORY_ENCRYPT_OP`` ioctl.
> +
> +The configurable features have three types:
> +
> +- Attributes:
> +  - PKS (bit 30) controls whether Supervisor Protection Keys is exposed to TD,
> +  which determines related CPUID bit and CR4 bit;
> +  - PERFMON (bit 63) controls whether PMU is exposed to TD.
> +
> +- XSAVE related features (XFAM):
> +  XFAM is a 64b mask, which has the same format as XCR0 or IA32_XSS MSR. It
> +  determines the set of extended features available for use by the guest TD.
> +
> +- CPUID features:
> +  Only some bits of some CPUID leaves are directly configurable by VMM.
> +
> +What features can be configured is reported via TDX capabilities.
> +
> +TDX capabilities
> +~~~~~~~~~~~~~~~~
> +
> +The VM scope ``MEMORY_ENCRYPT_OP`` ioctl provides command ``KVM_TDX_CAPABILITIES``
> +to get the TDX capabilities from KVM. It returns a data structure of
> +``struct kvm_tdx_capabilites``, which tells the supported configuration of
> +attributes, XFAM and CPUIDs.
> +
> +Launching a TD (TDX VM)
> +-----------------------
> +
> +To launch a TDX guest:
> +
> +.. parsed-literal::
> +
> +    |qemu_system_x86| \\
> +        -machine ...,confidential-guest-support=tdx0 \\
> +        -object tdx-guest,id=tdx0 \\
> +        -bios OVMF.fd \\

Don't we need kernel-irqchip=split?
Or this patch series set it automatically?

Thanks,

> +
> +Debugging
> +---------
> +
> +Bit 0 of TD attributes, is DEBUG bit, which decides if the TD runs in off-TD
> +debug mode. When in off-TD debug mode, TD's VCPU state and private memory are
> +accessible via given SEAMCALLs. This requires KVM to expose APIs to invoke those
> +SEAMCALLs and resonponding QEMU change.
> +
> +It's targeted as future work.
> +
> +restrictions
> +------------
> +
> + - No readonly support for private memory;
> +
> + - No SMM support: SMM support requires manipulating the guset register states
> +   which is not allowed;
> +
> +Live Migration
> +--------------
> +
> +TODO
> +
> +References
> +----------
> +
> +- `TDX Homepage <https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html>`__
> diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
> index 96bf54889a82..16dd4f1a8c80 100644
> --- a/docs/system/target-i386.rst
> +++ b/docs/system/target-i386.rst
> @@ -29,6 +29,7 @@ Architectural features
>     i386/kvm-pv
>     i386/sgx
>     i386/amd-memory-encryption
> +   i386/tdx
>  
>  .. _pcsys_005freq:
>  
> -- 
> 2.27.0
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

