Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1154F906
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:18:33 +0200 (CEST)
Received: from localhost ([::1]:44122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Cnw-0005yg-Dl
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o2CmC-0005HO-Kp
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o2Cm9-0004cO-11
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655475399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dKLNmHdFs++5HMDRkZwaat3CVX5Hoxw6jLEn5zgJtYo=;
 b=Zl1creKL/etD2HZ6uYJ6VfrEZbe5yQvUbnfoplScIPAAosrfS/SY5pDuBBpkBhwjqHZZiY
 UZWkSKEMosCcYPFONHX+Yu8KOGgYU5xumQSaD/iK6j7rCt0V/sOY3V38TmuaEmzgiVfNd6
 KRPi/Re+KRi1xxwR/zc7CdqPpUrIVrA=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-Gr68IjxAMIKb_bp3oPNieQ-1; Fri, 17 Jun 2022 10:16:36 -0400
X-MC-Unique: Gr68IjxAMIKb_bp3oPNieQ-1
Received: by mail-vs1-f69.google.com with SMTP id
 o10-20020a67fc0a000000b0034e171729fdso292558vsq.23
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dKLNmHdFs++5HMDRkZwaat3CVX5Hoxw6jLEn5zgJtYo=;
 b=XnquXzLUpHxj7vSdvFswuR5dCol9X1ouNjmd0dBl7WAkLnpTCFdHqqD/YuoJ/sFqwX
 AhPrihTEo+SYRlvRFT1eUS0YmxskENVRb8v8XzPU2qglgFf6J/refE+ofA/NDHJOtDuX
 SJomhKcFHY0uH/XzomcWlpw9W7jhYW0MdrG6AK77lBYdCS+tHsC0n5gtUYQjDqVRVzk/
 O6NH8sfw4OA05n5mLE4UR7S6IBeDpYpmbfSxcU7/hfYUoouhBSlIlRR+K02Px+vMzufg
 j3Vp3QFiYjNoXNMdmzzU2EdLxvoeW8jVCJ4Gi1ZorH+nU5k2KEfB88sPK+bLuOB4KIHp
 SCsw==
X-Gm-Message-State: AJIora9n2UCRb2U0xuDu+/fc7j0WYqy/lyMUJqal+92pDZnyXgMQG0Sc
 QuL6vXHtTyP2sjjfu24cgxn3v+gvKVkBk1rT2pxPIyJ3tfBFcMAvg4zRW95IpD+OIp804QXtJle
 +cFkYCwFD3MC5yFR9Ek48Y/JM2xHL2UM=
X-Received: by 2002:ab0:168a:0:b0:378:d73d:f630 with SMTP id
 e10-20020ab0168a000000b00378d73df630mr4318752uaf.119.1655475394054; 
 Fri, 17 Jun 2022 07:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vllyai/7pqIz6cJWySBbr6pZ0Oko4njMmM6GTq07hF5lnz5clBzhQYxAQS0eVJSlqB3D+ncSDCOwzVYI2/rLM=
X-Received: by 2002:ab0:168a:0:b0:378:d73d:f630 with SMTP id
 e10-20020ab0168a000000b00378d73df630mr4318539uaf.119.1655475392053; Fri, 17
 Jun 2022 07:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-39-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-39-git-send-email-steven.sistare@oracle.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Jun 2022 10:16:20 -0400
Message-ID: <CAFn=p-bhH5=KitjvJ3+sW0y1vwDbF0hRE8orLu8xNOhzG8o_hQ@mail.gmail.com>
Subject: Re: [PATCH V8 38/39] python/machine: add QEMUMachine accessors
To: Steve Sistare <steven.sistare@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b120ed05e1a566cf"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b120ed05e1a566cf
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 15, 2022, 11:27 AM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Provide full_args() to return all command-line arguments used to start a
> vm, some of which are not otherwise visible to QEMUMachine clients.  This
> is needed by the cpr test, which must start a vm, then pass all qemu
> command-line arguments to the cpr-exec monitor call.
>
> Provide reopen_qmp_connection() to reopen a closed monitor connection.
> This is needed by cpr, because qemu-exec closes the monitor socket.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  python/qemu/machine/machine.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/python/qemu/machine/machine.py
> b/python/qemu/machine/machine.py
> index 37191f4..60b934d 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -332,6 +332,11 @@ def args(self) -> List[str]:
>          """Returns the list of arguments given to the QEMU binary."""
>          return self._args
>
> +    @property
> +    def full_args(self) -> List[str]:
> +        """Returns the full list of arguments used to launch QEMU."""
> +        return list(self._qemu_full_args)
> +
>

OK

     def _pre_launch(self) -> None:
>          if self._console_set:
>              self._remove_files.append(self._console_address)
> @@ -486,6 +491,15 @@ def _close_qmp_connection(self) -> None:
>          finally:
>              self._qmp_connection = None
>
> +    def reopen_qmp_connection(self):
> +        self._close_qmp_connection()
> +        self._qmp_connection = QEMUMonitorProtocol(
> +            self._monitor_address,
> +            server=True,
> +            nickname=self._name
> +        )
> +        self._qmp.accept(self._qmp_timer)
> +
>

Unrelated change, please split into a new commit. (Sorry.)

Seems harmless enough, though. Happy to give RB and AB to both if you split
the commits.

--js

--000000000000b120ed05e1a566cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 15, 2022, 11:27 AM Steve Sistare &lt;<a hr=
ef=3D"mailto:steven.sistare@oracle.com">steven.sistare@oracle.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Provide full_args() to return=
 all command-line arguments used to start a<br>
vm, some of which are not otherwise visible to QEMUMachine clients.=C2=A0 T=
his<br>
is needed by the cpr test, which must start a vm, then pass all qemu<br>
command-line arguments to the cpr-exec monitor call.<br>
<br>
Provide reopen_qmp_connection() to reopen a closed monitor connection.<br>
This is needed by cpr, because qemu-exec closes the monitor socket.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank" rel=3D"noreferrer">steven.sistare@oracle.com</a>&gt;<b=
r>
---<br>
=C2=A0python/qemu/machine/machine.py | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.p=
y<br>
index 37191f4..60b934d 100644<br>
--- a/python/qemu/machine/machine.py<br>
+++ b/python/qemu/machine/machine.py<br>
@@ -332,6 +332,11 @@ def args(self) -&gt; List[str]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Returns the list of arg=
uments given to the QEMU binary.&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self._args<br>
<br>
+=C2=A0 =C2=A0 @property<br>
+=C2=A0 =C2=A0 def full_args(self) -&gt; List[str]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Returns the full list of arg=
uments used to launch QEMU.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return list(self._qemu_full_args)<br>
+<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>OK</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0def _pre_launch(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self._console_set:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._remove_files.append(s=
elf._console_address)<br>
@@ -486,6 +491,15 @@ def _close_qmp_connection(self) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finally:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._qmp_connection =3D No=
ne<br>
<br>
+=C2=A0 =C2=A0 def reopen_qmp_connection(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._close_qmp_connection()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp_connection =3D QEMUMonitorProtocol(<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._monitor_address,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server=3DTrue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nickname=3Dself._name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self._qmp.accept(self._qmp_timer)<br>
+<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Unrelated change, please split into a new commit. (Sorry.)</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Seems harmless enough, though. Happy =
to give RB and AB to both if you split the commits.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">--js=C2=A0</div></div>

--000000000000b120ed05e1a566cf--


