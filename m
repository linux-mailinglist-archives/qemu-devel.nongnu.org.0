Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2035A9AE3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:52:39 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlYY-0006qO-IK
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTlT6-0001ER-JQ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:46:56 -0400
Received: from mga01.intel.com ([192.55.52.88]:58942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oTlJ1-0007Ze-3k
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662042991; x=1693578991;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ktGPYfNA6db6xHQ+4uPDPGDhnlph/zXCKNK37wk/avg=;
 b=Cn9bWy17Et6KOpWskTaMAtLY7zv+DvfUbD43itiquIreEuIO3Clyn03Z
 ktEdXPzHajde5n9tiGkuSaFP4telqYRSpTF5Q6ocjDb/BLneCmjPtWSLI
 A0TwlNENLjelJw3D4AtydhaOz5Vdc4dIhjyzcgCKIq2qxhHyDEw1hIcAA
 RyGrIdMx3SlQSWxBfPrHxlQhQlGMKCgNgCw/glpJTqb8Jg71EwlnqgqKr
 plJtoMcEF2bt8/NCCCNvffs8omhsi/1Yr34DB6FviHlgEQWcI9qsIW4gu
 O8FGxA//CkYe0myYACbrvmuGXYs98uIbs1bfHof7b+XS097kDq4nsursd A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="321879390"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="321879390"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 07:36:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="754841985"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.114])
 ([10.255.28.114])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 07:36:22 -0700
Message-ID: <f7a56158-9920-e753-4d21-e1bcc3573e27@intel.com>
Date: Thu, 1 Sep 2022 22:36:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH 0/2] expose host-phys-bits to guest
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
References: <20220831125059.170032-1-kraxel@redhat.com>
 <957f0cc5-6887-3861-2b80-69a8c7cdd098@intel.com>
 <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220901135810.6dicz4grhz7ye2u7@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=192.55.52.88;
 envelope-from=xiaoyao.li@intel.com; helo=mga01.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=1, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/1/2022 9:58 PM, Gerd Hoffmann wrote:

>> Anyway, IMO, guest including guest firmware, should always consult from
>> CPUID leaf 0x80000008 for physical address length.
> 
> It simply can't for the reason outlined above.  Even if we fix qemu
> today that doesn't solve the problem for the firmware because we want
> backward compatibility with older qemu versions.  Thats why I want the
> extra bit which essentially says "CPUID leaf 0x80000008 actually works".

I don't understand how it backward compatible with older qemu version. 
Old QEMU won't set the extra bit you introduced in this series, and all 
the guest created with old QEMU will become untrusted on CPUID leaf 
0x80000008 ?

> take care,
>    Gerd
> 


