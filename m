Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81842180F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 21:59:30 +0200 (CEST)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXU7U-0006lS-RB
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 15:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXU6O-00065g-1A
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:58:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXU6J-0001YT-8E
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 15:58:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633377492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uxlqTrRwZTkeI8U/zws5ajse6SB18QMMQ7qQkcUllZM=;
 b=NJoKVrNToDtWvYHpN5GciV2ZabvUJIQu7ndwg4VzMlYSivsH9eZkujhcOMaTtFw+/zJENR
 Yf1j5G/OTfFjDOs/L//CDlQPqnkuyiajeSGj/UdS3HF3dC1iXndMmN9AVkA8TapI4Abf0r
 K/101ekQsXqXaGWVPwd/U8Ha3rAbkjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-qDZBMdtFMmC3qF-w60tZxA-1; Mon, 04 Oct 2021 15:58:11 -0400
X-MC-Unique: qDZBMdtFMmC3qF-w60tZxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3699A802B9E;
 Mon,  4 Oct 2021 19:58:10 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E16095D9DE;
 Mon,  4 Oct 2021 19:58:09 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 64887220BDB; Mon,  4 Oct 2021 15:58:09 -0400 (EDT)
Date: Mon, 4 Oct 2021 15:58:09 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 06/13] vhost-user-fs: Use helpers to create/cleanup
 virtqueue
Message-ID: <YVtc0UMWQtAaCNog@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-7-vgoyal@redhat.com>
 <YVsHifrJdRtVyERb@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVsHifrJdRtVyERb@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 02:54:17PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:30AM -0400, Vivek Goyal wrote:
> > Add helpers to create/cleanup virtuqueues and use those helpers. I will
> 
> s/virtuqueues/virtqueues/
> 
> > need to reconfigure queues in later patches and using helpers will allow
> > reusing the code.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  hw/virtio/vhost-user-fs.c | 87 +++++++++++++++++++++++----------------
> >  1 file changed, 52 insertions(+), 35 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index c595957983..d1efbc5b18 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -139,6 +139,55 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
> >      }
> >  }
> >  
> > +static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> > +{
> > +    /*
> > +     * Not normally called; it's the daemon that handles the queue;
> > +     * however virtio's cleanup path can call this.
> > +     */
> > +}
> > +
> > +static void vuf_create_vqs(VirtIODevice *vdev)
> > +{
> > +    VHostUserFS *fs = VHOST_USER_FS(vdev);
> > +    unsigned int i;
> > +
> > +    /* Hiprio queue */
> > +    fs->hiprio_vq = virtio_add_queue(vdev, fs->conf.queue_size,
> > +                                     vuf_handle_output);
> > +
> > +    /* Request queues */
> > +    fs->req_vqs = g_new(VirtQueue *, fs->conf.num_request_queues);
> > +    for (i = 0; i < fs->conf.num_request_queues; i++) {
> > +        fs->req_vqs[i] = virtio_add_queue(vdev, fs->conf.queue_size,
> > +                                          vuf_handle_output);
> > +    }
> > +
> > +    /* 1 high prio queue, plus the number configured */
> > +    fs->vhost_dev.nvqs = 1 + fs->conf.num_request_queues;
> > +    fs->vhost_dev.vqs = g_new0(struct vhost_virtqueue, fs->vhost_dev.nvqs);
> 
> These two lines prepare for vhost_dev_init(), so moving them here is
> debatable. If a caller is going to use this function again in the future
> then they need to be sure to also call vhost_dev_init(). For now it
> looks safe, so I guess it's okay.

Hmm..., I do call this function later from vuf_set_features() and
reconfigure the queues. I see that I don't call vhost_dev_init()
in that path. I am not even sure if I should be calling
vhost_dev_init() from inside vuf_set_features().

So core reuirement is that at the time of first creating device
I have no idea if driver supports notification queue or not. So
I do create device with notification queue. But later if driver
(and possibly vhost device) does not support notifiation queue,
then we need to reconfigure queues. What's the correct way to
do that?

Thanks
Vivek
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>



