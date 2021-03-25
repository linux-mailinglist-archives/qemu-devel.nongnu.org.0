Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCCC34876F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 04:18:33 +0100 (CET)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGVz-0005uK-MQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 23:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPGTX-0004Oy-OB
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 23:15:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:60406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPGTT-00087e-NL
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 23:15:59 -0400
IronPort-SDR: Vg6jNFsn+BLbR3ez374qEKsaFnbYVjBXQLnPD2E1NtSgi9Ir/AlnsP3+I7t0/AD8r+qNCkgW36
 N7KtMN3jNH1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="177954343"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="177954343"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 20:15:53 -0700
IronPort-SDR: LZKyOnaCDzdLg7784ZcsxTzftqKjGE30Aa7Pk6oGblOZf+CyRK5/J20p70JydyoFKuvrkO+R0O
 O0XcKkSlrtEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="525482688"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 24 Mar 2021 20:15:50 -0700
Message-ID: <09e24732185ed4df204063a6446c39ae4805d4f6.camel@linux.intel.com>
Subject: Re: [PATCH v3] i386/cpu_dump: support AVX512 ZMM regs dump
From: Robert Hoo <robert.hu@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com, 
 ehabkost@redhat.com
Date: Thu, 25 Mar 2021 11:15:49 +0800
In-Reply-To: <fc15756c-755d-fc96-80f4-ac9d6f6b461b@linaro.org>
References: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
 <fc15756c-755d-fc96-80f4-ac9d6f6b461b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=robert.hu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Wed, 2021-03-24 at 07:44 -0600, Richard Henderson wrote:
> On 3/24/21 2:00 AM, Robert Hoo wrote:
> > +        if ((env->xcr0 & XFEATURE_AVX512) == XFEATURE_AVX512) {
> > +            /* XSAVE enabled AVX512 */
> > +            nb = (env->hflags & HF_CS64_MASK) ? 32 : 8;
> > +            for (i = 0; i < nb; i++) {
> > +                qemu_fprintf(f, "ZMM%02d=0x%016lx %016lx %016lx
> > %016lx %016lx "
> > +                                "%016lx %016lx %016lx\n",
> > +                             i,
> > +                             env->xmm_regs[i].ZMM_Q(7),
> > +                             env->xmm_regs[i].ZMM_Q(6),
> > +                             env->xmm_regs[i].ZMM_Q(5),
> > +                             env->xmm_regs[i].ZMM_Q(4),
> > +                             env->xmm_regs[i].ZMM_Q(3),
> > +                             env->xmm_regs[i].ZMM_Q(2),
> > +                             env->xmm_regs[i].ZMM_Q(1),
> > +                             env->xmm_regs[i].ZMM_Q(0));
> > +            }
> 
> Dump opmask regs?

OK
> 
> > +        } else if (env->xcr0 & XFEATURE_AVX) {
> 
> This is normally a 2-bit test.

I beg your pardon. What 2 bits?
> 
> > +            /* XSAVE enabled AVX */
> > +            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
> > +            for (i = 0; i < nb; i++) {
> > +                qemu_fprintf(f, "YMM%02d=0x%016lx %016lx %016lx
> > %016lx\n",
> > +                             i,
> > +                             env->xmm_regs[i].ZMM_Q(3),
> > +                             env->xmm_regs[i].ZMM_Q(2),
> > +                             env->xmm_regs[i].ZMM_Q(1),
> > +                             env->xmm_regs[i].ZMM_Q(0));
> > +            }
> > +        } else { /* SSE and below cases */
> > +            nb = env->hflags & HF_CS64_MASK ? 16 : 8;
> > +            for (i = 0; i < nb; i++) {
> > +                qemu_fprintf(f, "XMM%02d=0x%016lx %016lx",
> > +                             i,
> > +                             env->xmm_regs[i].ZMM_Q(1),
> > +                             env->xmm_regs[i].ZMM_Q(0));
> > +                if ((i & 1) == 1)
> > +                    qemu_fprintf(f, "\n");
> > +                else
> > +                    qemu_fprintf(f, " ");
> 
> I'd be tempted to merge that second printf into the first, with "%s"
> and (i & 1 
> ? "\n" : " ").  Otherwise you'll need to add braces to that IF to
> satisfy 
> checkpatch.

Sure. I just retained previous code.
BTW, checkpatch didn't warn me on this. It escaped.:)
> 
> > +#define XFEATURE_X87        (1UL << 0)
> > +#define XFEATURE_SSE        (1UL << 1)
> > +#define XFEATURE_AVX        (1UL << 2)
> > +#define XFEATURE_AVX512_OPMASK          (1UL << 5)
> > +#define XFEATURE_AVX512_ZMM_Hi256       (1UL << 6)
> > +#define XFEATURE_AVX512_Hi16_ZMM        (1UL << 7)
> > +#define XFEATURE_AVX512     (XFEATURE_AVX512_OPMASK | \
> > +                             XFEATURE_AVX512_ZMM_Hi256 | \
> > +                             XFEATURE_AVX512_Hi16_ZMM)
> 
> Except for the last, these already exist under the name
> XSTATE_*_MASK.

Ah, my poor eye sight. They even exist in the same file. Thanks
pointing out.
> 
> I think you can just as well declare local variables to hold the 3
> bits for the 
> avx512 test and the 2 bits for the avx test.
> 
Sure.
> 
> r~


