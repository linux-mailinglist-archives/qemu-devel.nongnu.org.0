Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741773021DC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 06:33:09 +0100 (CET)
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3uUu-0007mY-1S
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 00:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1l3uRt-000782-P6
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:30:02 -0500
Received: from mga05.intel.com ([192.55.52.43]:27206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1l3uRp-0006WN-Ln
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 00:30:00 -0500
IronPort-SDR: JIfqcNZd0jXEhgI4payJLy8An9HeG3RI7mQqbRiTq+7xqVN/ETTvQbRjEp5Bn8OdIw3co5zlmF
 XqgdVh7zRYYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="264488900"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="264488900"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2021 21:29:47 -0800
IronPort-SDR: ahGkEFKGRbpxqBngxwqN4nbvvZcZeR5PAIxwekzcreUYlSU+iiJBSe+Vs8tpiF9ScZn+hPkcWu
 yEDxMsF/nzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; d="scan'208";a="406089100"
Received: from local-michael-cet-test.sh.intel.com (HELO localhost)
 ([10.239.159.172])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2021 21:29:46 -0800
Date: Mon, 25 Jan 2021 13:41:50 +0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
Message-ID: <20210125054150.GA4969@local-michael-cet-test.sh.intel.com>
References: <20210113090430.26394-1-weijiang.yang@intel.com>
 <20210124210829.GA2238365@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124210829.GA2238365@ubuntu-m3-large-x86>
User-Agent: Mutt/1.11.3 (2019-02-01)
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=weijiang.yang@intel.com; helo=mga05.intel.com
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
Cc: Yang Weijiang <weijiang.yang@intel.com>, seanjc@google.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 24, 2021 at 02:08:29PM -0700, Nathan Chancellor wrote:
> On Wed, Jan 13, 2021 at 05:04:30PM +0800, Yang Weijiang wrote:
> > QEMU option -cpu max(max_features) means "Enables all features supported by
> > the accelerator in the current host", this looks true for all the features
> > except guest max physical address width, so add this patch to enable it.
> > 
> > Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> > ---
> >  target/i386/cpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 35459a38bb..b5943406f7 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
> >                  warned = true;
> >              }
> >  
> > -            if (cpu->host_phys_bits) {
> > +            if (cpu->host_phys_bits || cpu->max_features) {
> >                  /* The user asked for us to use the host physical bits */
> >                  cpu->phys_bits = host_phys_bits;
> >                  if (cpu->host_phys_bits_limit &&
> > -- 
> > 2.17.2
> > 
> > 
> 
> Hi,
> 
> This patch as commit 5a140b255d ("x86/cpu: Use max host physical address
> if -cpu max option is applied") prevents me from using '-cpu host' while
> booting an i386_defconfig kernel.
> 
> $ qemu-system-i386 \
> -append console=ttyS0 \
> -cpu host \
> -display none \
> -enable-kvm \
> -initrd rootfs.cpio \
> -kernel bzImage \
> -serial mon:stdio
> qemu-system-i386: phys-bits should be between 32 and 36  (but is 48)
> 
> Am I expected to pass "-cpu host,host-phys-bits=false" now or did this
> do something unexpected?
>
Hi, Nathan,
Could you try Paolo's latest patch?

[PULL 03/31] x86/cpu: Use max host physical address if -cpu max option is applied

diff --git a/target/i386/cpu.c b/target/i386/cpu.c index 35459a38bb..72a79e6019 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4319,6 +4319,7 @@ static void max_x86_cpu_initfn(Object *obj)
         if (lmce_supported()) {
             object_property_set_bool(OBJECT(cpu), "lmce", true, &error_abort);
         }
+        object_property_set_bool(OBJECT(cpu), "host-phys-bits", true,
+ &error_abort);
     } else {
         object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
                                 &error_abort);
> Cheers,
> Nathan

