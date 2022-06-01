Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6432539E1F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 09:22:35 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwIgc-0005Kf-NK
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 03:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nwIf7-0004ZV-0j
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:21:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:56255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nwIf4-0004yJ-4R
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654068058; x=1685604058;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l+XiHh7anBduFpnJiS88+SjvrMYYjtp3avkrqqQLOEw=;
 b=I5G7ooQ7ZPoKcKeeF8ks74JKomTgI82a2PZtJGuPJjx2DRq0go4b9s2P
 faOpL2q1hzqFH0FkRpwMsjoq8ScIc8AbfN6LigVYYkTuCNeYm9Z7uCd5Q
 M5SivGI/KD3GDUc/JV1iSQ4vVf4E2K9vHSGSupp9uOz1xvk0NedHsPruk
 3TkiS6jkf51VUTaDQgbzBQNp6r42O07H7CdBlej9+eloFBngePetRhsLw
 1drsKFq2qw+GInnG5LQ/DanIhoXohT44WVwQeIcSZty8eMyfKFfQApETW
 sgCibxQMsV0NxMBr5SuVAAzmq+DNXP33u/N7PboWAprtyO0ZS16yFtmmu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="274302568"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="274302568"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 00:20:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="576804072"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.172.148])
 ([10.249.172.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 00:20:48 -0700
Message-ID: <39341481-67b6-aba4-a25a-10abb398bec4@intel.com>
Date: Wed, 1 Jun 2022 15:20:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 11/36] i386/tdx: Initialize TDX before creating TD
 vcpus
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-12-xiaoyao.li@intel.com>
 <20220523092003.lm4vzfpfh4ezfcmy@sirius.home.kraxel.org>
 <d3e967f3-917f-27ce-1367-2dba23e5c241@intel.com>
 <20220524065719.wyyoba2ke73tx3nc@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220524065719.wyyoba2ke73tx3nc@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=xiaoyao.li@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
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

On 5/24/2022 2:57 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>>> Hmm, hooking *vm* initialization into *vcpu* creation looks wrong to me.
>>
>> That's because for TDX, it has to do VM-scope (feature) initialization
>> before creating vcpu. This is new to KVM and QEMU, that every feature is
>> vcpu-scope and configured per-vcpu before.
>>
>> To minimize the change to QEMU, we want to utilize @cpu and @cpu->env to
>> grab the configuration info. That's why it goes this way.
>>
>> Do you have any better idea on it?
> 
> Maybe it's a bit more work to add VM-scope initialization support to
> qemu.  

If just introducing VM-scope initialization to QEMU, it would be easy. 
What matters is what needs to be done inside VM-scope initialization.

For TDX, we need to settle down the features that configured for the TD. 
Typically, the features are attributes of cpu object, parsed from "-cpu" 
option and stored in cpu object.

I cannot think up a clean solution for it, other than
1) implement the same attributes from cpu object to machine object, or
2) create a CPU object when initializing machine object and collect all 
the info from "-cpu" and drop it in the end; then why not do it when 
creating 1st vcpu like this patch.

That's what I can think up. Let's see if anyone has better idea.

> But I expect that approach will work better long-term.  You need
> this mutex and the 'initialized' variable in your code to make sure it
> runs only once because the way you hook it in is not ideal ...
> 
> [ disclaimer: I'm not that familiar with the kvm interface in qemu ]
> 
> take care,
>    Gerd
> 


