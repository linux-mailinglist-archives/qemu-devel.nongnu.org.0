Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970B3229A6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:48:17 +0100 (CET)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWAq-00084b-M8
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEW83-0007SF-BB
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEW7s-0004q9-O5
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614080704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TmgUR8mtFn/OGi35pPFGLa/+flr/D7IghxODDd3T4Zg=;
 b=OkQr4n3zfWyO8j/Hwt2qgjamd7pCiQUfQnxNaM1CaAZugNKraaCx1KB4WKQd56R6Q5cpH/
 m3w+C3qCUZddG3aerl9sKpNZh1B+wxzs3u6GPjetxpDxDFPpwoyoMJGKG2HNPh6UJj40VJ
 fVJOGeCGJabTpUguk3t28dRMPE2j6HA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-eZ0qcLGRNZWYcV6oDCSivQ-1; Tue, 23 Feb 2021 06:45:00 -0500
X-MC-Unique: eZ0qcLGRNZWYcV6oDCSivQ-1
Received: by mail-wr1-f72.google.com with SMTP id e29so7034343wra.12
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:45:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TmgUR8mtFn/OGi35pPFGLa/+flr/D7IghxODDd3T4Zg=;
 b=VzgSH7HdwbWPxSdXFC+lwtTfYA8huHwn6f/tkG92jCD41D3aGOvgcrJlCkM4jT6ked
 lecpNr4/wx+BLKAoZcg/vKmQ6iPtgRelUVqgfa69n4cSU+LN4ScP4mM/2BCp9wq7EW+I
 Fkm2kNXobmVUBh0WIhFHoYZvcS6ke6YQpmR3u1fbIdaHg72vzcDTJyaDvqQhXmxtmwXK
 hIGfIql2rbKIC1y28bdwlmY8geSSntFN7M76BiQnGxeTbHtBAVDSwHuEaY22TkKmzNrm
 QkoahmZFWO4meOnEYP3sfi8KQWzGlVzsbQABCiLGqxA+bCDErhUkpMrfND0ReHE17O4g
 ziyQ==
X-Gm-Message-State: AOAM5327n1j//tVh7ODq37NDhwyNtu654rYaWK+Lt+e/M02EPHH5SdP/
 vQicZJazc0OtkbCNhT1rH9NdEaEH5A7fAoJoFYCAJQ0E4Pu+tL9yk4GBUmuy67IIohfHU0IhviL
 8kjnI76JjRXHn70Y=
X-Received: by 2002:a5d:5586:: with SMTP id i6mr16386496wrv.250.1614080699398; 
 Tue, 23 Feb 2021 03:44:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWHJ/E9MogY6g/+K3tE3xtKq9Ygi+iPIKWdsAgjJ1wRZ7kuKhjIOikwHJt61Q3sGW+i0ywOA==
X-Received: by 2002:a5d:5586:: with SMTP id i6mr16386474wrv.250.1614080699152; 
 Tue, 23 Feb 2021 03:44:59 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id c133sm2478925wme.46.2021.02.23.03.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 03:44:58 -0800 (PST)
Date: Tue, 23 Feb 2021 06:44:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
Message-ID: <20210223064312-mutt-send-email-mst@kernel.org>
References: <8735xskm7j.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <8735xskm7j.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sergio Lopez <slp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Raphael

On Fri, Feb 19, 2021 at 04:04:34PM +0000, Alex Bennée wrote:
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

Hmm looks like a bug indeed ... Anyone wants to look
into fixing that? Marc-André?


>  - Is vhost.rs being to strict or libvhost-user too lax in interpreting
>    the negotiated features before processing the ``need_reply`` [Bit 3]
>    field of the messages?
> 
>  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD included
>    in the "list of the ones that do" require replies or do they only
>    reply when REPLY_ACK has been negotiated as the ambiguous "seealso::"
>    box out seems to imply?
> 
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


