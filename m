Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594ED48735A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 08:12:33 +0100 (CET)
Received: from localhost ([::1]:57146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5jQN-000649-T1
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 02:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n5jKH-000426-Ny
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:06:13 -0500
Received: from mga11.intel.com ([192.55.52.93]:18399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n5jKD-0000Ac-6N
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641539169; x=1673075169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dcir3Ffal0vUADpdNEqrL/soZai/8Aq4FsqiXQdZrkw=;
 b=PsneFX4y6G4pwcKnfSM+HC398aQkYoGx/hrVAXBhDpNzwl5IHf7DH4La
 kEe6QPe2mBAxB6MmD7Qa0rJZO9XfMf7N2lvHHi99KrL1vPRn9rEbrFFX3
 kWrxyIemLIs8uoT6PheOJCNarOMrVzB29mZYR1ndteSrhrE12nnwjTa7G
 LhtIQhgwfuyUmchP8YR8cbleEyoimKgkHyexNzWV1bKWyrXGCPQnW7ggK
 iwmEK/maKcM3nE3PoaDMJy3NCMbOBaB8sS54v0X4TZiW4NwM73bHnG2sY
 OzMewcxB9U/z4kl/va1PSzuQPu6epiVJMc7vUrQtTrpSCfkcC+r3TD1+Z g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="240373203"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="240373203"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 23:06:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="621813370"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.31.145])
 ([10.255.31.145])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 23:05:59 -0800
Message-ID: <e74fcb88-3add-4bb7-4508-742db44fa3c8@intel.com>
Date: Fri, 7 Jan 2022 15:05:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Content-Language: en-US
To: Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 isaku.yamahata@gmail.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
 <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
 <a97a75ad-9d1c-a09f-281b-d6b0a7652e78@intel.com>
 <4eb6a628-0af6-409b-7e42-52787ee3e69d@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <4eb6a628-0af6-409b-7e42-52787ee3e69d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/2022 12:06 AM, Laszlo Ersek wrote:
> On 01/04/22 14:08, Xiaoyao Li wrote:
> 
>> + Laszlo,
>>
>> Regarding laoding TDVF as pflash, I have some questions:
>>
>> - pflash requires KVM to support readonly mmeory. However, for TDX, it
>> doesn't support readonly memory. Is it a must? or we can make an
>> exception for TDX?
>>
>> - I saw from
>> https://lists.gnu.org/archive/html/qemu-discuss/2018-04/msg00045.html,
>> you said when load OVMF as pflash, it's MMIO. But for TDVF, it's treated
>> as private memory. I'm not sure whether it will cause some potential
>> problem if loading TDVF with pflash.
>>
>> Anyway I tried changing the existing pflash approach to load TDVF. It
>> can boot a TDX VM and no issue.
> 
> I have no comments on whether TDX should or should not use pflash.
> 
> If you go without pflash, then you likely will not have a
> standards-conformant UEFI variable store. (Unless you reimplement the
> variable arch protocols in edk2 on top of something else than the Fault
> Tolerant Write and Firmware Volume Block protocols.) Whether a
> conformant UEFI varstore matters to you (or to TDX in general) is
> something I can't comment on.

Thanks for your reply! Laszlo

regarding "standards-conformant UEFI variable store", I guess you mean 
the change to UEFI non-volatile variables needs to be synced back to the 
OVMF_VARS.fd file. right?

If so, I need to sync with internal folks who are upstreaming TDVF 
support into OVMF.

> (I've generally stopped commenting on confidential computing topics, but
> this message allows for comments on just pflash, and how it impacts OVMF.)
> 
> Regarding pflash itself, the read-only KVM memslot is required for it.
> Otherwise pflash cannot work as a "ROMD device" (= you can't flip it
> back and forth between ROM mode and programming (MMIO) mode).

We don't need Read-only mode for TDVF so far. If for this purpose, is it 
acceptable that allowing a pflash without KVM readonly memslot support 
if read-only is not required for the specific pflash device?

We are trying to follow the existing usage of OVMF for TDX, since TDVF 
support will be landed in OVMF instead of a new separate binary.

> Thanks
> Laszlo
> 


