Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134703ED367
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:52:05 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFb9w-0002Wc-33
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mFb8b-0001pc-1C
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mFb8Y-000481-L3
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629114636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pC0pB23MorfGsHuzEpvAX0K+IWqbk95/OaKkY+cSZNw=;
 b=C0aC1UCeWzbQ0o5sqd1MD/5+EKwfeAZXyhJbVm6+N7xjP5w/wGYrgcn4p33CTw4FPek/CI
 VNg4IJn2ShycdrsWksbTacg8gRGAoAZi8qbhkVBCNikUUtaAYoYdGJGGJShEv4c/xpZXJX
 1A8ppi+Q8TiSDb37faJ+0md/QkBdXuw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-8P975GRlPj-m1MPF4z_F0w-1; Mon, 16 Aug 2021 07:50:34 -0400
X-MC-Unique: 8P975GRlPj-m1MPF4z_F0w-1
Received: by mail-ej1-f71.google.com with SMTP id
 v3-20020a1709063383b02905b4d1d1e27cso4575816eja.19
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 04:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pC0pB23MorfGsHuzEpvAX0K+IWqbk95/OaKkY+cSZNw=;
 b=oTOoGBbbUN+oF5pXtvSH+Dc1aebnolLo6ePYuxItzzaTza3FvuLFthzMRYVV+ETYKl
 CZ0e7HVOx1MWcziYuEGwFf7IL2MOQUmaS8nujO2SxZAH4uBTFrnX2kAuYvRweLYBx47W
 WjX8bYAPpfCwz6/HaSJXpr2Ti9umgLKedJTxUZeinASElAMD5G2suf7k0LATh3FSp5ES
 738MLrxyV0l4qSawJAeVcw3st17VygNG0gnr99v0PVZ8TPAPIdRtnMqjKjtDjO9Yn2Kq
 YbVyf4wfurKVA+Vz8uy5vQErV2vdbt2ZxrFCmEWlTOD0zksgAA04MtPj9osS5a0XQxHM
 tuwA==
X-Gm-Message-State: AOAM531IUHQgF9IoUG2PgFn14DRtoXx6r2yXKPvIDBPpkhKMU4vzeSCG
 1LZd1ZXaAIs9o17UWknru61h6pVeecAvmjbXwVhn7IEHxvRmDkySardSxYvvZluhwSeZYCqYve0
 4Ze19Nl5rHJvrSs8=
X-Received: by 2002:a17:906:b811:: with SMTP id
 dv17mr15450451ejb.444.1629114633871; 
 Mon, 16 Aug 2021 04:50:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1/8th73m8tHIuh62qOvPaG/Fbnpdo2RodI0iLN4ryeoQ23cqmJuzJTKVPXSq1VIR+hXWCQQ==
X-Received: by 2002:a17:906:b811:: with SMTP id
 dv17mr15450436ejb.444.1629114633625; 
 Mon, 16 Aug 2021 04:50:33 -0700 (PDT)
Received: from redhat.com ([2.55.150.133])
 by smtp.gmail.com with ESMTPSA id w11sm1118135edc.5.2021.08.16.04.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 04:50:33 -0700 (PDT)
Date: Mon, 16 Aug 2021 07:50:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PING][PING] [PATCH v4] vhost: make SET_VRING_ADDR, SET_FEATURES
 send replies
Message-ID: <20210816074947-mutt-send-email-mst@kernel.org>
References: <20210809104824.78830-1-den-plotnikov@yandex-team.ru>
 <14cad3d1-c99b-32ef-2aa9-803a9eb27096@yandex-team.ru>
 <b83030bd-26d5-b26e-742b-185e9120a1cc@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <b83030bd-26d5-b26e-742b-185e9120a1cc@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 09:53:27AM +0300, Denis Plotnikov wrote:
> 
> On 12.08.2021 11:04, Denis Plotnikov wrote:
> > 
> > On 09.08.2021 13:48, Denis Plotnikov wrote:
> > > On vhost-user-blk migration, qemu normally sends a number of commands
> > > to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
> > > Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
> > > VHOST_USER_SET_VRING_ADDR per each started ring to enable "used ring"
> > > data logging.
> > > The issue is that qemu doesn't wait for reply from the vhost daemon
> > > for these commands which may result in races between qemu expectation
> > > of logging starting and actual login starting in vhost daemon.
> > > 
> > > The race can appear as follows: on migration setup, qemu enables
> > > dirty page
> > > logging by sending VHOST_USER_SET_FEATURES. The command doesn't
> > > arrive to a
> > > vhost-user-blk daemon immediately and the daemon needs some time to
> > > turn the
> > > logging on internally. If qemu doesn't wait for reply, after sending the
> > > command, qemu may start migrateing memory pages to a destination. At
> > > this time,
> > > the logging may not be actually turned on in the daemon but some
> > > guest pages,
> > > which the daemon is about to write to, may have already been transferred
> > > without logging to the destination. Since the logging wasn't turned on,
> > > those pages won't be transferred again as dirty. So we may end up with
> > > corrupted data on the destination.
> > > The same scenario is applicable for "used ring" data logging, which is
> > > turned on with VHOST_USER_SET_VRING_ADDR command.
> > > 
> > > To resolve this issue, this patch makes qemu wait for the command result
> > > explicitly if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated and
> > > logging enabled.
> > > 
> > > Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>


This looks reasonable. This change is too scary for 6.1 so
I think it should wait for 6.2.

Thanks!

> > > ---
> > > v3 -> v4:
> > >    * join acked reply and get_features in enforce_reply [mst]
> > >    * typos, rewording, cosmetic changes [mst]
> > > 
> > > v2 -> v3:
> > >    * send VHOST_USER_GET_FEATURES to flush out outstanding messages
> > > [mst]
> > > 
> > > v1 -> v2:
> > >    * send reply only when logging is enabled [mst]
> > > 
> > > v0 -> v1:
> > >    * send reply for SET_VRING_ADDR, SET_FEATURES only [mst]
> > > ---
> > >   hw/virtio/vhost-user.c | 139 +++++++++++++++++++++++++++++------------
> > >   1 file changed, 98 insertions(+), 41 deletions(-)
> > > 
> > > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > > index ee57abe04526..5bb9254acd21 100644
> > > --- a/hw/virtio/vhost-user.c
> > > +++ b/hw/virtio/vhost-user.c
> > > @@ -1095,23 +1095,6 @@ static int vhost_user_set_mem_table(struct
> > > vhost_dev *dev,
> > >       return 0;
> > >   }
> > >   -static int vhost_user_set_vring_addr(struct vhost_dev *dev,
> > > -                                     struct vhost_vring_addr *addr)
> > > -{
> > > -    VhostUserMsg msg = {
> > > -        .hdr.request = VHOST_USER_SET_VRING_ADDR,
> > > -        .hdr.flags = VHOST_USER_VERSION,
> > > -        .payload.addr = *addr,
> > > -        .hdr.size = sizeof(msg.payload.addr),
> > > -    };
> > > -
> > > -    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> > > -        return -1;
> > > -    }
> > > -
> > > -    return 0;
> > > -}
> > > -
> > >   static int vhost_user_set_vring_endian(struct vhost_dev *dev,
> > >                                          struct vhost_vring_state *ring)
> > >   {
> > > @@ -1288,72 +1271,146 @@ static int vhost_user_set_vring_call(struct
> > > vhost_dev *dev,
> > >       return vhost_set_vring_file(dev, VHOST_USER_SET_VRING_CALL, file);
> > >   }
> > >   -static int vhost_user_set_u64(struct vhost_dev *dev, int request,
> > > uint64_t u64)
> > > +
> > > +static int vhost_user_get_u64(struct vhost_dev *dev, int request,
> > > uint64_t *u64)
> > >   {
> > >       VhostUserMsg msg = {
> > >           .hdr.request = request,
> > >           .hdr.flags = VHOST_USER_VERSION,
> > > -        .payload.u64 = u64,
> > > -        .hdr.size = sizeof(msg.payload.u64),
> > >       };
> > >   +    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
> > > +        return 0;
> > > +    }
> > > +
> > >       if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> > >           return -1;
> > >       }
> > >   +    if (vhost_user_read(dev, &msg) < 0) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (msg.hdr.request != request) {
> > > +        error_report("Received unexpected msg type. Expected %d
> > > received %d",
> > > +                     request, msg.hdr.request);
> > > +        return -1;
> > > +    }
> > > +
> > > +    if (msg.hdr.size != sizeof(msg.payload.u64)) {
> > > +        error_report("Received bad msg size.");
> > > +        return -1;
> > > +    }
> > > +
> > > +    *u64 = msg.payload.u64;
> > > +
> > >       return 0;
> > >   }
> > >   -static int vhost_user_set_features(struct vhost_dev *dev,
> > > -                                   uint64_t features)
> > > +static int vhost_user_get_features(struct vhost_dev *dev, uint64_t
> > > *features)
> > >   {
> > > -    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features);
> > > +    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
> > >   }
> > >   -static int vhost_user_set_protocol_features(struct vhost_dev *dev,
> > > -                                            uint64_t features)
> > > +static int enforce_reply(struct vhost_dev *dev,
> > > +                         const VhostUserMsg *msg)
> > >   {
> > > -    return vhost_user_set_u64(dev,
> > > VHOST_USER_SET_PROTOCOL_FEATURES, features);
> > > +    uint64_t dummy;
> > > +
> > > +    if (msg->hdr.flags & VHOST_USER_NEED_REPLY_MASK) {
> > > +        return process_message_reply(dev, msg);
> > > +    }
> > > +
> > > +   /*
> > > +    * We need to wait for a reply but the backend does not
> > > +    * support replies for the command we just sent.
> > > +    * Send VHOST_USER_GET_FEATURES which makes all backends
> > > +    * send a reply.
> > > +    */
> > > +    return vhost_user_get_features(dev, &dummy);
> > >   }
> > >   -static int vhost_user_get_u64(struct vhost_dev *dev, int request,
> > > uint64_t *u64)
> > > +static int vhost_user_set_vring_addr(struct vhost_dev *dev,
> > > +                                     struct vhost_vring_addr *addr)
> > >   {
> > >       VhostUserMsg msg = {
> > > -        .hdr.request = request,
> > > +        .hdr.request = VHOST_USER_SET_VRING_ADDR,
> > >           .hdr.flags = VHOST_USER_VERSION,
> > > +        .payload.addr = *addr,
> > > +        .hdr.size = sizeof(msg.payload.addr),
> > >       };
> > >   -    if (vhost_user_one_time_request(request) && dev->vq_index != 0) {
> > > -        return 0;
> > > +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> > > + VHOST_USER_PROTOCOL_F_REPLY_ACK);
> > > +
> > > +    /*
> > > +     * wait for a reply if logging is enabled to make sure
> > > +     * backend is actually logging changes
> > > +     */
> > > +    bool wait_for_reply = addr->flags & (1 << VHOST_VRING_F_LOG);
> > > +
> > > +    if (reply_supported && wait_for_reply) {
> > > +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> > >       }
> > >         if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> > >           return -1;
> > >       }
> > >   -    if (vhost_user_read(dev, &msg) < 0) {
> > > -        return -1;
> > > +    if (wait_for_reply) {
> > > +        return enforce_reply(dev, &msg);
> > >       }
> > >   -    if (msg.hdr.request != request) {
> > > -        error_report("Received unexpected msg type. Expected %d
> > > received %d",
> > > -                     request, msg.hdr.request);
> > > -        return -1;
> > > +    return 0;
> > > +}
> > > +
> > > +static int vhost_user_set_u64(struct vhost_dev *dev, int request,
> > > uint64_t u64,
> > > +                              bool wait_for_reply)
> > > +{
> > > +    VhostUserMsg msg = {
> > > +        .hdr.request = request,
> > > +        .hdr.flags = VHOST_USER_VERSION,
> > > +        .payload.u64 = u64,
> > > +        .hdr.size = sizeof(msg.payload.u64),
> > > +    };
> > > +
> > > +    if (wait_for_reply) {
> > > +        bool reply_supported =
> > > virtio_has_feature(dev->protocol_features,
> > > + VHOST_USER_PROTOCOL_F_REPLY_ACK);
> > > +        if (reply_supported) {
> > > +            msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> > > +        }
> > >       }
> > >   -    if (msg.hdr.size != sizeof(msg.payload.u64)) {
> > > -        error_report("Received bad msg size.");
> > > +    if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> > >           return -1;
> > >       }
> > >   -    *u64 = msg.payload.u64;
> > > +    if (wait_for_reply) {
> > > +        return enforce_reply(dev, &msg);
> > > +    }
> > >         return 0;
> > >   }
> > >   -static int vhost_user_get_features(struct vhost_dev *dev,
> > > uint64_t *features)
> > > +static int vhost_user_set_features(struct vhost_dev *dev,
> > > +                                   uint64_t features)
> > >   {
> > > -    return vhost_user_get_u64(dev, VHOST_USER_GET_FEATURES, features);
> > > +    /*
> > > +     * wait for a reply if logging is enabled to make sure
> > > +     * backend is actually logging changes
> > > +     */
> > > +    bool log_enabled = features & (0x1ULL << VHOST_F_LOG_ALL);
> > > +
> > > +    return vhost_user_set_u64(dev, VHOST_USER_SET_FEATURES, features,
> > > +                              log_enabled);
> > > +}
> > > +
> > > +static int vhost_user_set_protocol_features(struct vhost_dev *dev,
> > > +                                            uint64_t features)
> > > +{
> > > +    return vhost_user_set_u64(dev,
> > > VHOST_USER_SET_PROTOCOL_FEATURES, features,
> > > +                              false);
> > >   }
> > >     static int vhost_user_set_owner(struct vhost_dev *dev)


