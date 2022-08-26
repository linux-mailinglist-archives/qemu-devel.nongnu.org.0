Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C05A1F9F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 06:05:57 +0200 (CEST)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRQbO-0007ka-C9
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 00:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oRQW4-0005XF-EM
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 00:00:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:41165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oRQVz-0004Uf-Nh
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 00:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661486415; x=1693022415;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LYpXOeGCv0D8LEuZ5rlYMSsbSL41VeqEWm/6QNHip1A=;
 b=iTWRWN+YJkU+6APC36Oa+aUnDfBjQr6NoKKcC1AYNcRsPD6K4cee4fjS
 /2gmUlX7ig2dlXYN1EWp+Mb+gv9NFxJf58dLNKBauy3e+HYbdMbQCmAoe
 f3zD6dITKyhl7kVFCkZMXe6hVm+q3lD4MBgqmJldqg0rxQS26ef/iU3kQ
 c2PAFT7mTVE1ZVYDLIoDiqxmjHjtuQUgjyHZrYF0f0HFpF1VR5XnY3v8H
 GsNQBSm2Ae1WDlStxOM9/0rdj4xLwrXGxA2GfLm7MqfJFdj9F4s1eTpRk
 orHRqRtvhgqMVwoKB99ffIoLKrbDeGMgltnz2xnXl6A8bYdraciqXkcIw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="277430479"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="277430479"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 21:00:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="671294986"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.246])
 ([10.255.29.246])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 21:00:09 -0700
Message-ID: <45f5c26a-4ed6-3364-304e-b91060dd608a@intel.com>
Date: Fri, 26 Aug 2022 12:00:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v1 08/40] i386/tdx: Adjust the supported CPUID based on
 TDX restrictions
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <20220802074750.2581308-9-xiaoyao.li@intel.com>
 <200d5aa2-f1e3-2b8b-7963-e605f9a5731e@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <200d5aa2-f1e3-2b8b-7963-e605f9a5731e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/3/2022 3:33 PM, Chenyi Qiang wrote:
> 
> 
> On 8/2/2022 3:47 PM, Xiaoyao Li wrote:
>> According to Chapter "CPUID Virtualization" in TDX module spec, CPUID
>> bits of TD can be classified into 6 types:
>>
>> ------------------------------------------------------------------------
>> 1 | As configured | configurable by VMM, independent of native value;
>> ------------------------------------------------------------------------
>> 2 | As configured | configurable by VMM if the bit is supported natively
>>      (if native)   | Otherwise it equals as native(0).
>> ------------------------------------------------------------------------
>> 3 | Fixed         | fixed to 0/1
>> ------------------------------------------------------------------------
>> 4 | Native        | reflect the native value
>> ------------------------------------------------------------------------
>> 5 | Calculated    | calculated by TDX module.
>> ------------------------------------------------------------------------
>> 6 | Inducing #VE  | get #VE exception
>> ------------------------------------------------------------------------
>>
>> Note:
>> 1. All the configurable XFAM related features and TD attributes related
>>     features fall into type #2. And fixed0/1 bits of XFAM and TD
>>     attributes fall into type #3.
>>
>> 2. For CPUID leaves not listed in "CPUID virtualization Overview" table
>>     in TDX module spec. When they are queried, TDX module injects #VE to
>>     TDs. For this case, TDs can request CPUID emulation from VMM via
>>     TDVMCALL and the values are fully controlled by VMM.
>>
>> Due to TDX module has its own virtualization policy on CPUID bits, it 
>> leads
>> to what reported via KVM_GET_SUPPORTED_CPUID diverges from the supported
>> CPUID bits for TDS. In order to keep a consistent CPUID configuration
>> between VMM and TDs. Adjust supported CPUID for TDs based on TDX
>> restrictions.
>>
>> Currently only focus on the CPUID leaves recognized by QEMU's
>> feature_word_info[] that are indexed by a FeatureWord.
>>
>> Introduce a TDX CPUID lookup table, which maintains 1 entry for each
>> FeatureWord. Each entry has below fields:
>>
>>   - tdx_fixed0/1: The bits that are fixed as 0/1;
>>
>>   - vmm_fixup:   The bits that are configurable from the view of TDX 
>> module.
>>                  But they requires emulation of VMM when they are 
>> configured
>>             as enabled. For those, they are not supported if VMM doesn't
>>         report them as supported. So they need be fixed up by
>>         checking if VMM supports them.
>>
>>   - inducing_ve: TD gets #VE when querying this CPUID leaf. The result is
>>                  totally configurable by VMM.
>>
>>   - supported_on_ve: It's valid only when @inducing_ve is true. It 
>> represents
>>             the maximum feature set supported that be emulated
>>             for TDs.
>>
>> By applying TDX CPUID lookup table and TDX capabilities reported from
>> TDX module, the supported CPUID for TDs can be obtained from following
>> steps:
>>
>> - get the base of VMM supported feature set;
>>
>> - if the leaf is not a FeatureWord just return VMM's value without
>>    modification;
>>
>> - if the leaf is an inducing_ve type, applying supported_on_ve mask and
>>    return;
>>
>> - include all native bits, it covers type #2, #4, and parts of type #1.
>>    (it also includes some unsupported bits. The following step will
>>     correct it.)
>>
>> - apply fixed0/1 to it (it covers #3, and rectifies the previous step);
>>
>> - add configurable bits (it covers the other part of type #1);
>>
>> - fix the ones in vmm_fixup;
>>
>> - filter the one has valid .supported field;
> 
> What does .supported field filter mean here?
> 

Sorry I missed this comment before.

Above statement is the leftover during internal development. It needs to 
be removed actually.

