Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691B45EF35D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 12:23:52 +0200 (CEST)
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqhr-0007cc-1T
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 06:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1odqRJ-0003ZX-3R; Thu, 29 Sep 2022 06:06:45 -0400
Received: from mout.gmx.net ([212.227.17.20]:33167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1odqRG-0007EK-Gl; Thu, 29 Sep 2022 06:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664445996;
 bh=R/WRc94PKp3bSDJm3m2WLB5I2cmgH10cW4frwKxV7Hs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:References:Subject:In-Reply-To;
 b=WzdA9TZTfgRslK9tllX0pGe75seFI4P5RLnMJbB0UikAdj36Worln5DiD4ZV80ZeZ
 T7u7VssiGkjLh4iaIvsvcugYxWLyxhWZ9IDiaGqqLshQnu9f1sGoCIkWTwg4iq1/mS
 cM6ndU/a2uIBntvskOYUP90xCTtDm5OJgthcYV9s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([92.78.251.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1pTbg73ufE-00s9bl; Thu, 29
 Sep 2022 12:06:36 +0200
Message-ID: <7af76d26-0e4e-9ceb-e891-7c02b63deae0@gmx.de>
Date: Thu, 29 Sep 2022 12:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Content-Language: de-DE
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
 <20220911181840.8933-2-arwed.meyer@gmx.de>
 <CAJ+F1CLi9pmLywWjxDzMCgLAm-NZx3Otq8okkBt2=Ca6TQjxXg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] msmouse: Handle mouse reset
In-Reply-To: <CAJ+F1CLi9pmLywWjxDzMCgLAm-NZx3Otq8okkBt2=Ca6TQjxXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ExTnWJtIP0+XTT+y7n/J7vA8/MyNU+aTcCNTtJBur4rwC1jZfhc
 BDumq73hrc0W1acFlKfS4E4vgMIB2dlx7B0Q61p3OZ8bTT5qm/FQpOogVX2QZbeAdHy2Y4n
 X9socW+Dld6ArKYYdlf4jwg4RXgh8CXX2zjXOv8745jLu4LU+cFVFg2POZ0aTSA0KmdOA4t
 sUADPiOZKmtyzlS2+8c9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lApXTUmyseA=:yhw0dlk5oWZXOmzjKyvCOT
 O7ua3vycJpUkHFnIoydj4JUvkN6vElk3fI5ecnnw9fm00jCI7rWwIEmORV+DRhLJw9LgTRVd+
 eUOX8Qq82g/jGRWoK9FfJgzq8iyQ0Wi8eI03FeZMD35Mfe+h3xulOuH1ByIsMa6I5JmTOjvWZ
 oW5ENFXmGusFIYMfkbYRqTKbwKL+48oQ1QvtX9jFb5nXDEde+1fXifyNUSJfLt7OsqEyjZV28
 DZG9bfK+HtMkQLSD0rcLtxEUp5Gf9n2bngjsrA+l7Rv+wNecH4ZevPlKdCj5HPmk//qYXfqIf
 WWhB6w11z1gtJ/Ss7yuTiX7TynMUpM4rMY5SRwzVukSZ6uS4z3omMdVK6KrnzAhp8BVEYnRJz
 FyN4vfiAeYv4eV3olH/fnd6QDeL5gIRsQpSXj9FlYtU2c/ZCfFeFQNAZgGwdFy7OH0M7k2Sez
 J9CrkAqSKOezHFN4B8Miu37nVrpsHJvBDZcGtTlWCyBGmYjxEY++eZij1TgtdHX6D/Q62FXaa
 zf4Y9rDSQo1o4Kb4S87UnDoaXCAPOSss5MlqlTaEtfg9jqDoQrQDAOjvgBZAAmqbC8XTsiP98
 5TkWfMv2+mpha0/5j+2Cx2BD5j1AG29GYvnCYJANsqFY3tcl8sjIXoJd15fAY1TuD2MQawRt9
 xIez2CGA3Edr+/TQycmg6lAJI1c3tVYCMljeWmJxMF0aZ81WRtZLOrc17LyyUfA9PhF1jtoxq
 OtPaUjUrmYROfw8VeTP+Ja7peWOnOIErCLbOmuFVtTKXGUiaODJqv2isxf0wcZ/YHAoZW4mBE
 WUmxtmFU+Ke8Ae9EgyhyW25os6BR+noZ5d/3/R9qNqgF4FIad+A6b5+btxmj0O+D+kM4CCecA
 WsTQlEENVi7ENIIoIUcKf8tdpzPmSIzfpozESkuNa3iBFMFwi4T9oZrAGxx5Kn65XFjs1pam+
 0Ecy9txDqZxlnvWHRyfFY+/f7IAO0Hn3W2IpJRUsVXxFPLdYUQ2lZQmqDR0X7nuFcgj2tW68R
 zXt4387fVua7v61qc78XS6dYytEWCmy0tWwrxG1hcz5++Dh3G1gGJldCoNxJ0+Cq3MvxhIcXg
 z3fL6NKZRifcWjcJaRTBRAoosDtm2Bz4n0lHV0v0FpfUHGhuS5vMDOQqw8ISYRqjk4I5i8/uO
 r2HDtGGKPKB1Fnmefcu6G3+JZv
Received-SPF: pass client-ip=212.227.17.20; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

thanks for the reminder and ack. I opened this issue:
https://gitlab.com/qemu-project/qemu/-/issues/1234
(wow, it's really 1234)


Best regards,

Arwed

Am 27.09.22 um 11:21 schrieb Marc-Andr=C3=A9 Lureau:
> Hi
>
> On Sun, Sep 11, 2022 at 10:39 PM Arwed Meyer <arwed.meyer@gmx.de
> <mailto:arwed.meyer@gmx.de>> wrote:
>
>     Detect mouse reset via RTS or DTR line:
>     Don't send or process anything while in reset.
>     When coming out of reset, send ID sequence first thing.
>     This allows msmouse to be detected by common mouse drivers.
>
>     Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
>     <https://gitlab.com/qemu-project/qemu/-/issues/77>
>     Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de
>     <mailto:arwed.meyer@gmx.de>>
>
>
> lgtm,
> Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com
> <mailto:marcandre.lureau@redhat.com>>
>
> It would be great to open an issue on gitlab wrt migration handling that
> Peter pointed out in v2
> (https://patchew.org/QEMU/20220908173120.16779-1-arwed.meyer@gmx.de/2022=
0908173120.16779-2-arwed.meyer@gmx.de/
> <https://patchew.org/QEMU/20220908173120.16779-1-arwed.meyer@gmx.de/2022=
0908173120.16779-2-arwed.meyer@gmx.de/>)
> and perhaps a comment with this patch that links to the issue?
>
>
>     ---
>      =C2=A0chardev/msmouse.c | 63 ++++++++++++++++++++++++++++++++++++++=
+++++++--
>      =C2=A01 file changed, 61 insertions(+), 2 deletions(-)
>
>     diff --git a/chardev/msmouse.c b/chardev/msmouse.c
>     index eb9231dcdb..95fa488339 100644
>     --- a/chardev/msmouse.c
>     +++ b/chardev/msmouse.c
>     @@ -25,17 +25,20 @@
>      =C2=A0#include "qemu/osdep.h"
>      =C2=A0#include "qemu/module.h"
>      =C2=A0#include "chardev/char.h"
>     +#include "chardev/char-serial.h"
>      =C2=A0#include "ui/console.h"
>      =C2=A0#include "ui/input.h"
>      =C2=A0#include "qom/object.h"
>
>     -#define MSMOUSE_LO6(n) ((n) & 0x3f)
>     -#define MSMOUSE_HI2(n) (((n) & 0xc0) >> 6)
>     +#define MSMOUSE_LO6(n)=C2=A0 ((n) & 0x3f)
>     +#define MSMOUSE_HI2(n)=C2=A0 (((n) & 0xc0) >> 6)
>     +#define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))
>
>      =C2=A0struct MouseChardev {
>      =C2=A0 =C2=A0 =C2=A0Chardev parent;
>
>      =C2=A0 =C2=A0 =C2=A0QemuInputHandlerState *hs;
>     +=C2=A0 =C2=A0 int tiocm;
>      =C2=A0 =C2=A0 =C2=A0int axis[INPUT_AXIS__MAX];
>      =C2=A0 =C2=A0 =C2=A0bool btns[INPUT_BUTTON__MAX];
>      =C2=A0 =C2=A0 =C2=A0bool btnc[INPUT_BUTTON__MAX];
>     @@ -109,6 +112,11 @@ static void msmouse_input_event(DeviceState
>     *dev, QemuConsole *src,
>      =C2=A0 =C2=A0 =C2=A0InputMoveEvent *move;
>      =C2=A0 =C2=A0 =C2=A0InputBtnEvent *btn;
>
>     +=C2=A0 =C2=A0 /* Ignore events if serial mouse powered down. */
>     +=C2=A0 =C2=A0 if (!MSMOUSE_PWR(mouse->tiocm)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>     +=C2=A0 =C2=A0 }
>     +
>      =C2=A0 =C2=A0 =C2=A0switch (evt->type) {
>      =C2=A0 =C2=A0 =C2=A0case INPUT_EVENT_KIND_REL:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D evt->u.rel.data;
>     @@ -132,6 +140,11 @@ static void msmouse_input_sync(DeviceState *dev=
)
>      =C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(dev);
>      =C2=A0 =C2=A0 =C2=A0Chardev *chr =3D CHARDEV(dev);
>
>     +=C2=A0 =C2=A0 /* Ignore events if serial mouse powered down. */
>     +=C2=A0 =C2=A0 if (!MSMOUSE_PWR(mouse->tiocm)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>     +=C2=A0 =C2=A0 }
>     +
>      =C2=A0 =C2=A0 =C2=A0msmouse_queue_event(mouse);
>      =C2=A0 =C2=A0 =C2=A0msmouse_chr_accept_input(chr);
>      =C2=A0}
>     @@ -142,6 +155,50 @@ static int msmouse_chr_write(struct Chardev *s,
>     const uint8_t *buf, int len)
>      =C2=A0 =C2=A0 =C2=A0return len;
>      =C2=A0}
>
>     +static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
>     +{
>     +=C2=A0 =C2=A0 MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
>     +=C2=A0 =C2=A0 int c;
>     +=C2=A0 =C2=A0 int *targ =3D (int *)arg;
>     +
>     +=C2=A0 =C2=A0 switch (cmd) {
>     +=C2=A0 =C2=A0 case CHR_IOCTL_SERIAL_SET_TIOCM:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D mouse->tiocm;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->tiocm =3D *(int *)arg;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MSMOUSE_PWR(mouse->tiocm)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!MSMOUSE_PWR(c)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Pow=
er on after reset: send "M3"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* cau=
se we behave like a 3 button logitech
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mou=
se.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outb=
uf[0] =3D 'M';
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outb=
uf[1] =3D '3';
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outl=
en =3D 2;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Start se=
nding data to serial. */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msmouse_chr=
_accept_input(chr);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Reset mouse buffers on power do=
wn.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Mouse won't send anything witho=
ut power.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outlen =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(mouse->axis, 0, sizeof(mouse->ax=
is));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(mouse->btns, false, sizeof(mouse=
->btns));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(mouse->btnc, false, sizeof(mouse=
->btns));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     +=C2=A0 =C2=A0 case CHR_IOCTL_SERIAL_GET_TIOCM:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember line control status. */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *targ =3D mouse->tiocm;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     +=C2=A0 =C2=A0 default:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;
>     +=C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 return 0;
>     +}
>     +
>      =C2=A0static void char_msmouse_finalize(Object *obj)
>      =C2=A0{
>      =C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
>     @@ -166,6 +223,7 @@ static void msmouse_chr_open(Chardev *chr,
>      =C2=A0 =C2=A0 =C2=A0*be_opened =3D false;
>      =C2=A0 =C2=A0 =C2=A0mouse->hs =3D qemu_input_handler_register((Devi=
ceState *)mouse,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&msmouse_handler);
>     +=C2=A0 =C2=A0 mouse->tiocm =3D 0;
>      =C2=A0}
>
>      =C2=A0static void char_msmouse_class_init(ObjectClass *oc, void *da=
ta)
>     @@ -175,6 +233,7 @@ static void char_msmouse_class_init(ObjectClass
>     *oc, void *data)
>      =C2=A0 =C2=A0 =C2=A0cc->open =3D msmouse_chr_open;
>      =C2=A0 =C2=A0 =C2=A0cc->chr_write =3D msmouse_chr_write;
>      =C2=A0 =C2=A0 =C2=A0cc->chr_accept_input =3D msmouse_chr_accept_inp=
ut;
>     +=C2=A0 =C2=A0 cc->chr_ioctl =3D msmouse_ioctl;
>      =C2=A0}
>
>      =C2=A0static const TypeInfo char_msmouse_type_info =3D {
>     --
>     2.34.1
>
>
>
>
> --
> Marc-Andr=C3=A9 Lureau


