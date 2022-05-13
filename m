Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1285258EF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:18:47 +0200 (CEST)
Received: from localhost ([::1]:58918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npJ14-00008C-K2
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1npIyR-00069C-90
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:16:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:4145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1npIyO-0000t9-UV
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652400960; x=1683936960;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1btgLcVFaoIL4FwmxtQ2dsqUiIPJhTN5EsOsNLdNOPI=;
 b=PQxyvqJs7z180fExOQ6bZT0qSj1Ysmqr5vmI9GPm2G6RyNe9EIlWtjbw
 QQS932+AyM37KKgR22vMxavOjZXZ6r0ghWPiYRQjQlSuTFK2EdvBxS17t
 YyrNJ1RHtUrwoWBEuiPuZpIaNj9cnVcxC3ZEuOnovEJkRLiE3ttW2FeJl
 4jVVU++rYgnWkp1+/Z4iG4dasYQWdpGEWL/PSi0KPJc0K3fGqaQSFSMut
 sJMNXaCBVRmgO+HWfSIxRjaFrtyZgDsVa6KdxtMngzUe0Co2gBjZkJrC5
 HWZCxPzzhtoM9vO40sgSmG+VVSU9j9pyhyDnJxNEa5x+nywYFp4tKRqTh g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="270105817"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="270105817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 17:15:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; d="scan'208";a="594944859"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.175.214])
 ([10.249.175.214])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2022 17:15:52 -0700
Message-ID: <7b941ee5-f4cb-bcc7-5f8a-f9469f977b52@intel.com>
Date: Fri, 13 May 2022 08:15:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: [RFC PATCH v4 09/36] KVM: Introduce kvm_arch_pre_create_vcpu()
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>, g@ls.amr.corp.intel.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-10-xiaoyao.li@intel.com>
 <20220512175059.GF2789321@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220512175059.GF2789321@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=xiaoyao.li@intel.com;
 helo=mga03.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/2022 1:50 AM, Isaku Yamahata wrote:
> On Thu, May 12, 2022 at 11:17:36AM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> Introduce kvm_arch_pre_create_vcpu(), to perform arch-dependent
>> work prior to create any vcpu. This is for i386 TDX because it needs
>> call TDX_INIT_VM before creating any vcpu.
> 
> Because "11/36 i386/tdx: Initialize TDX before creating TD vcpus" uses
> kvm_arch_pre_create_vcpu() (and 10/36 doesn't use it), please move this patch
> right before 11/36. (swap 09/36 and 10/36).
> 

OK.

I will change the order.



