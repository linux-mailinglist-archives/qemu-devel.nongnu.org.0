Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8396E5E51
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 12:11:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poiI2-0005Gt-8t; Tue, 18 Apr 2023 06:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poiHx-0005Gc-Ke
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:10:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1poiHl-0000JL-04
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 06:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681812602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGtjYpiijUAKwmxUXsFpokLn+P0TE+N+tqK4ba8DXRE=;
 b=CcTlEcetWbOwfLNNX7Rhj5/6klA7wzKAFZ0dyIlG05k1BPj4m1Si9j705gM4LqqTfDFZb8
 /CY7qxo8mzF5tQaij693/joydXY088l0DMs9iNDlFXkuySr8C+cu+GDPyKEZs+dyEKuqUH
 K5U3pAoFu1uNCN8ABXvDAstlu5BPdnk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-fSRhJrj-M0upbhN_AqwkLw-1; Tue, 18 Apr 2023 06:10:01 -0400
X-MC-Unique: fSRhJrj-M0upbhN_AqwkLw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-54f87e44598so171213617b3.5
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 03:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681812601; x=1684404601;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGtjYpiijUAKwmxUXsFpokLn+P0TE+N+tqK4ba8DXRE=;
 b=hJOPqlBp7bNUUiWFvPV6wOiMwLzUyNIE6IHyslUve/VPjCW2YxHZ/M1FiwwMUjgD8r
 hivMXeHX5yYAJV/K+1CkpMcWZTVyawq1eMKANYN1YG1n8/IkkmvaaNptDxaY6593iRlh
 zXAt7OZP5PWUtpIixyAlywqOsKxVrRgcFyYbwWvIscwWo7lE55F+x3Roj9ZI3YgZQZ3g
 9z8+7ssfnU1bO+q5wZv6Rnq3qUH2dF9SSH+IKcT6joEDMy0ZgkbzBh8wNNZXCMmGCDne
 u2CtgMO/SgehcJmg2VmzONnygpD2T0iKZaMfDWtsmRviTvctb49TJ3UXjoZF+jf0Y4Xn
 cGJw==
X-Gm-Message-State: AAQBX9c7v8iIIhTb2jrh1j/H6WoTSqH5U38HXVxqShIdM1WhTZC6X8oS
 BHjwgxs2YvSbBNiK3TA3F+ju+P8ywlKOFiV5rvtl9FTHVbzrioEr4EIlXFDjLR48sqgBH05sgsU
 7j/Q/tKuiFpPJ44pLgjmQSZgY6HFzSAw=
X-Received: by 2002:a0d:d585:0:b0:54e:dc37:582 with SMTP id
 x127-20020a0dd585000000b0054edc370582mr17984188ywd.14.1681812600738; 
 Tue, 18 Apr 2023 03:10:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350bBk+5yyXoTkLhEcJWMr8b+xH+AzjfGkxwlSBqD6oesBxUMlYwugPs9z+flMyJ92kL/BR6+1S1J9icwoIKgzIQ=
X-Received: by 2002:a0d:d585:0:b0:54e:dc37:582 with SMTP id
 x127-20020a0dd585000000b0054edc370582mr17984177ywd.14.1681812600497; Tue, 18
 Apr 2023 03:10:00 -0700 (PDT)
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
 <CAJaqyWd122pfv4XMzQhju7a5DV3FwbXvbedh1Z9s6T5Pw4a0GQ@mail.gmail.com>
 <CAJSP0QWhivOnFmmkBoZkxui6xbUVjs3oEUc3-QwPN2V3d7t9rg@mail.gmail.com>
In-Reply-To: <CAJSP0QWhivOnFmmkBoZkxui6xbUVjs3oEUc3-QwPN2V3d7t9rg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 18 Apr 2023 12:09:23 +0200
Message-ID: <CAJaqyWe_CyPHMj8bvr7x0T+nRuPjQA1FSHzdFqbpaJfhHbUhEw@mail.gmail.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Apr 17, 2023 at 9:46=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
>
> On Mon, 17 Apr 2023 at 15:12, Eugenio Perez Martin <eperezma@redhat.com> =
wrote:
> >
> > On Mon, Apr 17, 2023 at 9:08=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail=
.com> wrote:
> > >
> > > On Mon, 17 Apr 2023 at 14:56, Eugenio Perez Martin <eperezma@redhat.c=
om> wrote:
> > > >
> > > > On Mon, Apr 17, 2023 at 5:18=E2=80=AFPM Stefan Hajnoczi <stefanha@r=
edhat.com> wrote:
> > > > >
> > > > > On Fri, Apr 14, 2023 at 05:17:02PM +0200, Eugenio Perez Martin wr=
ote:
> > > > > > On Thu, Apr 13, 2023 at 7:55=E2=80=AFPM Hanna Czenczek <hreitz@=
redhat.com> wrote:
> > > > > > >
> > > > > > > On 13.04.23 13:38, Stefan Hajnoczi wrote:
> > > > > > > > On Thu, 13 Apr 2023 at 05:24, Hanna Czenczek <hreitz@redhat=
.com> wrote:
> > > > > > > >> On 12.04.23 23:06, Stefan Hajnoczi wrote:
> > > > > > > >>> On Tue, Apr 11, 2023 at 05:05:13PM +0200, Hanna Czenczek =
wrote:
> > > > > > > Basically, what I=E2=80=99m hearing is that I need to impleme=
nt a different
> > > > > > > feature that has no practical impact right now, and also fix =
bugs around
> > > > > > > it along the way...
> > > > > > >
> > > > > >
> > > > > > To fix this properly requires iterative device migration in qem=
u as
> > > > > > far as I know, instead of using VMStates [1]. This way the stat=
e is
> > > > > > requested to virtiofsd before the device reset.
> > > > >
> > > > > I don't follow. Many devices are fine with non-iterative migratio=
n. They
> > > > > shouldn't be forced to do iterative migration.
> > > > >
> > > >
> > > > Sorry I think I didn't express myself well. I didn't mean to force
> > > > virtiofsd to support the iterative migration, but to use the device
> > > > iterative migration API in QEMU to send the needed commands before
> > > > vhost_dev_stop. In that regard, the device or the vhost-user comman=
ds
> > > > would not require changes.
> > > >
> > > > I think it is convenient in the long run for virtiofsd, as if the
> > > > state grows so much that it's not feasible to fetch it in one shot
> > > > there is no need to make changes in the qemu migration protocol. I
> > > > think it is not unlikely in virtiofs, but maybe I'm missing somethi=
ng
> > > > obvious and it's state will never grow.
> > >
> > > I don't understand. vCPUs are still running at that point and the
> > > device state could change. It's not safe to save the full device stat=
e
> > > until vCPUs have stopped (after vhost_dev_stop).
> > >
> >
> > I think the vCPU is already stopped at save_live_complete_precopy
> > callback. Maybe my understanding is wrong?
>
> Agreed, vCPUs are stopped in save_live_complete_precopy(). However,
> you wrote "use the device iterative migration API in QEMU to send the
> needed commands before vhost_dev_stop". save_live_complete_precopy()
> runs after vhost_dev_stop() so it doesn't seem to solve the problem.
>

You're right, and it actually makes the most sense.

So I guess this converges with the other thread, let's follow the
discussion there.

Thanks!


