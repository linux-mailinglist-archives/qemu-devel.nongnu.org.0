Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35EB670BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:38:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHuZ2-0001vC-DT; Tue, 17 Jan 2023 17:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHuZ0-0001uz-3x
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:36:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHuYy-0003pY-Iw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:36:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673994975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9dCsH+ViLsCH991itRq5FQxRL7lMtqK71HR5vc1sWg=;
 b=UHDXq0YFuBMS8362zVHA7xRPF5PyOI6rxEn1GWKabW0k0e1QRDQV7OHa+C0ulFA1xMhEyq
 izzB88e4QbSVCt5cCzM9CAKkKhndeCTXoXIZ1fN7jsJ/YD/sSF9xccG8UwYP6yFVp9aU8P
 n3b3Q6D29MZ8Ay35+4krRSXZ5sVO7vQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-Lv_pVECDOGW77Hi0MpbhSg-1; Tue, 17 Jan 2023 17:36:14 -0500
X-MC-Unique: Lv_pVECDOGW77Hi0MpbhSg-1
Received: by mail-pj1-f72.google.com with SMTP id
 lk5-20020a17090b33c500b00228cb369d7aso178604pjb.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D9dCsH+ViLsCH991itRq5FQxRL7lMtqK71HR5vc1sWg=;
 b=claGJGAw0tTCoCGztojwndMaA1m5QoA5O++8MVvRUUwzHUn8xq7F2BceGXV4jqpW9W
 OFEAAyOONiOuq4wYQg8XRMqt6Q++suoogX9hCmzzI8qSuO+c5G72fNIfpFt2TmoAF9TW
 fnCDnkDne52KqzNC2JCGkQ0eKkSjvVD6dJ2BM8LAB3vUf+78txzeOyte7t37Bb+3MVYl
 LOyAhbERlvUkP7qpVJTJMyfCjuURWm9X2DuuFwwlrYEIuQI7omRO+emHzujmMrxrx1de
 t5tO6QEisWu6TErOkw/GHHEao27+npCLAk8mI6U9ruip0xg8yHoq0EUmGrQKwJcehVSl
 skqg==
X-Gm-Message-State: AFqh2kqW0uAaaAikO0NUHd34Yn7WmZv+fefzERR1o97rjNrNIhB1UuWY
 KKMh4vCxB+d+ylbVyvUZ0lXVsdNtK8fFd07tkkgnSKNAUFxR3wux0XzMl2CJko6INlHAdtqkV+Y
 7SMGF3r7J1A3vXBGdiqsi9Ucx78fil0s=
X-Received: by 2002:a63:6547:0:b0:4cf:ea8f:f151 with SMTP id
 z68-20020a636547000000b004cfea8ff151mr180630pgb.284.1673994973428; 
 Tue, 17 Jan 2023 14:36:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVHZFwShEiaEvxt3NfHYdUlY6kRT/BZPrPuUH8Vw2/OwiMTp0kEzmqIKNLPATE/90/zcFa8veGwij/3sybrYo=
X-Received: by 2002:a63:6547:0:b0:4cf:ea8f:f151 with SMTP id
 z68-20020a636547000000b004cfea8ff151mr180623pgb.284.1673994973094; Tue, 17
 Jan 2023 14:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
 <20230111080101.969151-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230111080101.969151-4-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 17 Jan 2023 17:36:02 -0500
Message-ID: <CAFn=p-bbU23Hr67ONF6Vo0fNpiCC9+77CSmdF5-145QbtWc7Cg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] python/qemu/machine: use socketpair() for QMP by
 default
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, berrange@redhat.com, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
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

On Wed, Jan 11, 2023 at 3:01 AM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> When no monitor address is given, establish the QMP communication through
> a socketpair() (API is also supported on Windows since Python 3.5)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  python/qemu/machine/machine.py | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine=
.py
> index 748a0d807c..5b2e499e68 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -158,17 +158,13 @@ def __init__(self,
>          self._qmp_timer =3D qmp_timer
>
>          self._name =3D name or f"qemu-{os.getpid()}-{id(self):02x}"
> +        self._sock_pair: Optional[Tuple[socket.socket, socket.socket]] =
=3D None
>          self._temp_dir: Optional[str] =3D None
>          self._base_temp_dir =3D base_temp_dir
>          self._sock_dir =3D sock_dir
>          self._log_dir =3D log_dir
>
> -        if monitor_address is not None:
> -            self._monitor_address =3D monitor_address
> -        else:
> -            self._monitor_address =3D os.path.join(
> -                self.sock_dir, f"{self._name}-monitor.sock"
> -            )
> +        self._monitor_address =3D monitor_address
>
>          self._console_log_path =3D console_log
>          if self._console_log_path:
> @@ -303,7 +299,11 @@ def _base_args(self) -> List[str]:
>          args =3D ['-display', 'none', '-vga', 'none']
>
>          if self._qmp_set:
> -            if isinstance(self._monitor_address, tuple):
> +            if self._sock_pair:
> +                fd =3D self._sock_pair[0].fileno()
> +                os.set_inheritable(fd, True)
> +                moncdev =3D f"socket,id=3Dmon,fd=3D{fd}"
> +            elif isinstance(self._monitor_address, tuple):
>                  moncdev =3D "socket,id=3Dmon,host=3D{},port=3D{}".format=
(
>                      *self._monitor_address
>                  )
> @@ -337,10 +337,17 @@ def _pre_launch(self) -> None:
>              self._remove_files.append(self._console_address)
>
>          if self._qmp_set:
> +            monitor_address =3D None
> +            sock =3D None
> +            if self._monitor_address is None:
> +                self._sock_pair =3D socket.socketpair()
> +                sock =3D self._sock_pair[1]
>              if isinstance(self._monitor_address, str):
>                  self._remove_files.append(self._monitor_address)
> +                monitor_address =3D self._monitor_address
>              self._qmp_connection =3D QEMUMonitorProtocol(
> -                self._monitor_address,
> +                address=3Dmonitor_address,
> +                sock=3Dsock,
>                  server=3DTrue,
>                  nickname=3Dself._name
>              )
> @@ -360,6 +367,7 @@ def _pre_launch(self) -> None:
>          ))
>
>      def _post_launch(self) -> None:
> +        self._sock_pair[0].close()

Needs an assert or an error-check here for _sock_pair to be non-None,
otherwise mypy will shout. Try running "make check-dev" from
qemu.git/python directory as a smoke test.


>          if self._qmp_connection:
>              self._qmp.accept(self._qmp_timer)
>
> --
> 2.39.0
>


