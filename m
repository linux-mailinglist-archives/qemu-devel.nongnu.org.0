Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F374043E3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 05:17:32 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOAZ8-0005YP-6n
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 23:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOAXc-0004A7-A0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:15:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:56394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mOAXa-0007SW-4r
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:15:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200861916"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="200861916"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 20:15:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; d="scan'208";a="539228617"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 08 Sep 2021 20:15:46 -0700
Date: Thu, 9 Sep 2021 11:01:52 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PULL v4 13/43] vl: Add sgx compound properties to expose SGX
 EPC sections to guest
Message-ID: <20210909030152.GD21362@yangzhon-Virtual>
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <20210908100426.264356-14-pbonzini@redhat.com>
 <20210908145240.baqge5v2kovmoq5m@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908145240.baqge5v2kovmoq5m@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 09:52:40AM -0500, Eric Blake wrote:
> On Wed, Sep 08, 2021 at 12:03:56PM +0200, Paolo Bonzini wrote:
> > From: Sean Christopherson <sean.j.christopherson@intel.com>
> > 
> > Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
> > realized prior to realizing the vCPUs themselves, i.e. long before
> > generic devices are parsed and realized.  From a virtualization
> > perspective, the CPUID aspect also means that EPC sections cannot be
> > hotplugged without paravirtualizing the guest kernel (hardware does
> > not support hotplugging as EPC sections must be locked down during
> > pre-boot to provide EPC's security properties).
> > 
> 
> >  qapi/machine.json         | 26 +++++++++++++++
> >  qemu-options.hx           | 10 ++++--
> >  9 files changed, 166 insertions(+), 8 deletions(-)
> >  create mode 100644 hw/i386/sgx.c
> ...
> > +++ b/qapi/machine.json
> > @@ -1194,6 +1194,32 @@
> >            }
> >  }
> >  
> > +##
> > +# @SgxEPC:
> > +#
> > +# Sgx EPC cmdline information
> > +#
> > +# @memdev: memory backend linked with device
> > +#
> > +# Since: 6.1
> 
> Another instance where we'll want the followup patch to correct things
> to 6.2.
> 
  
  Eric, i will cleanup this in the next version of https://patchew.org/QEMU/20210908081937.77254-1-yang.zhong@intel.com/.
  There is one special patch to do pure cleanup based on this PULL. thanks!

  Yang


