Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D23BEFD3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:49:57 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1CcO-0004ZI-Ae
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1CX4-0005l3-DE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1CX0-0000Xj-FQ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 14:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625683461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTPm2OB4bI0SLMECP8hOxQQpJIQsuDGb0f1MoMExTkA=;
 b=egX7TQpr80apQMl3YjZ3z7rmGv9UOOHCnglDfIJTEKi1a3EZk7l5gfvGbLgloxJfyoOAOI
 8ywFHLDRJW8sdQVgN11jc+uVD9cFGgRgW3jkviL4HrCbuP0H9tbB0yUim7oyu3joi/Spgv
 45zPkEbbGeDLx2JbmUekHw2+FnuF2TE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-sagnGYhaP5i7qXddSVK1UQ-1; Wed, 07 Jul 2021 14:44:20 -0400
X-MC-Unique: sagnGYhaP5i7qXddSVK1UQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 z2-20020a5d4d020000b0290130e19b0ddbso1070252wrt.17
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 11:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pTPm2OB4bI0SLMECP8hOxQQpJIQsuDGb0f1MoMExTkA=;
 b=DQW4KBB8pHmj/L+UNRsGW+7/7DYqtGNnS7oL9nsVObsJfxwnrXS8Q2e9fH3Uuwk9B9
 +IPS4wBUg5PqSwNMec5wwsJrlhq8EWJtrgJMoTRRF+T663ET8meSiQJDsP46y+3joDDB
 VK9ubSKxiG1TsXT2oIgHvfBs8BODjt7/Jx0ir0oU846bc/U9aHlog/rnSZ98lRANPzRY
 hpuXhSYpUEuGlJ0CUwnl/CIMsb5S1Qatfpe34i/zdFBP5T12a7QeHxO4B+Kk71nTWSAk
 2h8FMkDkxIhdSrhHZ2gTVpsT2GSDoWKSdhrvhVLxbS75BkHV/JPGGgJK2bQ7u2W8Q9gd
 /azw==
X-Gm-Message-State: AOAM531iREyupffyTCPsR/13h1J9FAmochYIh1mlCX+QZFZGj20OmzZ6
 iQ5TY5HTYFpxGs5+Pp9Q2Vj4Q56spxvxXGe2ayZKOGGfMMFIxgoN4RnCvCDXLNnKtxGCsh5DBh2
 DMp7sOfp/o8oAZwo=
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr549041wmk.66.1625683459309;
 Wed, 07 Jul 2021 11:44:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYEX38//27700VEJeVJRxoWjBNxE2auDvvPRWu6cQ3+1rvNafTQzYE5wD1tZDVqcK1MItWig==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr549014wmk.66.1625683459010;
 Wed, 07 Jul 2021 11:44:19 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id y16sm20167253wrw.42.2021.07.07.11.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 11:44:18 -0700 (PDT)
Date: Wed, 7 Jul 2021 14:44:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v0] vhost: make SET_VRING_ADDR, SET_[PROTOCOL_]FEATEURES
 send replies
Message-ID: <20210707144355-mutt-send-email-mst@kernel.org>
References: <20210625085210.236299-1-den-plotnikov@yandex-team.ru>
 <20210707060936-mutt-send-email-mst@kernel.org>
 <d7d3deec-f1d1-4fce-dbf0-a0cbd8063504@yandex-team.ru>
 <20210707103555-mutt-send-email-mst@kernel.org>
 <13c22772-5642-06b9-2ba3-864995544cd2@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <13c22772-5642-06b9-2ba3-864995544cd2@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 05:58:50PM +0300, Denis Plotnikov wrote:
> 
> On 07.07.2021 17:39, Michael S. Tsirkin wrote:
> > On Wed, Jul 07, 2021 at 03:19:20PM +0300, Denis Plotnikov wrote:
> > > On 07.07.2021 13:10, Michael S. Tsirkin wrote:
> > > > On Fri, Jun 25, 2021 at 11:52:10AM +0300, Denis Plotnikov wrote:
> > > > > On vhost-user-blk migration, qemu normally sends a number of commands
> > > > > to enable logging if VHOST_USER_PROTOCOL_F_LOG_SHMFD is negotiated.
> > > > > Qemu sends VHOST_USER_SET_FEATURES to enable buffers logging and
> > > > > VHOST_USER_SET_FEATURES per each started ring to enable "used ring"
> > > > > data logging.
> > > > > The issue is that qemu doesn't wait for reply from the vhost daemon
> > > > > for these commands which may result in races between qemu expectation
> > > > > of logging starting and actual login starting in vhost daemon.
> > > > Could you be more explicit please? What kind of race have you
> > > > observed? Getting a reply slows down the setup considerably and
> > > > should not be done lightly.
> > > I'm talking about the vhost-user-blk case. On migration setup, we enable
> > > logging by sending VHOST_USER_SET_FEATURES. The command doesn't arrive to a
> > > vhost-user-blk daemon immediately and the daemon needs some time turn the
> > > logging on internally. If qemu doesn't wait for reply, after sending the
> > > command qemu may start migrate memory pages. At this time the logging may
> > > not be actually turned on in the daemon  but some guest pages, which the
> > > daemon is about to write to, may be already transferred without logging to a
> > > destination. Since the logging wasn't turned on, those pages won't be
> > > transferred again as dirty. So we may end up with corrupted data on the
> > > destination.
> > > 
> > > Have I managed to explain the case clearly?
> > > 
> > > Thanks!
> > > 
> > > Denis
> > OK so this is just about enabling logging. It would be cleaner to
> > defer migrating memory until response ... if that is too hard,
> > at least document why we are doing this please.
> > And, let's wait for an ack just in that case then - why not?
> > 
> > And what about VHOST_USER_SET_PROTOCOL_FEATURES?
> 
> The code uses the same path for both VHOST_USER_SET_PROTOCOL_FEATURES and
> VHOST_USER_SET_FEATURES via vhost_user_set_u64(). So, I decided to suggest
> adding reply to both of them, so both feature setting commands work
> similarly as it doesn't contradicts with vhost-user spec.
> 
> I'm not sure that it worth doing that, so if you think it's not I'll just
> remove them.
> 
> 
> Denis


I'm inclined to say let's not add to the latency of setting up the
device unnecessarily.

> > 
> > 
> > > > Thanks!
> > > > 
> > > > > To resolve this issue, this patch makes qemu wait for the commands result
> > > > > explicilty if VHOST_USER_PROTOCOL_F_REPLY_ACK is negotiated.
> > > > > Also, this patch adds the reply waiting for VHOST_USER_SET_PROTOCOL_FEATURES
> > > > > command to make the features setting functions work similary.
> > > > > 
> > > > > Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> > > > > ---
> > > > >    hw/virtio/vhost-user.c | 20 ++++++++++++++++++++
> > > > >    1 file changed, 20 insertions(+)
> > > > > 
> > > > > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > > > > index ee57abe04526..e47b82adab00 100644
> > > > > --- a/hw/virtio/vhost-user.c
> > > > > +++ b/hw/virtio/vhost-user.c
> > > > > @@ -1105,10 +1105,20 @@ static int vhost_user_set_vring_addr(struct vhost_dev *dev,
> > > > >            .hdr.size = sizeof(msg.payload.addr),
> > > > >        };
> > > > > +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> > > > > +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> > > > > +    if (reply_supported) {
> > > > > +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> > > > > +    }
> > > > > +
> > > > >        if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> > > > >            return -1;
> > > > >        }
> > > > > +    if (reply_supported) {
> > > > > +        return process_message_reply(dev, &msg);
> > > > > +    }
> > > > > +
> > > > >        return 0;
> > > > >    }
> > > > > @@ -1297,10 +1307,20 @@ static int vhost_user_set_u64(struct vhost_dev *dev, int request, uint64_t u64)
> > > > >            .hdr.size = sizeof(msg.payload.u64),
> > > > >        };
> > > > > +    bool reply_supported = virtio_has_feature(dev->protocol_features,
> > > > > +                                              VHOST_USER_PROTOCOL_F_REPLY_ACK);
> > > > > +    if (reply_supported) {
> > > > > +        msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
> > > > > +    }
> > > > > +
> > > > >        if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
> > > > >            return -1;
> > > > >        }
> > > > > +    if (reply_supported) {
> > > > > +        return process_message_reply(dev, &msg);
> > > > > +    }
> > > > > +
> > > > >        return 0;
> > > > >    }
> > > > > -- 
> > > > > 2.25.1


