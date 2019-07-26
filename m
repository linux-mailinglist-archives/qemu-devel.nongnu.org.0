Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F975BFF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 02:19:18 +0200 (CEST)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqnx7-0004Kc-49
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 20:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hqnwu-0003v7-Oe
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 20:19:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hqnwt-0000Jz-Q6
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 20:19:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:52567)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hqnwt-0000Hy-Hc
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 20:19:03 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 17:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="198122683"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2019 17:18:56 -0700
Date: Thu, 25 Jul 2019 20:12:52 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190726001251.GA27883@joy-OptiPlex-7040>
References: <1563261042-15974-1-git-send-email-yan.y.zhao@intel.com>
 <20190725103907.GD2656@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725103907.GD2656@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: Re: [Qemu-devel] [PATCH] migration: notify runstate immediately
 before vcpu stops
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
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "crosthwaite.peter@gmail.com" <crosthwaite.peter@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 25, 2019 at 06:39:07PM +0800, Dr. David Alan Gilbert wrote:
> * Yan Zhao (yan.y.zhao@intel.com) wrote:
> > for some devices to do live migration, it is needed to do something
> > immediately before vcpu stops. add a notification here.
> > 
> > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > ---
> >  cpus.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/cpus.c b/cpus.c
> > index b09b702..d5d4abe 100644
> > --- a/cpus.c
> > +++ b/cpus.c
> > @@ -1068,6 +1068,7 @@ static int do_vm_stop(RunState state, bool send_stop)
> >      int ret = 0;
> >  
> >      if (runstate_is_running()) {
> > +        vm_state_notify(1, state);
> 
> SO that's quite interesting in that you'll end up getting a
> notificatiion like 'running=true, state=RUN_STATE_SHUTDOWN'
> that might be unexpected by existing callers.
> 
> Have you checked existing callers?  Also does this cause another event
> to be sent on the QMP - if so we need to chekc if this would confuse
> libvirt.
> 
> Dave

hi Dave
yes, this may cause problem for existing handlers as this is an
unexpected condition. like for ide's ide_restart_cb.
So, do you think it's a better that do the notification earlier, before
vm_stop_force_state() in migration.c and call notifier_list_notify(&migration_state_notifiers, s)
to notify migration state instead ?

Thanks
Yan



> 
> >          cpu_disable_ticks();
> >          pause_all_vcpus();
> >          runstate_set(state);
> > -- 
> > 2.7.4
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

