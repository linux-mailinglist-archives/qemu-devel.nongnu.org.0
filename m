Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4EE323B31
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:18:48 +0100 (CET)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsBr-00056S-DE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsAf-0004g7-Oy
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:17:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsAd-0004a0-Mn
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614165449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZdth/jUbehtJCYZwrly7yhxVtc9NrH42+8crogjt7Y=;
 b=TVyhszB/1blqrvxqVEBFdBy/rrU+Tt4jPm9Uqhi5Ncs9cxT5kVrojSHMcEHiGNcbEKdLUw
 9c9xqAPK49y0cDEwSL/EXMXhNxnWC+SbXtFXRUAe78PKuFajVQoV4L/NDjDUKngJyPdOn+
 IyufvUTZ1XUvkZgYTXeqRdbuXwD12BM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-JG18An3NMO2ncTIcRy6BFQ-1; Wed, 24 Feb 2021 06:16:42 -0500
X-MC-Unique: JG18An3NMO2ncTIcRy6BFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19DD28049C6;
 Wed, 24 Feb 2021 11:15:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8DB5D9D0;
 Wed, 24 Feb 2021 11:15:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 82C5718000AE; Wed, 24 Feb 2021 12:15:40 +0100 (CET)
Date: Wed, 24 Feb 2021 12:15:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
Message-ID: <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 01:50:51PM +0900, Akihiko Odaki wrote:
> 2021年2月22日(月) 19:57 Gerd Hoffmann <kraxel@redhat.com>:
> >
> > On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> > > This change introduces an additional member, refresh_rate to
> > > qemu_edid_info in include/hw/display/edid.h.
> > >
> > > This change also isolates the graphics update interval from the
> > > display update interval. The guest will update the frame buffer
> > > in the graphics update interval, but displays can be updated in a
> > > dynamic interval, for example to save update costs aggresively
> > > (vnc) or to respond to user-generated events (sdl).
> > > It stabilizes the graphics update interval and prevents the guest
> > > from being confused.
> >
> > Hmm.  What problem you are trying to solve here?
> >
> > The update throttle being visible by the guest was done intentionally,
> > so the guest can throttle the display updates too in case nobody is
> > watching those display updated anyway.
> 
> Indeed, we are throttling the update for vnc to avoid some worthless
> work. But typically a guest cannot respond to update interval changes
> so often because real display devices the guest is designed for does
> not change the update interval in that way.

What is the problem you are seeing?

Some guest software raising timeout errors when they see only
one vblank irq every 3 seconds?  If so: which software is this?
Any chance we can fix this on the guest side?

> That is why we have to
> tell the guest a stable update interval even if it results in wasted
> frames.

Because of the wasted frames I'd like this to be an option you can
enable when needed.  For the majority of use cases this seems to be
no problem ...

Also: the EDID changes should go to a separate patch.

take care,
  Gerd


