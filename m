Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6046834581D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 08:03:23 +0100 (CET)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOb4U-0001Uu-Ez
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 03:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lOb2K-0000gO-AZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:01:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:47564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lOb2C-0007Gg-Fw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:01:07 -0400
IronPort-SDR: Qti05/0YeDfMRSuaccP2wpKYTZdfRBL45rejN6hRhHMgD9vCr8YWwcHrEJOIOa8NcKKnfPGjeh
 HzUWwsuxVMng==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190515227"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="190515227"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 00:00:57 -0700
IronPort-SDR: +HPimj/JWw4bbrONwwYxTnf4fyET4RIqVWOcrYVeyWxsGcIzICLENTllI1mMT4lNioR+BvwtUt
 rbERgnX1xf8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="441539256"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2021 00:00:56 -0700
Message-ID: <705f02a0903fc40d7328b506ebe8517f007a5d9d.camel@linux.intel.com>
Subject: Re: [PATCH] i386/cpu_dump: support AVX512 ZMM regs dump
From: Robert Hoo <robert.hu@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com, 
 ehabkost@redhat.com
Date: Tue, 23 Mar 2021 15:00:55 +0800
In-Reply-To: <6afd2662-d9eb-35c1-4401-6e699c8f861e@linaro.org>
References: <1616410796-43167-1-git-send-email-robert.hu@linux.intel.com>
 <6afd2662-d9eb-35c1-4401-6e699c8f861e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=robert.hu@linux.intel.com; helo=mga09.intel.com
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

On Mon, 2021-03-22 at 15:06 -0600, Richard Henderson wrote:
> On 3/22/21 4:59 AM, Robert Hoo wrote:
> > Since commit fa4518741e (target-i386: Rename struct XMMReg to
> > ZMMReg),
> > CPUX86State.xmm_regs[] has already been extended to 512bit to
> > support
> > AVX512.
> > Also, other qemu level supports for AVX512 registers are there for
> > years.
> > But in x86_cpu_dump_state(), still only dump XMM registers.
> > This patch is just to complement this part, let it dump ZMM of
> > 512bits.
> 
> I think you should examine the state of the cpu to determine what of
> SSE, AVX 
> or AVX512 is currently enabled, then dump that.

Thanks Richard for review.

Uh, looks like the existing code doesn't have this logic yet.
OK, I'm to add this logic.
> 
> > -        if (env->hflags & HF_CS64_MASK)
> > -            nb = 16;
> > -        else
> > -            nb = 8;
> > -        for(i=0;i<nb;i++) {
> > -            qemu_fprintf(f, "XMM%02d=%08x%08x%08x%08x",
> > +
> > +        nb = sizeof(env->xmm_regs) / sizeof(env->xmm_regs[0]);
> 
> E.g., you're dumping all of the registers in 32-bit mode, which is
> restricted 
> to 8 registers, not 32.

In typedef struct CPUX86State {
...
ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32];
...
}

where in cpu.h

#define CPU_NB_REGS64 16
#define CPU_NB_REGS32 8

#ifdef TARGET_X86_64
#define CPU_NB_REGS CPU_NB_REGS64
#else
#define CPU_NB_REGS CPU_NB_REGS32
#endif

so the register number is 8 in 32-bit mode and 32 in 64-bit mode.
> 
> 
> r~


