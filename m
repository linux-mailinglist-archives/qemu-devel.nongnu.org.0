Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E714089D2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:03:40 +0200 (CEST)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjkR-0005NC-60
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPjhI-0004IT-AL
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:00:24 -0400
Received: from mga09.intel.com ([134.134.136.24]:7292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mPjhF-0006Pe-TP
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:00:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221679986"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="221679986"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 04:00:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="551564223"
Received: from yangzhon-virtual.bj.intel.com (HELO yangzhon-Virtual)
 ([10.238.144.101])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 13 Sep 2021 04:00:15 -0700
Date: Mon, 13 Sep 2021 18:46:19 +0800
From: Yang Zhong <yang.zhong@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/3] monitor: Add HMP and QMP interfaces
Message-ID: <20210913104619.GC27331@yangzhon-Virtual>
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-2-yang.zhong@intel.com>
 <YTthmPn2KGcfNX21@redhat.com> <YT8bboSgYfWJP9kh@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YT8bboSgYfWJP9kh@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, eblake@redhat.com, qemu-devel@nongnu.org,
 seanjc@google.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 10:35:42AM +0100, Daniel P. Berrangé wrote:
> On Fri, Sep 10, 2021 at 02:46:00PM +0100, Daniel P. Berrangé wrote:
> > On Fri, Sep 10, 2021 at 06:22:56PM +0800, Yang Zhong wrote:
> > > The QMP and HMP interfaces can be used by monitor or QMP tools to retrieve
> > > the SGX information from VM side when SGX is enabled on Intel platform.
> > > 
> > > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > > ---
> > >  hmp-commands-info.hx         | 15 +++++++++++++
> > >  hw/i386/sgx.c                | 29 ++++++++++++++++++++++++
> > >  include/hw/i386/sgx.h        | 11 +++++++++
> > >  include/monitor/hmp-target.h |  1 +
> > >  qapi/misc-target.json        | 43 ++++++++++++++++++++++++++++++++++++
> > >  target/i386/monitor.c        | 36 ++++++++++++++++++++++++++++++
> > >  tests/qtest/qmp-cmd-test.c   |  1 +
> > >  7 files changed, 136 insertions(+)
> > >  create mode 100644 include/hw/i386/sgx.h
> > 
> > > diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> > > index 02fa6487c3..8a32d62d7e 100644
> > > --- a/hw/i386/sgx.c
> > > +++ b/hw/i386/sgx.c
> > > @@ -17,6 +17,35 @@
> > >  #include "monitor/qdev.h"
> > >  #include "qapi/error.h"
> > >  #include "exec/address-spaces.h"
> > > +#include "hw/i386/sgx.h"
> > > +
> > > +SGXInfo *sgx_get_info(void)
> > 
> > I'd suggest this should have an 'Error **errp'

    Thanks, the new version will add this variable. thanks!


> > 
> > > +{
> > > +    SGXInfo *info = NULL;
> > > +    X86MachineState *x86ms;
> > > +    PCMachineState *pcms =
> > > +        (PCMachineState *)object_dynamic_cast(qdev_get_machine(),
> > > +                                              TYPE_PC_MACHINE);
> > > +    if (!pcms) {
> > 
> >   error_setg(errp, "SGX is only available for x86 PC machines");
> > 

      Yes, i will add this, thanks!


> > > +        return NULL;
> > > +    }
> > > +
> > > +    x86ms = X86_MACHINE(pcms);
> > > +    if (!x86ms->sgx_epc_list) {
> > 
> >   error_setg(errp "SGX is not enabled on this machine");
> > 
 
      Ditto, thanks!


> > > +        return NULL;
> > > +    }
> > > +
> > > +    SGXEPCState *sgx_epc = &pcms->sgx_epc;
> > > +    info = g_new0(SGXInfo, 1);
> > > +
> > > +    info->sgx = true;
> > > +    info->sgx1 = true;
> > > +    info->sgx2 = true;
> > > +    info->flc = true;
> > > +    info->section_size = sgx_epc->size;
> > > +
> > > +    return info;
> > > +}
> > 
> > 
> > 
> > > diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> > > index 119211f0b0..0f1b48b4f8 100644
> > > --- a/target/i386/monitor.c
> > > +++ b/target/i386/monitor.c
> > > @@ -35,6 +35,7 @@
> > >  #include "qapi/qapi-commands-misc-target.h"
> > >  #include "qapi/qapi-commands-misc.h"
> > >  #include "hw/i386/pc.h"
> > > +#include "hw/i386/sgx.h"
> > >  
> > >  /* Perform linear address sign extension */
> > >  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> > > @@ -763,3 +764,38 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
> > >  {
> > >      return sev_get_attestation_report(mnonce, errp);
> > >  }
> > > +
> > > +SGXInfo *qmp_query_sgx(Error **errp)
> > > +{
> > > +    SGXInfo *info;
> > > +
> > > +    info = sgx_get_info();
> > 
> > Pass errp into this

    Thanks, i will add this.


> > 
> > > +    if (!info) {
> > > +        error_setg(errp, "SGX features are not available");
> > 
> > And get rid of this.

    Yes, i will remove this, thanks!


> > 
> > > +        return NULL;
> > > +    }
> > > +
> > > +    return info;
> > > +}
> > > +
> > > +void hmp_info_sgx(Monitor *mon, const QDict *qdict)
> > > +{
> > 
> >   g_autoptr(Error) err = NULL
> 
> I was mistaken here - Error shouldn't use g_autoptr, just
> 
>    Error err = NULL;


    Yes, i will use this new defintion to handle it. thanks!


> 
> > 
> > > +    SGXInfo *info = qmp_query_sgx(NULL);
> > 
> > Pass in &err not NULL;
> > 
> > Also  declare it with  'g_autoptr(SGXInfo) info = ...'
> > 
> > And then
> > 
> >    if (err) {
> >       monitor_printf(mon, "%s\n", error_get_pretty(err);
> 
> Then use the simpler:
> 
>     error_report_err(err);
> 
> which prints + frees 'err'
> 

  Thanks, the new code like below:
  
  Error *err = NULL;

  SGXInfo *info = qmp_query_sgx(&err);
  if (err) {
      error_report_err(err);
      return;
  }

  ......

  I will send V3, please help review again, thanks!


  Yang



> >       return;
> >    }
> > 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

