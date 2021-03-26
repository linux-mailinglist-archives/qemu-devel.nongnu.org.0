Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E2349F0A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 02:49:34 +0100 (CET)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPbbR-0007SU-JK
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 21:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPbZL-0006U2-Sx
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 21:47:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:30370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPbZJ-0007wl-Rm
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 21:47:23 -0400
IronPort-SDR: DdpkQfRZVCla/oWNbG46qVtoVNDv9Zqy2U8x2rvHDASp5rFAFG5dveEt0yPtmedv1+w+By1gRy
 FsAiqLguIIdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="171038955"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="171038955"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 18:47:18 -0700
IronPort-SDR: yikxj4+lHiw9n2BSBhKfXJ+X4Fu2+Dh0tRV3lkrMeQLChXq3fTk/eDbsc4jaHm/Iwi9U5bwm2F
 21fT1SeQ90Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="375303310"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 25 Mar 2021 18:47:17 -0700
Message-ID: <4226b2c42eb896dc917f096d14c7d38850d9ec80.camel@linux.intel.com>
Subject: Re: [PATCH v3] i386/cpu_dump: support AVX512 ZMM regs dump
From: Robert Hoo <robert.hu@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com, 
 ehabkost@redhat.com
Date: Fri, 26 Mar 2021 09:47:16 +0800
In-Reply-To: <30be732d-50ce-d11c-88c6-f23e2e2d1c48@linaro.org>
References: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
 <fc15756c-755d-fc96-80f4-ac9d6f6b461b@linaro.org>
 <09e24732185ed4df204063a6446c39ae4805d4f6.camel@linux.intel.com>
 <30be732d-50ce-d11c-88c6-f23e2e2d1c48@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-8.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=robert.hu@linux.intel.com; helo=mga17.intel.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-03-25 at 06:39 -0600, Richard Henderson wrote:
> On 3/24/21 9:15 PM, Robert Hoo wrote:
> > > > +        } else if (env->xcr0 & XFEATURE_AVX) {
> > > 
> > > This is normally a 2-bit test.
> > 
> > I beg your pardon. What 2 bits?
> 
> I forget the names, but isn't the usual test xcr0 & 6 == 6?

6 stands for SSE state-component and AVX state-component.
I'm not sure about this.
Can you remember where did you this "xcr0 & 6 == 6"? I can look into
that.
> 
> > BTW, checkpatch didn't warn me on this. It escaped.:)
> 
> Heh.
> 
> 
> r~


