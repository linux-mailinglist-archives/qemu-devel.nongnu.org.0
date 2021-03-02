Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5A329D71
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:59:42 +0100 (CET)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3gj-0007hQ-VQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH3g0-0007Cn-NP
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:58:56 -0500
Received: from mx2.suse.de ([195.135.220.15]:55562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lH3fz-0005WW-1k
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:58:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 624A1B120;
 Tue,  2 Mar 2021 11:58:53 +0000 (UTC)
Subject: Re: [RFC v2 19/24] target/arm: move aarch64_sync_32_to_64 (and vv) to
 cpu code
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-20-cfontana@suse.de>
 <3c8622f8-cf47-2819-c351-8051c2725155@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <564ba572-b323-eca4-4cf6-c2c466f7f795@suse.de>
Date: Tue, 2 Mar 2021 12:58:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3c8622f8-cf47-2819-c351-8051c2725155@linaro.org>
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

On 3/2/21 7:23 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> and arm_phys_excp_target_el since it is tied up inside the
>> same #ifdef block.
>>
>> aarch64_sync_32_to_64 and aarch64_sync_64_to_32 are
>> mixed in with the tcg helpers, but they shouldn't, as they
>> are needed for kvm too, in the sysemu case.
> 
> Really?  Now that *is* surprising.  Again, please document.  Because I surely 
> cannot believe this to be used by kvm.
> 
> 
> r~
> 

Ok, will add comment here as well, they are needed by kvm64.c

There is lots that surprised me too on how kvm is bolted on top of tcg code currently;

partly related to this, if it can help understand this,

in kvm.c notice the kvm_arm_init_cpreg_list():

it basically undoes all TCG initializations in the cpreg_indexes, cpreg_values etc, and 
rebuilds the cpreg list based on the list read from the kernel.

Then, in kvm64.c:
kvm_arch_get_registers()
{
    ...
    if (!is_a64(env)) {
        aarch64_sync_64_to_32(env);
    }
    ...
    write_kvmstate_to_list(cpu);
    ...
    write_list_to_cpustate(cpu);
    ...
}

kvm_arch_put_registers()
{
    ...
    if (!is_a64(env)) {
        aarch64_sync_32_to_64(env);
    }
    ...
    write_cpustate_to_list(cpu, true);
    ...
    write_list_to_kvmstate(cpu, level)
    ...
}

Thanks,

Claudio












