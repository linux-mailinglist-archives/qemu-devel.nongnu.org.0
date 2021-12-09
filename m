Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C646E151
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 04:36:00 +0100 (CET)
Received: from localhost ([::1]:36004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvADv-0003Gs-Fe
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 22:35:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mvACJ-0002ay-QW
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 22:34:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:15417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1mvACH-0004hv-5k
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 22:34:19 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298798816"
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; d="scan'208";a="298798816"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 19:34:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,191,1635231600"; d="scan'208";a="503328522"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.29.184])
 ([10.255.29.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 19:34:01 -0800
Message-ID: <76f582f3-c130-70cd-05bc-9d5e38cfffdb@intel.com>
Date: Thu, 9 Dec 2021 11:33:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [RFC PATCH v2 07/44] i386/kvm: Squash getting/putting guest state
 for TDX VMs
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, isaku.yamahata@gmail.com
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <7194a76cfb8541d4f7a5b6a04fb3496bc14eab15.1625704980.git.isaku.yamahata@intel.com>
 <20210826102421.bwslsyeafmullmky@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20210826102421.bwslsyeafmullmky@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=xiaoyao.li@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 qemu-devel@nongnu.org, mtosatti@redhat.com, erdemaktas@google.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/2021 6:24 PM, Gerd Hoffmann wrote:
> On Wed, Jul 07, 2021 at 05:54:37PM -0700, isaku.yamahata@gmail.com wrote:
>> From: Sean Christopherson <sean.j.christopherson@intel.com>
>>
>> Ignore get/put state of TDX VMs as accessing/mutating guest state of
>> producation TDs is not supported.
> 
> Why silently ignore instead of returning an error?

The error is returned to upper caller in QEMU, right? There deems to be 
somewhere in QEMU to not call the IOCTLs to get guest states of TD VM.

Let's reword it to "Don't". Is it OK?



