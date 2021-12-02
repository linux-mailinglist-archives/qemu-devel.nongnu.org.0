Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B858646600A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 09:58:00 +0100 (CET)
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mshuh-0005Yk-RA
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 03:57:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1msht3-0004dS-H7
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 03:56:17 -0500
Received: from mga14.intel.com ([192.55.52.115]:48063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1msht0-0000eB-7G
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 03:56:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236892303"
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; d="scan'208";a="236892303"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 00:56:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,281,1631602800"; d="scan'208";a="513105132"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.31.236])
 ([10.255.31.236])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 00:56:05 -0800
Message-ID: <ee4934e1-e1e6-68dd-df67-424783c0f812@intel.com>
Date: Thu, 2 Dec 2021 16:56:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [RFC PATCH v2 11/44] i386/tdx: Implement user specified tsc
 frequency
Content-Language: en-US
To: Connor Kuehl <ckuehl@redhat.com>, isaku.yamahata@gmail.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 erdemaktas@google.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <564e6ae089c30aaba9443294ecca72da9ee7b7c4.1625704981.git.isaku.yamahata@intel.com>
 <42187f1c-26b5-b039-8fcf-f9268129feb8@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <42187f1c-26b5-b039-8fcf-f9268129feb8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=xiaoyao.li@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.627,
 HK_RANDOM_FROM=0.998, NICE_REPLY_A=-3.3, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/2021 1:53 AM, Connor Kuehl wrote:
> On 7/7/21 7:54 PM, isaku.yamahata@gmail.com wrote:
>> From: Xiaoyao Li <xiaoyao.li@intel.com>
>>
>> Reuse -cpu,tsc-frequency= to get user wanted tsc frequency and pass it
>> to KVM_TDX_INIT_VM.
>>
>> Besides, sanity check the tsc frequency to be in the legal range and
>> legal granularity (required by SEAM module).
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> ---
>> [..]
>> +    if (env->tsc_khz && (env->tsc_khz < TDX1_MIN_TSC_FREQUENCY_KHZ ||
>> +                         env->tsc_khz > TDX1_MAX_TSC_FREQUENCY_KHZ)) {
>> +        error_report("Invalid TSC %ld KHz, must specify cpu_frequecy 
>> between [%d, %d] kHz\n",
> 
> s/frequecy/frequency

will fix it, thanks!

>> +                      env->tsc_khz, TDX1_MIN_TSC_FREQUENCY_KHZ,
>> +                      TDX1_MAX_TSC_FREQUENCY_KHZ);
>> +        exit(1);
>> +    }
>> +
>> +    if (env->tsc_khz % (25 * 1000)) {
>> +        error_report("Invalid TSC %ld KHz, it must be multiple of 
>> 25MHz\n", env->tsc_khz);
> 
> Should this be 25KHz instead of 25MHz?

No. It equals to

	(evn->tsc_khz * 1000) % (25 * 1000 * 1000)





