Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 007AA31BAFE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:25:41 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBeom-0001f1-3V
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lBenk-00010T-GS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lBeni-0000nn-VU
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613399073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j3yXTUEjQ+wHkNw24NBBG4brp94v63tOaThVF5250WE=;
 b=RldTUgJ/iO7/VXjKfXxlTot88uD7OCN+wC5ptLPfpvf2v3PLdL/EzNXnuk+7ZuDBJpkU8v
 iKRTZ7d8NltQs9eRDPPygw+wg5v4ssep3+6P1Pxvq5K/E+6P/hueIrtDmg/QQukilHjtVw
 26RShaEIrutN6AE4gqebpQbVLSFqIwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-k9ulJsAYM5qxDLErRxQhxA-1; Mon, 15 Feb 2021 09:24:29 -0500
X-MC-Unique: k9ulJsAYM5qxDLErRxQhxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EF3586A061;
 Mon, 15 Feb 2021 14:24:28 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-111.rdu2.redhat.com [10.10.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AA8160875;
 Mon, 15 Feb 2021 14:24:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 8564B220BCF; Mon, 15 Feb 2021 09:24:15 -0500 (EST)
Date: Mon, 15 Feb 2021 09:24:15 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Chirantan Ekbote <chirantan@chromium.org>
Subject: Re: [Virtio-fs] [PATCH 07/24] DAX: virtio-fs: Add vhost-user slave
 commands for mapping
Message-ID: <20210215142415.GA3331@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-8-dgilbert@redhat.com>
 <CAJFHJrqioXu7K8Z=dFgMQDWoKoNK3pddcgf9znCS72BR4WHSYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJFHJrqioXu7K8Z=dFgMQDWoKoNK3pddcgf9znCS72BR4WHSYA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
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
Cc: mst@redhat.com, "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 07:35:53PM +0900, Chirantan Ekbote wrote:
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

Sounds like a reasonable idea. We probably will have to dynamically
allocate memory for removemapping, hopefully that does not have a
performance impact.

Vivek


