Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60535A15EC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:39:14 +0200 (CEST)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREwr-0002Xc-B1
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oREtQ-0007hT-SL
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:35:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:42207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oREtN-0007C7-5r
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661441737; x=1692977737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ALe3W9UVzuJwVIm95wO5987ELsrUxm8mx+BiX6s41OY=;
 b=c660WJtk6RA/MSp+MjVajgoTmeigHQJ2fCQUkn2fMyJ6o7UT9dUAeW7Y
 AoBUFz3pt20wBy+ysY0qlKp1vyiIh15IlVMcceUiWuMtEyBE5ZpuvvIYj
 K95tb/Efp3yv5+SM9ZkRwS1S5aVH21uaEmSWPnJyvd0xy4a2eMWo00JZs
 y5X0AiDdukd4y05lBfnv6vblrSMqEFC+FiM4utiaVZdfuXTTIc/XBLI1v
 JfMY4whjhpOlo1BG5u1wKJRB2S/9sCtAqUSFnU7Dh2NyLKMgsgyuF8Y9X
 4Zc2fzXfQr03dy/UjUwdaO+ihbAl313OxPH7AdeyPXapkajgw38q3yc7F w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="291846671"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="291846671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 08:35:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="671034879"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.55])
 ([10.255.29.55])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 08:35:02 -0700
Message-ID: <00b93d50-ca34-a3e1-6a32-48cf93edfa88@intel.com>
Date: Thu, 25 Aug 2022 23:35:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v1 06/40] i386/tdx: Get tdx_capabilities via
 KVM_TDX_CAPABILITIES
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <20220802074750.2581308-7-xiaoyao.li@intel.com>
 <20220825101203.vpgwzbyqc677snjt@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220825101203.vpgwzbyqc677snjt@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/25/2022 6:12 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> +        r = tdx_platform_ioctl(KVM_TDX_CAPABILITIES, 0, caps);
>> +        if (r == -E2BIG) {
>> +            g_free(caps);
>> +            nr_cpuid_configs *= 2;
>> +            if (nr_cpuid_configs > KVM_MAX_CPUID_ENTRIES) {
>> +                error_report("KVM TDX seems broken");
> 
> Maybe, but IMHO this should still report what exactly the problem is
> (number of cpuid entries exceeds limit).

Will update it to

	error_report(KVM TDX seems broken that number of CPUID entries in 
kvm_tdx_capabilities exceeds limit)

> take care,
>    Gerd
> 
> 


