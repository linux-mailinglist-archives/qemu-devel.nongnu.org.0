Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC26E50AB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 21:13:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poUHB-00070E-8N; Mon, 17 Apr 2023 15:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poUH9-000704-6i
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poUH7-0005hf-Io
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 15:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681758748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lEAABrA6PC/ZhMJzpq28W9UTWlJ3ihIRIQTK9FpRKw=;
 b=OS0t94pjijJ+PxIMIME9fDHPDjKYGG6TYParTxXWbNYPjg2UX5CO8dxyN5Y+l7x1V2W/G2
 nNWmFc4GjpCyb7YyRFyHvjrjO8lJ4y484fFUdzXH65rLWOvUoFv2xb0jRxWTWoXjt+PZBd
 h84vlap3Y0U2mZ44zTPYF3BhHMgm6yg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-qgn0-uRwODGjbIWrKdiWEw-1; Mon, 17 Apr 2023 15:12:27 -0400
X-MC-Unique: qgn0-uRwODGjbIWrKdiWEw-1
Received: by mail-yb1-f197.google.com with SMTP id
 85-20020a250d58000000b00b8f380b2bccso14839227ybn.14
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 12:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681758746; x=1684350746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0lEAABrA6PC/ZhMJzpq28W9UTWlJ3ihIRIQTK9FpRKw=;
 b=DTy2Ju8HwVGz24kPhhMvTp4s0/nqTajfswnAalGVEvMi/oOxqDqKRcMtOUzJ3IjULw
 K5syYeMwbRNaWS7uhr7DP4GKb2qsJUJryiFlKFVIUjaJelmZjPdMW8TETSXJerq2eAkV
 CmtJT+RIOz5DSPbkx2lJkrqeK7gJv9RSbik6CYXr/95iX2d/MDr9neIjFTxXg677s4Vz
 iW8cJgMqkrrFVCh/QAtcL7+Q7ahJ8EfOtA43qGNlSjToxsFQuVWb5H1NWcPEKArPvWHv
 vpW1XT4Q67UFgTBJgrm2xbEdn+RsvwFqmiYD75vqVjiG8H0n15gi84P71567JtW31vOk
 H3Aw==
X-Gm-Message-State: AAQBX9dSd5eB932O24hpZbptfUnh6nvweNNxHmzOXEhYjVPZzVODFlr1
 DVS9Ybxt9RsiHRkCUyxdVidwxjZyI+ay7HBUsU/KYTWDlsubhFziWePjqrze2ZbVV3nKcckf/RW
 rtJ0qU3pbzECYx72uflfV9PEBI0ZxpC0=
X-Received: by 2002:a81:4005:0:b0:540:e744:13ae with SMTP id
 l5-20020a814005000000b00540e74413aemr10243446ywn.3.1681758746591; 
 Mon, 17 Apr 2023 12:12:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3ThI0LYa2T3c2jreP4mB1sq/mUzVkaJBFOyl8HrgcS/42SjKzwVeaf+jHucgi23vaQazrYnCjTnxnSlPQhgA=
X-Received: by 2002:a81:4005:0:b0:540:e744:13ae with SMTP id
 l5-20020a814005000000b00540e74413aemr10243424ywn.3.1681758746300; Mon, 17 Apr
 2023 12:12:26 -0700 (PDT)
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
 <CAJSP0QWmFgJvVPLDo2eoFapj8GCmDjaaEygAaywZwHuH=_q=rQ@mail.gmail.com>
In-Reply-To: <CAJSP0QWmFgJvVPLDo2eoFapj8GCmDjaaEygAaywZwHuH=_q=rQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 17 Apr 2023 21:11:50 +0200
Message-ID: <CAJaqyWd122pfv4XMzQhju7a5DV3FwbXvbedh1Z9s6T5Pw4a0GQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
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

On Mon, Apr 17, 2023 at 9:08=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
>
> On Mon, 17 Apr 2023 at 14:56, Eugenio Perez Martin <eperezma@redhat.com> =
wrote:
> >
> > On Mon, Apr 17, 2023 at 5:18=E2=80=AFPM Stefan Hajnoczi <stefanha@redha=
t.com> wrote:
> > >
> > > On Fri, Apr 14, 2023 at 05:17:02PM +0200, Eugenio Perez Martin wrote:
> > > > On Thu, Apr 13, 2023 at 7:55=E2=80=AFPM Hanna Czenczek <hreitz@redh=
at.com> wrote:
> > > > >
> > > > > On 13.04.23 13:38, Stefan Hajnoczi wrote:
> > > > > > On Thu, 13 Apr 2023 at 05:24, Hanna Czenczek <hreitz@redhat.com=
> wrote:
> > > > > >> On 12.04.23 23:06, Stefan Hajnoczi wrote:
> > > > > >>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek wrot=
e:
> > > > > Basically, what I=E2=80=99m hearing is that I need to implement a=
 different
> > > > > feature that has no practical impact right now, and also fix bugs=
 around
> > > > > it along the way...
> > > > >
> > > >
> > > > To fix this properly requires iterative device migration in qemu as
> > > > far as I know, instead of using VMStates [1]. This way the state is
> > > > requested to virtiofsd before the device reset.
> > >
> > > I don't follow. Many devices are fine with non-iterative migration. T=
hey
> > > shouldn't be forced to do iterative migration.
> > >
> >
> > Sorry I think I didn't express myself well. I didn't mean to force
> > virtiofsd to support the iterative migration, but to use the device
> > iterative migration API in QEMU to send the needed commands before
> > vhost_dev_stop. In that regard, the device or the vhost-user commands
> > would not require changes.
> >
> > I think it is convenient in the long run for virtiofsd, as if the
> > state grows so much that it's not feasible to fetch it in one shot
> > there is no need to make changes in the qemu migration protocol. I
> > think it is not unlikely in virtiofs, but maybe I'm missing something
> > obvious and it's state will never grow.
>
> I don't understand. vCPUs are still running at that point and the
> device state could change. It's not safe to save the full device state
> until vCPUs have stopped (after vhost_dev_stop).
>

I think the vCPU is already stopped at save_live_complete_precopy
callback. Maybe my understanding is wrong?

Thanks!

> If you're suggestion somehow doing non-iterative migration but during
> the iterative phase, then I don't think that's possible?
>
> Stefan
>


