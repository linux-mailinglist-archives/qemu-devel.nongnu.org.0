Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4A633723E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:18:10 +0100 (CET)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKGX-0003xc-Ix
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKKE2-00031B-TG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKKDz-00038A-PY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:15:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615464930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFxuVXRhC9dGoUvtXt1yMEw6BspsBanUe+daanGdViQ=;
 b=GTx3WsiKxGOjOUunODA2BuiXWH27zhZPBLF4tLfOJzs/xlgS2xvH1iO9yLaDtpgy67AENM
 6smyiiINFOtL5i4d0JtWfpF4NiZi8MInQZB0j8YuQn6f0HXqDlzVr0tc2FhIXq3dzHeBEI
 jyYT/HX0X8y7lPi8YyG52ZK873uL0zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-VTjHZYs1O9iVwEXPxLZHhw-1; Thu, 11 Mar 2021 07:15:28 -0500
X-MC-Unique: VTjHZYs1O9iVwEXPxLZHhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DECC980D6AA;
 Thu, 11 Mar 2021 12:15:27 +0000 (UTC)
Received: from work-vm (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D84260C5F;
 Thu, 11 Mar 2021 12:15:12 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:15:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chirantan Ekbote <chirantan@chromium.org>
Subject: Re: [Virtio-fs] [PATCH 07/24] DAX: virtio-fs: Add vhost-user slave
 commands for mapping
Message-ID: <YEoJzfLRy/Kk6SOf@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-8-dgilbert@redhat.com>
 <CAJFHJrqioXu7K8Z=dFgMQDWoKoNK3pddcgf9znCS72BR4WHSYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJFHJrqioXu7K8Z=dFgMQDWoKoNK3pddcgf9znCS72BR4WHSYA@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: mst@redhat.com, qemu-devel@nongnu.org,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 marcandre.lureau@redhat.com, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chirantan Ekbote (chirantan@chromium.org) wrote:
> On Wed, Feb 10, 2021 at 4:04 AM Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > +
> > +typedef struct {
> > +    /* Offsets within the file being mapped */
> > +    uint64_t fd_offset[VHOST_USER_FS_SLAVE_ENTRIES];
> > +    /* Offsets within the cache */
> > +    uint64_t c_offset[VHOST_USER_FS_SLAVE_ENTRIES];
> > +    /* Lengths of sections */
> > +    uint64_t len[VHOST_USER_FS_SLAVE_ENTRIES];
> > +    /* Flags, from VHOST_USER_FS_FLAG_* */
> > +    uint64_t flags[VHOST_USER_FS_SLAVE_ENTRIES];
> > +} VhostUserFSSlaveMsg;
> > +
> 
> Is it too late to change this?  This struct allocates space for up to
> 8 entries but most of the time the server will only try to set up one
> mapping at a time so only 32 out of the 256 bytes in the message are
> actually being used.  We're just wasting time memcpy'ing bytes that
> will never be used.  Is there some reason this can't be dynamically
> sized?  Something like:
> 
> typedef struct {
>     /* Number of mapping requests */
>     uint16_t num_requests;
>     /* `num_requests` mapping requests */
>    MappingRequest requests[];
> } VhostUserFSSlaveMsg;
> 
> typedef struct {
>     /* Offset within the file being mapped */
>     uint64_t fd_offset;
>     /* Offset within the cache */
>     uint64_t c_offset;
>     /* Length of section */
>     uint64_t len;
>     /* Flags, from VHOST_USER_FS_FLAG_* */
>     uint64_t flags;
> } MappingRequest;
> 
> The current pre-allocated structure both wastes space when there are
> fewer than 8 requests and requires extra messages to be sent when
> there are more than 8 requests.  I realize that in the grand scheme of
> things copying 224 extra bytes is basically not noticeable but it just
> irks me that we could fix this really easily before it gets propagated
> to too many other places.

So this has come out as:

typedef struct {
    /* Offsets within the file being mapped */
    uint64_t fd_offset;
    /* Offsets within the cache */
    uint64_t c_offset;
    /* Lengths of sections */
    uint64_t len;
    /* Flags, from VHOST_USER_FS_FLAG_* */
    uint64_t flags;
} VhostUserFSSlaveMsgEntry;
 
typedef struct {
    /* Generic flags for the overall message */
    uint32_t flags;
    /* Number of entries */
    uint16_t count;
    /* Spare */
    uint16_t align;
 
    VhostUserFSSlaveMsgEntry entries[];
} VhostUserFSSlaveMsg;

which seems to work OK.
I've still got a:
#define VHOST_USER_FS_SLAVE_MAX_ENTRIES 8

to limit the size VhostUserFSSlaveMsg can get to.
The variable length array makes the union in the reader a bit more
hairy, but it's OK.

Dave

> Chirantan
> 
> > --
> > 2.29.2
> >
> > _______________________________________________
> > Virtio-fs mailing list
> > Virtio-fs@redhat.com
> > https://www.redhat.com/mailman/listinfo/virtio-fs
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


