Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D75389D8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 04:12:14 +0200 (CEST)
Received: from localhost ([::1]:35460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvrMi-00049A-Qm
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 22:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nvrKi-0003Mz-Qh
 for qemu-devel@nongnu.org; Mon, 30 May 2022 22:10:11 -0400
Received: from mga18.intel.com ([134.134.136.126]:64666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nvrKf-0002bR-2j
 for qemu-devel@nongnu.org; Mon, 30 May 2022 22:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653963005; x=1685499005;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q0KO5pJ9qEbsF4xl8KTu6ajUChQfGULarXFR8H9GAvU=;
 b=BywHZ4xcV+11hodYI4PWGMMIbX75/K0VMbiOoMGPIv84vh3jGTbqlAyn
 5oOkOZE9GyGs4TOW/xnR15DEp6dUYEHCdpHqJNsxg5+Q0vY93B/oKNhrw
 G1YHoh28yCdMcC6j0hRt69AhvafPHZT6/M0jaB7vZR2tj+0Ax0ze6N7T1
 /zfQwB4pQD/pPaIgNAWv/9V538J3HSqKd76IXYKdVHjWlwlueFBXLTaar
 LvK/GP0rozSa1dxwF8gYxfprsSt2iusr+DoHFQ8I0yhxWrjSmJyF7/8bE
 BPdrExHkpm8cZGntBIfaM85nCp26W5N6O3InyKxTKNVqeWKEq9rDYgc/m A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="257179119"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="257179119"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 19:09:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="753560675"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.170.26])
 ([10.249.170.26])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 19:09:51 -0700
Message-ID: <b34bfd43-16ce-74d0-5104-6972f4977a45@intel.com>
Date: Tue, 31 May 2022 10:09:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 22/36] i386/tdx: Track RAM entries for TDX VM
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Isaku Yamahata <isaku.yamahata@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, isaku.yamahata@intel.com,
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
 <20220512031803.3315890-23-xiaoyao.li@intel.com>
 <20220524073729.xkk6s4tjkzm77wwz@sirius.home.kraxel.org>
 <5e457e0b-dc23-9e5b-de89-0b137e2baf7f@intel.com>
 <20220526184826.GA3413287@ls.amr.corp.intel.com>
 <fa75cda1-311d-dcd7-965d-c553700c5303@intel.com>
 <20220530115908.lcb6xegu4arfsqux@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220530115908.lcb6xegu4arfsqux@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=xiaoyao.li@intel.com; helo=mga18.intel.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
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

On 5/30/2022 7:59 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>>> tdx_add_ram_entry() increments tdx_guest->nr_ram_entries.  I think it's worth
>>> for comments why this is safe regarding to this for-loop.
>>
>> The for-loop is to find the valid existing RAM entry (from E820 table).
>> It will update the RAM entry and increment tdx_guest->nr_ram_entries when
>> the initial RAM entry needs to be split. However, once find, the for-loop is
>> certainly stopped since it returns unconditionally.
> 
> Add a comment saying so would be good.
> 
> Or move the code block doing the update out of the loop.  That will
> likewise make clear that finding the entry which must be updated is
> the only purpose of the loop.

Good idea. I'll go this way.

> take care,
>    Gerd
> 


