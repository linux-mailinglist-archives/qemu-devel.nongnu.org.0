Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 579AA4E229A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:56:43 +0100 (CET)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWDqD-0003vY-Uv
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:56:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWDoc-0003E8-Ih
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:55:02 -0400
Received: from mga06.intel.com ([134.134.136.31]:16668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWDoa-0006mf-77
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647852900; x=1679388900;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hh41s0fKyb5NLDLam98VzjysnItQcHpDQLFJXPyxjew=;
 b=FTa5kmZVnI9Xl3NupMPM2coqN6NvdkAYfM5/AHf1BWTYCAORX2wgr06j
 gLvA/QHxidVG7WsuVTkzuZAvNWMwLpALNY57sphbvSuBpV5b8DkWQCsMj
 NlAmvvCAPRuQzCFWh+q1QYWx8RyMMvSQjiesduxqguUHL0DTvkF1pYl9m
 o5ihQY2WiSc90ON5gQsFjhOjABv+20hdrj4/KFOEJIkgwzp/+0ielbcDo
 w/ei3rlGvgBOI2c6zkVVZYNO+AnJTqTojrsZgZd0z1aL2TOFonjihtpQQ
 4HJe2u13DM9M4RVZNAbIlcBV9y6jIEzXbj7OGo3DODpc/qOyURLZq7jG7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="318212746"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="318212746"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:54:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="500103014"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.249])
 ([10.255.28.249])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 01:54:53 -0700
Message-ID: <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
Date: Mon, 21 Mar 2022 16:54:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, qemu-devel@nongnu.org,
 erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/2022 10:07 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 17/3/22 14:58, Xiaoyao Li wrote:
>> TDX VM needs to boot with Trust Domain Virtual Firmware (TDVF). Unlike
>> that OVMF is mapped as rom device, TDVF needs to be mapped as private
>> memory. This is because TDX architecture doesn't provide read-only
>> capability for VMM, and it doesn't support instruction emulation due
>> to guest memory and registers are not accessible for VMM.
>>
>> On the other hand, OVMF can work as TDVF, which is usually configured
>> as pflash device in QEMU. To keep the same usage (QEMU parameter),
>> introduce ram_mode to pflash for TDVF. When it's creating a TDX VM,
>> ram_mode will be enabled automatically that map the firmware as RAM.
>>
>> Note, this implies two things:
>>   1. TDVF (OVMF) is not read-only (write-protected).
>>
>>   2. It doesn't support non-volatile UEFI variables as what pflash
>>      supports that the change to non-volatile UEFI variables won't get
>>      synced back to backend vars.fd file.
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   hw/block/pflash_cfi01.c | 25 ++++++++++++++++++-------
>>   hw/i386/pc_sysfw.c      | 14 +++++++++++---
>>   2 files changed, 29 insertions(+), 10 deletions(-)
> 
> If you don't need a pflash device, don't use it: simply map your nvram
> region as ram in your machine. No need to clutter the pflash model like
> that.

I know it's dirty to hack the pflash device. The purpose is to make the 
user interface unchanged that people can still use

	-drive if=pflash,format=raw,unit=0,file=/path/to/OVMF_CODE.fd
         -drive if=pflash,format=raw,unit=1,file=/path/to/OVMF_VARS.fd

to create TD guest.

I can go back to use generic loader[1] to load TDVF in v2.

[1] 
https://lore.kernel.org/qemu-devel/acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com/ 


> NAcked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 


