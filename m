Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D347D534919
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 04:57:23 +0200 (CEST)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu3gg-0005NQ-Mz
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 22:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu3e9-0003l4-56
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:54:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:15224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu3e6-0003Gg-Gv
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653533682; x=1685069682;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ACUvpAw4fP8n3H8/+ddBfvDqIhHF+X4k+5/2EXHVwn8=;
 b=Ka+pj1LMep533grvMLrIMzCDQuw2gkIkFe9VDrlwEaROx+28xkMZcelm
 m49o3Ii49THkSITEJj6DF/iHcqb2P/ja7EVp3I+3Xoqa1WfMz6hm6WTNd
 0PJGeGHHvsirQOC3PPwepdnR3isqx7SZSY6cy1zoCoG6HhqdiKX0/gKhg
 gyzc6bMPuMZ1ZUkgI6iDQOQmAC9HLO+A29HhcL1emLiDOUkArjIHOtuoX
 vlEqVqzy8fV7ND55YWtlCXH5mcZnEZLOXhDNAL/XKOTvo65Tlz9WUugg3
 vsFbmADALn4dxODoFEAGG0hPQCLq1TEQfSTIh6riyiqQFyyhPy9evr/y1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="271580061"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="271580061"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 19:49:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="573640580"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.212])
 ([10.255.28.212])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 19:48:58 -0700
Message-ID: <b294af31-fe92-f251-5d3e-0e439a59ee1e@intel.com>
Date: Thu, 26 May 2022 10:48:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 18/36] i386/tdx: Skip BIOS shadowing setup
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
 <20220512031803.3315890-19-xiaoyao.li@intel.com>
 <20220524070804.tcrsg7cwlnbkzhjz@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220524070804.tcrsg7cwlnbkzhjz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
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

On 5/24/2022 3:08 PM, Gerd Hoffmann wrote:
> On Thu, May 12, 2022 at 11:17:45AM +0800, Xiaoyao Li wrote:
>> TDX guest cannot go to real mode, so just skip the setup of isa-bios.
> 
> Does isa-bios setup cause any actual problems?
> (same question for patch #19).

It causes mem_region split and mem_slot deletion on KVM.

TDVF marks pages starting from 0x800000 as TEMP_MEM and TD_HOB, which 
are TD's private memory and are TDH_MEM_PAGE_ADD'ed to TD via 
KVM_TDX_INIT_MEM_REGION

However, if isa-bios and pc.rom are not skipped, the memory_region 
initialization of them is after KVM_TDX_INIT_MEM_REGION in 
tdx_machine_done_notify(). (I didn't figure out why this order though)

And the it causes memory region split that splits
	[0, ram_below_4g)
to
	[0, 0xc0 000),
	[0xc0 000, 0xe0 000),
	[0xe0 000, 0x100 000),
	[0x100 000, ram_below_4g)

which causes mem_slot deletion on KVM. On KVM side, we lose the page 
content when mem_slot deletion. Thus, the we lose the content of TD HOB.

Yes, the better solution seems to be ensure KVM_TDX_INIT_MEM_REGION is 
called after all the mem region is settled down. But I haven't figured 
out the reason why the isa-bios and pc.rom initialization happens after
machine_init_done_notifier

on the other hand, to keep isa-bios and pc.rom, we need additional work 
to copy the content from the end_of_4G to end_of_1M.

I'm not sure if isa-bios and pc.rom are needed from people on TD guest, 
so I just skip them for simplicity,

> "is not needed" IMHO isn't a good enough reason to special-case tdx
> here.
> 
> take care,
>    Gerd
> 


