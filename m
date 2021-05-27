Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BAA39346D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:59:46 +0200 (CEST)
Received: from localhost ([::1]:50692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJMH-0004Db-DG
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmJKI-0003GD-Fw
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmJKE-0001BS-Mg
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622134656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AieaqCAVNzd3RGR1bAkpd3n8ubAEYppVoPCcCwme07U=;
 b=F8aVNynfU52WaEwA2EIM4hDY8Terc2LjGwHieDC79dCvVOTf9QMcDSb+g78FxEGqLODYQq
 330c+inXRBXLpRG+35cZbEr6tKBZp6xd9KXMYUC0LBDcyQBR+5x7IrdkIQ0s8JwTphsg6y
 SC0pVf9Na/KcPvyN1OFM5UCEkQbwGwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-B9qXxdbwN9yAZ48DgkgQNQ-1; Thu, 27 May 2021 12:57:33 -0400
X-MC-Unique: B9qXxdbwN9yAZ48DgkgQNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55137180FD61;
 Thu, 27 May 2021 16:57:32 +0000 (UTC)
Received: from work-vm (ovpn-114-249.ams2.redhat.com [10.36.114.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44E7C19D9B;
 Thu, 27 May 2021 16:57:23 +0000 (UTC)
Date: Thu, 27 May 2021 17:57:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 09/26] DAX: virtio-fs: Add vhost-user slave commands
 for mapping
Message-ID: <YK/PcSYNVKhomZak@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-10-dgilbert@redhat.com>
 <YJKomatE4qqje5cY@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJKomatE4qqje5cY@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Apr 28, 2021 at 12:00:43PM +0100, Dr. David Alan Gilbert (git) wrote:
> > diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> > index dd0a02aa99..169a146e72 100644
> > --- a/hw/virtio/vhost-user-fs.c
> > +++ b/hw/virtio/vhost-user-fs.c
> > @@ -45,6 +45,72 @@ static const int user_feature_bits[] = {
> >  #define DAX_WINDOW_PROT PROT_NONE
> >  #endif
> >  
> > +/*
> > + * The message apparently had 'received_size' bytes, check this
> > + * matches the count in the message.
> > + *
> > + * Returns true if the size matches.
> > + */
> > +static bool check_slave_message_entries(const VhostUserFSSlaveMsg *sm,
> > +                                        int received_size)
> > +{
> > +    int tmp;
> > +
> > +    /*
> > +     * VhostUserFSSlaveMsg consists of a body followed by 'n' entries,
> > +     * (each VhostUserFSSlaveMsgEntry).  There's a maximum of
> > +     * VHOST_USER_FS_SLAVE_MAX_ENTRIES of these.
> > +     */
> > +    if (received_size <= sizeof(VhostUserFSSlaveMsg)) {
> 
> received_size is an int and we risk hitting checking against the coerced
> size_t value but then using the signed int received_size later. It's
> safer to convert to size_t once and then use that size_t value
> everywhere later.

Done.

> > +typedef struct {
> > +    /* Offsets within the file being mapped */
> > +    uint64_t fd_offset;
> > +    /* Offsets within the cache */
> > +    uint64_t c_offset;
> > +    /* Lengths of sections */
> > +    uint64_t len;
> > +    /* Flags, from VHOST_USER_FS_FLAG_* */
> > +    uint64_t flags;
> > +} VhostUserFSSlaveMsgEntry;
> > +
> > +typedef struct {
> > +    /* Number of entries */
> > +    uint16_t count;
> > +    /* Spare */
> > +    uint16_t align;
> 
> VhostUserFSSlaveMsgEntry is aligned to 64 bits, so the 16-bit align
> field is not sufficient for full alignment.

Ah, interesting; fixed to:

typedef struct {
    /* Generic flags for the overall message */
    uint32_t flags;
    /* Number of entries */
    uint16_t count;
    /* Spare */
    uint16_t align;
} VhostUserFSSlaveMsgHdr;

or do I actually need to have a uint64_t in there?

Dave


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


