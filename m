Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA1945B5D8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:48:14 +0100 (CET)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpn0n-0002cc-9w
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:48:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mpmka-00057L-Vb
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:31:29 -0500
Received: from mga02.intel.com ([134.134.136.20]:9141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mpmkX-0006Pu-A7
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:31:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222444855"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="222444855"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 23:31:20 -0800
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="509771296"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.29.159])
 ([10.255.29.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 23:31:16 -0800
Message-ID: <03aaab8b-0a50-6b56-2891-ccd58235ad83@intel.com>
Date: Wed, 24 Nov 2021 15:31:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.1
Subject: Re: [RFC PATCH v2 06/44] hw/i386: Introduce kvm-type for TDX guest
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, isaku.yamahata@gmail.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <04c08d0770736cfa2e3148489602bc42492c78f3.1625704980.git.isaku.yamahata@intel.com>
 <20210826102212.gykq2z4fb2iszb2k@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20210826102212.gykq2z4fb2iszb2k@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, mtosatti@redhat.com, erdemaktas@google.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/2021 6:22 PM, Gerd Hoffmann wrote:
> On Wed, Jul 07, 2021 at 05:54:36PM -0700, isaku.yamahata@gmail.com wrote:
>> From: Xiaoyao Li <xiaoyao.li@intel.com>
>>
>> Introduce a machine property, kvm-type, to allow the user to create a
>> Trusted Domain eXtensions (TDX) VM, a.k.a. a Trusted Domain (TD), e.g.:
>>
>>   # $QEMU \
>> 	-machine ...,kvm-type=tdx \
>> 	...

Sorry for the very late reply.

> Can we align sev and tdx better than that?
> 
> SEV is enabled this way:
> 
> qemu -machine ...,confidential-guest-support=sev0 \
>       -object sev-guest,id=sev0,...
> 
> (see docs/amd-memory-encryption.txt for details).
> 
> tdx could likewise use a tdx-guest object (and both sev-guest and
> tdx-guest should probably have a common parent object type) to enable
> and configure tdx support.

yes, sev only introduced a new object and passed it to 
confidential-guest-support. This is because SEV doesn't require the new 
type of VM.
However, TDX does require a new type of VM.

If we read KVM code, there is a parameter of CREATE_VM to pass the 
vm_type, though x86 doesn't use this field so far. On QEMU side, it also 
has the codes to pass/configure vm-type in command line. Of cousre, x86 
arch doesn't implement it. With upcoming TDX, it will implement and use 
vm type for TDX. That's the reason we wrote this patch to implement 
kvm-type for x86, similar to other arches.

yes, of course we can infer the vm_type from "-object tdx-guest". But I 
prefer to just use vm_type. Let's see others opinion.

thanks,
-Xiaoyao

> take care,
>    Gerd
> 


