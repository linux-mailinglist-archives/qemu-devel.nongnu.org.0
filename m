Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5784944BBD7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 07:56:35 +0100 (CET)
Received: from localhost ([::1]:57650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkhX8-0000pu-Go
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 01:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mkhWJ-0007tj-7F
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:55:43 -0500
Received: from mga06.intel.com ([134.134.136.31]:21216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mkhWH-0002c0-Ha
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:55:42 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293445977"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="293445977"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 22:55:36 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="503845778"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 09 Nov 2021 22:55:34 -0800
Date: Wed, 10 Nov 2021 14:41:00 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, thuth@redhat.com
Subject: Re: [PULL 05/33] i386: Add 'sgx-epc' device to expose EPC sections
 to guest
Message-ID: <20211110064100.GA2950@yangzhon-Virtual>
References: <20210928125116.183620-1-pbonzini@redhat.com>
 <20210928125116.183620-6-pbonzini@redhat.com>
 <32078e7f-608c-2c62-b92e-58efb6f6d241@redhat.com>
 <59c77978-a099-a25f-5d84-7ee3489ac3a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59c77978-a099-a25f-5d84-7ee3489ac3a3@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, qemu-devel@nongnu.org,
 sean.j.christopherson@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 06:48:59PM +0100, Paolo Bonzini wrote:
> On 11/9/21 15:25, Thomas Huth wrote:
> >Our device-crash-test script reports that this new device can be
> >used to crash QEMU:
> >
> >$ ./qemu-system-x86_64 -M none -device sgx-epc
> >/home/thuth/devel/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object
> >0x55c80d332290 is not an instance of type generic-pc-machine
> >
> >Should it be marked with:
> >
> >     dc->user_creatable = false
> >
> >?
> 
> Yes, it should.  Thanks for the report!
>

  Thanks Thomas reported this issue!

  I did not know we need do this test before. this test is not
  covered into Qemu Gitlab CI build system? or what's kind of tests we
  need do before we send the patches to Qemu community? If there is one
  guide or CI build including this, which is much better. Thanks!

  Yang

 
> Paolo

