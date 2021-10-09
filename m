Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676304277C0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 08:29:27 +0200 (CEST)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZ5rJ-0003Zl-LZ
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 02:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZ5qO-0002vc-Kk
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 02:28:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:5706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZ5qM-0006XP-DE
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 02:28:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="290137089"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="290137089"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 23:28:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; d="scan'208";a="489750761"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 08 Oct 2021 23:28:19 -0700
Date: Sat, 9 Oct 2021 14:14:06 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/4] hw/i386/sgx: Have sgx_epc_get_section() return a
 boolean
Message-ID: <20211009061406.GA14769@yangzhon-Virtual>
References: <20211007175612.496366-1-philmd@redhat.com>
 <20211007175612.496366-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211007175612.496366-3-philmd@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=yang.zhong@intel.com; helo=mga07.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 07:56:10PM +0200, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/i386/sgx-epc.h | 2 +-
>  hw/i386/sgx-stub.c        | 2 +-
>  hw/i386/sgx.c             | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
> index 65a68ca753a..a6a65be854f 100644
> --- a/include/hw/i386/sgx-epc.h
> +++ b/include/hw/i386/sgx-epc.h
> @@ -55,7 +55,7 @@ typedef struct SGXEPCState {
>      int nr_sections;
>  } SGXEPCState;
>  
> -int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
> +bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);
>  
>  static inline uint64_t sgx_epc_above_4g_end(SGXEPCState *sgx_epc)
>  {
> diff --git a/hw/i386/sgx-stub.c b/hw/i386/sgx-stub.c
> index 3be9f5ca32c..45c473119ef 100644
> --- a/hw/i386/sgx-stub.c
> +++ b/hw/i386/sgx-stub.c
> @@ -20,7 +20,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>      memset(&pcms->sgx_epc, 0, sizeof(SGXEPCState));
>  }
>  
> -int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
> +bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
>  {
>      g_assert_not_reached();
>  }
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index e481e9358f1..29724ff8f08 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -115,13 +115,13 @@ SGXInfo *sgx_get_info(Error **errp)
>      return info;
>  }
>  
> -int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
> +bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
>  {
>      PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
>      SGXEPCDevice *epc;
>  
>      if (pcms->sgx_epc.size == 0 || pcms->sgx_epc.nr_sections <= section_nr) {
> -        return 1;
> +        return true;


If return boolean, here should be return false, Sean wrote this(return 0 or 1) like Linux kernel did.  


>      }
>  
>      epc = pcms->sgx_epc.sections[section_nr];
> @@ -129,7 +129,7 @@ int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
>      *addr = epc->addr;
>      *size = memory_device_get_region_size(MEMORY_DEVICE(epc), &error_fatal);
>  
> -    return 0;
> +    return false;

Here should be return true.

Then in the ./target/i386/cpu.c file,

 if (sgx_epc_get_section(count - 2, &epc_addr, &epc_size))

 should be

 if (!sgx_epc_get_section(count - 2, &epc_addr, &epc_size))


Yang


>  }
>  
>  void pc_machine_init_sgx_epc(PCMachineState *pcms)
> -- 
> 2.31.1

