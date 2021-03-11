Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980D2337D0F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:59:06 +0100 (CET)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQWX-0003cQ-Kb
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKQQS-0006BP-MU
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:52:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKQQL-0000Py-Lf
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615488759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t/Ua4EX5DV5NRY6Lr7zTw+lomYG0jfFKC9Iqa2m00KE=;
 b=i4zc6eK40M+ahXcg+DLlEWL3gc83IkDDCcea8cA3hXArolHDZOn0taEuBVDhHLz8fCAby9
 kIb32w/DZx+5vKe0vhHr16IDulNOvXOsMEVuq9rnwRMX8yhdJHd86QgQWCn2VpjVxvpM4S
 /tSgsDaNK8/2m/TxxDgcsxGxdLwlJWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-9YXYZ0PGPumgtHWHKcZqMg-1; Thu, 11 Mar 2021 13:52:37 -0500
X-MC-Unique: 9YXYZ0PGPumgtHWHKcZqMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00621800D55;
 Thu, 11 Mar 2021 18:52:37 +0000 (UTC)
Received: from work-vm (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9D2F102AE7E;
 Thu, 11 Mar 2021 18:52:20 +0000 (UTC)
Date: Thu, 11 Mar 2021 18:52:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 07/24] DAX: virtio-fs: Add vhost-user slave
 commands for mapping
Message-ID: <YEpm4YCYN2zuyD8w@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-8-dgilbert@redhat.com>
 <CAJFHJrqioXu7K8Z=dFgMQDWoKoNK3pddcgf9znCS72BR4WHSYA@mail.gmail.com>
 <YEoJzfLRy/Kk6SOf@work-vm> <20210311135050.GA145441@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210311135050.GA145441@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: mst@redhat.com, Chirantan Ekbote <chirantan@chromium.org>,
 qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Thu, Mar 11, 2021 at 12:15:09PM +0000, Dr. David Alan Gilbert wrote:
> > * Chirantan Ekbote (chirantan@chromium.org) wrote:
> > > On Wed, Feb 10, 2021 at 4:04 AM Dr. David Alan Gilbert (git)
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > > +
> > > > +typedef struct {
> > > > +    /* Offsets within the file being mapped */
> > > > +    uint64_t fd_offset[VHOST_USER_FS_SLAVE_ENTRIES];
> > > > +    /* Offsets within the cache */
> > > > +    uint64_t c_offset[VHOST_USER_FS_SLAVE_ENTRIES];
> > > > +    /* Lengths of sections */
> > > > +    uint64_t len[VHOST_USER_FS_SLAVE_ENTRIES];
> > > > +    /* Flags, from VHOST_USER_FS_FLAG_* */
> > > > +    uint64_t flags[VHOST_USER_FS_SLAVE_ENTRIES];
> > > > +} VhostUserFSSlaveMsg;
> > > > +
> > > 
> > > Is it too late to change this?  This struct allocates space for up to
> > > 8 entries but most of the time the server will only try to set up one
> > > mapping at a time so only 32 out of the 256 bytes in the message are
> > > actually being used.  We're just wasting time memcpy'ing bytes that
> > > will never be used.  Is there some reason this can't be dynamically
> > > sized?  Something like:
> > > 
> > > typedef struct {
> > >     /* Number of mapping requests */
> > >     uint16_t num_requests;
> > >     /* `num_requests` mapping requests */
> > >    MappingRequest requests[];
> > > } VhostUserFSSlaveMsg;
> > > 
> > > typedef struct {
> > >     /* Offset within the file being mapped */
> > >     uint64_t fd_offset;
> > >     /* Offset within the cache */
> > >     uint64_t c_offset;
> > >     /* Length of section */
> > >     uint64_t len;
> > >     /* Flags, from VHOST_USER_FS_FLAG_* */
> > >     uint64_t flags;
> > > } MappingRequest;
> > > 
> > > The current pre-allocated structure both wastes space when there are
> > > fewer than 8 requests and requires extra messages to be sent when
> > > there are more than 8 requests.  I realize that in the grand scheme of
> > > things copying 224 extra bytes is basically not noticeable but it just
> > > irks me that we could fix this really easily before it gets propagated
> > > to too many other places.
> > 
> > So this has come out as:
> > 
> > typedef struct {
> >     /* Offsets within the file being mapped */
> >     uint64_t fd_offset;
> >     /* Offsets within the cache */
> >     uint64_t c_offset;
> >     /* Lengths of sections */
> >     uint64_t len;
> >     /* Flags, from VHOST_USER_FS_FLAG_* */
> >     uint64_t flags;
> > } VhostUserFSSlaveMsgEntry;
> >  
> > typedef struct {
> >     /* Generic flags for the overall message */
> >     uint32_t flags;
> >     /* Number of entries */
> >     uint16_t count;
> >     /* Spare */
> >     uint16_t align;
> >  
> >     VhostUserFSSlaveMsgEntry entries[];
> > } VhostUserFSSlaveMsg;
> > 
> > which seems to work OK.
> > I've still got a:
> > #define VHOST_USER_FS_SLAVE_MAX_ENTRIES 8
> 
> Hi Dave,
> 
> So if we were to raise this limit down the line, will it be just a matter
> of changing this numebr and recompile qemu + virtiofsd? Or this is just
> a limit on sender and qemu does not care.

They have to agree; 
> If qemu cares about number of entries, then it will be good to raise this
> limit to say 32 or 64.

I've bumped it to 32.

Dave

> Otherwise new definitions look good.
> 
> Thanks
> Vivek
> 
> > 
> > to limit the size VhostUserFSSlaveMsg can get to.
> > The variable length array makes the union in the reader a bit more
> > hairy, but it's OK.
> > 
> > Dave
> > 
> > > Chirantan
> > > 
> > > > --
> > > > 2.29.2
> > > >
> > > > _______________________________________________
> > > > Virtio-fs mailing list
> > > > Virtio-fs@redhat.com
> > > > https://www.redhat.com/mailman/listinfo/virtio-fs
> > > >
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


