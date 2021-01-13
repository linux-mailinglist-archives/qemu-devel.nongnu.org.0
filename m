Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ECA2F4DCB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:54:48 +0100 (CET)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhXr-0000T4-Lc
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1kzhVz-0007wJ-3n
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:52:55 -0500
Received: from mga04.intel.com ([192.55.52.120]:28416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1kzhVw-00077F-9o
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:52:50 -0500
IronPort-SDR: y20Y8le+rMdpMvhttFO+Ln8pShZr6AxcQlqpkR199dzL8bdjsFIyktrH2jD28G2AE3w5ZRPvGZ
 83bH/Sp73uoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="175632474"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="175632474"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 06:52:44 -0800
IronPort-SDR: G181oUDAcx0VC3s/+iiipOX6i5cCNjzRI8PoRGKEXKH8lh1X69Ym0Yt6zNhBf97J6iDuG8WiEw
 nbwTA4A1L6zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="464925027"
Received: from local-michael-cet-test.sh.intel.com (HELO localhost)
 ([10.239.159.172])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2021 06:52:43 -0800
Date: Wed, 13 Jan 2021 23:04:29 +0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
Message-ID: <20210113150429.GA29878@local-michael-cet-test.sh.intel.com>
References: <20210113090430.26394-1-weijiang.yang@intel.com>
 <5dd8016f-dc18-ee4d-c150-5deabe60e559@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dd8016f-dc18-ee4d-c150-5deabe60e559@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=weijiang.yang@intel.com; helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>, qemu-devel@nongnu.org,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 11:06:09AM +0100, Paolo Bonzini wrote:
> On 13/01/21 10:04, Yang Weijiang wrote:
> > QEMU option -cpu max(max_features) means "Enables all features supported by
> > the accelerator in the current host", this looks true for all the features
> > except guest max physical address width, so add this patch to enable it.
> > 
> > Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> > ---
> >   target/i386/cpu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 35459a38bb..b5943406f7 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> >                   warned = true;
> >               }
> > -            if (cpu->host_phys_bits) {
> > +            if (cpu->host_phys_bits || cpu->max_features) {
> >                   /* The user asked for us to use the host physical bits */
> >                   cpu->phys_bits = host_phys_bits;
> >                   if (cpu->host_phys_bits_limit &&
> > 
> 
> Can you check if this works?
> 
Hi, Paolo,
Yes, below change works for kvm-unit-test/access. Would you add the
patch? 

Thanks!

> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 35459a38bb..72a79e6019 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4319,6 +4319,7 @@ static void max_x86_cpu_initfn(Object *obj)
>          if (lmce_supported()) {
>              object_property_set_bool(OBJECT(cpu), "lmce", true,
> &error_abort);
>          }
> +        object_property_set_bool(OBJECT(cpu), "host-phys-bits", true,
> &error_abort);
>      } else {
>          object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
>                                  &error_abort);
> 
> 
> It should allow people to use -cpu max,host-phys-bits=false.
> 
> Thanks,
> 
> Paolo

