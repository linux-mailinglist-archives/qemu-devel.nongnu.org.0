Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F30A40D158
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:44:48 +0200 (CEST)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgSF-00062Q-Mg
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQgR4-0005M2-CY
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 21:43:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:60305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mQgR2-0004ZA-6y
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 21:43:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="201963455"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="201963455"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 18:43:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; d="scan'208";a="553620132"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 15 Sep 2021 18:43:28 -0700
Date: Thu, 16 Sep 2021 09:29:30 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 04/33] i386: Add 'sgx-epc' device to expose EPC
 sections to guest
Message-ID: <20210916012930.GA31727@yangzhon-Virtual>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-5-yang.zhong@intel.com>
 <6a2fe37a-0016-018d-ff41-77f1e57b8aeb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a2fe37a-0016-018d-ff41-77f1e57b8aeb@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=192.55.52.136; envelope-from=yang.zhong@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Sep 14, 2021 at 08:36:24AM +0200, Philippe Mathieu-Daudé wrote:
> On 7/19/21 1:21 PM, Yang Zhong wrote:
> > From: Sean Christopherson <sean.j.christopherson@intel.com>
> > 
> > SGX EPC is enumerated through CPUID, i.e. EPC "devices" need to be
> > realized prior to realizing the vCPUs themselves, which occurs long
> > before generic devices are parsed and realized.  Because of this,
> > do not allow 'sgx-epc' devices to be instantiated after vCPUS have
> > been created.
> > 
> > The 'sgx-epc' device is essentially a placholder at this time, it will
> > be fully implemented in a future patch along with a dedicated command
> > to create 'sgx-epc' devices.
> > 
> > Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > ---
> >  hw/i386/meson.build       |   1 +
> >  hw/i386/sgx-epc.c         | 161 ++++++++++++++++++++++++++++++++++++++
> >  include/hw/i386/sgx-epc.h |  44 +++++++++++
> >  3 files changed, 206 insertions(+)
> >  create mode 100644 hw/i386/sgx-epc.c
> >  create mode 100644 include/hw/i386/sgx-epc.h
> > 
> > diff --git a/hw/i386/meson.build b/hw/i386/meson.build
> > index 80dad29f2b..27476b36bb 100644
> > --- a/hw/i386/meson.build
> > +++ b/hw/i386/meson.build
> > @@ -5,6 +5,7 @@ i386_ss.add(files(
> >    'e820_memory_layout.c',
> >    'multiboot.c',
> >    'x86.c',
> > +  'sgx-epc.c',
> >  ))
> >  
> >  i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
> > diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
> > new file mode 100644
> > index 0000000000..aa487dea79
> > --- /dev/null
> > +++ b/hw/i386/sgx-epc.c
> > @@ -0,0 +1,161 @@
> > +/*
> > + * SGX EPC device
> > + *
> > + * Copyright (C) 2019 Intel Corporation
> > + *
> > + * Authors:
> > + *   Sean Christopherson <sean.j.christopherson@intel.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +#include "qemu/osdep.h"
> > +#include "hw/i386/pc.h"
> > +#include "hw/i386/sgx-epc.h"
> > +#include "hw/mem/memory-device.h"
> > +#include "hw/qdev-properties.h"
> > +#include "monitor/qdev.h"
> 
> Is that include used?
> 
> > +#include "qapi/error.h"
> > +#include "qapi/visitor.h"
> > +#include "qemu/config-file.h"
> 
> Ditto.
> 
> > +#include "qemu/error-report.h"
> 
> Ditto.
> 
> > +#include "qemu/option.h"
> 
> Ditto.
> 
> > +#include "qemu/units.h"
> 
> Ditto.
>
 
  Thanks Philippe, those header files have been removed in the Paolo's
  gitlab(sgx branch), thanks!

  Yang

 
> > +#include "target/i386/cpu.h"
> > +#include "exec/address-spaces.h"

