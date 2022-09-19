Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FC25BC2C1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 08:18:32 +0200 (CEST)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaA6x-00032m-6Q
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 02:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oaA1D-000058-TD
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:12:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:15254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oaA19-0005xD-QJ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663567951; x=1695103951;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xP07MG2LZpGM4fSELwtQs+nWzgGYK+3ztLksyhtQoIU=;
 b=UcadUj8jG1skcgUFB3vv0HDkbNv63BDhbl6RmTTu1xb5aEupfzt9VUGx
 PWWVYeP5CAGti/rxBt0BYb9DqhsCd9Dgx5DH2lJEogrp5mROBQsbm4snX
 SN9hegljwA8roN9L8H63UjCym+M/m3tV126gBUoyfp2KWvbEXegZwoDAE
 gymcZUOZLn7K3hLyjxfUYGOZWrcNFPNpgMyN7NoOt5U00N8LeyogLocXb
 bkKbNxn4Cs2b+ke322OYiznn8CV28GDC56FdW5E3RpV5D4ddIXi/OpHQf
 iYM0oiIEXMTrwW7Py1sgOrAnZdUmW9K/uBGvdTOmS74ICcUKAqTiJCyLC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="325601751"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325601751"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2022 23:12:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="947078454"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.170.149])
 ([10.249.170.149])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2022 23:11:57 -0700
Message-ID: <a224206a-c5db-18a4-ecad-2c7132e12452@intel.com>
Date: Mon, 19 Sep 2022 14:11:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH v6 2/2] i386: Add notify VM exit support
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>, Peter Xu <peterx@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220915092839.5518-1-chenyi.qiang@intel.com>
 <20220915092839.5518-3-chenyi.qiang@intel.com> <YyTxL7kstA20tB5a@xz-m1.local>
 <5beb9f1c-a419-94f7-a1b9-4aeb281baa41@intel.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <5beb9f1c-a419-94f7-a1b9-4aeb281baa41@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88; envelope-from=xiaoyao.li@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, NICE_REPLY_A=-3.657,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/19/2022 1:46 PM, Chenyi Qiang wrote:
>> Not sure some warning would be also useful here, but I really don't know
>> the whole context so I can't tell whether there can easily be false
>> positives to pollute qemu log.
>>
> 
> The false positive case is not easy to happen unless some potential 
> issues in silicon. But in case of it, to avoid polluting qemu log, how 
> about:
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ae7fb2c495..8f97133cbf 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -5213,6 +5213,7 @@ int kvm_arch_handle_exit(CPUState *cs, struct 
> kvm_run *run)
>           break;
>       case KVM_EXIT_NOTIFY:
>           ret = 0;
> +        warn_report_once("KVM: notify window was exceeded in guest");
>           if (run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID) {
>               warn_report("KVM: invalid context due to notify vmexit");
>               if (has_triple_fault_event) {

how about this

     case KVM_EXIT_NOTIFY:
         bool ctx_invalid = run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID;
         ret = 0;
         warn_report_once("KVM: Encounter notify exit with %svalid context",
                          ctx_invalid ? "in" : "");

         if (ctx_invalid) {
             ...
         }

