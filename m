Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D0664806
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:03:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIgu-0006RD-WF; Tue, 10 Jan 2023 12:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFIgr-0006Q1-7f
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFIgo-0003AP-PN
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673372733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2qoeWeUfeS8LDZ7Iy4AcwFqpFNz0g7U2JniA7szB2c=;
 b=Hkqq/MuQkiVZYZJFAxtFG6VYYFQ+3IOZXqivna21Li/2N+j/G7JMTHRpwSW1U3lmL1ew1I
 sQUhj4jvuX/Qcvt3rY1pdKuXa4UHNd0f9tEkqfGgyBB5PlERaVxU2v91JXdlsaCuiMqIJ0
 V1oJuW28xvyTLbiqkTb+c3+d6HBFEws=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-GxJ8X_IANVOtCsAsyQ5vTw-1; Tue, 10 Jan 2023 12:45:31 -0500
X-MC-Unique: GxJ8X_IANVOtCsAsyQ5vTw-1
Received: by mail-lf1-f72.google.com with SMTP id
 l15-20020a056512110f00b004b6fe4513b7so4777767lfg.23
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X2qoeWeUfeS8LDZ7Iy4AcwFqpFNz0g7U2JniA7szB2c=;
 b=pbOep91iX/8B6vxAxwhCibF9T4fanDKM7wv2NKq4L7OiSUEQfTYtXGpnJ+olA7XNQw
 DoNYldFaPnYC5fWxIseBJEd5llpTAcKa7QR7R/cwjZFSbS7iDq3nI38/h/UHtBAAI9GM
 p2FGgCYDtBmDkZqVQxCap5QZ7+E65rUwxbNY0PHjjtjYOGGPbVVfKL65zfsnh1YeL1q3
 fU423TCz4RLVRVvLTQOB58s4sBZ73s1x92QGodNGnxqlI1YXqRsSKZ/vtPeut1AYZAKM
 xEK/epwlc1/MNjzidG92y+XXu9OO+z3hw/bk23P1gLCTqI+H5lq5AI2eBrGa5lQVp1/S
 y2Cw==
X-Gm-Message-State: AFqh2kpE0rXHB9Cx63QZvcwONsRFKYZNI4sejDBxM25IZtKduU39Vb8x
 CxfvaqpoPLAkdRrY5Dgy1OtFRUzyVTwPWczxo1xS6+Fkt9BaByii67Pub6/ZAA5hCI0fzLCqr+7
 rY+q29/iYQxAWPy5CMe3VyNHsSd7r0tE=
X-Received: by 2002:a05:6512:1cd:b0:4b5:b10b:6822 with SMTP id
 f13-20020a05651201cd00b004b5b10b6822mr3056268lfp.621.1673372729937; 
 Tue, 10 Jan 2023 09:45:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKisiWegJuNXT/KU9BQcNeIQQiewczDjfYEk5vQmz4CWM3pFaoxRaEaDgD+JNWaSLSxCRWRb+chKDKZZG8p08=
X-Received: by 2002:a05:6512:1cd:b0:4b5:b10b:6822 with SMTP id
 f13-20020a05651201cd00b004b5b10b6822mr3056262lfp.621.1673372729719; Tue, 10
 Jan 2023 09:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
 <CAFn=p-Z1JqriE2iD26pYFycNBZhkxK3wqOcz6KzD-CegFP+qKQ@mail.gmail.com>
 <CAJ+F1C+NEqp-P9BAzT5ADkxVP_pZyvtZPAOVz3R_Xq0w7tCmpg@mail.gmail.com>
 <CAFn=p-b-hXVGZJruWa7zY+-pXiqMCEN17FTSpHGNHWPPKMik2A@mail.gmail.com>
 <CAJ+F1CLrTb_UWwubr38v=2dEbVkJCF4RYKKDLRax=rhGyoiU0A@mail.gmail.com>
In-Reply-To: <CAJ+F1CLrTb_UWwubr38v=2dEbVkJCF4RYKKDLRax=rhGyoiU0A@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 10 Jan 2023 12:45:18 -0500
Message-ID: <CAFn=p-apVFU3XMK8ZWKbE8eYrXtWhV-VmQX1Y_rXETX7emOzDw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] python/qemu/machine: fix potential hang in QMP
 accept
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Jan 10, 2023 at 2:05 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi John
>
> On Tue, Jan 10, 2023 at 1:06 AM John Snow <jsnow@redhat.com> wrote:
> >
> > On Mon, Jul 25, 2022 at 7:23 AM Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@gmail.com> wrote:
> > >
> > > Hi
> > >
> > > On Fri, Jul 1, 2022 at 2:51 AM John Snow <jsnow@redhat.com> wrote:
> > >>
> > >> On Thu, Jun 30, 2022 at 8:34 AM <marcandre.lureau@redhat.com> wrote:
> > >> >
> > >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >> >
> > >> > Hi,
> > >> >
> > >> > As reported earlier by Richard Henderson ("virgl avocado hang" thr=
ead), avocado
> > >> > tests may hang when QEMU exits before the QMP connection is establ=
ished.
> > >> >
> > >> > v2:
> > >> >  - use a socketpair() for QMP (instead of async concurrent code fr=
om v1) as
> > >> >    suggested by Daniel Berrange.
> > >> >  - should not regress (hopefully)
> > >> >
> > >> > Marc-Andr=C3=A9 Lureau (3):
> > >> >   python/qmp/protocol: add open_with_socket()
> > >> >   python/qmp/legacy: make QEMUMonitorProtocol accept a socket
> > >> >   python/qemu/machine: use socketpair() for QMP by default
> > >> >
> > >> >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
> > >> >  python/qemu/qmp/legacy.py      | 18 +++++++++++++++---
> > >> >  python/qemu/qmp/protocol.py    | 25 ++++++++++++++++++++-----
> > >> >  3 files changed, 51 insertions(+), 16 deletions(-)
> > >> >
> > >> > --
> > >> > 2.37.0.rc0
> > >> >
> > >>
> > >> For anything that touches python/qemu/qmp/*, may I please ask that y=
ou
> > >> submit them to https://gitlab.com/qemu-project/python-qemu-qmp ?
> > >>
> > >
> > > Ok
> > >
> > >>
> > >> (I'll review them in the meantime on-list just in the interest of
> > >> moving things along.)
> > >
> > >
> > > I was waiting for a review before updating the patches / moving to py=
thon-qemu-qmp.
> > >
> >
> > Fair enough - can I kindly ask you to resend, though? My apologies and
> > Happy New Year!
>
> I am confused, what's the relation between QEMU python/qemu/qmp and
> https://gitlab.com/qemu-project/python-qemu-qmp ?
>
> When / how is the code sync ?
>

python-qemu-qmp supersedes the code that is in qemu.git.
qemu.git/python/qemu/qmp is scheduled to be deleted, but there are
changes that need to go in to configure etc to support the deletion
first, and I've been backlogged/waylaid on making those changes.

--js


