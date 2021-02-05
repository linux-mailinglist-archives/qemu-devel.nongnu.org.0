Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B596310865
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:53:41 +0100 (CET)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xo4-0003aR-Iw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7xmY-0002TI-QY
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:52:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:48610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7xmX-00068H-4e
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:52:06 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C1DFAD0B;
 Fri,  5 Feb 2021 09:52:03 +0000 (UTC)
Subject: Re: [Bug 1914696] Re: aarch64: migration failed: Segmentation fault
 (core dumped)
To: Bug 1914696 <1914696@bugs.launchpad.net>
References: <161249398803.13999.15324457641617983607.malonedeb@soybean.canonical.com>
 <161249427147.24305.16887496480047661554.malone@wampee.canonical.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <651d12ef-7a35-67c6-ef49-16eefe90ef29@suse.de>
Date: Fri, 5 Feb 2021 10:52:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <161249427147.24305.16887496480047661554.malone@wampee.canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.182,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi LiZhiJian,

just one thing I noticed in your call stack, your $Subject talks about AArch64,
and you end up in arm_v7m_mmu_idx_for_secstate,

which means that ARM_FEATURE_M is detected, so definitely something looks off when it comes to the feature bits..

Ciao,

Claudio

On 2/5/21 4:04 AM, lizhijian wrote:
> paste the call trace
> 
> (gdb) bt
> #0  0x0000aaaac036a02c in armv7m_nvic_neg_prio_requested (opaque=0x0, secure=false) at ../hw/intc/armv7m_nvic.c:406
> #1  0x0000aaaac014dcf4 in arm_v7m_mmu_idx_for_secstate_and_priv (env=0xaaaaca23d950, secstate=false, priv=true) at ../target/arm/m_helper.c:2837
> #2  0x0000aaaac014dd8c in arm_v7m_mmu_idx_for_secstate (env=0xaaaaca23d950, secstate=false) at ../target/arm/m_helper.c:2848
> #3  0x0000aaaac018aa6c in arm_mmu_idx_el (env=0xaaaaca23d950, el=1) at ../target/arm/helper.c:12841
> #4  0x0000aaaac018b788 in rebuild_hflags_internal (env=0xaaaaca23d950) at ../target/arm/helper.c:13100
> #5  0x0000aaaac018b80c in arm_rebuild_hflags (env=0xaaaaca23d950) at ../target/arm/helper.c:13113
> #6  0x0000aaaac007f928 in cpu_post_load (opaque=0xaaaaca233b10, version_id=22) at ../target/arm/machine.c:767
> #7  0x0000aaaabfc8f508 in vmstate_load_state (f=0xaaaaca355520, vmsd=0xaaaac0d59ea8 <vmstate_arm_cpu>, opaque=0xaaaaca233b10, version_id=22) at ../migration/vmstate.c:168
> #8  0x0000aaaabfca3404 in vmstate_load (f=0xaaaaca355520, se=0xaaaaca2708b0) at ../migration/savevm.c:885
> #9  0x0000aaaabfca6410 in qemu_loadvm_section_start_full (f=0xaaaaca355520, mis=0xaaaaca204d90) at ../migration/savevm.c:2396
> #10 0x0000aaaabfca6a8c in qemu_loadvm_state_main (f=0xaaaaca355520, mis=0xaaaaca204d90) at ../migration/savevm.c:2582
> #11 0x0000aaaabfca6c34 in qemu_loadvm_state (f=0xaaaaca355520) at ../migration/savevm.c:2661
> #12 0x0000aaaabfd95bf0 in process_incoming_migration_co (opaque=0x0) at ../migration/migration.c:522
> #13 0x0000aaaac06c6248 in coroutine_trampoline (i0=-895198224, i1=43690) at ../util/coroutine-ucontext.c:173
> #14 0x0000ffffa5071f90 in __startcontext () at ../sysdeps/unix/sysv/linux/aarch64/setcontext.S:123
> 
> 
> ** Information type changed from Public to Public Security
> 


