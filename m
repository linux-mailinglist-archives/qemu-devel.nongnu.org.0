Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6453251C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 10:17:52 +0200 (CEST)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntPjj-0003iF-0a
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 04:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntPeI-0000TB-RN
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:12:15 -0400
Received: from mga07.intel.com ([134.134.136.100]:15031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1ntPeC-0001LV-9R
 for qemu-devel@nongnu.org; Tue, 24 May 2022 04:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653379928; x=1684915928;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p0AzvFL26WE5tpeWJg9IQQ/7Q4siWy3k1jt1lWZOFkY=;
 b=CUmxKje+wsSZ6vNxx6R5cU05JUmf63Hnp6vWA/Gk2rRPDe/kUi0LmfTv
 5ZDM53uq8reF6PdM0uOv5BD+0BpAUA4N4HQ/5JlmwaBY8y2WabfQiuyz3
 dC4dEsFxu1H4uGKZ0avv4PeEm/LspXbPMGmuYZFsLFnmZhelqBLryDWQB
 yP3u/tuEQCEywxn75qjrJgO6fJJuXn4M1hbBlhXtb9KBMiVS6Ao47c83a
 ZqN7dnb2KbWyAevWgIoZG+3e2Z7X3Pw8klJWXMYkLPs9/2b2CIwun8EjX
 2TLUlVDVGzSwuQHwdCL13CWeHfrW9yg99XXZg0U+baWKn9CqXsTDpwG3d w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="336519915"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="336519915"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 01:12:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601105029"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.170.252])
 ([10.249.170.252])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 01:11:59 -0700
Message-ID: <89534991-1850-be09-8abd-6d29bef5958e@intel.com>
Date: Tue, 24 May 2022 16:11:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v4 13/36] i386/tdx: Validate TD attributes
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
 <20220512031803.3315890-14-xiaoyao.li@intel.com>
 <20220523093920.o6pk5i7zig6enwnm@sirius.home.kraxel.org>
 <1e0f0051-f7c1-ed3b-be02-d16f0cf9f25d@intel.com>
 <20220524065959.umzmlhwcspfwi7m2@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220524065959.umzmlhwcspfwi7m2@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=xiaoyao.li@intel.com; helo=mga07.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 5/24/2022 2:59 PM, Gerd Hoffmann wrote:
> On Tue, May 24, 2022 at 12:19:51PM +0800, Xiaoyao Li wrote:
>> On 5/23/2022 5:39 PM, Gerd Hoffmann wrote:
>>> So, how is this supposed to work?  Patch #2 introduces attributes as
>>> user-settable property.  So do users have to manually figure and pass
>>> the correct value, so the check passes?  Specifically the fixed1 check?
>>>
>>> I think 'attributes' should not be user-settable in the first place.
>>> Each feature-bit which is actually user-settable (and not already
>>> covered by another option like pmu) should be a separate attribute for
>>> tdx-object.  Then the tdx code can create attributes from hardware
>>> capabilities and user settings.
>>
>> In patch #2, tdx-guest.attributes is defined as a field to hold a 64 bits
>> value of attributes but it doesn't provide any getter/setter for it. So it's
>> *not* user-settable.
> 
> Ok.  Why it is declared as object property in the first place then?

Is there another way to define a member/field of object besides property?

> take care,
>    Gerd
> 


