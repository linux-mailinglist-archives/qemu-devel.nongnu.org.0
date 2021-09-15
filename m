Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5442D40C497
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 13:50:54 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTRF-0004f8-DB
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 07:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQTOH-0002Mc-El
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:47:49 -0400
Received: from mga14.intel.com ([192.55.52.115]:2234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQTOE-0000ak-6D
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 07:47:48 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="221958673"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="221958673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 04:47:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544811253"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 15 Sep 2021 04:47:36 -0700
Date: Wed, 15 Sep 2021 19:33:38 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 23/33] sgx-epc: Add the reset interface for sgx-epc
 virt device
Message-ID: <20210915113338.GB30272@yangzhon-Virtual>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-24-yang.zhong@intel.com>
 <77caedf9-31bb-c245-d5b5-20b9792a57ed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77caedf9-31bb-c245-d5b5-20b9792a57ed@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 qemu-devel@nongnu.org, jarkko@kernel.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 08:53:48AM +0200, Philippe Mathieu-Daudé wrote:
> On 7/19/21 1:21 PM, Yang Zhong wrote:
> > If the VM is reset, we need make sure sgx virt epc in clean status.
> > Once the VM is reset, and sgx epc virt device will be reseted by
> > reset callback registered by qemu_register_reset(). Since this epc
> > virt device depend on backend, this reset will call backend reset
> > interface to re-mmap epc to guest.
> > 
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hw/i386/sgx-epc.c | 94 ++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 81 insertions(+), 13 deletions(-)
> > 
> > diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> > index 924dea22f0..9880d832d5 100644
> > --- a/hw/i386/sgx-epc.c
> > +++ b/hw/i386/sgx-epc.c
> > @@ -18,6 +18,9 @@
> >  #include "qapi/visitor.h"
> >  #include "target/i386/cpu.h"
> >  #include "exec/address-spaces.h"
> > +#include "sysemu/reset.h"
> > +
> > +uint32_t epc_num;
> 
> Missing 'static' qualifier.

  Philippe, thanks! This Qemu SGX reset solution will be replaced by kernel
  patchset made by Paolo(https://www.spinics.net/lists/kvm/msg253930.html).

  Yang
 

