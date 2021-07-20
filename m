Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C83CFC6E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:40:07 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5quf-0001Ap-21
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m5qsW-0007XJ-JT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:37:48 -0400
Received: from mout.gmx.net ([212.227.15.19]:50525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m5qsU-00032I-Ig
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626791860;
 bh=K1SUnOdP3v3Q1D0PQR5LrgIg43cSZSopOff/P+bg2cY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=a4DloVJSa52EF3sy3YRimRNP5sBWCIztR5H/2J9Y7W9gJRy9795e0fuOYNwSS0k1K
 0oRaYAq268kkOV/PM1+mzYnZaGToowji8NCFOrgJWljSTpkQ0zGnZ4PnysKQYy1rWq
 kl44j9VNUoydiBTDpsVZeduIzSut+kwlPSZGPDvI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.188.43] ([87.123.205.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9dsV-1l0puL0fDh-015bOX; Tue, 20
 Jul 2021 16:37:40 +0200
Subject: Re: [PATCH] ui/gtk: Fix relative mouse with multiple monitors
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210629132410.286813-1-denniswoelfing@gmx.de>
 <CAJ+F1CKDBxMngPZpQOF0RAiq0hHZEt8mpFaAx9T2z7nb5zLjRQ@mail.gmail.com>
From: =?UTF-8?Q?Dennis_W=c3=b6lfing?= <denniswoelfing@gmx.de>
Message-ID: <5960c0d1-f44f-8ca0-1d2c-fa6eb6545314@gmx.de>
Date: Tue, 20 Jul 2021 16:37:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKDBxMngPZpQOF0RAiq0hHZEt8mpFaAx9T2z7nb5zLjRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u89JHVTSwMrtZknWx2kFx33kA+gLBhjk2xosX6nDpzccU0N0O5T
 VAIbeukI3t8pHO7bxtB81jDeptNnAuZmVV4W68PZ89DALDTShlpvAmdsawIQDcLrOx/ft0u
 rayuMM7F3mfa/ohH/EyKBRn/Bwp/6gPGNXKjyIN3C1ttLa+ClRDwBVTddxw5JQOZ3rQ7Q17
 zbmwZ0CPUUonUbgdq0Y8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QGHkdBDucEI=:XOHtuEHruFRWEvK+IJLJ35
 QqEy1Wr+UxFA+vc8gtzFgat70mmOPhvHV+GISO87O5cJKRdMwk5lmlcxxpsbSb8BQTfK7IHjo
 anzMBmKtXxhMNlSRvIZ7flfhCYF/QMCgSsNo1TaZcuZn0P8Fx+EveMLm59FxlkpjIV3QVkOLP
 OJPn5zKfUlRVHZcwfw4yFNGZ2HPNO8u46RwUnCC/YMOrbz2XUMsGGLPc9IVpjNL1sRxNMBUFm
 YhlRf+tc04RhBRyYF0yDFfGB6w+mFBSxWMNWV4plGHQlgHUBONdAqTaUuQ4bgCHqHjNiBcSCk
 +11/IF3ABqT1Chvm9dSIsuyJpBJyOE4WBZG9wE3anpsk9/ZzzMzvmbPfGIGfrqZVmcfQR5Av2
 LV08NbnHlA3oub49q3o+zLiWBL60vV2d3xyt8dGVa0bo/qvJ0l0is0Rdst9TkLLzpima2hzdr
 YH01itOm5gdwGhSS7/4biVKdPwjKFN2jehQRbeQ2adnDnkmtpBt/CkOJVkZYtl0zGrRzMMl3h
 IyRNagTFoOI6TqPpGfypQAL18moUcelKUbjyTBICiLMnPcSGguvoR8aX8Zk3XnzyVpmWGZ8vg
 moPBDjoI74R9l+kWDxZRS37/NKkoSJjEtkAYkF6puUmYaayahn1x8n0NO+txmzM2IEStSxVea
 EJ+/8jw/KKAl5O569cS/3lvMpLtAfWOd0KZjdxbDUaOg802Xwgu22LovwESkB0G04sGwE5Jx6
 CsecI+rzR9H3m4t1l/PKUv/omT5ia4rpnhl9st9nQWpfOnNatqB6ltPLFUmYpj6Gq73Ay6BrG
 oGZulHdIKoWo5RjnTR5gjwtLk8gtbHZVkFxejDxwVMG0kPhOZ1BjFR4YFNmPuQE/6STjAtztw
 sMysia+vvx6Oifjv1XJ81sWfOETCt8OYLduO4FqZyhE96q2PQJZpiN7sWPk44yX5HLibZ94N5
 ri2TmOJj5FMK3vGx9XiF/yhEy+QJfV8wzTEvjia4RNTDxuUCZ0W/Ugrz28E2U5lhhdi3s12fh
 ENFYAy+cChAFnxLZDIxmDB6eufEP5x5Ygk6XMv9j4bRjtpgK+0NI/ADSqzZKKZn+/O/JB2ZGr
 u6mhdEo0vOUqVL3Y516t4vRQlL65bW0O+qd43p0xzPN1uuAn7R8e1bZJQ==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=denniswoelfing@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.07.21 13:31, Marc-Andr=C3=A9 Lureau wrote:
> Hi Dennis
>
> On Tue, Jun 29, 2021 at 5:26 PM Dennis W=C3=B6lfing <denniswoelfing@gmx.=
de> wrote:
>
> > To handle relative mouse input the event handler needs to move the mou=
se
> > away from the screen edges. Failing to do so results in the mouse
> > getting stuck at invisible walls. However the current implementation f=
or
> > this is broken on hosts with multiple monitors.
> >
> > With multiple monitors the mouse can be located outside of the current
> > monitor which is not handled by the current code. Also the monitor
> > itself might be located at coordinates different from (0, 0).
> >
> > Signed-off-by: Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
>
>
> Looks reasonable to me. In spice-gtk we have slightly different code, we
> wrap at the middle of the monitor instead
> (https://gitlab.freedesktop.org/spice/spice-gtk/-/blob/master/src/spice-=
widget.c#L1214),
> what do you think?

Indeed, warping to the center of the monitor allows for simpler code and
means that it will take longer until the cursors hits a border again.
I'll send a v2 that warps to the middle of the monitor.

> And also, spice-gtk has special cases for w32 and wayland, which behave
> differently.

I just tested QEMU on a Windows host and relative mouse input is quite
broken both before and after this patch: As soon as the cursor leaves
the window QEMU no longer receives mouse events until the cursor is
moved back into the window. I haven't tested it with Wayland.
So we should perhaps have similar special cases as in spice-gtk. However
I'm not comfortable with writing a patch to fix this as I am not
familiar with the Windows and Wayland APIs.

> Gtk4 is also different, as device_warp() is gone (it will have to handle
> it specifically again for the different platforms:
> https://gitlab.gnome.org/malureau/rdw/-/blob/master/rdw/src/display.rs#L=
812)

That is unfortunate. The code will need to be rewritten then when it
updated for Gtk4.

