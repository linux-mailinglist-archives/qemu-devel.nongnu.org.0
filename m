Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DB5A1115
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:52:18 +0200 (CEST)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCLJ-0000Zn-R8
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oRCE9-0003uH-W9
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:44:54 -0400
Received: from mga03.intel.com ([134.134.136.65]:10475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oRCE7-0001Vi-3R
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661431491; x=1692967491;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j2Ya427lxj0NqFGjYYioE6S+hxmpBGrcOkVCVJDXqkA=;
 b=VYODAq2u4nSg7uKxeYf5OkZaUQWLXSrI5Yg+Oj6RnMCKHI28/Y1Ksse/
 T9XMTxrVszNi8wRil/5u2DXNwKgzyoulB8Jcwksqy//NFi+TFtY90H89o
 KjbgovnskPkjtr48e8o4E4b2frxK10tURimA/9OKOv+uo+8FMcisSzoF5
 CX5HpkcGgeo9hACuRgTkSEfC9ZBse1e0lZGK2byPSuv4Lo7XGBUbqcBFk
 LAcUIn8cwqkGtuelOJqYiox0Lr0ffsn7/goE+zwDkiZIa8D3RJQFV7Jq8
 5xIxlpOAMIeT1Nd9NCYfzZwTfckJW3HPAw7H3gwUOTxhCJunR7m1gfFYW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295506653"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="295506653"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 05:44:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; d="scan'208";a="670964154"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.29.55])
 ([10.255.29.55])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 05:44:41 -0700
Message-ID: <146cad27-e263-7882-6469-981f5166f42c@intel.com>
Date: Thu, 25 Aug 2022 20:44:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v1 08/40] i386/tdx: Adjust the supported CPUID based on
 TDX restrictions
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
 <20220802074750.2581308-9-xiaoyao.li@intel.com>
 <20220825112647.xmtvkoiffyk7aigr@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220825112647.xmtvkoiffyk7aigr@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=xiaoyao.li@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/25/2022 7:26 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> between VMM and TDs. Adjust supported CPUID for TDs based on TDX
>> restrictions.
> 
> Automatic adjustment depending on hardware capabilities isn't going to
> fly long-term, you'll run into compatibility problems sooner or later,
> for example when different hardware with diverging capabilities (first
> vs. second TDX generation) leads to different CPUID capsets in a
> otherwise identical configuration.
> 
> Verification should happen of course, but I think qemu should just throw
> an error in case the tdx can't support a given cpu configuration.

I think you misunderstand this patch.

It's to adjust the supported feature set of the platform, not the 
feature set of the given VM/TD. I.e, the adjusted supported feature set 
will be used to *verify* the VM's setting that specified by user. Of 
course, if user requires unsupported feature, QEMU will throw an error.

> (see also Daniels reply to the cover letter).
> 
> take care,
>    Gerd
> 


