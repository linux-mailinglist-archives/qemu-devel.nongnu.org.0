Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDC665EC9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:08:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFchi-0001pD-RF; Wed, 11 Jan 2023 10:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFch2-0001hy-I1
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pFch0-0008Mt-CA
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673449625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZwEqF/gYy/q6kYdxJ0yA28b8ANSSGO3rF+zp5viM5qU=;
 b=iXeLW3noFWG+pLj5n6nupSqTG6jy6L3CJ76dAkNO1Kb9xBStXv7oh19LY+kUbWYIWhbHtz
 ekP28BIyTwX8ma1dfIl4EEVwEUSA2gt2Pva3NZ/mMe9oN3IrBP6dfPU8e8M4uBvcCp8+un
 JYW6rb+n9QnClhDCkXDgR/Hxg69D++s=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-K4niW94aPwy5ync8YCUJOA-1; Wed, 11 Jan 2023 10:07:03 -0500
X-MC-Unique: K4niW94aPwy5ync8YCUJOA-1
Received: by mail-lj1-f199.google.com with SMTP id
 x32-20020a2ea9a0000000b0027b52e5e56cso4019877ljq.10
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZwEqF/gYy/q6kYdxJ0yA28b8ANSSGO3rF+zp5viM5qU=;
 b=VChONuPzbZKkT1hdBruqWD2EWl424bZzf/zipTD77eRj+TPDhkre5d7uzp8ofQPItl
 tr/5gq7aFUmcxdQI5ACj5mThrVgaNaEntSjeEIE2qSODAH/zCFhTxV6Gn58j3yr/l3Bb
 FIpsvIksK/tfm6KSAkXGQV8LtPDPginhtNOTRlsSfWxIdUNJeQie9pT+7DazZnM49Fvl
 +RBJCdSJu3pT8lDI9HGJfZO61QKhSLvWjiKTjO9BTcHdhMbAJ2yBTdQZXxjn7oxcuT9C
 cbSkf1RMBfUQK2t0CmGta2zcU39359OIbumeSf/q4pDI0pBul+m8k7BVzJBwoFa1Pum0
 7f3A==
X-Gm-Message-State: AFqh2kovznBAxghVFGJZkRg5D5/PpQGw7xcPHanMJlHc2Vxh4s5wl2kx
 sUHfQ2whhGXuTiv8lJb7g7fAzvjECIUS8puvPy11S7+R3f5SFeyqtFlQrXyLiJaS00HQ59F+7ck
 2F7rnPeT64O26KEW5AQgPwZlX1HiqgPM=
X-Received: by 2002:a05:6512:3a88:b0:4cc:66d4:41a0 with SMTP id
 q8-20020a0565123a8800b004cc66d441a0mr1187220lfu.21.1673449622082; 
 Wed, 11 Jan 2023 07:07:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu7fjYXM9duO0zq4et2TCl9k+GGkfg/9nXbUBkQCQj/VbEXB7v4iF64MTlexELRl/0UqB4dQlNVs8oDwQ4fuBs=
X-Received: by 2002:a05:6512:3a88:b0:4cc:66d4:41a0 with SMTP id
 q8-20020a0565123a8800b004cc66d441a0mr1187213lfu.21.1673449621689; Wed, 11 Jan
 2023 07:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20230110080756.38271-1-peter@pjd.dev>
 <20230110080756.38271-2-peter@pjd.dev>
 <CAFn=p-astqzr2vW0f3p9_36OfpiYJ1HXZRTLQDEdO7_F4g95hQ@mail.gmail.com>
 <Y758YAboUihlFNMF@redhat.com>
In-Reply-To: <Y758YAboUihlFNMF@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 11 Jan 2023 10:06:49 -0500
Message-ID: <CAFn=p-bdgyuHEAdM1Dhk4AbKsuDT75S1ROJ=nKapYyO-C+pOxQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] python/machine: Fix AF_UNIX path too long on macOS
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Delevoryas <peter@pjd.dev>, crosa@redhat.com, bleal@redhat.com,
 philmd@linaro.org, wainersm@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Wed, Jan 11, 2023 at 4:07 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jan 10, 2023 at 06:18:29PM -0500, John Snow wrote:
> > On Tue, Jan 10, 2023 at 3:34 AM Peter Delevoryas <peter@pjd.dev> wrote:
> > >
> > > On macOS, private $TMPDIR's are the default. These $TMPDIR's are
> > > generated from a user's unix UID and UUID [1], which can create a
> > > relatively long path:
> > >
> > >     /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/
> > >
> > > QEMU's avocado tests create a temporary directory prefixed by
> > > "avo_qemu_sock_", and create QMP sockets within _that_ as well.
> > > The QMP socket is unnecessarily long, because a temporary directory
> > > is created for every QEMUMachine object.
> > >
> > >     /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock
> > >
> > > The path limit for unix sockets on macOS is 104: [2]
> > >
> > >     /*
> > >      * [XSI] Definitions for UNIX IPC domain.
> > >      */
> > >     struct  sockaddr_un {
> > >         unsigned char   sun_len;        /* sockaddr len including nul=
l */
> > >         sa_family_t     sun_family;     /* [XSI] AF_UNIX */
> > >         char            sun_path[104];  /* [XSI] path name (gag) */
> > >     };
> > >
> > > This results in avocado tests failing on macOS because the QMP unix
> > > socket can't be created, because the path is too long:
> > >
> > >     ERROR| Failed to establish connection: OSError: AF_UNIX path too =
long
> > >
> > > This change resolves by reducing the size of the socket directory pre=
fix
> > > and the suffix on the QMP and console socket names.
> > >
> > > The result is paths like this:
> > >
> > >     pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
> > >     $ tree qemu*
> > >     qemu_df4evjeq
> > >     qemu_jbxel3gy
> > >     qemu_ml9s_gg7
> > >     qemu_oc7h7f3u
> > >     qemu_oqb1yf97
> > >     =E2=94=9C=E2=94=80=E2=94=80 10a004050.con
> > >     =E2=94=94=E2=94=80=E2=94=80 10a004050.qmp
> > >
> > > [1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-t=
emp-directory-in-weird-path
> > > [2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/inclu=
de/sys/un.h
> > >
> > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> >
> > I'm tentatively staging this with a benefit-of-the-doubt [1] -- my
> > tests are still running -- but I do have a question:
> >
> > > ---
> > >  python/qemu/machine/machine.py         | 6 +++---
> > >  tests/avocado/avocado_qemu/__init__.py | 2 +-
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mac=
hine.py
> > > index 748a0d807c9d..d70977378305 100644
> > > --- a/python/qemu/machine/machine.py
> > > +++ b/python/qemu/machine/machine.py
> > > @@ -157,7 +157,7 @@ def __init__(self,
> > >          self._wrapper =3D wrapper
> > >          self._qmp_timer =3D qmp_timer
> > >
> > > -        self._name =3D name or f"qemu-{os.getpid()}-{id(self):02x}"
> > > +        self._name =3D name or f"{id(self):x}"
> >
> > Why is it safe to not differentiate based on the process ID?
> >
> > ... I suppose the thinking is: by default, in machine.py, this is a
> > temp dir created by tempfile.mkdtemp which will be unique per-process.
> > I suppose there's no protection against a caller supplying the same
> > tempdir (or sockdir) to multiple instances, but I suppose in those
> > cases we get to argue that "Well, don't do that, then."
>
> Every process will have a separate tempdir, and if there are
> multiple instances of this class, 'id(self)' will provide
> uniqueness within the process.

Right. The only small thing is if a caller passes the same directory
to multiple instances across multiple processes, you could
*theoretically* get a collision, and we don't guard against it. It's
not a super likely occurrence so I'm fine with ignoring it, but I
think it's technically possible.


