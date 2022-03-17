Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE594DBF1B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 07:16:01 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUjQW-0006lZ-1w
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 02:16:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nUjNU-0005Jq-Bt
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:12:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:64089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1nUjNR-0003gk-Ig
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 02:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647497569; x=1679033569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e8+nBh31J/LgW0UBnHwSozwAfLLujNMGXhtwbXV67FM=;
 b=JflvbrDdG1XEJiLftAiHgD6Dc4FRmmLjoHIg+IR1ACrs9j+xDHK1vykC
 e48EiXLQD+4fPTURIhtXcAZ6HcWP2BW9jpuaNnJ4HMGg0YCAOTMCdbLXO
 GIsB+LG7xStJ0UpvrQ3qcf1nsK8pqTJolTswtDYZCs95pQX4qm/+z8Fea
 HaftfzKnRjBK+D8Wiu1VJC9jjwnDDkZ1qq6uXv+oUIsYiJpvDDBrwXpb2
 u4BBpBzkO/EMVuBAgqbhwzgfN/T3VJq0Jw2sN8oEyuJ2/IWafaG0xY/uV
 vJSyKW1dP00pNQrWgihcDcEpgYpfT0AAn6tf+LtVdeFTqr0EDLP6qN0M1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="343228278"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="343228278"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 23:12:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="516640255"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.145.56])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 16 Mar 2022 23:12:44 -0700
Date: Thu, 17 Mar 2022 13:56:49 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Peter Krempa <pkrempa@redhat.com>, pbonzini@redhat.com
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
Message-ID: <20220317055649.GA23688@yangzhon-Virtual>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjII86LKWTe0mVED@angien.pipo.sk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
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

  Thanks for pointing this out!
  
  In my side, no AMD machine can be used to try this issue, I listed the
  FPU info from host kernel dmesg for reference.
  
  root@984fee00bf64:~# dmesg | grep fpu
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x400: 'PASID state'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x20000: 'AMX Tile config'
  [    0.000000] x86/fpu: Supporting XSAVE feature 0x40000: 'AMX Tile data'
  [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
  [    0.000000] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
  [    0.000000] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
  [    0.000000] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
  [    0.000000] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
  [    0.000000] x86/fpu: xstate_offset[10]: 2440, xstate_sizes[10]:    8
  [    0.000000] x86/fpu: xstate_offset[17]: 2496, xstate_sizes[17]:   64
  [    0.000000] x86/fpu: xstate_offset[18]: 2560, xstate_sizes[18]: 8192
  [    0.000000] x86/fpu: Enabled xstate features 0x606e7, context size is 10752 bytes, using 'compacted' format.

  Paolo, if you have fix patch, I can double check this from Intel SPR server. thanks!

  Yang


