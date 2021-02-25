Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CEB324DD2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:21:24 +0100 (CET)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDls-0001Tk-1V
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lFDkT-0000WM-Pl
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lFDkP-0003Iw-U0
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614248393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P0BCu9jEH3lkjIa2EeyV1ix7q8WeRvH20CqIpoMmeWY=;
 b=iqtjmzjuAI1i2VcoPWOVEKLZS6AoU7HtcXnhZ3+J6BLHYocyjf6F1MP2fJ40oKFiHzmPGG
 Od/A8iRbsfFKxggKfSna/lxzEtOTJ30ZKZ2kzqWs9orA2zGw1vrLiie6o4agGmMm2IX8Ip
 eXkD35zSpoFhr2vv5am1hV5vPWvPPxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-WGz4vnErN_u_HPZVnfvOAw-1; Thu, 25 Feb 2021 05:19:48 -0500
X-MC-Unique: WGz4vnErN_u_HPZVnfvOAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82A90100B3B2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 10:19:47 +0000 (UTC)
Received: from work-vm (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7F646E51F;
 Thu, 25 Feb 2021 10:19:33 +0000 (UTC)
Date: Thu, 25 Feb 2021 10:19:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 18/24] DAX/unmap virtiofsd: Parse unmappable elements
Message-ID: <YDd5swx5HA+WinFF@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-19-dgilbert@redhat.com>
 <20210211142948.GS247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211142948.GS247031@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Feb 09, 2021 at 07:02:18PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > For some read/writes the virtio queue elements are unmappable by
> > the daemon; these are cases where the data is to be read/written
> > from non-RAM.  In viritofs's case this is typically a direct read/write
> > into an mmap'd DAX file also on virtiofs (possibly on another instance).
> > 
> > When we receive a virtio queue element, check that we have enough
> > mappable data to handle the headers.  Make a note of the number of
> > unmappable 'in' entries (ie. for read data back to the VMM),
> > and flag the fuse_bufvec for 'out' entries with a new flag
> > FUSE_BUF_PHYS_ADDR.
> 
> Looking back at this I think vhost-user will need generic
> READ_MEMORY/WRITE_MEMORY commands. It's okay for virtio-fs to have its
> own IO command (although not strictly necessary).
> 
> With generic READ_MEMORY/WRITE_MEMORY libvhost-user and other vhost-user
> device backend implementations can handle vring descriptors that point
> into the DAX window. This can be done transparently so individual device
> implementations (net, blk, etc) don't even know when memory is copied vs
> zero-copy shared memory access.
> 
> So this approach is okay for virtio-fs but it's not a long-term solution
> for all of vhost-user. Eventually the long-term solution may be needed
> so that other VIRTIO devices that have shared memory resources work.
> 
> Another bonus of READ_MEMORY/WRITE_MEMORY is that users that prefer an
> enforcing vIOMMU can disable shared memory (maybe just keep the vring
> itself mmapped).
> 
> I just wanted to share this idea but don't expect it to be addressed in
> this patch series.

Yes, that would be nice; although in this case it would imply an extra
memory copy; you'd have to do the IO in the daemon, and then perform a
read/write back across the socket.

> > diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> > index a090040bb2..ed9280de91 100644
> > --- a/tools/virtiofsd/fuse_common.h
> > +++ b/tools/virtiofsd/fuse_common.h
> > @@ -611,6 +611,13 @@ enum fuse_buf_flags {
> >       * detected.
> >       */
> >      FUSE_BUF_FD_RETRY = (1 << 3),
> > +
> > +    /**
> > +     * The addresses in the iovec represent guest physical addresses
> > +     * that can't be mapped by the daemon process.
> > +     * IO must be bounced back to the VMM to do it.
> > +     */
> > +    FUSE_BUF_PHYS_ADDR = (1 << 4),
> 
> With a vIOMMU it's an IOVA. Without a vIOMMU it's a GPA. This constant
> may need to be renamed in the future, but it is okay for now.

Do we have any naming for something that's either a GPA or a IOVA?

> > +    if (req->bad_in_num || req->bad_out_num) {
> > +        bool handled_unmappable = false;
> > +
> > +        if (out_num > 2 && out_num_readable >= 2 && !req->bad_in_num &&
> > +            out_sg[0].iov_len == sizeof(struct fuse_in_header) &&
> > +            ((struct fuse_in_header *)fbuf.mem)->opcode == FUSE_WRITE &&
> > +            out_sg[1].iov_len == sizeof(struct fuse_write_in)) {
> 
> This violates the VIRTIO specification:
> 
>   2.6.4.1 Device Requirements: Message Framing
> 
>   The device MUST NOT make assumptions about the particular arrangement of descriptors.
> 
>   https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-280004
> 
> The driver is not obligated to submit separate iovecs. out_num == 1 is
> valid and the device needs to process it byte-wise instead of making
> assumptions about iovec layout.

Yes, it's actually not new in this patch, but I'll clean it up.
I took the shortcut all the way back in:
  e17f7a580e2c599330ad virtiofsd: Pass write iov's all the way through

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


