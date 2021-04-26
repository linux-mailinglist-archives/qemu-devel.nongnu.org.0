Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C6036B555
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:59:58 +0200 (CEST)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb2iL-00023A-Jm
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lb2ga-0001Dr-5s
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:58:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lb2gW-0003BR-OH
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619449081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YkQMuRe5UqNvBZneLKTvhN3S0YtmKirbPi7JPlY7VY=;
 b=Pd7fft5utZVRiw8E+I2KDomZAPLqSW/zGMkdHd+Lu6nMkbTD8fLoxURKOvSIonGcJM6eUW
 xnO419b2Pf+6fGeK4hFHAkNitmJDh9rO+F6FrxVuIlCy95daNw3CfYDM3F6gkhvBvTUx6+
 lEnQObz9KQBRUDjJfGEn7UNa+7yqYVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-txT9CRlJOCCK3Si-39vEjA-1; Mon, 26 Apr 2021 10:56:12 -0400
X-MC-Unique: txT9CRlJOCCK3Si-39vEjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A1D3853EC0;
 Mon, 26 Apr 2021 14:56:11 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEB661002388;
 Mon, 26 Apr 2021 14:56:10 +0000 (UTC)
Date: Mon, 26 Apr 2021 08:56:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <20210426085610.1918ee31@redhat.com>
In-Reply-To: <YIavueU/GRbAEyK0@work-vm>
References: <CAED3YRr-8ACi5FzsHy8AtijTMMS68aDW2sE1Qy5kmexkhGvETQ@mail.gmail.com>
 <YIavueU/GRbAEyK0@work-vm>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Edge NFV <edgenfv@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 13:19:05 +0100
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Edge NFV (edgenfv@gmail.com) wrote:
> >  Signed-off-by: Edge NFV <edgenfv@gmail.com>  
> 
> Hi,
>   I take it that 'Edge NFV' isn't your real name; apologies if it is.
> It's unusual not to use a real name; I would be interested to know
> why you feel uncomfortable not doing.

The documentation noted by Laurent even goes so far as to request a
real name for the Sign-off.  Intentionally masking your identity will
only serve to raise suspicion and increase the chances that the patch
is ignored.  I think perhaps aside from one or two legacy contributors,
all QEMU contributions are signed-off by real names these days.

I also require a commit log describing the change.

> > ---
> >  hw/vfio/common.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index ae5654fcdb..83e15bf7a3 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -668,6 +668,15 @@ static void vfio_listener_region_add(MemoryListener
> > *listener,
> >                  int128_get64(int128_sub(section->size, int128_one())));
> >          return;
> >      }
> > +
> > +    /* Do not add virtio fs cache section */
> > +    if (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) {  
> 
> So first, this is a patch that fixes something that isn't yet in qemu;
> the DAX mode of virtiofs.
> Secondly, hard coding the name like this is probably the wrong thing to
> do; we need a way for the cache to declare it wants to be omitted.
> Thirdly, shouldn't this actually be a change to
> vfio_listener_skip_section to add this test?

Agree on all points, there needs to be justification on why this region
cannot be a DMA target for the device, not simply wishing to skip it to
workaround a boot failure.  Thanks,

Alex

> > +        trace_vfio_listener_region_add_skip(
> > +                section->offset_within_address_space,
> > +                section->offset_within_address_space +
> > +                int128_get64(int128_sub(section->size, int128_one())));
> > +        return;
> > +    }
> > 
> >      if (unlikely((section->offset_within_address_space &
> >                    ~qemu_real_host_page_mask) !=
> > -- 
> > 2.25.1  


