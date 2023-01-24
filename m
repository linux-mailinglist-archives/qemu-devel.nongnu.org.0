Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE1678CBD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:23:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK75n-0004wl-Co; Mon, 23 Jan 2023 19:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pK75g-0004wS-7V
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pK75e-0005M5-5a
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674519784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvGumtR8/Y+hinMESfn+r5LklswupM3tDlYwxT02q7s=;
 b=Qv+zZI7oTjDNJ+u20WXOwVJTe69zsWcgyCEOQp812OjH4qrkx7RRgAzbPLLayQxH4EhuLK
 0AMkRgViu61kiOBs+L7ciDF8JXSqiYUPAMZnSUWVtX5wnXk1Geyd77pV2yjRhel5zTqnaR
 ReGfCmgHwOqpDHxI+ujwp2GK+wsEa5k=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-znlWB7yMPPe9TC3wFMBgWg-1; Mon, 23 Jan 2023 19:23:03 -0500
X-MC-Unique: znlWB7yMPPe9TC3wFMBgWg-1
Received: by mail-pl1-f197.google.com with SMTP id
 b9-20020a170903228900b00194a0110d7bso7984818plh.6
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvGumtR8/Y+hinMESfn+r5LklswupM3tDlYwxT02q7s=;
 b=8RljeaLcFBcod4Jjo+rcFYHdyXa2j/nRbPuTyF7ZgUrrnyERzHA9fzSrfkRimdsgU9
 UbWvBSviWEYMNlEWDnMGHJKwwyhiiJcfq03Lwj8JtoWWiBRnLi5yOUoY7sbBuXA9iRj5
 IZjH5CmgkkQnAIj6/Dn4eMdVJdQ7o7cbfmOmc6mcCz2NyCoGFSWpu83DdGXU89F8EjU4
 alUtZ3Af3Oym+Tj1HEcUzhnnIjxzRL5Z6EhwIc9nV8QSinaMdhcUFpBlaeBvgPiozl2p
 ZBI94PIHsf24a0dFFtcovu0tu9s9oiMwjc+6Y9txbXKHui+LrzLQQ/frtDHmY7wV9OJD
 HXqg==
X-Gm-Message-State: AFqh2koHbt1seZ3aYW6QlE3hap4uUgeGQrT0PMsKpIXlgmC1ac8yqp2n
 rVwZAPmcntO7HMjG2UI11JXNGkiYQB+VBkKmTQcQufympVoumr7ga5UMv8H3+7V4OLPjwna4LCK
 YsNostUj65ERRdP4PT+WX9w5KPI+tV3g=
X-Received: by 2002:a17:90b:3d8:b0:22b:af8f:b02b with SMTP id
 go24-20020a17090b03d800b0022baf8fb02bmr1394482pjb.134.1674519781359; 
 Mon, 23 Jan 2023 16:23:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3wArGjy0n4ka/oaP62RjqXSHseH15I6UIPNy1FGAv3i4YZSfiRgeI5PDiQPUx/b7Cg/hf75EhF20oNnGaLP0=
X-Received: by 2002:a17:90b:3d8:b0:22b:af8f:b02b with SMTP id
 go24-20020a17090b03d800b0022baf8fb02bmr1394478pjb.134.1674519781028; Mon, 23
 Jan 2023 16:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
 <20230111080101.969151-4-marcandre.lureau@redhat.com>
 <CAFn=p-bbU23Hr67ONF6Vo0fNpiCC9+77CSmdF5-145QbtWc7Cg@mail.gmail.com>
 <CAJ+F1C+JdP6C6_H7jLwQuW1hx18TxGqJhH50uus-+mKjh=xB=A@mail.gmail.com>
In-Reply-To: <CAJ+F1C+JdP6C6_H7jLwQuW1hx18TxGqJhH50uus-+mKjh=xB=A@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 23 Jan 2023 19:22:49 -0500
Message-ID: <CAFn=p-bKoDKe_qw1cWD78=iCDz0ZO7tNJhOFpfmRMpkpTzX5Sw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] python/qemu/machine: use socketpair() for QMP by
 default
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
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

On Wed, Jan 18, 2023 at 3:03 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Jan 18, 2023 at 2:36 AM John Snow <jsnow@redhat.com> wrote:
> >
> > On Wed, Jan 11, 2023 at 3:01 AM <marcandre.lureau@redhat.com> wrote:
> > >
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > When no monitor address is given, establish the QMP communication thr=
ough
> > > a socketpair() (API is also supported on Windows since Python 3.5)
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > ---
> > >  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
> > >  1 file changed, 16 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/mac=
hine.py
> > > index 748a0d807c..5b2e499e68 100644
> > > --- a/python/qemu/machine/machine.py
> > > +++ b/python/qemu/machine/machine.py
> > > @@ -158,17 +158,13 @@ def __init__(self,
> > >          self._qmp_timer =3D qmp_timer
> > >
> > >          self._name =3D name or f"qemu-{os.getpid()}-{id(self):02x}"
> > > +        self._sock_pair: Optional[Tuple[socket.socket, socket.socket=
]] =3D None
> > >          self._temp_dir: Optional[str] =3D None
> > >          self._base_temp_dir =3D base_temp_dir
> > >          self._sock_dir =3D sock_dir
> > >          self._log_dir =3D log_dir
> > >
> > > -        if monitor_address is not None:
> > > -            self._monitor_address =3D monitor_address
> > > -        else:
> > > -            self._monitor_address =3D os.path.join(
> > > -                self.sock_dir, f"{self._name}-monitor.sock"
> > > -            )
> > > +        self._monitor_address =3D monitor_address
> > >
> > >          self._console_log_path =3D console_log
> > >          if self._console_log_path:
> > > @@ -303,7 +299,11 @@ def _base_args(self) -> List[str]:
> > >          args =3D ['-display', 'none', '-vga', 'none']
> > >
> > >          if self._qmp_set:
> > > -            if isinstance(self._monitor_address, tuple):
> > > +            if self._sock_pair:
> > > +                fd =3D self._sock_pair[0].fileno()
> > > +                os.set_inheritable(fd, True)
> > > +                moncdev =3D f"socket,id=3Dmon,fd=3D{fd}"
> > > +            elif isinstance(self._monitor_address, tuple):
> > >                  moncdev =3D "socket,id=3Dmon,host=3D{},port=3D{}".fo=
rmat(
> > >                      *self._monitor_address
> > >                  )
> > > @@ -337,10 +337,17 @@ def _pre_launch(self) -> None:
> > >              self._remove_files.append(self._console_address)
> > >
> > >          if self._qmp_set:
> > > +            monitor_address =3D None
> > > +            sock =3D None
> > > +            if self._monitor_address is None:
> > > +                self._sock_pair =3D socket.socketpair()
> > > +                sock =3D self._sock_pair[1]
> > >              if isinstance(self._monitor_address, str):
> > >                  self._remove_files.append(self._monitor_address)
> > > +                monitor_address =3D self._monitor_address
> > >              self._qmp_connection =3D QEMUMonitorProtocol(
> > > -                self._monitor_address,
> > > +                address=3Dmonitor_address,
> > > +                sock=3Dsock,
> > >                  server=3DTrue,
> > >                  nickname=3Dself._name
> > >              )
> > > @@ -360,6 +367,7 @@ def _pre_launch(self) -> None:
> > >          ))
> > >
> > >      def _post_launch(self) -> None:
> > > +        self._sock_pair[0].close()
> >
> > Needs an assert or an error-check here for _sock_pair to be non-None,
> > otherwise mypy will shout. Try running "make check-dev" from
> > qemu.git/python directory as a smoke test.
>
> Good catch, it should be:
>
> +        if self._sock_pair:
> +            self._sock_pair[0].close()
>
> Let me know if you want me to resend the whole series, or if you can
> touch it during picking.

Touching it up during picking, running tests, PR soon. Thanks,
--js


