Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F84E2087
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:15:41 +0100 (CET)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWBKJ-0000Xj-D9
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:15:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBDP-0006bR-9G
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:08:27 -0400
Received: from mga01.intel.com ([192.55.52.88]:11093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nWBDM-0002PE-RY
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647842904; x=1679378904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gk3r9H77ctg1IpRHX33yDmxGf6+MwoJQhtFLQ7e4Uuw=;
 b=JX5K3+S7fUCDBCcuv05AEVvL2roLsxhSiG2VgP6Epp8C7Nuhm1BJIVpD
 Md5npaMWkySwHe7jV0UwDl8MLWklwo+W9E9Gg8TUKETPceGAoRIMjiVqS
 QWZN4vfGB5rXL+rnFk/le9nCBAV4JEkK0G/91CoJJh/xYeCoK+b7Jr+/x
 doe5SRz+ymGOM+6Xq5wDI9Aa9CdOGULvXevHPRNygA5sK3BYUFl25oAqj
 04Z+rBU4KC6SHyyDDytZ16r8neIyc6tmyNRMccZasPip3xBHZ2AhEOWnv
 KiI26luBtjxImLPrhAXE/fzsElIutGUgKzyvoHijGkvF7mw+rDtopRKtH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="282301317"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="282301317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:08:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; d="scan'208";a="559719245"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.169.245])
 ([10.249.169.245])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2022 23:08:17 -0700
Message-ID: <784e854a-09ca-883a-509a-dd196bb3f7d6@intel.com>
Date: Mon, 21 Mar 2022 14:08:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 33/36] i386/tdx: Only configure MSR_IA32_UCODE_REV
 in kvm_init_msrs() for TDs
Content-Language: en-US
To: Isaku Yamahata <isaku.yamahata@gmail.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-34-xiaoyao.li@intel.com>
 <20220318173120.GB4050087@ls.amr.corp.intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220318173120.GB4050087@ls.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=xiaoyao.li@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 "Daniel P. Berrang???" <berrange@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daud??? <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/2022 1:31 AM, Isaku Yamahata wrote:
> On Thu, Mar 17, 2022 at 09:59:10PM +0800,
> Xiaoyao Li <xiaoyao.li@intel.com> wrote:
> 
>> For TDs, only MSR_IA32_UCODE_REV in kvm_init_msrs() can be configured
>> by VMM, while the features enumerated/controlled by other MSRs except
>> MSR_IA32_UCODE_REV in kvm_init_msrs() are not under control of VMM.
>>
>> Only configure MSR_IA32_UCODE_REV for TDs.
> 
> non-TDs?

No. It meant exactly TDs.

Only MSR_IA32_UCODE_REV is supported to be emulated by VMM for TDs.

