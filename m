Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE66CABE4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:34:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqj3-0006Ka-Tg; Mon, 27 Mar 2023 13:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqj1-0006Gr-Ie
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:33:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqiu-0001PZ-GF
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679938412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrl5xMWoX0dZal/4E6A4b+z8ewpOd6GBXR/oHaHVEVg=;
 b=jGgwxs73rqpR7kRfDQonPIyqAIdugbrl6am6/MlDMKGxBdpzXHtFvkIFByyeqPYb9PnlqM
 LVVoc+H4lCblryrCQzy+3TuD/pgVkfzNnR9wAwhJvtZtdAFl7pR0qcER8il0niG003sUz2
 FKo6QvktG8X0jWpKTJYTpwo7DIgX2FI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-ytbp7B4cM_-3Sm3CNGKsGA-1; Mon, 27 Mar 2023 13:33:28 -0400
X-MC-Unique: ytbp7B4cM_-3Sm3CNGKsGA-1
Received: by mail-ot1-f72.google.com with SMTP id
 n30-20020a9d711e000000b006a11baeb49bso3166856otj.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679938408;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrl5xMWoX0dZal/4E6A4b+z8ewpOd6GBXR/oHaHVEVg=;
 b=Y5YFOxEJLA2EXqe5VDDtfZzOlAqu3j5P6Erir3wYvoErdugoCCRUpkUYl3BbzG1l99
 +bvEEU7UjQhtebj01zmDH07u+cLeNXTweMSIAfb5fORXpOVePXka7hEKH7SsZ25YDTD9
 eCT3sopxm80+TeBiUXpLQtVLihtL/nDagqnmHxwhmLEMRE52VjgF2p2CTuNRpiqb/o6s
 lASnZi8LDXH6Q3AEd9Fl3GHgm3pq4AQ9HkdskaixnYAG0y1YMecPOMjmNlJVG9hb8JSJ
 lncK2hPySa3n0lhfRsa5aqEfjrLAl/hDMyCNTy5VkgUIXGRFOM8Y3K58/VXaRXsK57fs
 QXnA==
X-Gm-Message-State: AO0yUKWIh2n/6EgZarPueAJYf1OUfchnRBFZERLfMM3pjEC0FhWBiSdN
 hq8XHaYpJg2L0Qt6rOr+I/J41rrqyiFyC02O0nj7QQAhKUeUd4bFisHAWJ/yGNfboqFGnPF4WHk
 9OQ0hfA98Yv3CBl7R9TLFhzmmhHOuW/k=
X-Received: by 2002:a05:6871:d96:b0:17e:1aaf:eb88 with SMTP id
 vi22-20020a0568710d9600b0017e1aafeb88mr3963667oab.3.1679938407741; 
 Mon, 27 Mar 2023 10:33:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgS9t7WBYhSnZLz6eCbbDv5xm7Yfk6NYlUzuNkgyUwUQdizW5mPOomtyYXTuDmG9eFpqV274n8wEIgRcgzZQ8=
X-Received: by 2002:a05:6871:d96:b0:17e:1aaf:eb88 with SMTP id
 vi22-20020a0568710d9600b0017e1aafeb88mr3963664oab.3.1679938407499; Mon, 27
 Mar 2023 10:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230326211700.68254-1-casantos@redhat.com>
 <ZCFg+cjoVPZEUdkT@redhat.com>
In-Reply-To: <ZCFg+cjoVPZEUdkT@redhat.com>
From: Carlos Santos <casantos@redhat.com>
Date: Mon, 27 Mar 2023 14:33:16 -0300
Message-ID: <CAC1VKkMr9rh6Q4kpXxLoh8_KsskvVgvEx9pS47++G7sb=K+O4A@mail.gmail.com>
Subject: Re: [PATCH V2] meson: install keyboard maps only if necessary
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
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

On Mon, Mar 27, 2023 at 6:25=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Sun, Mar 26, 2023 at 06:17:00PM -0300, casantos@redhat.com wrote:
> > From: Carlos Santos <casantos@redhat.com>
> >
> > They are required only for system emulation (i.e. have_system is true).
> >
> > Signed-off-by: Carlos Santos <casantos@redhat.com>
> > ---
> >  pc-bios/keymaps/meson.build   | 6 ++++--
> >  tests/fp/berkeley-testfloat-3 | 2 +-
> >  ui/keycodemapdb               | 2 +-
>
> This still has the accidental git submodule updates included
>
> >  3 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> > index 158a3b410c..bff3083313 100644
> > --- a/pc-bios/keymaps/meson.build
> > +++ b/pc-bios/keymaps/meson.build
> > @@ -47,7 +47,7 @@ if native_qemu_keymap.found()
> >                         build_by_default: true,
> >                         output: km,
> >                         command: [native_qemu_keymap, '-f', '@OUTPUT@',=
 args.split()],
> > -                       install: true,
> > +                       install: have_system,
> >                         install_dir: qemu_datadir / 'keymaps')
> >    endforeach
> >
> > @@ -56,4 +56,6 @@ else
> >    install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
> >  endif
> >
> > -install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> > +if have_system
> > +  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
> > +endif
> > diff --git a/tests/fp/berkeley-testfloat-3 b/tests/fp/berkeley-testfloa=
t-3
> > index 40619cbb3b..5a59dcec19 160000
> > --- a/tests/fp/berkeley-testfloat-3
> > +++ b/tests/fp/berkeley-testfloat-3
> > @@ -1 +1 @@
> > -Subproject commit 40619cbb3bf32872df8c53cc457039229428a263
> > +Subproject commit 5a59dcec19327396a011a17fd924aed4fec416b3
> > diff --git a/ui/keycodemapdb b/ui/keycodemapdb
> > index f5772a62ec..d21009b1c9 160000
> > --- a/ui/keycodemapdb
> > +++ b/ui/keycodemapdb
> > @@ -1 +1 @@
> > -Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
> > +Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
> > --
> > 2.31.1

I submitted an updated patch. Thanks.

--=20
Carlos Santos
Senior Software Maintenance Engineer
Red Hat
casantos@redhat.com    T: +55-11-3534-6186


