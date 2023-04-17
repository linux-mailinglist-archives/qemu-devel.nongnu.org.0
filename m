Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F30F6E50A1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:09:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUDO-0005Sr-LS; Mon, 17 Apr 2023 15:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poUDM-0005RF-Iz
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:08:36 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poUDK-0004s5-UH
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:08:36 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-54fb615ac3dso215868367b3.2
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681758511; x=1684350511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqmJ0u2JcL/PLkPPs6RH032zB5ZsNtlEvdwJ+5hnxzw=;
 b=gjJybOmBHM9YYpUHCXKdI9BKElpWX59zrFQJl/SqHOABzAY6TNLnz3gLM5XpcpBBSx
 +qMAzUEsc7fPTvlXBRioEmpSLlT5sXPpjbOe8432EaI8mH7o1c/69a7vfXz/b42JPmju
 IDlYlcB/Ctn+P+4/MNmfm4pLTnIM5bBxAymcyw/5TxB5CzyE3D+2/sihygpD22nRerq9
 6Fq4AUYXhp2YmAuvM/96xu5NvPPskBKBNT31CpAxfnOpo1atSw8nrWg0QedG1Ggy7AK+
 Tb9O/ao1h0k7erZq7FFOjzyLNpYa4t62i65ZKGmApfq1ejXXtuWGNd5M9LgMFH7WOPIy
 xWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681758511; x=1684350511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqmJ0u2JcL/PLkPPs6RH032zB5ZsNtlEvdwJ+5hnxzw=;
 b=RQdOwwunNyxIIcLy/BBI7lM9ve74kds1mxEE+7suN+HledaGW39dopj2G5suOTS5xq
 Szo8gCFxntnP1JkotosmlRse36x1+431LpA4YMBoB0oZHi8YmW4ij7tdOdv2WavVS/AE
 MQU7damBOQxzuRmahr3reNxUhcYxeR6GR6/nI3vXOOBt1AZJT/XOrhD1GmjdXLEd9ruh
 x1tJhsJnHCXL/AqVXZ+hojr6PgieDatYuEbLDJI4NVsruTFc2wcyAvfIMF3XmkgHMJZP
 kGdJ79CLC1gnRTxxe5h6ARbmV9AugNd4wxMg6YfkU6d0w2BqDp0i3+jApUhuE2EmWQsY
 pVuA==
X-Gm-Message-State: AAQBX9fhvWFvbMtgL8/uioYM1J73qxl9Gc7MKCkiAa0rwyfrFKdBgcPV
 NTndHvNy3BSVkoDT/94LsSUtxMlf29A+KnPqBAhGeV2T
X-Google-Smtp-Source: AKy350aWhtJNPgN8py1S8jmPO8puJf1wQSFskWOpaFYzUDXm51pqTda5bkTqyVli0W4VHHRZU1N3Vy9WKbJE145AzBc=
X-Received: by 2002:a81:b71c:0:b0:54f:b931:adf7 with SMTP id
 v28-20020a81b71c000000b0054fb931adf7mr10633010ywh.4.1681758511619; Mon, 17
 Apr 2023 12:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <246691c3-2287-7472-3615-7ec0f074445c@redhat.com>
 <CAJSP0QU-iDTT+xtkZ_xRf4vX+hM0WY+H1SXSuyS+cjiogz3A_A@mail.gmail.com>
 <b0cd4f54-94ed-09a4-cec2-e81f36da4008@redhat.com>
 <CAJaqyWegMfuc8s6bKdxdM4uVixmhy-F3xUUyOCYS1yGDXoiVZA@mail.gmail.com>
 <20230417151840.GD3852722@fedora>
 <CAJaqyWeTBXStyxty4G5qpiG=UoZkmOmr75hHaC3H21kJfK=idg@mail.gmail.com>
In-Reply-To: <CAJaqyWeTBXStyxty4G5qpiG=UoZkmOmr75hHaC3H21kJfK=idg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 17 Apr 2023 15:08:19 -0400
Message-ID: <CAJSP0QWmFgJvVPLDo2eoFapj8GCmDjaaEygAaywZwHuH=_q=rQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Apr 2023 at 14:56, Eugenio Perez Martin <eperezma@redhat.com> wr=
ote:
>
> On Mon, Apr 17, 2023 at 5:18=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.=
com> wrote:
> >
> > On Fri, Apr 14, 2023 at 05:17:02PM +0200, Eugenio Perez Martin wrote:
> > > On Thu, Apr 13, 2023 at 7:55=E2=80=AFPM Hanna Czenczek <hreitz@redhat=
.com> wrote:
> > > >
> > > > On 13.04.23 13:38, Stefan Hajnoczi wrote:
> > > > > On Thu, 13 Apr 2023 at 05:24, Hanna Czenczek <hreitz@redhat.com> =
wrote:
> > > > >> On 12.04.23 23:06, Stefan Hajnoczi wrote:
> > > > >>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrote:
> > > > Basically, what I=E2=80=99m hearing is that I need to implement a d=
ifferent
> > > > feature that has no practical impact right now, and also fix bugs a=
round
> > > > it along the way...
> > > >
> > >
> > > To fix this properly requires iterative device migration in qemu as
> > > far as I know, instead of using VMStates [1]. This way the state is
> > > requested to virtiofsd before the device reset.
> >
> > I don't follow. Many devices are fine with non-iterative migration. The=
y
> > shouldn't be forced to do iterative migration.
> >
>
> Sorry I think I didn't express myself well. I didn't mean to force
> virtiofsd to support the iterative migration, but to use the device
> iterative migration API in QEMU to send the needed commands before
> vhost_dev_stop. In that regard, the device or the vhost-user commands
> would not require changes.
>
> I think it is convenient in the long run for virtiofsd, as if the
> state grows so much that it's not feasible to fetch it in one shot
> there is no need to make changes in the qemu migration protocol. I
> think it is not unlikely in virtiofs, but maybe I'm missing something
> obvious and it's state will never grow.

I don't understand. vCPUs are still running at that point and the
device state could change. It's not safe to save the full device state
until vCPUs have stopped (after vhost_dev_stop).

If you're suggestion somehow doing non-iterative migration but during
the iterative phase, then I don't think that's possible?

Stefan

