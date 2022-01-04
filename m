Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB86484221
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:11:00 +0100 (CET)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jad-0006ex-GI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:10:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n4jYO-0005CW-Po
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:08:40 -0500
Received: from mga09.intel.com ([134.134.136.24]:25137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1n4jYL-0006QT-Mr
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641301717; x=1672837717;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eTosNZWN1zAzfnx/zcKL1qsuRrbXMmlQcyS8hm7dCaw=;
 b=ds9fiuQSjptRa7Nm9owqMyc1bgYkZCHr1/ITT1yudhBLEC7P41kn1ugk
 3m/0BeYAgn1SVXOr7RRlnw82Ck14n21aHQH1JL75bjxa97E0OjwrfIfMp
 p2IOYmaD/D1MB29yJQaXzZGEoI3+7k1th2PyN5sZZRbtn9AmDvArqamch
 MtCSHlghboOThdOSc6iKRdVJI1HKkSl43VjGqcwbPCA5NMP1LPoWOm+dJ
 U5VbSC+Fi8d6E8PYueQB7HBjrh780qI7IOxUOCM1fZ5YiQt6NQZ0uvUK+
 GhX7cBcVb4r1GYadvUY3azQE84lKgOVav8+9XmHDOD+qaczddYwBc/TLT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242015974"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="242015974"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 05:08:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="472058377"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.30.18])
 ([10.255.30.18])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 05:08:31 -0800
Message-ID: <a97a75ad-9d1c-a09f-281b-d6b0a7652e78@intel.com>
Date: Tue, 4 Jan 2022 21:08:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, isaku.yamahata@gmail.com,
 Laszlo Ersek <lersek@redhat.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
 <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=xiaoyao.li@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/26/2021 7:18 PM, Gerd Hoffmann wrote:
>> +int load_tdvf(const char *filename)
>> +{
> 
>> +    for_each_fw_entry(fw, entry) {
>> +        if (entry->address < x86ms->below_4g_mem_size ||
>> +            entry->address > 4 * GiB) {
>> +            tdvf_init_ram_memory(ms, entry);
>> +        } else {
>> +            tdvf_init_bios_memory(fd, filename, entry);
>> +        }
>> +    }
> 
> Why there are two different ways to load the firmware?

because there are two different parts in TDVF:
  a) one is firmware volume (BFV and CFV, i.e., OVMF_CODE.fd and 
OVMF_VAR.fd). Those are ROMs;

  b) the other is some RAM regions, e.g., temp memory for BFV early 
running and TD HOB to pass info to TDVF; Those are RAMs which is already 
added to TDX VM;

> Also: why is all this firmware volume parsing needed?  The normal ovmf
> firmware can simply be mapped just below 4G, why can't tdvf work the
> same way?

Ideally, the firmware (part a above) can be mapped just below 4G like 
what we do for OVMF.

But it needs additional when map part a) to parse the metadata and get 
location of part b) and initialize the RAM of part b). Yes, the 
additional work can be added in existing OVMF laoding flow as pflash.


+ Laszlo,

Regarding laoding TDVF as pflash, I have some questions:

- pflash requires KVM to support readonly mmeory. However, for TDX, it 
doesn't support readonly memory. Is it a must? or we can make an 
exception for TDX?

- I saw from 
https://lists.gnu.org/archive/html/qemu-discuss/2018-04/msg00045.html, 
you said when load OVMF as pflash, it's MMIO. But for TDVF, it's treated 
as private memory. I'm not sure whether it will cause some potential 
problem if loading TDVF with pflash.

Anyway I tried changing the existing pflash approach to load TDVF. It 
can boot a TDX VM and no issue.

> thanks,
>    Gerd
> 


