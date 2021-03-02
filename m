Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4573296D9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:20:26 +0100 (CET)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0GX-0008ME-Aj
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH0F6-0007TS-9b
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:18:56 -0500
Received: from mx2.suse.de ([195.135.220.15]:57968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH0F4-0003iF-Kp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:18:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0EE57AC24;
 Tue,  2 Mar 2021 08:18:53 +0000 (UTC)
Subject: Re: [RFC v2 14/24] target/arm: split vfp state setting from tcg
 helpers
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-15-cfontana@suse.de>
 <3658a432-7dc1-ce34-e341-710ea6013556@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <03d6abf6-e076-17d9-d23a-5dd00bc4540e@suse.de>
Date: Tue, 2 Mar 2021 09:18:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3658a432-7dc1-ce34-e341-710ea6013556@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 5:24 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> vfp_get_fpsr and vfp_set_fpsr are needed also for KVM.
>>
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/cpu-vfp.h          |  29 +++++
>>   target/arm/cpu-vfp.c          |  92 +++++++++++++++
>>   target/arm/kvm/helper-stubs.c |  10 ++
>>   target/arm/tcg/cpu-vfp.c      | 146 +++++++++++++++++++++++
>>   target/arm/tcg/vfp_helper.c   | 210 +---------------------------------
>>   target/arm/meson.build        |   1 +
>>   target/arm/tcg/meson.build    |   1 +
>>   7 files changed, 281 insertions(+), 208 deletions(-)
>>   create mode 100644 target/arm/cpu-vfp.h
>>   create mode 100644 target/arm/cpu-vfp.c
>>   create mode 100644 target/arm/tcg/cpu-vfp.c
> 
> kvm/helper-stubs.c should be for all !tcg.
> 
> 
> r~
> 

Can you explain more what you mean?

In this patch kvm/helper-stubs.c is updated to include two stubs:

uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
{
    return 0;
}

void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
{
}

The corresponding tcg code instead is in tcg/arm/cpu-vtp.c.

For the non-stub code that comprises

vfp_get_fpscr
vfp_set_fpscr

the code is moved to target/arm/cpu-vfp.c,

to be shared by tcg and kvm.

Thanks,

C





