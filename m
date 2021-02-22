Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC5321832
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:13:26 +0100 (CET)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEB1h-0003tv-Vc
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEAvp-0006s6-2i
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:07:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEAvm-0005fe-8u
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613999237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVdQS4ZUFYmOzxPgo/LPDPHKA/fjXwUZADeXIBLujvY=;
 b=H/bgALEkQQKw3gUD2Ada/mFk2xhmlioQFgGlS8BgraaAQFv3O59gIuYjkPqnxmX3Gn9dPr
 jT4tuMxRH9XCW+8FErxoFvkPrjx1bgHjFEBQh/i9RYzwhlTnSjBRRUgrDLiKB8BOjp4BiX
 z+CyQPrXa8E9Cpl327YXJsgSvQ7PRiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-rn4tXKUwPf2LqBw11ihHPQ-1; Mon, 22 Feb 2021 08:06:30 -0500
X-MC-Unique: rn4tXKUwPf2LqBw11ihHPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52918801965;
 Mon, 22 Feb 2021 13:06:26 +0000 (UTC)
Received: from work-vm (ovpn-115-14.ams2.redhat.com [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CE6D189A4;
 Mon, 22 Feb 2021 13:06:09 +0000 (UTC)
Date: Mon, 22 Feb 2021 13:06:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
Message-ID: <YDOsP1pWUS+hXiBX@work-vm>
References: <8735xskm7j.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8735xskm7j.fsf@linaro.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Bennée (alex.bennee@linaro.org) wrote:
> Hi,
> 
> I finally got a chance to get down into the guts of vhost-user while
> attempting to port my original C RPMB daemon to Rust using the
> vhost-user-backend and related crates. I ended up with this hang during
> negotiation:
> 
>   startup
> 
>   vhost_user_write req:1 flags:0x1
>   vhost_user_read_start
>   vhost_user_read req:1 flags:0x5
>   vhost_user_backend_init: we got 170000000
>   vhost_user_write req:15 flags:0x1
>   vhost_user_read_start
>   vhost_user_read req:15 flags:0x5
>   vhost_user_set_protocol_features: 2008
>   vhost_user_write req:16 flags:0x1
>   vhost_user_write req:3 flags:0x1
>   vhost_user_write req:1 flags:0x1
>   vhost_user_read_start
>   vhost_user_read req:1 flags:0x5
>   vhost_user_write req:13 flags:0x1
> 
>   kernel initialises device
> 
>   virtio_rpmb virtio1: init done!
>   vhost_user_write req:13 flags:0x1
>   vhost_dev_set_features: 130000000
>   vhost_user_set_features: 130000000
>   vhost_user_write req:2 flags:0x1
>   vhost_user_write req:5 flags:0x9
>   vhost_user_read_start
> 
> The proximate cause is the vhost crate handling:
> 
>   MasterReq::SET_MEM_TABLE => {
>       let res = self.set_mem_table(&hdr, size, &buf, rfds);
>       self.send_ack_message(&hdr, res)?;
>   }
> 
> which gates on the replay_ack_enabled flag:
> 
>     fn send_ack_message(
>         &mut self,
>         req: &VhostUserMsgHeader<MasterReq>,
>         res: Result<()>,
>     ) -> Result<()> {
>         if dbg!(self.reply_ack_enabled) {
>             let hdr = self.new_reply_header::<VhostUserU64>(req, 0)?;
>             let val = match res {
>                 Ok(_) => 0,
>                 Err(_) => 1,
>             };
>             let msg = VhostUserU64::new(val);
>             self.main_sock.send_message(&hdr, &msg, None)?;
>         }
>         Ok(())
>     }
> 
> which is only set when we have all the appropriate acknowledged flags:
> 
>     fn update_reply_ack_flag(&mut self) {
>         let vflag = VhostUserVirtioFeatures::PROTOCOL_FEATURES.bits();
>         let pflag = VhostUserProtocolFeatures::REPLY_ACK;
>         if (self.virtio_features & vflag) != 0
>             && (self.acked_virtio_features & vflag) != 0
>             && self.protocol_features.contains(pflag)
>             && (self.acked_protocol_features & pflag.bits()) != 0
>         {
>             self.reply_ack_enabled = true;
>         } else {
>             self.reply_ack_enabled = false;
>         }
>     }
> 
> which from above you can see QEMU helpfully dropped those bits in the
> reply. It does however work in the C/libvhost version:
> 
>   virtio_rpmb virtio1: init done!
>   vhost_user_write req:13 flags:0x1
>   vhost_dev_set_features: 130000000
>   vhost_user_set_features: 130000000
>   vhost_user_write req:2 flags:0x1
>   vhost_user_write req:37 flags:0x9
>   vhost_user_read_start
>   vhost_user_read req:37 flags:0x5
>   vhost_user_write req:8 flags:0x1
>   vhost_user_write req:10 flags:0x1
>   vhost_user_write req:9 flags:0x1
>   vhost_user_write req:12 flags:0x1
>   vhost_user_write req:13 flags:0x1
> 
> albeit with a slightly different message sequence
> (VHOST_USER_ADD_MEM_REG instead of VHOST_USER_SET_MEM_TABLE). Reading
> the C code you can see why:
> 
>     need_reply = vmsg.flags & VHOST_USER_NEED_REPLY_MASK;
> 
>     reply_requested = vu_process_message(dev, &vmsg);
>     if (!reply_requested && need_reply) {
>         vmsg_set_reply_u64(&vmsg, 0);
>         reply_requested = 1;
>     }
> 
> So regardless of what may have been negotiated it will always reply with
> something if the master requested it do so. This points us at the
> specification which reads:
> 
>   - Bit 3 is the need_reply flag - see :ref:`REPLY_ACK <reply_ack>` for
>     details.
> 
> which says in VHOST_USER_PROTOCOL_F_REPLY_ACK that this bit should only
> be honoured when the feature has been negotiated. Which brings us to a
> series of questions:
> 
>  - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEATURES
>    when doing the eventual VHOST_USER_SET_FEATURES reply?
> 
>  - Is vhost.rs being to strict or libvhost-user too lax in interpreting
>    the negotiated features before processing the ``need_reply`` [Bit 3]
>    field of the messages?

I think vhost.rs is being correctly strict - but there would be no harm
in it flagging that you'd hit an inconsistency if it finds a need_reply
without the feature.

>  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD included
>    in the "list of the ones that do" require replies or do they only
>    reply when REPLY_ACK has been negotiated as the ambiguous "seealso::"
>    box out seems to imply?

set_mem_table gives a reply when postcopy is enabled (and then qemu
replies to the reply!) but otherwise doesn't.
(Note there's an issue opened for .rs to support ADD_MEM_REGION
since it's a lot better than SET_MEM_TABLE which has a fixed size table
that's small).

Dave

> Currently I have some hacks in:
> 
>   https://github.com/stsquad/vhost/tree/my-hacks
> 
> which gets my daemon booting up to the point we actually need to do a
> transaction. However I won't submit a PR until I've worked out exactly
> where the problems are.
> 
> -- 
> Alex Bennée
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


