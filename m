Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C648984D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 13:12:26 +0100 (CET)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6tXF-0004bi-Er
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 07:12:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n6tUX-0003Fd-9l
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:09:37 -0500
Received: from mga12.intel.com ([192.55.52.136]:15583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n6tUU-0004qc-NI
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 07:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641816574; x=1673352574;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bAHGK9eNZdWd+9mTtbAvP5QK/8pqTMOjwvz9yiYjb1w=;
 b=GIfZTAoqJUzznMRGIJyMrYF3ampewmR2bL2TxBAPFxb44COtW4GRXopS
 jWUTf4yqRHnWp32R1g/6RDtqvT818F0oFFMC8502I1BPxhFu7HHCbqS03
 J5x1fAVQPmcFIhIyL/sFaw3e/2H/mtHgSIEWH01X6uLGLDklfxTVL4vYZ
 ni8qvOGSK6gv5PxwfyrWrojqGs1231G0k1kTdvcAvvbsSLW1YCqDmjHq9
 ZVCmgXbiaP6QLD/awAtLbhN7MI+eBRH4sZxeY+vjoCptIJyzpx9iPk0YG
 c0nS0XdRJZPcghuRl7gqzxkzPt5KIiNWFAHUe1c6G4hh296OOXJPgkdaK w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="223192648"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="223192648"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 04:09:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="528246363"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.249.174.157])
 ([10.249.174.157])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 04:09:28 -0800
Message-ID: <0771d5e3-c1b8-c3ad-3f3c-f117dfcc4d13@intel.com>
Date: Mon, 10 Jan 2022 20:09:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
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
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
 erdemaktas@google.com, pbonzini@redhat.com, Laszlo Ersek <lersek@redhat.com>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/2022 7:01 PM, Gerd Hoffmann wrote:
>>> If you go without pflash, then you likely will not have a
>>> standards-conformant UEFI variable store. (Unless you reimplement the
>>> variable arch protocols in edk2 on top of something else than the Fault
>>> Tolerant Write and Firmware Volume Block protocols.) Whether a
>>> conformant UEFI varstore matters to you (or to TDX in general) is
>>> something I can't comment on.
>>
>> Thanks for your reply! Laszlo
>>
>> regarding "standards-conformant UEFI variable store", I guess you mean the
>> change to UEFI non-volatile variables needs to be synced back to the
>> OVMF_VARS.fd file. right?
> 
> Yes.  UEFI variables are expected to be persistent, and syncing to
> OVMF_VARS.fd handles that.

Further question.

Is it achieved via read-only memslot that when UEFI variable gets 
changed, it exits to QEMU with KVM_EXIT_MMIO due to read-only memslot so 
QEMU can sync the change to OVMF_VAR.fd?

> Not fully sure whenever that expectation holds up in the CC world.  At
> least the AmdSev variant has just OVMF.fd, i.e. no CODE/VARS split.
> 
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
> take care,
>    Gerd
> 


