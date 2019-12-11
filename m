Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15711A07B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 02:28:59 +0100 (CET)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieqoE-0006s2-JE
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 20:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yan.y.zhao@intel.com>) id 1ieqnL-0006Qs-EF
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 20:28:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1ieqnI-0000C4-Cl
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 20:28:02 -0500
Received: from mga18.intel.com ([134.134.136.126]:56527)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1ieqnI-00006H-3z
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 20:28:00 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 17:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="245060376"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2019 17:27:52 -0800
Date: Tue, 10 Dec 2019 20:19:41 -0500
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC PATCH 1/9] vfio/pci: introduce mediate ops to intercept
 vfio-pci ops
Message-ID: <20191211011941.GB28339@joy-OptiPlex-7040>
References: <20191205032419.29606-1-yan.y.zhao@intel.com>
 <20191205032536.29653-1-yan.y.zhao@intel.com>
 <20191205165519.106bd210@x1.home>
 <20191206075655.GG31791@joy-OptiPlex-7040>
 <20191206142226.2698a2be@x1.home>
 <20191209034225.GK31791@joy-OptiPlex-7040>
 <20191209170339.2cb3d06e@x1.home>
 <20191210024422.GA27331@joy-OptiPlex-7040>
 <20191210095824.5c4cdad7@x1.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210095824.5c4cdad7@x1.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "He,
 Shaopeng" <shaopeng.he@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 11, 2019 at 12:58:24AM +0800, Alex Williamson wrote:
> On Mon, 9 Dec 2019 21:44:23 -0500
> Yan Zhao <yan.y.zhao@intel.com> wrote:
> 
> > > > > > Currently, yes, i40e has build dependency on vfio-pci.
> > > > > > It's like this, if i40e decides to support SRIOV and compiles in vf
> > > > > > related code who depends on vfio-pci, it will also have build dependency
> > > > > > on vfio-pci. isn't it natural?    
> > > > > 
> > > > > No, this is not natural.  There are certainly i40e VF use cases that
> > > > > have no interest in vfio and having dependencies between the two
> > > > > modules is unacceptable.  I think you probably want to modularize the
> > > > > i40e vfio support code and then perhaps register a table in vfio-pci
> > > > > that the vfio-pci code can perform a module request when using a
> > > > > compatible device.  Just and idea, there might be better options.  I
> > > > > will not accept a solution that requires unloading the i40e driver in
> > > > > order to unload the vfio-pci driver.  It's inconvenient with just one
> > > > > NIC driver, imagine how poorly that scales.
> > > > >     
> > > > what about this way:
> > > > mediate driver registers a module notifier and every time when
> > > > vfio_pci is loaded, register to vfio_pci its mediate ops?
> > > > (Just like in below sample code)
> > > > This way vfio-pci is free to unload and this registering only gives
> > > > vfio-pci a name of what module to request.
> > > > After that,
> > > > in vfio_pci_open(), vfio-pci requests the mediate driver. (or puts
> > > > the mediate driver when mediate driver does not support mediating the
> > > > device)
> > > > in vfio_pci_release(), vfio-pci puts the mediate driver.
> > > > 
> > > > static void register_mediate_ops(void)
> > > > {
> > > >         int (*func)(struct vfio_pci_mediate_ops *ops) = NULL;
> > > > 
> > > >         func = symbol_get(vfio_pci_register_mediate_ops);
> > > > 
> > > >         if (func) {
> > > >                 func(&igd_dt_ops);
> > > >                 symbol_put(vfio_pci_register_mediate_ops);
> > > >         }
> > > > }
> > > > 
> > > > static int igd_module_notify(struct notifier_block *self,
> > > >                               unsigned long val, void *data)
> > > > {
> > > >         struct module *mod = data;
> > > >         int ret = 0;
> > > > 
> > > >         switch (val) {
> > > >         case MODULE_STATE_LIVE:
> > > >                 if (!strcmp(mod->name, "vfio_pci"))
> > > >                         register_mediate_ops();
> > > >                 break;
> > > >         case MODULE_STATE_GOING:
> > > >                 break;
> > > >         default:
> > > >                 break;
> > > >         }
> > > >         return ret;
> > > > }
> > > > 
> > > > static struct notifier_block igd_module_nb = {
> > > >         .notifier_call = igd_module_notify,
> > > >         .priority = 0,
> > > > };
> > > > 
> > > > 
> > > > 
> > > > static int __init igd_dt_init(void)
> > > > {
> > > > 	...
> > > > 	register_mediate_ops();
> > > > 	register_module_notifier(&igd_module_nb);
> > > > 	...
> > > > 	return 0;
> > > > }  
> > > 
> > > 
> > > No, this is bad.  Please look at MODULE_ALIAS() and request_module() as
> > > used in the vfio-platform for loading reset driver modules.  I think
> > > the correct approach is that vfio-pci should perform a request_module()
> > > based on the device being probed.  Having the mediation provider
> > > listening for vfio-pci and registering itself regardless of whether we
> > > intend to use it assumes that we will want to use it and assumes that
> > > the mediation provider module is already loaded.  We should be able to
> > > support demand loading of modules that may serve no other purpose than
> > > providing this mediation.  Thanks,  
> > hi Alex
> > Thanks for this message.
> > So is it good to create a separate module as mediation provider driver,
> > and alias its module name to "vfio-pci-mediate-vid-did".
> > Then when vfio-pci probes the device, it requests module of that name ?
> 
> I think this would give us an option to have the mediator as a separate
> module, but not require it.  Maybe rather than a request_module(),
> where if we follow the platform reset example we'd then expect the init
> code for the module to register into a list, we could do a
> symbol_request().  AIUI, this would give us a reference to the symbol
> if the module providing it is already loaded, and request a module
> (perhaps via an alias) if it's not already load.  Thanks,
> 
ok. got it!
Thank you :)

Yan

