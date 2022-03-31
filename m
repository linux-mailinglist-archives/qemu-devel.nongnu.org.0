Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568E4ED44E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 09:00:03 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZomn-0000Ou-Mb
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 03:00:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nZol8-00085B-AT
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:58:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:52983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nZol3-0006Ln-L4
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:58:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648709893; x=1680245893;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O/bKGbwTuz4odrbizTQy29vauof302HjcqPe5nVHZvI=;
 b=lUa+3d6eZ4jCkot6N/4nqP4TM02JTH+eiib7KWIL28ARYkB3D1XuzrLb
 kRo35cfFWicUbgyFftHK3/Hzu8XKIun6UJVCFA4krvPSO6exQ1qC3E28S
 m3kSDfrv+LlxAvW2FRGFovGUbo1YLnXgLvqBCYP4GdlXTDCgxzJvBWK5l
 MQPLyEjdkATVOzg4X0DlysABFsE7EtATyeGw23qxB+EPa2jILJD4NhcF6
 Mn/mczlrcHx92RYKDz4BCo4ASEA+V1OF2asdMDwZ/W8Q0JnxWzMNe4o7G
 AWTu92ZSCASWbaktX00/6A9+V8QDpu3yHVpFp5kyZaz4uwZc+iefbpAkb A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="258568157"
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="258568157"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 23:57:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,224,1643702400"; d="scan'208";a="547188445"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.193.1])
 ([10.249.193.1])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 23:57:50 -0700
Message-ID: <9d6299ef-ed28-7192-7f8e-5c1a4daf6a62@intel.com>
Date: Thu, 31 Mar 2022 14:57:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
 <20220322092141.qsgv3pqlvlemgrgw@sirius.home.kraxel.org>
 <YjmXFZRCbKXTkAhN@redhat.com>
 <20220322103518.ljbi4pvghbgjxm7k@sirius.home.kraxel.org>
 <YjmqOolbafWkMEHN@redhat.com>
 <20220322122024.blyut6mnszhyw6hz@sirius.home.kraxel.org>
 <20220324083528.deoh77e77swf67gb@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220324083528.deoh77e77swf67gb@sirius.home.kraxel.org>
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 seanjc@google.com, erdemaktas@google.com, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/2022 4:35 PM, Gerd Hoffmann wrote:
> On Tue, Mar 22, 2022 at 01:20:24PM +0100, Gerd Hoffmann wrote:
>>    Hi,
>>
>>> At the time I did try a gross hack that (IIRC) disabled the
>>> rom_reset logic, and munged x86_bios_rom_init so that it would
>>> force load it straight at the RAM location.
>>
>> Sounds reasonable.  The whole rom logic exists to handle resets,
>> but with confidential guests we don't need that, we can't change
>> guest state to perform a reset anyway ...
> 
> Completed, cleaned up a bit, but untested:
>    https://git.kraxel.org/cgit/qemu/log/?h=sirius/cc
> 
> Any chance you can give this a try?

Hi Gred,

I refactor the TDX series to load TDVF via "-bios" option upon it.

No issue hit.

Thanks,
-Xiaoyao

> thanks,
>    Gerd
> 


