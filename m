Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A2329DA6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:05:48 +0100 (CET)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3md-0003Wm-Gu
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH3l7-0002L3-Dp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:04:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:60060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH3l3-0006CK-Ra
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:04:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F3B4ABF4;
 Tue,  2 Mar 2021 12:04:08 +0000 (UTC)
Subject: Re: target/arm: "define_arm_cp_regs" and similar for KVM
To: Peter Maydell <peter.maydell@linaro.org>
References: <7360ab6a-0613-8300-ef8d-b0c641fbaed1@suse.de>
 <CAFEAcA9V9vtCeH9=PWdsab7iFA1YxdgB2F6ocLP0COjjP39YVQ@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1bd1bf6c-7139-74f1-7579-78895f5f554d@suse.de>
Date: Tue, 2 Mar 2021 13:04:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9V9vtCeH9=PWdsab7iFA1YxdgB2F6ocLP0COjjP39YVQ@mail.gmail.com>
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

On 3/2/21 1:02 PM, Peter Maydell wrote:
> On Fri, 26 Feb 2021 at 17:27, Claudio Fontana <cfontana@suse.de> wrote:
>>
>> Hi Peter,
>>
>> I am trying to find out how to split properly KVM and TCG in target/arm, among other things.
>>
>> I skipped or stubbed all define_arm_cp_regs and similar functions,
>>
>> and made a cpregs module that is TCG-only.
>>
>> Thought it is fine, as we have a kvm_arm_init_cpreg_list that throws away everything TCG-related anyway later:
>>
>> target/arm/kvm.c:
>>
>> /* Initialize the ARMCPU cpreg list according to the kernel's
>>  * definition of what CPU registers it knows about (and throw away
>>  * the previous TCG-created cpreg list).
>>  */
>> int kvm_arm_init_cpreg_list(ARMCPU *cpu)
> 
> It throws away the cpreg *list*, but not the cpreg hash table.
> That is, we trust KVM for "what sysregs exist and need to be migrated"
> but we still
> use the hashtable to find out what QEMU thinks about them and where it stores
> them in the CPU state structure if it knows about them. So you still
> need to keep the
> define_arm_cp_regs stuff to register sysregs. Not doing so will break
> any bits of the
> code which rely on being able to do "synchronize kernel's idea of
> sysreg state to
> QEMU" and then "read the register value out of the CPU state struct". It'll also
> break visibility of sysregs in the gdbstub.
> 
> thanks
> -- PMM
> 

Thanks for the confirmation Peter,

I ended up doing that.

Thanks,

Claudio

