Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A2C6A384
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 10:04:19 +0200 (CEST)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnIRe-0005kk-4L
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 04:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56583)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hnIRO-0005MC-Vx
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:04:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hnIRN-0005tX-1m
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:04:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:59507)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hnIRL-0005oh-9x
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:04:00 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 01:03:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,497,1557212400"; d="scan'208";a="187290508"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2019 01:03:51 -0700
Date: Tue, 16 Jul 2019 03:57:49 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Peter Xu <zhexu@redhat.com>
Message-ID: <20190716075749.GB8912@joy-OptiPlex-7040>
References: <1563261042-15974-1-git-send-email-yan.y.zhao@intel.com>
 <20190716072315.GA30980@xz-x1>
 <20190716072919.GA8912@joy-OptiPlex-7040>
 <20190716075025.GB30980@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716075025.GB30980@xz-x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
 "crosthwaite.peter@gmail.com" <crosthwaite.peter@gmail.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 16, 2019 at 03:50:25PM +0800, Peter Xu wrote:
> On Tue, Jul 16, 2019 at 03:29:19AM -0400, Yan Zhao wrote:
> > On Tue, Jul 16, 2019 at 03:23:16PM +0800, Peter Xu wrote:
> > > On Tue, Jul 16, 2019 at 03:10:42PM +0800, Yan Zhao wrote:
> > > > for some devices to do live migration, it is needed to do something
> > > > immediately before vcpu stops. add a notification here.
> > > 
> > > Hi, Yan,
> > > 
> > > Could I ask for a more detailed commit message here?  E.g., what is
> > > "some devices"?  And, what's the problem behind?
> > >
> > hi Peter,
> > 
> > Some devices refer to assigned devices, like NICs.
> > For assigned devices to do live migration, it is sometimes required that
> > source device is stopped before stopping source vcpus. vcpus can do some
> > final cleanups (like handling interrupt) in that case.
> 
> I see, so this is a prerequisite of another work?

Yes.
> 
> IMHO it would make more sense to have this patch to be with that
> patchset, then it'll justify itself with reasoning.  Unless I
> misunderstood - this single patch seems to help nothing if as a
> standalone one.

It would be better. but this patch alone is also somewhat general,
as it only adds an extra notification and wouldn't impact others.

Only after this patch is upstreamed, can VFIO live migration have a
second choice for those devices of special requirements.

Hope it can get understanding from you:)

Or do you think I need to change the commit message a little to unbind
from migration?

Thanks
Yan


