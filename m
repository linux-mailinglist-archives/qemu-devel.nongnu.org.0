Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7B134A969
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:17:53 +0100 (CET)
Received: from localhost ([::1]:36388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnHc-0004iK-QQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPnGa-0004HN-Ci
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:16:48 -0400
Received: from mga06.intel.com ([134.134.136.31]:8432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1lPnGY-00051k-AL
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:16:48 -0400
IronPort-SDR: Zu/AxSggNYma7KFLlJ7QRKVGh/I457rL4CGFd5ZXr5wutFtTKXqVOqTcYcygYWI2VvMX+DN+fz
 GYelD/zCOtqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="252507216"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="252507216"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 07:16:43 -0700
IronPort-SDR: C0x/vQn7wAlK5dAOgwaIlowdwBrdoV3Vm2W8YrfRWyjeknrsI/yfOLh0HbkW5mZrp5xCnKseLB
 meea4F/BDbnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="594185098"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga005.jf.intel.com with ESMTP; 26 Mar 2021 07:16:42 -0700
Message-ID: <5f2371ec8a0a67947a0ace04348b18308f34c55c.camel@linux.intel.com>
Subject: Re: [PATCH v3] i386/cpu_dump: support AVX512 ZMM regs dump
From: Robert Hoo <robert.hu@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com, 
 ehabkost@redhat.com
Date: Fri, 26 Mar 2021 22:16:41 +0800
In-Reply-To: <54b5fe3c-5bfe-209a-9600-4a86fefb7b2c@linaro.org>
References: <1616572804-7898-1-git-send-email-robert.hu@linux.intel.com>
 <fc15756c-755d-fc96-80f4-ac9d6f6b461b@linaro.org>
 <09e24732185ed4df204063a6446c39ae4805d4f6.camel@linux.intel.com>
 <30be732d-50ce-d11c-88c6-f23e2e2d1c48@linaro.org>
 <4226b2c42eb896dc917f096d14c7d38850d9ec80.camel@linux.intel.com>
 <54b5fe3c-5bfe-209a-9600-4a86fefb7b2c@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-03-26 at 07:11 -0600, Richard Henderson wrote:
> On 3/25/21 7:47 PM, Robert Hoo wrote:
> > On Thu, 2021-03-25 at 06:39 -0600, Richard Henderson wrote:
> > > On 3/24/21 9:15 PM, Robert Hoo wrote:
> > > > > > +        } else if (env->xcr0 & XFEATURE_AVX) {
> > > > > 
> > > > > This is normally a 2-bit test.
> > > > 
> > > > I beg your pardon. What 2 bits?
> > > 
> > > I forget the names, but isn't the usual test xcr0 & 6 == 6?
> > 
> > 6 stands for SSE state-component and AVX state-component.
> > I'm not sure about this.
> > Can you remember where did you this "xcr0 & 6 == 6"? I can look
> > into
> > that.
> 
> IA-64 and IA32 Software developers manual, Vol 1 Basic Architecture,
> Section 
> 14.3 Detection of AVX instructions.

OK, thanks Richard. If use the feature detection criteria here, then
AVX512 case will also need XCR0[2:1]='11b'.
I'm going to send v4 soon.
> 
> 
> r~


