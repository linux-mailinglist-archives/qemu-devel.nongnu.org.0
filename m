Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509135348E1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 04:28:13 +0200 (CEST)
Received: from localhost ([::1]:60216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu3ES-0001zr-1M
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 22:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu3C4-0001E3-Q2
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:25:45 -0400
Received: from mga11.intel.com ([192.55.52.93]:13287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nu3C2-00082r-2z
 for qemu-devel@nongnu.org; Wed, 25 May 2022 22:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653531942; x=1685067942;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sv7dvPzxgZU2loEhA73w1Vns5XlLncRcMXnvraJptVQ=;
 b=BjyyfrEqt5Sr3PxN5xmjfSR9cz7IR5cNLzfE/KUVp4Ptj9shaB532Z2O
 5DUUEgdUPnmzcUzWI93HsYCVJzOqjNoVDinKtapbeKsRNiJQZZwRLI9mj
 0l64lvZ8jHJJwj0Vxn8uov8aEhFtaN8jlKJU9Z50acOEoqw4UD6V5BNZN
 N2eAMiPYYqgjnsokXXQyd6OlhDwvTb1KgLDrbMieC6MphXHaflpjEphZ1
 6zF+YqgJOBvfiJCo78p2hMr2hXOhzEzcdUsBpPFkbcDWCjfNoZRz+gjVT
 hY0tQ7ELUF0NCsKou8zlgxBVdnHpMkXM3QmGe7aN7DOADLvFw/t09gicz g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="271572797"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="271572797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 19:25:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="573630666"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.255.28.212])
 ([10.255.28.212])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 19:25:31 -0700
Message-ID: <5f363432-9fcd-c05a-f253-237216716689@intel.com>
Date: Thu, 26 May 2022 10:25:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 16/36] i386/tdvf: Introduce function to parse TDVF
 metadata
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
 <20220512031803.3315890-17-xiaoyao.li@intel.com>
 <20220524070258.evtfwwujone36yjx@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220524070258.evtfwwujone36yjx@sirius.home.kraxel.org>
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

On 5/24/2022 3:02 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> +static int tdvf_parse_section_entry(const TdvfSectionEntry *src,
>> +                                     TdxFirmwareEntry *entry)
> 
>> +    /* sanity check */
> 
> That is what the whole function is doing.  So rename it to
> tdvf_check_section_entry to clarify that?

I will rename it to tdvf_parse_and_check_section_entry() since it first 
parses the section entries from TDVF to software defined data structure 
TdxFirmwareEntry

> take care,
>    Gerd
> 


