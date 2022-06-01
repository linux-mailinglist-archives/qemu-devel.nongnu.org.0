Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDA53A448
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 13:45:50 +0200 (CEST)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwMnM-0000l0-S5
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 07:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwMWo-0007Ay-96; Wed, 01 Jun 2022 07:28:42 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nwMWl-0002UL-HC; Wed, 01 Jun 2022 07:28:42 -0400
Received: by mail-oi1-x236.google.com with SMTP id t144so2218407oie.7;
 Wed, 01 Jun 2022 04:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8XYJcFM50zP1yJbguxhlIEfKnpAbms0/PfoIva434aY=;
 b=iAmYFHjtTR62X3WoLEeA+ypb0vMULDot+cxy1JAuQJUWJARNS4gCAYESyj4Bl0Kggl
 r3avxXYZs/S0YeGelsDoMp1/tBbtKSDzQ+27/z4wwOXAb40GZ1HO1qhDPX6P2wUMEX9R
 JouDgPRLm2fjBAX/u6qrE/W9RMfxRi2dzJorCchi6SfNBzLl7E545l4aKUpBpy0YpwCv
 Cmume+BgbogEX6ucjG/NW2vyj5EJsHRId5cY8wPtGhnDNDWDO56r5gNDhFdx05JUjM/6
 Bb/5JKmWVXd35/hKI2LL7tUd3d1Uehgh2id+Hhz3ZQH1aE0pZJjK9LXDfOeZX75gVr1o
 r4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8XYJcFM50zP1yJbguxhlIEfKnpAbms0/PfoIva434aY=;
 b=c6/h13LJreN9rAw7S/vaDd466uB04vnfbzUI7mHr8Ya91aqtRol/t30ekvA6B3Rn8v
 xR6zleHzs4SS40iFN98uFB9ppHHoGHe5Hvt+HudVF9/OZr47h6JLCjbQc06FVpmkA6JR
 zA7LBi7kHYVgHtXvQCnfs/64iGpkuzzV1RGZFwyI6e6FmHg3QgLdmJXZeO/R4T+bUbI1
 P5WSFhEVoQ12cqtvu5lhcCJpyINSPHyxUsrp5xFmDurqKLzPeaqgV4aV9B/KuKLuueKW
 lh9pRsM5SsFKr9Un8jX0ildWWgMLjLpPA52za0quPcJTf1FKWrOoyJ++PvkY3jxWTfjT
 ec3w==
X-Gm-Message-State: AOAM5320FO5EnWpRoZwJ6QpKOwPOYbivBDacasqOxIMm0MeEl2KalqXr
 r11LjLUtlfCynGSylei2cvSj+9RSlUUvGXbN3Tk=
X-Google-Smtp-Source: ABdhPJyxQ5/Zhogp01N+Im+GWTgARUCqaHr+e/68AifN87MuS2vgVL3XWZm/rXrr+aFZffbQduc+7734hifN8A1QywI=
X-Received: by 2002:a05:6808:3099:b0:32b:30de:d14e with SMTP id
 bl25-20020a056808309900b0032b30ded14emr13922130oib.212.1654082917602; Wed, 01
 Jun 2022 04:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
 <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
 <CAAAx-8JxWYBN1Zk6Vk-WHTzYnGE6b_PXHsoVY=gnUcuikW7JCg@mail.gmail.com>
In-Reply-To: <CAAAx-8JxWYBN1Zk6Vk-WHTzYnGE6b_PXHsoVY=gnUcuikW7JCg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 1 Jun 2022 12:28:25 +0100
Message-ID: <CAJSP0QUc6ONE9ye0EQppYN+G8zg9JekF5VPNdEsWzPwVTQd+1Q@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Sam Li <faithilikerun@gmail.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Jun 2022 at 11:19, Sam Li <faithilikerun@gmail.com> wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B46=
=E6=9C=881=E6=97=A5=E5=91=A8=E4=B8=89 13:47=E5=86=99=E9=81=93=EF=BC=9A
> > On 6/1/22 11:57, Sam Li wrote:
> > > Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=88=
30=E6=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A
> > >> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> wrote=
:
> > For the zone struct: You may need to add a read-write lock per zone to =
be
> > able to write lock zones to ensure a sequential write pattern (virtio
> > devices can be multi-queue and so writes may be coming in from differen=
t
> > contexts) and to correctly emulate zone append operations with an atomi=
c
> > update of the wp field.
> >
>
> Yes, I haven't thought through the thread-safety problem but I'll come
> up with an approach.

Operations in the I/O code path (as opposed to the control/management
code path) will probably be declared as coroutine_fn, which means that
they execute in a coroutine and can yield back to the event loop when
waiting for something to happen.

Coroutines can use CoMutex locks to serialize execution. This way only
one write request will be in flight at a time and the write pointer
can be updated atomically.

Here is a sketch of what the block/file-posix.c driver's write append
function would look like:

static int coroutine_fn raw_write_append_zone(BlockDriverState *bs,
uint64_t offset, uint64_t bytes, QEMUIOVector *qiov)
{
    BDRVRawState *s =3D bs->opaque;
    RawPosixAIOData acb =3D ...; /* fill in aio request state */

    /* Serialize append requests */
    QEMU_LOCK_GUARD(&s->append_locks[offset_to_lock_idx(offset)]);
    return raw_thread_pool_submit(bs, handle_aiocb_append_zone, &acb);
}

The actual system call runs in a thread pool worker function
handle_aiocb_append_zone() that performs the write on the underlying
fd and updates the write pointer if the syscall succeeds.

Stefan

