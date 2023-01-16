Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFDD66CFDC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 21:08:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHVl8-0007Ze-Op; Mon, 16 Jan 2023 15:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHVl4-0007Yq-AH
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHVl0-0007zB-I1
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673899619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfvvnptCEX/ETs9QfLoD+/qnb0ruDHzLkdtp/idiQvk=;
 b=MVO7D3Qt4vMPRrTzLou6trNoh1XksSVXa8BSM3YMFrEJOtcE2KGX8y7hd3ACvUAInYCins
 EirgbBTh77xxLeg1TVbQ4aKaLIQWjTfwGdwkMaEKgZgN9hLTIe/2sMOujARG7MYcb0G1j+
 kNz/MkzH5VGu0zyuYtlsnd1TICV2t+g=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-Ehsg9sKkMqSefS2OforD-g-1; Mon, 16 Jan 2023 15:06:57 -0500
X-MC-Unique: Ehsg9sKkMqSefS2OforD-g-1
Received: by mail-pf1-f200.google.com with SMTP id
 24-20020aa79118000000b00580476432deso12932960pfh.23
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 12:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfvvnptCEX/ETs9QfLoD+/qnb0ruDHzLkdtp/idiQvk=;
 b=M5ErJU88N1m/RV1f7HWc6HfmtBFA63UGF1kkXkVSjY/GEh+67nKf6k0yK4AqeNE53v
 CCOJAjJ1cVIp+2cJ5bwH23DQgC4NDtRjtJawqReldpVl990+Hxhuq2n9qMt0mKlKQHh6
 TFKaHoTv7kvoXhuL8Ua3/BnQISftdbYqoTW5kuE1sxZn2S4kx0w6TBnnBVGrDMFdqddY
 TL1GWIfQRliKlg+XCnQD4Hdxcw6DAl8VJuWqEVWri2uvQrZSLCefbVzkCVSloRdRXMjm
 JhWQ/EAjJHqWvVNGt+OB6Vof97Il2rF8+mxoSMy7ONBp6iBClzy4wi5Mb1dY4RKcVDNQ
 +IqA==
X-Gm-Message-State: AFqh2krdJztu2C9C9cpV/g17LH1yE97DP/FejpbL3u+QEfOTlaW581Bl
 OfatA+iCWMyGEBekil4wTxaNDVJ/ItG53g+eCD6vrFNcFWKglBKIuUimltHY+P2ZISGjpsyrm6r
 V1kTe9Uvuot0s/MiBu90uHgb+SbQv3Lw=
X-Received: by 2002:a17:90a:e38b:b0:229:3677:5536 with SMTP id
 b11-20020a17090ae38b00b0022936775536mr32345pjz.134.1673899616285; 
 Mon, 16 Jan 2023 12:06:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKWqFmWw8XgB/CrTtYFydeaNTvtGsFJp7Dmy83JIpCDarVAld3JyDmze/M4ovCL+g5WzIeW9kVpv5ZuZWgYSE=
X-Received: by 2002:a17:90a:e38b:b0:229:3677:5536 with SMTP id
 b11-20020a17090ae38b00b0022936775536mr32337pjz.134.1673899615979; Mon, 16 Jan
 2023 12:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
 <20221130015358.6998-2-zhangdongdong@eswincomputing.com>
 <d6fc6751-1fe2-78de-49f5-2a34554767af@linaro.org>
 <a117f627-a043-4801-db65-114b0b0cc0a6@vivier.eu>
In-Reply-To: <a117f627-a043-4801-db65-114b0b0cc0a6@vivier.eu>
From: John Snow <jsnow@redhat.com>
Date: Mon, 16 Jan 2023 15:06:44 -0500
Message-ID: <CAFn=p-aCJ_r=vMVsvQPbVZH6WXMJooeLtK7eUqXX9OG2NejuGA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fix some typos
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Dongdong Zhang <zhangdongdong@eswincomputing.com>, qemu-devel@nongnu.org,
 crosa@redhat.com, bleal@redhat.com, QEMU Trivial <qemu-trivial@nongnu.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Jan 16, 2023 at 1:11 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 30/11/2022 =C3=A0 09:29, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> > On 30/11/22 02:53, Dongdong Zhang wrote:
> >> Fix some typos in 'python' directory.
> >>
> >> Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >
> >> ---
> >>   python/qemu/machine/console_socket.py | 2 +-
> >>   python/qemu/machine/qtest.py          | 2 +-
> >>   python/qemu/qmp/protocol.py           | 2 +-
> >>   python/qemu/qmp/qmp_tui.py            | 6 +++---
> >>   4 files changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/python/qemu/machine/console_socket.py b/python/qemu/machi=
ne/console_socket.py
> >> index 8c4ff598ad..4e28ba9bb2 100644
> >> --- a/python/qemu/machine/console_socket.py
> >> +++ b/python/qemu/machine/console_socket.py
> >> @@ -68,7 +68,7 @@ def _thread_start(self) -> threading.Thread:
> >>           """Kick off a thread to drain the socket."""
> >>           # Configure socket to not block and timeout.
> >>           # This allows our drain thread to not block
> >> -        # on recieve and exit smoothly.
> >> +        # on receive and exit smoothly.
> >>           socket.socket.setblocking(self, False)
> >>           socket.socket.settimeout(self, 1)
> >>           drain_thread =3D threading.Thread(target=3Dself._drain_fn)
> >> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.=
py
> >> index 1a1fc6c9b0..906bd13298 100644
> >> --- a/python/qemu/machine/qtest.py
> >> +++ b/python/qemu/machine/qtest.py
> >> @@ -42,7 +42,7 @@ class QEMUQtestProtocol:
> >>       :raise socket.error: on socket connection errors
> >>       .. note::
> >> -       No conection is estabalished by __init__(), this is done
> >> +       No connection is estabalished by __init__(), this is done
> >>          by the connect() or accept() methods.
> >>       """
> >>       def __init__(self, address: SocketAddrT,
> >> diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
> >> index 6ea86650ad..15909b7dba 100644
> >> --- a/python/qemu/qmp/protocol.py
> >> +++ b/python/qemu/qmp/protocol.py
> >> @@ -812,7 +812,7 @@ def _done(task: Optional['asyncio.Future[Any]']) -=
> bool:
> >>       @bottom_half
> >>       async def _bh_close_stream(self, error_pathway: bool =3D False) =
-> None:
> >> -        # NB: Closing the writer also implcitly closes the reader.
> >> +        # NB: Closing the writer also implicitly closes the reader.
> >>           if not self._writer:
> >>               return
> >> diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
> >> index ce239d8979..8369144723 100644
> >> --- a/python/qemu/qmp/qmp_tui.py
> >> +++ b/python/qemu/qmp/qmp_tui.py
> >> @@ -71,7 +71,7 @@ def format_json(msg: str) -> str:
> >>       due to an decoding error then a simple string manipulation is do=
ne to
> >>       achieve a single line JSON string.
> >> -    Converting into single line is more asthetically pleasing when lo=
oking
> >> +    Converting into single line is more aesthetically pleasing when l=
ooking
> >>       along with error messages.
> >>       Eg:
> >> @@ -91,7 +91,7 @@ def format_json(msg: str) -> str:
> >>           [1, true, 3]: QMP message is not a JSON object.
> >> -    The single line mode is more asthetically pleasing.
> >> +    The single line mode is more aesthetically pleasing.
> >>       :param msg:
> >>           The message to formatted into single line.
> >> @@ -498,7 +498,7 @@ def __init__(self, parent: App) -> None:
> >>   class HistoryBox(urwid.ListBox):
> >>       """
> >>       This widget is modelled using the ListBox widget, contains the l=
ist of
> >> -    all messages both QMP messages and log messsages to be shown in t=
he TUI.
> >> +    all messages both QMP messages and log messages to be shown in th=
e TUI.
> >>       The messages are urwid.Text widgets. On every append of a messag=
e, the
> >>       focus is shifted to the last appended message.
> >
> >
>
> Applied to my trivial-patches branch.
>
> Thanks,
> Laurent

Laurent, I'll grab this one, sorry!


