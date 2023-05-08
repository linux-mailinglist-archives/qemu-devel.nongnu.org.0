Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A36FB620
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 19:54:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw52M-0007Kq-DR; Mon, 08 May 2023 13:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pw52D-0007KZ-Pj
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pw52B-0002Vu-ME
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683568346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVJpKIZKCxVKbve+7dKdCFxCaAcb8H9ogq4MKGDwdsc=;
 b=K0hjvYhVgnXEXFfPrrIWYya6zrTEDcprGMN/l91o8j9p+XhpDErSQ8ZeIXDru2VHQyj4DP
 KuzI0jzBvbIa058boNK6qs7/qPIsMRrbCgnOPpypMrlAsIpgfa4RKy83WthirH4y+DAyo4
 mQ02PNr/QbGRjW6nRRC2CTRoPdnsnIU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-7ytgiFX4Nq-Bd4-O0hn4dQ-1; Mon, 08 May 2023 13:52:22 -0400
X-MC-Unique: 7ytgiFX4Nq-Bd4-O0hn4dQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-b9a7766d220so6094638276.2
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683568342; x=1686160342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PVJpKIZKCxVKbve+7dKdCFxCaAcb8H9ogq4MKGDwdsc=;
 b=Hla4Mq01rpK8FWcc0OkHCIsSKFPN5qSsjWaqFFkkDeFqe6fhXtG9HzyCesA6KUtUTO
 PCteZ3qcnO7lNNxteB4aU2AQouO+AVF1wsozD/xoxMZSP5xdmX2vBnk5SQdJAtXhOyto
 0KkkYMgI8A+dcisz08KezVtKxyP3byayU0bM946rUT4FGguqeFmhTg8xSZoNuZNin6Tx
 gffRH0Ad80+TnpVTWCOsHQP3X2b/QLn6PngGuoRHEeBeePLYzuFWvSCSgeImOwkJoCa2
 7hWmcuWXdWlDSoVrH+eOkXa9uAkBsTAt23Iyswe6dlCssv96xLEXM2v0UicOc4dGgZN8
 +H/g==
X-Gm-Message-State: AC+VfDw0fuekPiRxZEXi/AqCO/9r3kgLJNOav/W7mx1tVwYpbc5ppgqj
 JonhrWtl5OsWVEMUD3bdTr0LRIt+TQ0Ez1plNPbvu6jd9uVlz2QzGES9/t4did5c8lnvxn+ZHKS
 V1yhA5O3HIMGCncK6P9fbbFgMdTQJ/5k=
X-Received: by 2002:a25:d3c8:0:b0:b92:393a:8ee0 with SMTP id
 e191-20020a25d3c8000000b00b92393a8ee0mr11157265ybf.14.1683568342076; 
 Mon, 08 May 2023 10:52:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lj6tV9L/5xjwDJn497ww3IR6DFKBMmuX9TXzWH2Ffoc8jxkkXX6nsztQF67vsitXKUakMQtX42OLfxhVmosg=
X-Received: by 2002:a25:d3c8:0:b0:b92:393a:8ee0 with SMTP id
 e191-20020a25d3c8000000b00b92393a8ee0mr11157251ybf.14.1683568341815; Mon, 08
 May 2023 10:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <71e47e3e-880d-38d8-c1b0-3287c60365e4@redhat.com>
 <CAJaqyWe13QxuC9BNBULJ1xu1saWE9Y3ET8eEef-7qtyL5R73SQ@mail.gmail.com>
 <f04ed41d-39b6-a4e8-dfa5-c3e4936302ca@redhat.com>
 <d25a7982-cfca-6c6b-5dff-1a197fa0d262@redhat.com>
In-Reply-To: <d25a7982-cfca-6c6b-5dff-1a197fa0d262@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 8 May 2023 19:51:45 +0200
Message-ID: <CAJaqyWcf-U4tB3FxPWBKHh02ZNk7nEfLiZ=cnns8AdHSasv6CA@mail.gmail.com>
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, May 8, 2023 at 7:00=E2=80=AFPM Hanna Czenczek <hreitz@redhat.com> w=
rote:
>
> On 05.05.23 16:37, Hanna Czenczek wrote:
> > On 05.05.23 16:26, Eugenio Perez Martin wrote:
> >> On Fri, May 5, 2023 at 11:51=E2=80=AFAM Hanna Czenczek <hreitz@redhat.=
com>
> >> wrote:
> >>> (By the way, thanks for the explanations :))
> >>>
> >>> On 05.05.23 11:03, Hanna Czenczek wrote:
> >>>> On 04.05.23 23:14, Stefan Hajnoczi wrote:
> >>> [...]
> >>>
> >>>>> I think it's better to change QEMU's vhost code
> >>>>> to leave stateful devices suspended (but not reset) across
> >>>>> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
> >>>>> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
> >>>>> this aspect?
> >>>> Yes and no; I mean, I haven=E2=80=99t in detail, but I thought this =
is what=E2=80=99s
> >>>> meant by suspending instead of resetting when the VM is stopped.
> >>> So, now looking at vhost_dev_stop(), one problem I can see is that
> >>> depending on the back-end, different operations it does will do
> >>> different things.
> >>>
> >>> It tries to stop the whole device via vhost_ops->vhost_dev_start(),
> >>> which for vDPA will suspend the device, but for vhost-user will
> >>> reset it
> >>> (if F_STATUS is there).
> >>>
> >>> It disables all vrings, which doesn=E2=80=99t mean stopping, but may =
be
> >>> necessary, too.  (I haven=E2=80=99t yet really understood the use of =
disabled
> >>> vrings, I heard that virtio-net would have a need for it.)
> >>>
> >>> It then also stops all vrings, though, so that=E2=80=99s OK.  And bec=
ause this
> >>> will always do GET_VRING_BASE, this is actually always the same
> >>> regardless of transport.
> >>>
> >>> Finally (for this purpose), it resets the device status via
> >>> vhost_ops->vhost_reset_status().  This is only implemented on vDPA, a=
nd
> >>> this is what resets the device there.
> >>>
> >>>
> >>> So vhost-user resets the device in .vhost_dev_start, but vDPA only do=
es
> >>> so in .vhost_reset_status.  It would seem better to me if vhost-user
> >>> would also reset the device only in .vhost_reset_status, not in
> >>> .vhost_dev_start.  .vhost_dev_start seems precisely like the place to
> >>> run SUSPEND/RESUME.
> >>>
> >> I think the same. I just saw It's been proposed at [1].
> >>
> >>> Another question I have (but this is basically what I wrote in my las=
t
> >>> email) is why we even call .vhost_reset_status here.  If the device
> >>> and/or all of the vrings are already stopped, why do we need to reset
> >>> it?  Na=C3=AFvely, I had assumed we only really need to reset the dev=
ice if
> >>> the guest changes, so that a new guest driver sees a freshly
> >>> initialized
> >>> device.
> >>>
> >> I don't know why we didn't need to call it :). I'm assuming the
> >> previous vhost-user net did fine resetting vq indexes, using
> >> VHOST_USER_SET_VRING_BASE. But I don't know about more complex
> >> devices.
> >>
> >> The guest can reset the device, or write 0 to the PCI config status,
> >> at any time. How does virtiofs handle it, being stateful?
> >
> > Honestly a good question because virtiofsd implements neither
> > SET_STATUS nor RESET_DEVICE.  I=E2=80=99ll have to investigate that.
> >
> > I think when the guest resets the device, SET_VRING_BASE always comes
> > along some way or another, so that=E2=80=99s how the vrings are reset. =
 Maybe
> > the internal state is reset only following more high-level FUSE
> > commands like INIT.
>
> So a meeting and one session of looking-into-the-code later:
>
> We reset every virt queue on GET_VRING_BASE, which is wrong, but happens
> to serve the purpose.  (German is currently on that.)
>
> In our meeting, German said the reset would occur when the memory
> regions are changed, but I can=E2=80=99t see that in the code.

That would imply that the status is reset when the guest's memory is
added or removed?

> I think it only
> happens implicitly through the SET_VRING_BASE call, which resets the
> internal avail/used pointers.
>
> [This doesn=E2=80=99t seem different from libvhost-user, though, which
> implements neither SET_STATUS nor RESET_DEVICE, and which pretends to
> reset the device on RESET_OWNER, but really doesn=E2=80=99t (its
> vu_reset_device_exec() function just disables all vrings, doesn=E2=80=99t=
 reset
> or even stop them).]
>
> Consequently, the internal state is never reset.  It would be cleared on
> a FUSE Destroy message, but if you just force-reset the system, the
> state remains into the next reboot.  Not even FUSE Init clears it, which
> seems weird.  It happens to work because it=E2=80=99s still the same file=
system,
> so the existing state fits, but it kind of seems dangerous to keep e.g.
> files open.  I don=E2=80=99t think it=E2=80=99s really exploitable becaus=
e everything
> still goes through the guest kernel, but, well.  We should clear the
> state on Init, and probably also implement SET_STATUS and clear the
> state there.
>

I see. That's in the line of assuming GET_VRING_BASE is the last
message received from qemu.

Thanks!


