Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A723F805E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 04:18:17 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ4y7-0004mW-Nu
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 22:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mJ4wZ-00044b-AS
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 22:16:39 -0400
Received: from mga18.intel.com ([134.134.136.126]:1512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mJ4wW-00080g-Az
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 22:16:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204785239"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="204785239"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 19:16:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="494884155"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.239.13.122])
 ([10.239.13.122])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 19:16:28 -0700
Subject: Re: Live migration regarding Intel PT
To: Eduardo Habkost <ehabkost@redhat.com>
References: <e31344c9-e9e6-7d78-3a53-2c0e5e5f39d7@intel.com>
 <20210825204813.tfhrj3dg2vlqxm4u@habkost.net>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <3d098ac3-e757-a26f-8bf8-e74e711ca09e@intel.com>
Date: Thu, 26 Aug 2021 10:16:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825204813.tfhrj3dg2vlqxm4u@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.89,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/2021 4:48 AM, Eduardo Habkost wrote:
> On Wed, Aug 25, 2021 at 02:59:37PM +0800, Xiaoyao Li wrote:
>> Hi Eduardo,
>>
>> I have some question regrading Intel PT live migration.
>>
>> Commit "e37a5c7fa459 (i386: Add Intel Processor Trace feature support)"
>> expose Intel PT with a fixed capabilities of CPUID 0x14 for live migration.
>> And the fixed capabilities are the value reported on ICX(IceLake). However,
>> the upcoming SPR(Sapphire Rapids) has less capabilities of
>> INTEL_PT_CYCLE_BITMAP than ICX. It fails to enable PT in guest on SPR
>> machine.
>>
>> If change the check on INTEL_PT_CYCLE_BITMAP to allow different value to
>> allow it work on SPR. I think it breaks live migration, right?
> 
> If I understand your description correctly, I don't think that
> would break live migration.
> 
> Generating different CPUID data for the same CPU model+flags
> would break live migration.
> 
> However, merely allowing a wider set of configurations to work
> wouldn't break live migration, as long as the same CPU
> model+flags generates the same CPUID data on any host.

The easy fix in my brain to make PT work on SPR guest surely will lead 
to different CPUID data between ICX and SPR. That's why I wrote the email.

Other questions about live migration. I think a named CPU model is the 
pre-condition for live migration, right?

Then is "same QEMU version/binary" the pre-condition for live migration 
as well?

> 
>>
>> For me, not making each sub-function of PT as configurable in QEMU indeed
>> makes it hard for live migration. [...]
> 
> Making all sub-functions of PT configurable would be welcome.
> actually.  That would allow us to support a wider range of
> configurations and keep live migration working at the same time.

I think it will break old QEMU? Is it OK?

> 
>> [...] Why not make PT as unmigratable in the
>> first place when introducing the support in QEMU?
> 
> I don't know, this was not my decision.  Now we support live
> migration in a few specific cases (ICX hosts), and I assume we
> don't want to stop supporting it.
> 
> If you just want to support a larger set of hosts when live
> migration is not needed, you can add support to that use case
> too.  e.g.: "-cpu host,migratable=off" and/or
> "-cpu ...,intel-pt-passthrough=on" could do host passthrough of
> intel-pt sub-leaves (and block live migration).
> 

That will make things complicated that old use case "-cpu ...,+intel-pt" 
still means supporting live migration. And when use "-cpu 
...,+intel-pt", QEMU needs to generate fixed PT capability as previous?


