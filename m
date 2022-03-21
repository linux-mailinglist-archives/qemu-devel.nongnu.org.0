Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A84E20F3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:07:37 +0100 (CET)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWC8e-00009h-4P
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:07:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBth-0006QF-Qm
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:52:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:54107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBtf-0003YV-0h
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647845527; x=1679381527;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=M5dH+/DenWqwLY/1sakEHfMvcCZ74F02Alh0NIVWiI4=;
 b=oFnIGsfEqSn1QL8rOUiH4gAnN3vmijkz+f1xZgZyP7jfgsVpxV4mPu2K
 PP7xoWMv9EfZ9khAbjoxOoFOug+exYyuXty8vU9vYNFfYOKYtLifOq/0O
 Usav+a+0lIXzswe85aYCtQ+nsZVjJp40CO1QrUOWu2uB12UrehRXuxm1I
 vBuPEy9b+m85Gvjtx502ZE9OxYB7rs/InvbM4mJCgxT+jnXzp9Dfd/PXy
 vzERnlhY6FaIL9ROG6FXgyL+sGGjZgKSouyE9N3uHQWT53sj0CnjK9zYJ
 Lnd4r21SF/pdVB+Lj21iYzOJXHcyKIWc7zvBqfNvLGk3wjQDUiH5bO195 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="238086327"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="238086327"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:52:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="559732794"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.245])
 ([10.249.169.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:52:00 -0700
Message-ID: <1032f754-03e9-6745-fb0b-0850a8d1e7c8@intel.com>
Date: Mon, 21 Mar 2022 14:51:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 27/36] i386/tdx: Disable SMM for TDX VMs
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-28-xiaoyao.li@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220317135913.2166202-28-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, qemu-devel@nongnu.org,
 erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/2022 9:59 PM, Xiaoyao Li wrote:
> TDX doesn't support SMM and VMM cannot emulate SMM for TDX VMs because
> VMM cannot manipulate TDX VM's memory.
> 
> Disable SMM for TDX VMs and error out if user requests to enable SMM.
> 
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>   target/i386/kvm/tdx.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index deb9634b27dc..ec6f5d7a2e48 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -302,12 +302,25 @@ static Notifier tdx_machine_done_notify = {
>   
>   int tdx_kvm_init(MachineState *ms, Error **errp)
>   {
> +    X86MachineState *x86ms = X86_MACHINE(ms);
>       TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
>                                                       TYPE_TDX_GUEST);
>       if (!tdx) {
>           return -EINVAL;
>       }
>   
> +    if (!kvm_enable_x2apic()) {
> +        error_setg(errp, "Failed to enable x2apic in KVM");
> +        return -EINVAL;
> +    }

above change is not relevant to this patch, will remove it in next version.

> +
> +    if (x86ms->smm == ON_OFF_AUTO_AUTO) {
> +        x86ms->smm = ON_OFF_AUTO_OFF;
> +    } else if (x86ms->smm == ON_OFF_AUTO_ON) {
> +        error_setg(errp, "TDX VM doesn't support SMM");
> +        return -EINVAL;
> +    }
> +
>       if (!tdx_caps) {
>           get_tdx_capabilities();
>       }


