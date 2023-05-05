Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D306F84D5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 16:27:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwOb-0007ta-VP; Fri, 05 May 2023 10:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1puwOY-0007tG-Et
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:26:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1puwOU-0005Ft-WB
 for qemu-devel@nongnu.org; Fri, 05 May 2023 10:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683296805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4VhcrIzCruLCRn6+2QtWViRhbprTBJiR5SfBq9TbIw=;
 b=AMi+ofCcSt8UFCucIZMKbiodaFL9fc2FGghXOlws2/w+qHR2zXb3eEksyu7MozhCPfwLYz
 Y9xjuDTka6tK2ghfrf6XHZRY9yKHzpi3nz/kly+gzWnLTZ8Yq6Bt731YlwPGfs7e4KPL0l
 UHi36FtUA6cx7hGRzrhLdnvq3YndXQ8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-q2geqwnkNGylgyP05HRd4Q-1; Fri, 05 May 2023 10:26:45 -0400
X-MC-Unique: q2geqwnkNGylgyP05HRd4Q-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-b9a77926afbso3381302276.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 07:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683296804; x=1685888804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4VhcrIzCruLCRn6+2QtWViRhbprTBJiR5SfBq9TbIw=;
 b=UMdQJn9bGk80+n69LFDCPA5UmHe5ZKIF4In3tDmpJO+OLvHjSet1RRdd3BUvkJcV74
 LVBKtwr8RinZf57F7p7df+Bcbgdk7FJ6smGMMcdhWARO8Z9hE+Qj3R9pihpFfvI5pLel
 CRlMglmLlvJWJ0/jp70iQv5N1vyK7FQUuWel9vucSD7KsAXtt85wWUk3Sb5cXb4/esaq
 42lqn+t7w8ouSAJOoWiNKKYkmQfbz250Cimk4nfJuRljUmsleKZtKRysylrgjpQK0E+4
 WR9ZoZ0yDyobEIHb5rljMq8eooaEqRbbeO40221/5uQZJhPQ2uxWFI8a54CvruyTn13m
 EGyg==
X-Gm-Message-State: AC+VfDzHkWx1HedoqnYJgDcYloCIioEGLdp6+isTCs6dWwBVGL38SSFh
 +A1Iwb4pBWVgz5G5NApYukHYNe7s7JhdZBqaChQBMlBTRQJ/CoWEHalV4e+FDVWBZcl+Exp6vvA
 iB6FCeMnR4rctfSYz798wO5TTBu8X3zc=
X-Received: by 2002:a25:7413:0:b0:ba1:9d86:8df with SMTP id
 p19-20020a257413000000b00ba19d8608dfmr1957494ybc.8.1683296804355; 
 Fri, 05 May 2023 07:26:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vupqSZ5t9WVE9SvG7PYiZEU/s/Qk82gzJYX6q1ZQ39MiGNUNP5ACOFpxVgdeo9PNfV7yhsifqnfG+L+zT5pI=
X-Received: by 2002:a25:7413:0:b0:ba1:9d86:8df with SMTP id
 p19-20020a257413000000b00ba19d8608dfmr1957480ybc.8.1683296804094; Fri, 05 May
 2023 07:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
 <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
 <71e47e3e-880d-38d8-c1b0-3287c60365e4@redhat.com>
In-Reply-To: <71e47e3e-880d-38d8-c1b0-3287c60365e4@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 5 May 2023 16:26:08 +0200
Message-ID: <CAJaqyWe13QxuC9BNBULJ1xu1saWE9Y3ET8eEef-7qtyL5R73SQ@mail.gmail.com>
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
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

On Fri, May 5, 2023 at 11:51=E2=80=AFAM Hanna Czenczek <hreitz@redhat.com> =
wrote:
>
> (By the way, thanks for the explanations :))
>
> On 05.05.23 11:03, Hanna Czenczek wrote:
> > On 04.05.23 23:14, Stefan Hajnoczi wrote:
>
> [...]
>
> >> I think it's better to change QEMU's vhost code
> >> to leave stateful devices suspended (but not reset) across
> >> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
> >> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
> >> this aspect?
> >
> > Yes and no; I mean, I haven=E2=80=99t in detail, but I thought this is =
what=E2=80=99s
> > meant by suspending instead of resetting when the VM is stopped.
>
> So, now looking at vhost_dev_stop(), one problem I can see is that
> depending on the back-end, different operations it does will do
> different things.
>
> It tries to stop the whole device via vhost_ops->vhost_dev_start(),
> which for vDPA will suspend the device, but for vhost-user will reset it
> (if F_STATUS is there).
>
> It disables all vrings, which doesn=E2=80=99t mean stopping, but may be
> necessary, too.  (I haven=E2=80=99t yet really understood the use of disa=
bled
> vrings, I heard that virtio-net would have a need for it.)
>
> It then also stops all vrings, though, so that=E2=80=99s OK.  And because=
 this
> will always do GET_VRING_BASE, this is actually always the same
> regardless of transport.
>
> Finally (for this purpose), it resets the device status via
> vhost_ops->vhost_reset_status().  This is only implemented on vDPA, and
> this is what resets the device there.
>
>
> So vhost-user resets the device in .vhost_dev_start, but vDPA only does
> so in .vhost_reset_status.  It would seem better to me if vhost-user
> would also reset the device only in .vhost_reset_status, not in
> .vhost_dev_start.  .vhost_dev_start seems precisely like the place to
> run SUSPEND/RESUME.
>

I think the same. I just saw It's been proposed at [1].

> Another question I have (but this is basically what I wrote in my last
> email) is why we even call .vhost_reset_status here.  If the device
> and/or all of the vrings are already stopped, why do we need to reset
> it?  Na=C3=AFvely, I had assumed we only really need to reset the device =
if
> the guest changes, so that a new guest driver sees a freshly initialized
> device.
>

I don't know why we didn't need to call it :). I'm assuming the
previous vhost-user net did fine resetting vq indexes, using
VHOST_USER_SET_VRING_BASE. But I don't know about more complex
devices.

The guest can reset the device, or write 0 to the PCI config status,
at any time. How does virtiofs handle it, being stateful?

Thanks!

[1] https://lore.kernel.org/qemu-devel/20230501230409.274178-1-stefanha@red=
hat.com/


