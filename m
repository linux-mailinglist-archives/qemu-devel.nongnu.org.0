Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02837512C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:57:40 +0200 (CEST)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZpD-0005Io-Oa
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1leZnu-0004al-8u
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:56:19 -0400
Received: from mga06.intel.com ([134.134.136.31]:22808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1leZnq-0004Qa-HN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:56:18 -0400
IronPort-SDR: +CUdAXvEAop6HZqt32nM3DRsAlukhGpGxGXh/zJ2hmBSWWm9rr7rj/RZebIwkRNC3AHN/vVutV
 9+JRzH52gdnA==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="259696635"
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="259696635"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 01:56:09 -0700
IronPort-SDR: o+9g47Dn3NWVGJ1xk0Yjnw3a3Jo09m4sfPnBDiRgzG3BDsHoUvSDs+Wd5743MhVpWLxkF6RFTZ
 QQwfGz4k7iUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,277,1613462400"; d="scan'208";a="607740429"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga005.jf.intel.com with ESMTP; 06 May 2021 01:56:07 -0700
Message-ID: <731e42b30561f45eb3026ccb478493ac0491a4a7.camel@linux.intel.com>
Subject: Re: [PATCH v5] i386/cpu_dump: support AVX512 ZMM regs dump
From: Robert Hoo <robert.hu@linux.intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 06 May 2021 16:56:07 +0800
In-Reply-To: <20210419215952.cganarekhjc3jy6t@habkost.net>
References: <1618538904-93433-1-git-send-email-robert.hu@linux.intel.com>
 <20210419201825.43ejc5d4xaj7ebj3@habkost.net>
 <20210419215952.cganarekhjc3jy6t@habkost.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=robert.hu@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-04-19 at 17:59 -0400, Eduardo Habkost wrote:
> On Mon, Apr 19, 2021 at 04:18:25PM -0400, Eduardo Habkost wrote:
> > On Fri, Apr 16, 2021 at 10:08:24AM +0800, Robert Hoo wrote:
> > > Since commit fa4518741e (target-i386: Rename struct XMMReg to
> > > ZMMReg),
> > > CPUX86State.xmm_regs[] has already been extended to 512bit to
> > > support
> > > AVX512.
> > > Also, other qemu level supports for AVX512 registers are there
> > > for
> > > years.
> > > But in x86_cpu_dump_state(), still only dump XMM registers no
> > > matter
> > > YMM/ZMM is enabled.
> > > This patch is to complement this, let it dump XMM/YMM/ZMM
> > > accordingly.
> > > 
> > > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > 
> > Queued for 6.1, thanks!
> 
> Dequeuing, as it causes build failures on multiple configs:
> 
> https://gitlab.com/ehabkost/qemu/-/pipelines/288890306
> 
> Example:
> 
> 
> ../target/i386/cpu-dump.c: In function 'x86_cpu_dump_state':
> ../target/i386/cpu-dump.c:511:50: error: format '%lx' expects
> argument of type 'long unsigned int', but argument 4 has type
> 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
>                  qemu_fprintf(f, "Opmask%02d=%016lx%s", i, env-
> >opmask_regs[i],
>                                              ~~~~~^        ~~~~~~~~~~
> ~~~~~~~~~
>                                              %016llx
> ../target/i386/cpu-dump.c:517:47: error: format '%lx' expects
> argument of type 'long unsigned int', but argument 4 has type
> 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
>                  qemu_fprintf(f, "ZMM%02d=%016lx %016lx %016lx %016lx
> %016lx "
>                                           ~~~~~^
>                                           %016llx
> 
Hi Eduardo,

I've sent v6 
https://patchwork.kernel.org/project/qemu-devel/patch/1618986232-73826-1-git-send-email-robert.hu@linux.intel.com/
, would you retest and queue it?
Thanks.

> 


