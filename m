Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45E4978ED
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 07:29:06 +0100 (CET)
Received: from localhost ([::1]:51234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBsqe-0006gl-U2
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 01:29:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nBskx-0004zA-UQ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:23:13 -0500
Received: from mga03.intel.com ([134.134.136.65]:7054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nBsku-00060C-WA
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 01:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643005389; x=1674541389;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jSstmPNCf3s4Q1fhHwsv1snaaS9fbX221w264WxTtl0=;
 b=UzrpyBiGDA+DJY7oBEpSMEbbRcrlMtdAb1St8KdcaTMS0UmHR28Fickn
 6aDSvfyDJdPHYtl7wWajLJLT68eCsWpg2B6cvOxg8eR5QMgQz5ALD/C/h
 ipUhrcsWmtN1U326ykk6iBumPG0Igp/NvoF5pY67eTa3/fCgvpY8VWXA+
 EckI/iaPk4+wZLRwtAY7vihIV0PB27qPXZiBvuqmCa76X8E/Ae1b8KUCo
 sxGnr3G1zSMFM8q2EAbmF6SpDgBd/CjcZNWwu+npr7Q/42kXBmCmXpieN
 l5SdlzBt6dVNoHIaur5DHnz8md4eXQ4KK+T0jlYOtMln59KnYTki9CjH9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245918391"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="245918391"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 22:22:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="695306846"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.249.168.250])
 ([10.249.168.250])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 22:22:51 -0800
Message-ID: <8793aa69-3416-d48e-d690-9f70b1784b46@intel.com>
Date: Mon, 24 Jan 2022 14:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
 <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
 <a97a75ad-9d1c-a09f-281b-d6b0a7652e78@intel.com>
 <4eb6a628-0af6-409b-7e42-52787ee3e69d@redhat.com>
 <e74fcb88-3add-4bb7-4508-742db44fa3c8@intel.com>
 <20220110110120.ldjekirdzgmgex4z@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220110110120.ldjekirdzgmgex4z@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=xiaoyao.li@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.56, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, mtosatti@redhat.com, "Min M . Xu" <min.m.xu@intel.com>,
 erdemaktas@google.com, pbonzini@redhat.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/2022 7:01 PM, Gerd Hoffmann wrote:
>>> Regarding pflash itself, the read-only KVM memslot is required for it.
>>> Otherwise pflash cannot work as a "ROMD device" (= you can't flip it
>>> back and forth between ROM mode and programming (MMIO) mode).
>>
>> We don't need Read-only mode for TDVF so far. If for this purpose, is it
>> acceptable that allowing a pflash without KVM readonly memslot support if
>> read-only is not required for the specific pflash device?
> 
> In case you don't want/need persistent VARS (which strictly speaking is
> a UEFI spec violation) you should be able to go for a simple "-bios
> OVMF.fd".
> 

Gerd and Laszlo,

First, thank you for your patient explanation of how pflash works in 
QEMU and the clarification of usage of pflash with OVMF.

Below I want to share current situation of loading TDVF.

Restrictions from TDX architecture:
- Current TDX doesn't support read-only memory, i.e., cannot trap write.

- Current TDVF spec states that "In order to simplify the design, TDVF 
does not support non-volatile variables" in chapter 8.3.3


Regarding what interface should be used to load TDVF, there are three 
options:

   1) pflash: the same as how we load OVMF.

   Suppose TDVF support will finally get into OVMF, using this
   interface, it's full compatible with normal VMs. No change required
   to QEMU command line and TDVF binary is mapped to the GPA address
   right below 4G, but they are actually mapped as RAM.

   Of course, we need several hacks (special handling) in QEMU.

   Of course, they don't work as flash, the change made to it doesn't
   persist.

   2) -bios

   exploit "-bios" parameter to load TDVF. But again, read-only is not
   supported. TDVF is mapped as RAM.

   3) generic loader

   Just like what this series does. Implement specific parser in generic
   loader to load and parse TDVF as private RAM.

I'm nor sure if 1) is acceptable from your side. If not, we will go with 
option 3, since 2) doesn't make too much sense.

