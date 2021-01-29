Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35143089B6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:04:58 +0100 (CET)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VKT-0003zK-9y
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l5VIn-0003TC-K3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:03:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l5VIj-00018n-PO
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611932587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IGW8wprBm+/khV5/OTg+TJxFBBsVmQLrl8046J0kszc=;
 b=cVmFt0XTEk7BiSKIwE5H+k5dorxfStb3VkeT0W16S8hnVKV1NK/dlRVWurFVIJepgCQSym
 F7v6IUnLvmhIFixYVdMxdHkHz8W2L3KDSxvjj9hT7+eNxcyHxlcQUwVFHnoE2C67TRcZoO
 TS/8KsWo48sNWk8+1S2Im6Hm2uQBQIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-0YxOcWk6MUmgnhG0tLoAXQ-1; Fri, 29 Jan 2021 10:03:03 -0500
X-MC-Unique: 0YxOcWk6MUmgnhG0tLoAXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76A961842144;
 Fri, 29 Jan 2021 15:03:02 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-45.rdu2.redhat.com [10.10.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0650D60BE2;
 Fri, 29 Jan 2021 15:02:51 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 890CA220BCF; Fri, 29 Jan 2021 10:02:50 -0500 (EST)
Date: Fri, 29 Jan 2021 10:02:50 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/6] vhost-user: Return error code from slave_read()
Message-ID: <20210129150250.GB3146@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
 <20210125180115.22936-4-vgoyal@redhat.com>
 <20210129104507.1ade37a7@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210129104507.1ade37a7@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 virtio-fs@redhat.com, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 10:45:07AM +0100, Greg Kurz wrote:
> On Mon, 25 Jan 2021 13:01:12 -0500
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > Right now slave_read() is called through main event loop and does not
> > return error. In next few patches I want to call slave_read() from
> > vhost device shutdown path as well and want to know if an error
> > happened so that caller can give up and return error accordingly.
> > 
> > Hence, create helper function do_slave_read(), which returns an
> > integer. Success is 0 and negative number is error code. slave_read()
> > calls do_slave_read() and ignores error code.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  hw/virtio/vhost-user.c | 43 ++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 37 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index d95dbc39e3..867cac034f 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -1401,7 +1401,7 @@ static uint64_t vhost_user_slave_handle_vring_host_notifier(
> >      return false;
> >  }
> >  
> > -static void slave_read(void *opaque)
> > +static int do_slave_read(void *opaque)
> >  {
> >      struct vhost_dev *dev = opaque;
> >      struct vhost_user *u = dev->opaque;
> > @@ -1432,13 +1432,22 @@ static void slave_read(void *opaque)
> >          size = recvmsg(u->slave_fd, &msgh, 0);
> >      } while (size < 0 && (errno == EINTR || errno == EAGAIN));
> >  
> > -    if (size != VHOST_USER_HDR_SIZE) {
> > +    if (size < 0) {
> > +        ret = -errno;
> >          error_report("Failed to read from slave.");
> >          goto err;
> >      }
> >  
> > +    if (size != VHOST_USER_HDR_SIZE) {
> > +        error_report("Failed to read %lu bytes from slave.",
> > +                     VHOST_USER_HDR_SIZE);
> 
> Maybe also print size ?

Sounds good. That way it will be clear how many bytes we were expecting
and how many did we get.

> 
> And, question from a newbie : any idea why short reads are
> considered as errors instead of retrying ? Same question
> stands for the other locations where we check the numbers
> of read/written bytes in this function.

I had same question when I was modifying the code. Atleast recvmsg()
man page does not say anything about read number of bytes can less
than number of bytes requested. But read() man page does say that
fewer bytes can be returned.

So maybe something to improve upon down the line.

> 
> > +        ret = -EBADMSG;
> > +        goto err;
> > +    }
> > +
> >      if (msgh.msg_flags & MSG_CTRUNC) {
> >          error_report("Truncated message.");
> > +        ret = -EBADMSG;
> >          goto err;
> >      }
> >  
> > @@ -1456,6 +1465,7 @@ static void slave_read(void *opaque)
> >          error_report("Failed to read msg header."
> >                  " Size %d exceeds the maximum %zu.", hdr.size,
> >                  VHOST_USER_PAYLOAD_SIZE);
> > +        ret = -EBADMSG;
> >          goto err;
> >      }
> >  
> > @@ -1464,8 +1474,15 @@ static void slave_read(void *opaque)
> >          size = read(u->slave_fd, &payload, hdr.size);
> >      } while (size < 0 && (errno == EINTR || errno == EAGAIN));
> >  
> > -    if (size != hdr.size) {
> > +    if (size == -1) {
> 
> Maybe make it (size < 0) for consistency with the error checking
> added above ? And this seems to be the preferred way in the QEMU
> tree :)

Ok, will do. Don't have any strong preferene. read() man page says
it returns -1 in case of error, so checked for that.

> 
> >          error_report("Failed to read payload from slave.");
> > +        ret = errno;
> 
>     ret = -errno;
> 
> And this should be done before error_report() to ensure errno
> isn't cloberred.

Aha.. good catch. Will fix it.

> 
> > +        goto err;
> > +    }
> > +
> > +    if (size != hdr.size) {
> > +        error_report("Failed to read %d payload bytes from slave.", hdr.size);
> > +        ret = -EBADMSG;
> >          goto err;
> >      }
> >  
> > @@ -1529,13 +1546,22 @@ static void slave_read(void *opaque)
> >              size = writev(u->slave_fd, iovec, ARRAY_SIZE(iovec));
> >          } while (size < 0 && (errno == EINTR || errno == EAGAIN));
> >  
> > -        if (size != VHOST_USER_HDR_SIZE + hdr.size) {
> > +        if (size == -1) {
> 
> size < 0
> 
> >              error_report("Failed to send msg reply to slave.");
> > +            ret = -errno;
> 
> Move before error_report()

Will do. 

Vivek

> 
> > +            goto err;
> > +        }
> > +
> > +        if (size != VHOST_USER_HDR_SIZE + hdr.size) {
> > +            error_report("Failed to send msg reply to slave. Wrote %d bytes"
> > +                         " expected %lu bytes.", size,
> > +                         VHOST_USER_HDR_SIZE + hdr.size);
> > +            ret = -EIO;
> >              goto err;
> >          }
> >      }
> >  
> > -    return;
> > +    return 0;
> >  
> >  err:
> >      qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
> > @@ -1546,7 +1572,12 @@ err:
> >              close(fd[i]);
> >          }
> >      }
> > -    return;
> > +    return ret;
> > +}
> > +
> > +static void slave_read(void *opaque)
> > +{
> > +    do_slave_read(opaque);
> >  }
> >  
> >  static int vhost_setup_slave_channel(struct vhost_dev *dev)
> 


