Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6EF51DE30
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 19:11:12 +0200 (CEST)
Received: from localhost ([::1]:49974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn1Tz-0001d7-0w
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 13:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nn1SR-0008Uu-Hy
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:09:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:48802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nn1SP-0003db-S7
 for qemu-devel@nongnu.org; Fri, 06 May 2022 13:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651856973; x=1683392973;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MQl4lNC5AE5M7DDUDIos/VtudUXNK+BGY2jQOWwnWlc=;
 b=hS0HIOgePrzgE8dTFt/d6+ObvOUzC/SDoHsPMAFflYHKsemlmndg7SDr
 76XA2Oid9dvtX/1LisS3Coht2uBFkxrclgNnGsfdZMZG+2a8RbKCT0j8g
 pn+fDR74/hDivPLqHTiovWpKyFkOjuWKWpPjviHHyZnjtmMVmzHNmssc3
 FC1sbCZbFPRap1MErJT4UxvpA/EMv53/7fD/62lZDvUa0h1k/Lcqe/5bx
 AvEt2pig+DaK7cVcog8D+TBqYvE386LwN/oL99875ZccX1f29aJCkgV9W
 82NauOiBd7H9HKLW2U7Q9Y9L5RMw5DjclIK+tU5nVoMMo1oCWrPM9HpnU Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268418695"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="268418695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:09:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="709555465"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.121.200.203])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:09:31 -0700
Date: Fri, 6 May 2022 10:09:30 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] virtio-gpu: update done only on the scanout associated
 with rect
Message-ID: <20220506170930.GB369@dongwonk-MOBL.amr.corp.intel.com>
References: <20220505214030.4261-1-dongwon.kim@intel.com>
 <CAJ+F1CJ_vLG31zk9y2rphOy3y+NhVkn1VSriSXYv4mXCbFEWJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CJ_vLG31zk9y2rphOy3y+NhVkn1VSriSXYv4mXCbFEWJQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 06, 2022 at 11:53:22AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, May 6, 2022 at 1:46 AM Dongwon Kim <dongwon.kim@intel.com> wrote:
> 
> > It only needs to update the scanouts containing the rect area
> > coming with the resource-flush request from the guest.
> >
> >
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  hw/display/virtio-gpu.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > index 529b5246b2..165ecafd7a 100644
> > --- a/hw/display/virtio-gpu.c
> > +++ b/hw/display/virtio-gpu.c
> > @@ -514,6 +514,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
> >          for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
> >              scanout = &g->parent_obj.scanout[i];
> >              if (scanout->resource_id == res->resource_id &&
> > +                rf.r.x >= scanout->x && rf.r.y >= scanout->y &&
> > +                rf.r.x + rf.r.width <= scanout->x + scanout->width &&
> > +                rf.r.y + rf.r.height <= scanout->y + scanout->height &&
> >
> 
> 
> That doesn't seem to handle intersections/overlapping, I think it should.

so set-scanouts and resource flushes are issued per scanout(CRTC/plane
from guest's point of view). In case of intersections/overlapping, there
will be two resource flushes (in case there are two scanouts) and each
resource flush will take care of updating the scanout that covers
partial damaged area.

The problem with the original code is that even if there is a resource
flush request for a single scanout, it does update on both (or more) as
well, which is unnecessary burden.

Thanks

> 
> 
> >                  console_has_gl(scanout->con)) {
> >                  dpy_gl_update(scanout->con, 0, 0, scanout->width,
> >                                scanout->height);
> > --
> > 2.30.2
> >
> >
> >
> 
> -- 
> Marc-André Lureau

