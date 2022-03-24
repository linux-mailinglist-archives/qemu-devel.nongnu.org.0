Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0B4E5E88
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 07:15:38 +0100 (CET)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXGkz-0001bK-Aa
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 02:15:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXGjb-0000ts-Pl
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 02:14:13 -0400
Received: from mga06.intel.com ([134.134.136.31]:13462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXGjZ-00075m-G3
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 02:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648102449; x=1679638449;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UOpTd7StGhej4ruU8H47HWJvgta4QrBbISqx81PRTkk=;
 b=cH3N7O1KWqW7u8MgotO8UwyEikpB85LclVlsqNGkFCQ/9k6k8R9vUyQ7
 WTEJrwtzOfzxKKVvuscZ7ibPvaADdh2KLFFibRovHvvAMkWmmYL1+cSFm
 QpKJ7OKeKYr/RrkBSSeN2Fi5CsRstnF6nyBxG0sz0rgsEg6LObaju1aT0
 7GM9k9cyBcMIWNRdNmIN7ruRAygbZq61X/8kKfr5WQBYKLRukjzxFz0qc
 UHxqL7d6trWnnZTpBsxSkt1uPYeU80/yeQRUVvlcv6J+P4vA71t9u7zfO
 jpfkEsnboXjzsALFkHC57y/BVH1PO1Bc7hoIWpGZ/ufimYLhitHxebcz+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="319006853"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="319006853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 23:14:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="561229879"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.201.150])
 ([10.249.201.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 23:13:56 -0700
Message-ID: <e7fb2eab-b2b1-dd0e-4821-4cca40751d15@intel.com>
Date: Thu, 24 Mar 2022 14:13:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
 <20220322092141.qsgv3pqlvlemgrgw@sirius.home.kraxel.org>
 <YjmXFZRCbKXTkAhN@redhat.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <YjmXFZRCbKXTkAhN@redhat.com>
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

On 3/22/2022 5:29 PM, Daniel P. Berrangé wrote:
> On Tue, Mar 22, 2022 at 10:21:41AM +0100, Gerd Hoffmann wrote:
>>    Hi,
>>
>>>> If you don't need a pflash device, don't use it: simply map your nvram
>>>> region as ram in your machine. No need to clutter the pflash model like
>>>> that.
>>
>> Using the pflash device for something which isn't actually flash looks a
>> bit silly indeed.
>>
>>>
>>> I know it's dirty to hack the pflash device. The purpose is to make the user
>>> interface unchanged that people can still use
>>>
>>> 	-drive if=pflash,format=raw,unit=0,file=/path/to/OVMF_CODE.fd
>>>          -drive if=pflash,format=raw,unit=1,file=/path/to/OVMF_VARS.fd
>>>
>>> to create TD guest.
>>
>> Well, if persistent vars are not supported anyway there is little reason
>> to split the firmware into CODE and VARS files.  You can use just use
>> OVMF.fd with a single pflash device.  libvirt recently got support for
>> that.
> 
> Agreed.

The purpose of using split firmware is that people can share the same 
code.fd while using different vars.fd




