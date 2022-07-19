Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4657A758
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 21:40:56 +0200 (CEST)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDt5T-00080C-FP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 15:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oDt3r-0005zJ-6W
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:39:15 -0400
Received: from mga06b.intel.com ([134.134.136.31]:58818 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oDt3o-0000AA-OZ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658259552; x=1689795552;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ANfgmUdL/xK8scwEUH9ti7RpX40hpNYXJHWKVDiMkA0=;
 b=T+Ao5/n9uBs2QPwPIx5uDeu1m6OorX085kiAt0v83U3S2sgBGECRqxLu
 AC/Bj6TpckXwHzs6iexyUQh92mZDFFRJ5ZadE1dtY1z9umQfEduKzAaXf
 09mML9wNyPNO8aEOo4MPpgsF4Oy3KmT7cUCi5CaQzXwzaO2FZoPqT4wYg
 4AAnCMVtkjGMrobnXTi4eYiu1U4fM0bfcBSs5rtV7TarJk9JiNSmz7O4z
 YN2ff1/vTh/aC14hL0ebMmv6tsPgdK24tCqElhQ60nOmolRrwwaK62aFo
 nxxjXDsayIgIAT+oGAN6t6bnev/s97N2tlIDVvhForlzNN3vnFOpPoic9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="348277231"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; d="scan'208";a="348277231"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 12:39:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; d="scan'208";a="655920171"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.121.200.78])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 12:39:09 -0700
Date: Tue, 19 Jul 2022 12:39:08 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] virtio-gpu: update done only on the scanout associated
 with rect
Message-ID: <20220719193908.GA332@dongwonk-MOBL.amr.corp.intel.com>
References: <20220505214030.4261-1-dongwon.kim@intel.com>
 <CAJ+F1CJ_vLG31zk9y2rphOy3y+NhVkn1VSriSXYv4mXCbFEWJQ@mail.gmail.com>
 <20220506170930.GB369@dongwonk-MOBL.amr.corp.intel.com>
 <20220719111526.d4qnoy5ogyeu3tdw@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719111526.d4qnoy5ogyeu3tdw@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=dongwon.kim@intel.com; helo=mga06.intel.com
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

On Tue, Jul 19, 2022 at 01:15:26PM +0200, Gerd Hoffmann wrote:
> On Fri, May 06, 2022 at 10:09:30AM -0700, Dongwon Kim wrote:
> > On Fri, May 06, 2022 at 11:53:22AM +0400, Marc-André Lureau wrote:
> > > Hi
> > > 
> > > On Fri, May 6, 2022 at 1:46 AM Dongwon Kim <dongwon.kim@intel.com> wrote:
> > > 
> > > > It only needs to update the scanouts containing the rect area
> > > > coming with the resource-flush request from the guest.
> > > >
> > > >
> > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > > > ---
> > > >  hw/display/virtio-gpu.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > > > index 529b5246b2..165ecafd7a 100644
> > > > --- a/hw/display/virtio-gpu.c
> > > > +++ b/hw/display/virtio-gpu.c
> > > > @@ -514,6 +514,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
> > > >          for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
> > > >              scanout = &g->parent_obj.scanout[i];
> > > >              if (scanout->resource_id == res->resource_id &&
> > > > +                rf.r.x >= scanout->x && rf.r.y >= scanout->y &&
> > > > +                rf.r.x + rf.r.width <= scanout->x + scanout->width &&
> > > > +                rf.r.y + rf.r.height <= scanout->y + scanout->height &&
> > > >
> > > 
> > > 
> > > That doesn't seem to handle intersections/overlapping, I think it should.
> > 
> > so set-scanouts and resource flushes are issued per scanout(CRTC/plane
> > from guest's point of view). In case of intersections/overlapping, there
> > will be two resource flushes (in case there are two scanouts) and each
> > resource flush will take care of updating the scanout that covers
> > partial damaged area.
> 
> Even though the linux kernel driver sends two flushes, one for each
> scanout, it is perfectly valid send a single flush for the complete
> resource.
> 
> So checking whenever the rectangle is completely within the scanout is
> not correct.  When the scanout is covered partly you must update too.
> Only when the rectangle is completely outside the scanout it is valid to
> skip it.

Gerd,

I got your point. I will take a look into it.

> 
> take care,
>   Gerd
> 

