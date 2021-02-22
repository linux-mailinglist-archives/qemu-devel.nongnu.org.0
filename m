Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE9E3218F4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:35:27 +0100 (CET)
Received: from localhost ([::1]:45554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBN0-000880-5W
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEBFe-0001yy-O2
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEBFb-00064O-Gw
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614000466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQNpQbeOj4EctOxczkHJ6+xFLRaX3EiOCe+SqqnVgic=;
 b=dM5Zl0xA84lmLcTSkB3Avx+eW8KWf9s5wK9YHnR47YLXrJPMLYnRWs7WY95kUrhZ5PF41o
 KWJjBOg0ARrvGa7CeWSHccbE6DTcXRSQRw+GZCnkeDCj8lSBGRKUTktDr2mtkdDCrNhwKQ
 XfC2otjWhiwZpU1UsLLd+bD8tBz1PLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-hLioClwfNbO3Uzkl-5Z1Mw-1; Mon, 22 Feb 2021 08:27:44 -0500
X-MC-Unique: hLioClwfNbO3Uzkl-5Z1Mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6333D801965;
 Mon, 22 Feb 2021 13:27:43 +0000 (UTC)
Received: from work-vm (ovpn-115-14.ams2.redhat.com [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F865D9CC;
 Mon, 22 Feb 2021 13:27:25 +0000 (UTC)
Date: Mon, 22 Feb 2021 13:27:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
Message-ID: <YDOxOv4w3J68b+uo@work-vm>
References: <8735xskm7j.fsf@linaro.org> <YDOsP1pWUS+hXiBX@work-vm>
 <871rd86xrf.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <871rd86xrf.fsf@linaro.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Bennée (alex.bennee@linaro.org) wrote:
> 
> Dr. David Alan Gilbert <dgilbert@redhat.com> writes:
> 
> > * Alex Bennée (alex.bennee@linaro.org) wrote:
> >> Hi,
> >> 
> >> I finally got a chance to get down into the guts of vhost-user while
> >> attempting to port my original C RPMB daemon to Rust using the
> >> vhost-user-backend and related crates. I ended up with this hang during
> >> negotiation:
> >> 
> >>   startup
> >> 
> >>   vhost_user_write req:1 flags:0x1
> >>   vhost_user_read_start
> >>   vhost_user_read req:1 flags:0x5
> >>   vhost_user_backend_init: we got 170000000
> 
> GET_FEATURES
> 
> >>   vhost_user_write req:15 flags:0x1
> >>   vhost_user_read_start
> >>   vhost_user_read req:15 flags:0x5
> >>   vhost_user_set_protocol_features: 2008
> >>   vhost_user_write req:16 flags:0x1
> >>   vhost_user_write req:3 flags:0x1
> >>   vhost_user_write req:1 flags:0x1
> >>   vhost_user_read_start
> >>   vhost_user_read req:1 flags:0x5
> >>   vhost_user_write req:13 flags:0x1
> >> 
> >>   kernel initialises device
> >> 
> >>   virtio_rpmb virtio1: init done!
> >>   vhost_user_write req:13 flags:0x1
> >>   vhost_dev_set_features: 130000000
> >>   vhost_user_set_features: 130000000
> 
> SET_FEATURES
> 
> >>   vhost_user_write req:2 flags:0x1
> >>   vhost_user_write req:5 flags:0x9
> >>   vhost_user_read_start
> >> 
> <snip>
> >> 
> >>  - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEATURES
> >>    when doing the eventual VHOST_USER_SET_FEATURES reply?
> >> 
> >>  - Is vhost.rs being to strict or libvhost-user too lax in interpreting
> >>    the negotiated features before processing the ``need_reply`` [Bit 3]
> >>    field of the messages?
> >
> > I think vhost.rs is being correctly strict - but there would be no harm
> > in it flagging that you'd hit an inconsistency if it finds a need_reply
> > without the feature.
> 
> But the feature should have been negotiated. So unless the slave can
> assume it is enabled because it asked I think QEMU is in the wrong by
> not preserving the feature bits in it's SET_FEATURES reply. We just gets
> away with it with libvhostuser being willing to reply anyway.

Oh I wasn't trying to reply to that bit; I can never remember how the
vhost/virtio feature bit negotiation works...

Dave

> >
> >>  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD included
> >>    in the "list of the ones that do" require replies or do they only
> >>    reply when REPLY_ACK has been negotiated as the ambiguous "seealso::"
> >>    box out seems to imply?
> >
> > set_mem_table gives a reply when postcopy is enabled (and then qemu
> > replies to the reply!) but otherwise doesn't.
> > (Note there's an issue opened for .rs to support ADD_MEM_REGION
> > since it's a lot better than SET_MEM_TABLE which has a fixed size table
> > that's small).
> 
> Thanks for the heads up.
> 
> >
> > Dave
> >
> >> Currently I have some hacks in:
> >> 
> >>   https://github.com/stsquad/vhost/tree/my-hacks
> >> 
> >> which gets my daemon booting up to the point we actually need to do a
> >> transaction. However I won't submit a PR until I've worked out exactly
> >> where the problems are.
> >> 
> >> -- 
> >> Alex Bennée
> >> 
> 
> 
> -- 
> Alex Bennée
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


