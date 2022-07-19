Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B57579843
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:17:24 +0200 (CEST)
Received: from localhost ([::1]:60334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlEA-00044z-Rk
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDlCX-0001ll-Qk
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oDlCS-00015F-Tc
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658229335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G5JfQ75Qy6j2GMpz5ZoTKJuwjCRJS/M6Y0XIUe69hsQ=;
 b=DHGOmUdl+saTxS8JuWIh5Jpm0TDFvMuLxKYoKHGOwpdsrZMVlL8lPzRpmXOyVsi+q/hADs
 Zlxod/0C1l8iqeaeiii+BeET/Vlkpd2ldM6EalNtJbxurs+Ci8RJliym8S8Uzg4Nkb0+F5
 Y0mPT6OWF8BaqptmGb23tPMn9SQ9cKQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-3jOemcfcMZGsKdu0_htSSw-1; Tue, 19 Jul 2022 07:15:28 -0400
X-MC-Unique: 3jOemcfcMZGsKdu0_htSSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE53B8037AC;
 Tue, 19 Jul 2022 11:15:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A51E1121314;
 Tue, 19 Jul 2022 11:15:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 23CF918000A3; Tue, 19 Jul 2022 13:15:26 +0200 (CEST)
Date: Tue, 19 Jul 2022 13:15:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH] virtio-gpu: update done only on the scanout associated
 with rect
Message-ID: <20220719111526.d4qnoy5ogyeu3tdw@sirius.home.kraxel.org>
References: <20220505214030.4261-1-dongwon.kim@intel.com>
 <CAJ+F1CJ_vLG31zk9y2rphOy3y+NhVkn1VSriSXYv4mXCbFEWJQ@mail.gmail.com>
 <20220506170930.GB369@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506170930.GB369@dongwonk-MOBL.amr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, May 06, 2022 at 10:09:30AM -0700, Dongwon Kim wrote:
> On Fri, May 06, 2022 at 11:53:22AM +0400, Marc-André Lureau wrote:
> > Hi
> > 
> > On Fri, May 6, 2022 at 1:46 AM Dongwon Kim <dongwon.kim@intel.com> wrote:
> > 
> > > It only needs to update the scanouts containing the rect area
> > > coming with the resource-flush request from the guest.
> > >
> > >
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > > ---
> > >  hw/display/virtio-gpu.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> > > index 529b5246b2..165ecafd7a 100644
> > > --- a/hw/display/virtio-gpu.c
> > > +++ b/hw/display/virtio-gpu.c
> > > @@ -514,6 +514,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
> > >          for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
> > >              scanout = &g->parent_obj.scanout[i];
> > >              if (scanout->resource_id == res->resource_id &&
> > > +                rf.r.x >= scanout->x && rf.r.y >= scanout->y &&
> > > +                rf.r.x + rf.r.width <= scanout->x + scanout->width &&
> > > +                rf.r.y + rf.r.height <= scanout->y + scanout->height &&
> > >
> > 
> > 
> > That doesn't seem to handle intersections/overlapping, I think it should.
> 
> so set-scanouts and resource flushes are issued per scanout(CRTC/plane
> from guest's point of view). In case of intersections/overlapping, there
> will be two resource flushes (in case there are two scanouts) and each
> resource flush will take care of updating the scanout that covers
> partial damaged area.

Even though the linux kernel driver sends two flushes, one for each
scanout, it is perfectly valid send a single flush for the complete
resource.

So checking whenever the rectangle is completely within the scanout is
not correct.  When the scanout is covered partly you must update too.
Only when the rectangle is completely outside the scanout it is valid to
skip it.

take care,
  Gerd


