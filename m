Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE82535BC1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 10:44:04 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuVZj-0005iW-66
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 04:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nuVVj-0003Yq-EY
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:39:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:43913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nuVVh-0003Xa-Ey
 for qemu-devel@nongnu.org; Fri, 27 May 2022 04:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653640793; x=1685176793;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bjyDl6kDQro5FK/KVrzr1mqiYtjFN8A1wcFN6EwTDb0=;
 b=IJUKImObZcLxUeX+DvQfRD5iWtRXyoMWVD4OTL1D/3d/bWu533quCsio
 as7K+z4C+b3Tv4wmkf/pyc9ZzxSTtEXddZ6Ss6IR4Ka2ftGEkoI9mjsAa
 qo9ctey1ptmZkxdrnDIUBrUTUbWHJbyOhM0nRGSAx2IFW/qIW/ese5hOz
 45BDDzmERfFJeo6q+4UM04JfcrU71o09eOujUE/5OsJgLiLBqEbJVyckT
 LXDn3+MbUieHoueYgC6Dd35YLX9bUKX2bfiIdtW5Ct8Ti6n2ODK2AII7G
 4qrbf/Ws3uggZGzuTgcqEstHnu0Um1BNakNDaz7/hkdjOCpmMet9M+uDg g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="254297779"
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="254297779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 01:39:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,254,1647327600"; d="scan'208";a="574449080"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.41])
 ([10.255.28.41])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2022 01:39:47 -0700
Message-ID: <fa75cda1-311d-dcd7-965d-c553700c5303@intel.com>
Date: Fri, 27 May 2022 16:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 22/36] i386/tdx: Track RAM entries for TDX VM
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 isaku.yamahata@intel.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-23-xiaoyao.li@intel.com>
 <20220524073729.xkk6s4tjkzm77wwz@sirius.home.kraxel.org>
 <5e457e0b-dc23-9e5b-de89-0b137e2baf7f@intel.com>
 <20220526184826.GA3413287@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220526184826.GA3413287@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 5/27/2022 2:48 AM, Isaku Yamahata wrote:
> On Thu, May 26, 2022 at 03:33:10PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> On 5/24/2022 3:37 PM, Gerd Hoffmann wrote:
>>> I think all this can be simplified, by
>>>     (1) Change the existing entry to cover the accepted ram range.
>>>     (2) If there is room before the accepted ram range add a
>>>         TDX_RAM_UNACCEPTED entry for that.
>>>     (3) If there is room after the accepted ram range add a
>>>         TDX_RAM_UNACCEPTED entry for that.
>>
>> I implement as below. Please help review.
>>
>> +static int tdx_accept_ram_range(uint64_t address, uint64_t length)
>> +{
>> +    uint64_t head_start, tail_start, head_length, tail_length;
>> +    uint64_t tmp_address, tmp_length;
>> +    TdxRamEntry *e;
>> +    int i;
>> +
>> +    for (i = 0; i < tdx_guest->nr_ram_entries; i++) {
>> +        e = &tdx_guest->ram_entries[i];
>> +
>> +        if (address + length < e->address ||
>> +            e->address + e->length < address) {
>> +                continue;
>> +        }
>> +
>> +        /*
>> +         * The to-be-accepted ram range must be fully contained by one
>> +         * RAM entries
>> +         */
>> +        if (e->address > address ||
>> +            e->address + e->length < address + length) {
>> +            return -EINVAL;
>> +        }
>> +
>> +        if (e->type == TDX_RAM_ADDED) {
>> +            return -EINVAL;
>> +        }
>> +
>> +        tmp_address = e->address;
>> +        tmp_length = e->length;
>> +
>> +        e->address = address;
>> +        e->length = length;
>> +        e->type = TDX_RAM_ADDED;
>> +
>> +        head_length = address - tmp_address;
>> +        if (head_length > 0) {
>> +            head_start = e->address;
>> +            tdx_add_ram_entry(head_start, head_length, TDX_RAM_UNACCEPTED);
> 
> tdx_add_ram_entry() increments tdx_guest->nr_ram_entries.  I think it's worth
> for comments why this is safe regarding to this for-loop.

The for-loop is to find the valid existing RAM entry (from E820 table).
It will update the RAM entry and increment tdx_guest->nr_ram_entries 
when the initial RAM entry needs to be split. However, once find, the 
for-loop is certainly stopped since it returns unconditionally.


