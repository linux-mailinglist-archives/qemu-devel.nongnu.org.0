Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC363249BB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 05:21:52 +0100 (CET)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF89v-0008SQ-A9
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 23:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgreid@google.com>) id 1lF88C-0007Z7-KU
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:20:04 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:41910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dgreid@google.com>) id 1lF88A-0001Cm-AD
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 23:20:04 -0500
Received: by mail-ua1-x92f.google.com with SMTP id w24so1491874uau.8
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 20:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UyEWMqomPsgFt9cISGocbEnZpvvcvDBpocfl6dEAPJQ=;
 b=BsMGxhQFhvMGentOPbC55jsQiMr0zbgEmP6nANSP30CnR6CwVUb1HwVGMf2uOrkbf5
 3rRARpIbPszgD1ocZT8flnROX5yDroqaTOqN5OMZbjIdklG24pa4kTQ9Ihvx0L4cKJGy
 bmWym7R7J04z+W6qavETBvWAKV406NBu/ux2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UyEWMqomPsgFt9cISGocbEnZpvvcvDBpocfl6dEAPJQ=;
 b=e9nu8cPjrC+ZppDJWtjjwAD5QbnNUdNbk56YdycW55gLnAN9Ju1wi6tQHnUvQ7dQK8
 ejz4DynT31y5r/2Lxd9nDB8SnGgi3ZIKZ4GdixHdHW0lsMgxUR2y2ylOg0G46Po+AzKx
 enPdl//IMPf2vz2yyV6qcSlvy3K6ligKDiufv6sSigt1mwWhG89Xg5FNUMxwf/J5Uvnp
 pGyNqwxVDgHzzdpr4gFvRUCM3sREl6gf7t//D/IrrfQORxRSu11feN7fEUGMDSb36+nF
 oB/s6IZTcxjPyDlCH7u3rWWMjWVlBZb53zhLvC6nmf6Ne1Q58bsqc02hCNqTNH+kv3rx
 +pAw==
X-Gm-Message-State: AOAM531dXnXyCQGmF+8lK4lz4zcJIDPZKw3kxImdRbjA+UGnPI7scWC+
 CdF/7IUIQieYiT5W51YqdAWvRZW4veykPxt8J4zQog==
X-Google-Smtp-Source: ABdhPJywc/mTtulbV8yhS0JZvQjzSH7SJHuwqWU2ClcmZKqbQutrw2mwFOemf/GE3mNF7pWRAkWGvN1HAnFZLTKTmpY=
X-Received: by 2002:ab0:59c1:: with SMTP id k1mr646760uad.103.1614226799465;
 Wed, 24 Feb 2021 20:19:59 -0800 (PST)
MIME-Version: 1.0
References: <8735xskm7j.fsf@linaro.org>
 <20210223064312-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210223064312-mutt-send-email-mst@kernel.org>
From: Dylan Reid <dgreid@chromium.org>
Date: Wed, 24 Feb 2021 20:19:48 -0800
Message-ID: <CAEUnVG5twgJ+=_fzrPQCoc1PtJhFpD0tDpKD4WsTHG0jBmcD2A@mail.gmail.com>
Subject: Re: [Rust-VMM] vhost reply_ack negotiation (a.k.a differences in
 vhost-user behaviour with libvhost-user and vhost-user-backend.rs)
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=dgreid@google.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: Sergio Lopez <slp@redhat.com>, Chirantan Ekbote <chirantan@chromium.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Keiichi Watanabe <keiichiw@chromium.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 raphael.norwitz@nutanix.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 8:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Cc: Raphael
>
> On Fri, Feb 19, 2021 at 04:04:34PM +0000, Alex Benn=C3=A9e wrote:
> > Hi,
> >
> > I finally got a chance to get down into the guts of vhost-user while
> > attempting to port my original C RPMB daemon to Rust using the
> > vhost-user-backend and related crates. I ended up with this hang during
> > negotiation:
> >
> >   startup
> >
> >   vhost_user_write req:1 flags:0x1
> >   vhost_user_read_start
> >   vhost_user_read req:1 flags:0x5
> >   vhost_user_backend_init: we got 170000000
> >   vhost_user_write req:15 flags:0x1
> >   vhost_user_read_start
> >   vhost_user_read req:15 flags:0x5
> >   vhost_user_set_protocol_features: 2008
> >   vhost_user_write req:16 flags:0x1
> >   vhost_user_write req:3 flags:0x1
> >   vhost_user_write req:1 flags:0x1
> >   vhost_user_read_start
> >   vhost_user_read req:1 flags:0x5
> >   vhost_user_write req:13 flags:0x1
> >
> >   kernel initialises device
> >
> >   virtio_rpmb virtio1: init done!
> >   vhost_user_write req:13 flags:0x1
> >   vhost_dev_set_features: 130000000
> >   vhost_user_set_features: 130000000
> >   vhost_user_write req:2 flags:0x1
> >   vhost_user_write req:5 flags:0x9
> >   vhost_user_read_start
> >
> > The proximate cause is the vhost crate handling:
> >
> >   MasterReq::SET_MEM_TABLE =3D> {
> >       let res =3D self.set_mem_table(&hdr, size, &buf, rfds);
> >       self.send_ack_message(&hdr, res)?;
> >   }
> >
> > which gates on the replay_ack_enabled flag:
> >
> >     fn send_ack_message(
> >         &mut self,
> >         req: &VhostUserMsgHeader<MasterReq>,
> >         res: Result<()>,
> >     ) -> Result<()> {
> >         if dbg!(self.reply_ack_enabled) {
> >             let hdr =3D self.new_reply_header::<VhostUserU64>(req, 0)?;
> >             let val =3D match res {
> >                 Ok(_) =3D> 0,
> >                 Err(_) =3D> 1,
> >             };
> >             let msg =3D VhostUserU64::new(val);
> >             self.main_sock.send_message(&hdr, &msg, None)?;
> >         }
> >         Ok(())
> >     }
> >
> > which is only set when we have all the appropriate acknowledged flags:
> >
> >     fn update_reply_ack_flag(&mut self) {
> >         let vflag =3D VhostUserVirtioFeatures::PROTOCOL_FEATURES.bits()=
;
> >         let pflag =3D VhostUserProtocolFeatures::REPLY_ACK;
> >         if (self.virtio_features & vflag) !=3D 0
> >             && (self.acked_virtio_features & vflag) !=3D 0
> >             && self.protocol_features.contains(pflag)
> >             && (self.acked_protocol_features & pflag.bits()) !=3D 0
> >         {
> >             self.reply_ack_enabled =3D true;
> >         } else {
> >             self.reply_ack_enabled =3D false;
> >         }
> >     }
> >
> > which from above you can see QEMU helpfully dropped those bits in the
> > reply. It does however work in the C/libvhost version:
> >
> >   virtio_rpmb virtio1: init done!
> >   vhost_user_write req:13 flags:0x1
> >   vhost_dev_set_features: 130000000
> >   vhost_user_set_features: 130000000
> >   vhost_user_write req:2 flags:0x1
> >   vhost_user_write req:37 flags:0x9
> >   vhost_user_read_start
> >   vhost_user_read req:37 flags:0x5
> >   vhost_user_write req:8 flags:0x1
> >   vhost_user_write req:10 flags:0x1
> >   vhost_user_write req:9 flags:0x1
> >   vhost_user_write req:12 flags:0x1
> >   vhost_user_write req:13 flags:0x1
> >
> > albeit with a slightly different message sequence
> > (VHOST_USER_ADD_MEM_REG instead of VHOST_USER_SET_MEM_TABLE). Reading
> > the C code you can see why:
> >
> >     need_reply =3D vmsg.flags & VHOST_USER_NEED_REPLY_MASK;
> >
> >     reply_requested =3D vu_process_message(dev, &vmsg);
> >     if (!reply_requested && need_reply) {
> >         vmsg_set_reply_u64(&vmsg, 0);
> >         reply_requested =3D 1;
> >     }
> >
> > So regardless of what may have been negotiated it will always reply wit=
h
> > something if the master requested it do so. This points us at the
> > specification which reads:
> >
> >   - Bit 3 is the need_reply flag - see :ref:`REPLY_ACK <reply_ack>` for
> >     details.
> >
> > which says in VHOST_USER_PROTOCOL_F_REPLY_ACK that this bit should only
> > be honoured when the feature has been negotiated. Which brings us to a
> > series of questions:
> >
> >  - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEATURE=
S
> >    when doing the eventual VHOST_USER_SET_FEATURES reply?
>
> Hmm looks like a bug indeed ... Anyone wants to look
> into fixing that? Marc-Andr=C3=A9?

chirantan and keiichi will be implementing vhost-user-vitio-fs on
Chrome OS, maybe one of you two can take a look?


>
>
>
> >  - Is vhost.rs being to strict or libvhost-user too lax in interpreting
> >    the negotiated features before processing the ``need_reply`` [Bit 3]
> >    field of the messages?
> >
> >  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD included
> >    in the "list of the ones that do" require replies or do they only
> >    reply when REPLY_ACK has been negotiated as the ambiguous "seealso::=
"
> >    box out seems to imply?
> >
> > Currently I have some hacks in:
> >
> >   https://github.com/stsquad/vhost/tree/my-hacks
> >
> > which gets my daemon booting up to the point we actually need to do a
> > transaction. However I won't submit a PR until I've worked out exactly
> > where the problems are.
> >
> > --
> > Alex Benn=C3=A9e
>
>
> _______________________________________________
> Rust-vmm mailing list
> Rust-vmm@lists.opendev.org
> http://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm

