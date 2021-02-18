Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7BA31E8DF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 12:02:08 +0100 (CET)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCh4Q-0006b0-RX
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 06:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lCh2r-00066U-Ol
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lCh2n-0006ov-6v
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 06:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613646022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pVNu3+kbd+9vu25mqmY94cdq2vTn9bjYLXG3/4cmr0Y=;
 b=EZ/JwRlTP9TAzcTsPdVjZ5tid1ghEzZMyNlmhpauhGqJ05B9coyfob9mYTaqlwHGmd6Rdg
 pSsrzN0bvi6eKPqJc6aIFS6mCltq1EEBcFNPvZjB2Mg+EQ8C1dXZtofWfFOlJ4J80H1xO8
 DfzqlqYLDQbFR9evwrLQeBGKY3/VDtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-grxkwTOfM5aOomleGD4D4g-1; Thu, 18 Feb 2021 06:00:20 -0500
X-MC-Unique: grxkwTOfM5aOomleGD4D4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE5EE100A8E8
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 11:00:19 +0000 (UTC)
Received: from work-vm (ovpn-115-17.ams2.redhat.com [10.36.115.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 650C82C01F;
 Thu, 18 Feb 2021 10:59:55 +0000 (UTC)
Date: Thu, 18 Feb 2021 10:59:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 08/24] DAX: virtio-fs: Fill in slave commands for mapping
Message-ID: <YC5IqMK+6UUjaE04@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-9-dgilbert@redhat.com>
 <20210211105755.GI247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211105755.GI247031@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Feb 09, 2021 at 07:02:08PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Fill in definitions for map, unmap and sync commands.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > with fix by misono.tomohiro@fujitsu.com
> > ---
> >  hw/virtio/vhost-user-fs.c | 115 ++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 111 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index 78401d2ff1..5f2fca4d82 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -37,15 +37,122 @@
> >  uint64_t vhost_user_fs_slave_map(struct vhost_dev *dev, VhostUserFSSlaveMsg *sm,
> >                                   int fd)
> >  {
> > -    /* TODO */
> > -    return (uint64_t)-1;
> > +    VHostUserFS *fs = VHOST_USER_FS(dev->vdev);
> > +    if (!fs) {
> > +        /* Shouldn't happen - but seen on error path */
> > +        error_report("Bad fs ptr");
> > +        return (uint64_t)-1;
> > +    }
> 
> If a non-vhost-user-fs vhost-user device backend sends this message
> VHOST_USER_FS() -> object_dynamic_cast_assert() there will either be an
> assertion failure (CONFIG_QOM_CAST_DEBUG) or the pointer will be
> silently cast to the wrong type (!CONFIG_QOM_CAST_DEBUG).
> 
> Both of these outcomes are not suitable for input validation. We need to
> fail cleanly here:
> 
>   VhostUserFS *fs = (VHostUserFS *)object_dynamic_cast(OBJECT(dev->vdev),
>                                                        TYPE_VHOST_USER_FS);
>   if (!fs) {
>       ...handle failure...
>   }
> 
> >  uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev,
> >                                     VhostUserFSSlaveMsg *sm)
> >  {
> > -    /* TODO */
> > -    return (uint64_t)-1;
> > +    VHostUserFS *fs = VHOST_USER_FS(dev->vdev);
> > +    if (!fs) {
> > +        /* Shouldn't happen - but seen on error path */
> > +        error_report("Bad fs ptr");
> > +        return (uint64_t)-1;
> > +    }
> 
> Same here.

Thanks, fixed.

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


