Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B0C6B34A6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 04:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paTEZ-0004p9-9n; Thu, 09 Mar 2023 22:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1paTEW-0004or-I3
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 22:15:52 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1paTEU-0002Rk-1D
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 22:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678418150; x=1709954150;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XADA23lPV7Xh8GYzbrlqm6Mek6sY5wgy/cce61f3qH4=;
 b=fbHmxlHk1jw9Tpj499m/nLDJQ18aKqHp4E3FpFSWUNQ+pgshSKsgMoG7
 ZlO9OH0h6/fGY/5NAtUY+OSeHKRUzmdmeG5cHgT7CLRoMHunZK3Yi6XDo
 OHf6vyxNn2FLh/qdiXn0v8zSDTMocxgXmcs4tEAqESTLcTgkUZGRiO7RQ
 41GFXrdbgFljgQuAyhf3Y2VCQac+twq+N1hDwl40KUxIAfSFloXZyb7p3
 V3n7obD5ib8kp0lwNNY6lM72KaavshzvOI4jqsA77Geh9Km4P16A/AWLk
 Qm/GReIC2HGfMTXqPe1H5gG3+DGd9mdKzyaUjb5NtxuAnx9I6DaE11/p4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324985333"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="324985333"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 19:15:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627643087"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="627643087"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.254.212.199])
 ([10.254.212.199])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 19:15:40 -0800
Message-ID: <96e49428-0c2a-2a50-42e0-31c8e553a34b@intel.com>
Date: Fri, 10 Mar 2023 11:15:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v15 15/60] i386/xen: add pc_machine_kvm_type to initialize
 XEN_EMULATE mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
References: <20230301135223.988336-1-dwmw2@infradead.org>
 <20230301135223.988336-16-dwmw2@infradead.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20230301135223.988336-16-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/1/2023 9:51 PM, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The xen_overlay device (and later similar devices for event channels and
> grant tables) need to be instantiated. Do this from a kvm_type method on
> the PC machine derivatives, since KVM is only way to support Xen emulation
> for now.

Just curious, isn't there any more reasonable place to add machine 
specific initialization?

abusing the mc->kvm_type() looks bad to me.

If everything goes well, KVM x86 will support multiple vm_type[1].
At that time, QEMU will need to implement mc->kvm_type() to get/parse vm 
type. I have posted the patch to enable it for TDX[2].

[1] 
https://github.com/sean-jc/linux/commit/fbc35ac0be99b5e02248e7c8f1f3cacb9da512ce

[2] 
https://lore.kernel.org/qemu-devel/20220802074750.2581308-4-xiaoyao.li@intel.com/ 


> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/pc.c         | 11 +++++++++++
>   include/hw/i386/pc.h |  3 +++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 992951c107..a316a01b15 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -90,6 +90,7 @@
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/virtio/virtio-pmem-pci.h"
>   #include "hw/virtio/virtio-mem-pci.h"
> +#include "hw/i386/kvm/xen_overlay.h"
>   #include "hw/mem/memory-device.h"
>   #include "sysemu/replay.h"
>   #include "target/i386/cpu.h"
> @@ -1846,6 +1847,16 @@ static void pc_machine_initfn(Object *obj)
>       cxl_machine_init(obj, &pcms->cxl_devices_state);
>   }
>   
> +int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
> +{
> +#ifdef CONFIG_XEN_EMU
> +    if (xen_mode == XEN_EMULATE) {
> +        xen_overlay_create();
> +    }
> +#endif
> +    return 0;
> +}
> +
>   static void pc_machine_reset(MachineState *machine, ShutdownCause reason)
>   {
>       CPUState *cs;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 66e3d059ef..467311007e 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -291,12 +291,15 @@ extern const size_t pc_compat_1_5_len;
>   extern GlobalProperty pc_compat_1_4[];
>   extern const size_t pc_compat_1_4_len;
>   
> +int pc_machine_kvm_type(MachineState *machine, const char *vm_type);
> +
>   #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
>       static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
>       { \
>           MachineClass *mc = MACHINE_CLASS(oc); \
>           optsfn(mc); \
>           mc->init = initfn; \
> +        mc->kvm_type = pc_machine_kvm_type; \
>       } \
>       static const TypeInfo pc_machine_type_##suffix = { \
>           .name       = namestr TYPE_MACHINE_SUFFIX, \


