Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4594E3B08
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:45:55 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWa9K-0006Dw-T7
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:45:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nWa6r-0003pM-7U
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:43:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:55763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nWa6o-0005EU-2f
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647938598; x=1679474598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Vx0R2X3iGK5UdRg98VziVIrJikDdoYoSLOhO+hRVrNM=;
 b=GapIOU94ZCa3vJa5J52dbyBUkpyB9HEWbOYDnx82OiMtBxWCREEfOgXJ
 C/02oX/aKnbtrD+LsfPYLrWyk6wwqnp7ot7sZHUVvKVZMVbo43Jsx38+e
 OcCtghD1vC5V/MsyeIjePZzTx3IakKKm37KZ4tijhNqtEWlnGTxTOxVMi
 YcNPovj1fwtUXK43kFVm4TkD3rIM6R6/ZSyjHZUaqEszLQABYc/DrnUox
 zIGAzOecbwBm0SUEfOTq87D5/I79kDT1l2VyjTDfvqQx6LqOLwKx/VhoN
 YVBI8dCtQNhCD46x4ca286pLYD3YOHZZ014d9M99RM4ZF2qEwjY5ybrXy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257953986"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="257953986"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 01:42:52 -0700
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="543596925"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 22 Mar 2022 01:42:50 -0700
Date: Tue, 22 Mar 2022 16:26:52 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
Message-ID: <20220322082652.GA30793@yangzhon-Virtual>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjII86LKWTe0mVED@angien.pipo.sk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: yang.zhong@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 04:57:39PM +0100, Peter Krempa wrote:
> On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
> > From: Yang Zhong <yang.zhong@intel.com>
> > 
> > Kernel allocates 4K xstate buffer by default. For XSAVE features
> > which require large state component (e.g. AMX), Linux kernel
> > dynamically expands the xstate buffer only after the process has
> > acquired the necessary permissions. Those are called dynamically-
> > enabled XSAVE features (or dynamic xfeatures).
> > 
> > There are separate permissions for native tasks and guests.
> > 
> > Qemu should request the guest permissions for dynamic xfeatures
> > which will be exposed to the guest. This only needs to be done
> > once before the first vcpu is created.
> > 
> > KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
> > get host side supported_xcr0 and Qemu can decide if it can request
> > dynamically enabled XSAVE features permission.
> > https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
> > 
> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > Signed-off-by: Jing Liu <jing2.liu@intel.com>
> > Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  target/i386/cpu.c          |  7 +++++
> >  target/i386/cpu.h          |  4 +++
> >  target/i386/kvm/kvm-cpu.c  | 12 ++++----
> >  target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
> >  target/i386/kvm/kvm_i386.h |  1 +
> >  5 files changed, 75 insertions(+), 6 deletions(-)
> 
> With this commit qemu crashes for me when invoking the following
> QMP command:
> 
> $ ~pipo/git/qemu.git/build/qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 90, "minor": 2, "major": 6}, "package": "v7.0.0-rc0-8-g1d60bb4b14"}, "capabilities": ["oob"]}}
> {'execute':'qmp_capabilities'}
> {"return": {}}
> {"execute":"qom-list-properties","arguments":{"typename":"max-x86_64-cpu"},"id":"libvirt-41"}
> qemu-system-x86_64: ../target/i386/kvm/kvm-cpu.c:105: kvm_cpu_xsave_init: Assertion `esa->size == eax' failed.
> Aborted (core dumped)
> 
> Note that the above is on a box with an 'AMD Ryzen 9 3900X'.
> 
> Curiously on a laptop with an Intel chip (Intel(R) Core(TM) i7-10610U)
> it seems to work.

  
  Paolo, I debugged this issue and found this issue is caused by xstate feature bit9
  (MPK, which like pku in intel) in the some AMD platforms.

  #AMD Spec, p409
  https://www.amd.com/system/files/TechDocs/24593.pdf

  I checked the cpuid info from AMD EPYC 7402P server and ECX=0x9, the eax is 0x40,
  which is different with eax=0x00000008 in Intel platform. So, the ASSERT is generated
  by AMX changes.

  ##AMD host
  0x0000000d 0x00: eax=0x00000207 ebx=0x00000340 ecx=0x00000380 edx=0x00000000
  0x0000000d 0x01: eax=0x0000000f ebx=0x00000340 ecx=0x00000000 edx=0x00000000
  0x0000000d 0x02: eax=0x00000100 ebx=0x00000240 ecx=0x00000000 edx=0x00000000
  0x0000000d 0x09: eax=0x00000040 ebx=0x00000340 ecx=0x00000000 edx=0x00000000

  ##Intel host
  0x0000000d 0x00: eax=0x000602e7 ebx=0x00002b00 ecx=0x00002b00 edx=0x00000000
  0x0000000d 0x01: eax=0x0000001f ebx=0x00002d00 ecx=0x0000dd00 edx=0x00000000
  0x0000000d 0x02: eax=0x00000100 ebx=0x00000240 ecx=0x00000000 edx=0x00000000
  0x0000000d 0x05: eax=0x00000040 ebx=0x00000440 ecx=0x00000000 edx=0x00000000
  0x0000000d 0x06: eax=0x00000200 ebx=0x00000480 ecx=0x00000000 edx=0x00000000
  0x0000000d 0x07: eax=0x00000400 ebx=0x00000680 ecx=0x00000000 edx=0x00000000
  0x0000000d 0x08: eax=0x00000080 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
  0x0000000d 0x09: eax=0x00000008 ebx=0x00000a80 ecx=0x00000000 edx=0x00000000
  0x0000000d 0x0a: eax=0x00000008 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
  0x0000000d 0x0b: eax=0x00000010 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
  0x0000000d 0x0c: eax=0x00000018 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
  0x0000000d 0x0e: eax=0x00000030 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
  0x0000000d 0x0f: eax=0x00000328 ebx=0x00000000 ecx=0x00000001 edx=0x00000000
  0x0000000d 0x11: eax=0x00000040 ebx=0x00000ac0 ecx=0x00000002 edx=0x00000000
  0x0000000d 0x12: eax=0x00002000 ebx=0x00000b00 ecx=0x00000006 edx=0x00000000

  But I also checked same cpuid info from AMD MILAN server, the eax=0x00000008 in ECX=0x9.
  So, for this ECX=0x9, the eax values in different AMD server are different.

  How can we handle those different value since we have used host_cpuid() to read host's
  registers? thanks!

  Yang


