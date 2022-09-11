Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F95B5051
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 19:36:49 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXQsy-00012K-3N
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 13:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXQjq-0004PC-UY; Sun, 11 Sep 2022 13:27:22 -0400
Received: from mout.gmx.net ([212.227.17.20]:34449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXQjo-0003ys-O6; Sun, 11 Sep 2022 13:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662917235;
 bh=EvXxd1Fg6YX5hVljJu5WsKr6acQiN2nTtRAJmqWF5M0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:References:Subject:In-Reply-To;
 b=lAy8pdoGf20v0c2WGN6Ne49T1yhw82pte1V0VzfoRhyX9+p7/vFy7yfWTSdXefTVF
 3v53SSnje5c2YFffmkxTsPdxDUyO7Yw6V5EaLi8n5dSVAMWPKLQ4JldqvTVdv9/D4o
 bgYBlY8yppm6Jqe7yE0yqWE8+QG/MYncaREBgrvw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([178.8.103.147]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MK3Rm-1olF1w40QY-00LaBm; Sun, 11
 Sep 2022 19:27:15 +0200
Message-ID: <570dcea5-7b73-abcd-714d-8ac46995601d@gmx.de>
Date: Sun, 11 Sep 2022 19:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Content-Language: de-DE
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-4-arwed.meyer@gmx.de>
 <CAJ+F1CLRrh94VU5XDDVHeHGy+1cxZ5WD8rr_1wi5D2ygVoWKdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] msmouse: Use fifo8 instead of array
In-Reply-To: <CAJ+F1CLRrh94VU5XDDVHeHGy+1cxZ5WD8rr_1wi5D2ygVoWKdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GCj2LhljRSH7Rw5+RM3dedDIkli3jXAFgSIrI+ZzhtCrtrDaVac
 mghiavDoMMZ9al2UbExNss89/vFBNEUj+t/qXDOYzJiyaTcGxyw1gxSmth3NhAjgQk6B6sw
 PxcksBRkNvMg/O9WPJPgMRCYIipOFKnNqLrhst/p+hG0ONRr5CF7wAc1Qn/t88Q+E7EYCfN
 YQLzTQAJxPH1kyFuM5CEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c6uNoRfgMno=:aDbkyJkk9xl9fPvs+PgD66
 VHBa0whQ4aLx5ssGdVd12QjeZLR9WNkh0Ssxw/Z/VzLZ8V6i5wPiZkLET2y++Gs9pZ97hMHMd
 xYbIjhHpolZvP8WfHP1cc40IuOYH3lfZyLiTl7EoMB0iYkSY2HjQMQg6wXEL6ouMcNXRGquAl
 W9BtOf09mBF3jD5f38CywYK1m8zcrGYX4w/CGoWux9qCpZTcSMUzOhMIN00qH6JXc3PbTD31c
 vv7GEdAsjhzsINsLP7RzGtdV/1+szIzJNdQkTAGDmkW8WyoS7hG8sORhwdYdRpr8q52tl0AZR
 KHGo/P2gu2bpC83Cy30oYQqUgYOgqL1Y/PuruJRcjYEmqHJ3/Bi1kVDse3jSce4aeiwAODZcj
 6NyxcyOsJlkdtTm9dxdo+7/9DGVm4t8O+KvX8QWmQoKbfrlCl13b2Cz0kPzpOtC/gERStg24Q
 zwumtA51gd8gtE9Oq7Sgw1MUfgukNO5kIuYf/CXSotDSQOYLLkhgK1AN4J6Yb/rKCtksNiVRr
 +JwBy3thceG0YSrGCIHrAdWkbkc1ta0pHkdxs6Hv6tusb9L6MQVDyaR06h3kaFi5sI/ByBIIe
 Hhl5N+E8YNcjP9yaScQVGFBQq18H4uJFe3/OXlfKhMhE5GGkqWCf7hKgUXOtfWVStgdMTC47E
 LQXio00Tim3B3wNon0G+f+BefqUY17H1d4E92vY3cb/OTPVpT+ndw/yJI2V9FCPjCtZGbvRsr
 fe7DxyhLzanXhtl5HiKv1OPinU6qEE7bfXrS17vaKAbX0zwZeRr8fBM90oVi/mMLoG6vAoLv9
 wHEo7p6pKR3GfLALHgtwSxr/zqkHWpdbAWBZMexMAcZsSHSU99sE1OqoAEIFrmi4W/kiEJV3T
 4eAYHhvbysTUh0BkBj2gFl+s4T5msivF0OIu4knd7tSir9LIhuUezgSqZIlfKsswIqZcfvEI9
 qdWV5GchXWNnV12ve1Ld+MF6GyXA732L6XkAQUPN0laWIjsX6FLXCFv7TsQUfDYK3wM9vZEmp
 FHo64dtyKNy2q6A0YsDZAbCdxfNa8onu9b1p1YJqw4UgUX2kekEP6iN2Fi2wo85OkmnslQdWe
 fhDYKVypeb7XG/HHo5yI9/bjpAHt1+Hr39vnYQzvSe3FV5/5nWOimPxgS6DsjfrS7ktLjZpWg
 /IUfhR3UeU6bGrX+bRdyPcQKj6
Received-SPF: pass client-ip=212.227.17.20; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.101,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hi,

Am 09.09.22 um 15:18 schrieb Marc-Andr=C3=A9 Lureau:
> Hi
>
> On Thu, Sep 8, 2022 at 9:38 PM Arwed Meyer <arwed.meyer@gmx.de
> <mailto:arwed.meyer@gmx.de>> wrote:
>
>     Make use of fifo8 functions instead of implementing own fifo code.
>     This makes the code more readable and reduces risk of bugs.
>
>     Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de
>     <mailto:arwed.meyer@gmx.de>>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com
> <mailto:marcandre.lureau@redhat.com>>
>
>     ---
>      =C2=A0chardev/msmouse.c | 43 +++++++++++++++++++++-----------------=
-----
>      =C2=A01 file changed, 21 insertions(+), 22 deletions(-)
>
>     diff --git a/chardev/msmouse.c b/chardev/msmouse.c
>     index 95fa488339..e9aa3eab55 100644
>     --- a/chardev/msmouse.c
>     +++ b/chardev/msmouse.c
>     @@ -24,6 +24,7 @@
>
>      =C2=A0#include "qemu/osdep.h"
>      =C2=A0#include "qemu/module.h"
>     +#include "qemu/fifo8.h"
>      =C2=A0#include "chardev/char.h"
>      =C2=A0#include "chardev/char-serial.h"
>      =C2=A0#include "ui/console.h"
>     @@ -34,6 +35,12 @@
>      =C2=A0#define MSMOUSE_HI2(n)=C2=A0 (((n) & 0xc0) >> 6)
>      =C2=A0#define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR)=
)
>
>     +/* Serial fifo size. */
>     +#define MSMOUSE_BUF_SZ 64
>
>
> Why bump to 64 bytes?
That's to make some extra space for PnP data (see PATCH v2 4/5). Didn't
want to leave it at 32 (which seems rather random as well) just to
change it again in the next patch.
>
>     +
>     +/* Mouse ID: Send "M3" cause we behave like a 3 button logitech
>     mouse. */
>     +const uint8_t mouse_id[] =3D {'M', '3'};
>     +
>      =C2=A0struct MouseChardev {
>      =C2=A0 =C2=A0 =C2=A0Chardev parent;
>
>     @@ -42,8 +49,7 @@ struct MouseChardev {
>      =C2=A0 =C2=A0 =C2=A0int axis[INPUT_AXIS__MAX];
>      =C2=A0 =C2=A0 =C2=A0bool btns[INPUT_BUTTON__MAX];
>      =C2=A0 =C2=A0 =C2=A0bool btnc[INPUT_BUTTON__MAX];
>     -=C2=A0 =C2=A0 uint8_t outbuf[32];
>     -=C2=A0 =C2=A0 int outlen;
>     +=C2=A0 =C2=A0 Fifo8 outbuf;
>      =C2=A0};
>      =C2=A0typedef struct MouseChardev MouseChardev;
>
>     @@ -54,21 +60,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev,
>     MOUSE_CHARDEV,
>      =C2=A0static void msmouse_chr_accept_input(Chardev *chr)
>      =C2=A0{
>      =C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
>     -=C2=A0 =C2=A0 int len;
>     +=C2=A0 =C2=A0 uint32_t len_out, len;
>
>     -=C2=A0 =C2=A0 len =3D qemu_chr_be_can_write(chr);
>     -=C2=A0 =C2=A0 if (len > mouse->outlen) {
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D mouse->outlen;
>     -=C2=A0 =C2=A0 }
>     -=C2=A0 =C2=A0 if (!len) {
>     +=C2=A0 =C2=A0 len_out =3D qemu_chr_be_can_write(chr);
>     +=C2=A0 =C2=A0 if (!len_out || fifo8_is_empty(&mouse->outbuf)) {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>      =C2=A0 =C2=A0 =C2=A0}
>     -
>     -=C2=A0 =C2=A0 qemu_chr_be_write(chr, mouse->outbuf, len);
>     -=C2=A0 =C2=A0 mouse->outlen -=3D len;
>     -=C2=A0 =C2=A0 if (mouse->outlen) {
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove(mouse->outbuf, mouse->outbuf + =
len, mouse->outlen);
>     -=C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 len =3D MIN(fifo8_num_used(&mouse->outbuf), len_out);
>     +=C2=A0 =C2=A0 qemu_chr_be_write(chr, fifo8_pop_buf(&mouse->outbuf, =
len,
>     &len_out),
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len_out);
>      =C2=A0}
>
>      =C2=A0static void msmouse_queue_event(MouseChardev *mouse)
>     @@ -94,12 +94,11 @@ static void msmouse_queue_event(MouseChardev *mo=
use)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse->btnc[INPUT_BUTTON_MIDDLE])=
 {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes[3] |=3D (mouse->btns[INPUT_=
BUTTON_MIDDLE] ? 0x20 : 0x00);
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse->btnc[INPUT_BUTTON_MIDDLE] =
=3D false;
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D 4;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 count++;
>
>
> a bit superfluous,=C2=A0 ok
Well... at least on x86 I think this may save a byte or two.
>
>      =C2=A0 =C2=A0 =C2=A0}
>
>     -=C2=A0 =C2=A0 if (mouse->outlen <=3D sizeof(mouse->outbuf) - count)=
 {
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(mouse->outbuf + mouse->outlen, b=
ytes, count);
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outlen +=3D count;
>     +=C2=A0 =C2=A0 if (fifo8_num_free(&mouse->outbuf) >=3D count) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&mouse->outbuf, bytes, c=
ount);
>      =C2=A0 =C2=A0 =C2=A0} else {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* queue full -> drop event */
>      =C2=A0 =C2=A0 =C2=A0}
>     @@ -172,9 +171,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd,
>     void *arg)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ca=
use we behave like a 3 button logitech
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * mo=
use.
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outb=
uf[0] =3D 'M';
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outb=
uf[1] =3D '3';
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outl=
en =3D 2;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_=
all(&mouse->outbuf, mouse_id,
>     sizeof(mouse_id));
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* St=
art sending data to serial. */
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msmou=
se_chr_accept_input(chr);
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     @@ -184,7 +181,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd,
>     void *arg)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Reset mouse buffers on power d=
own.
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Mouse won't send anything with=
out power.
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outlen =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_reset(&mouse->outbuf);
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(mouse->axis, 0, sizeof(mou=
se->axis));
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(mouse->btns, false, sizeof=
(mouse->btns));
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(mouse->btnc, false, sizeof=
(mouse->btns));
>     @@ -204,6 +201,7 @@ static void char_msmouse_finalize(Object *obj)
>      =C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
>
>      =C2=A0 =C2=A0 =C2=A0qemu_input_handler_unregister(mouse->hs);
>     +=C2=A0 =C2=A0 fifo8_destroy(&mouse->outbuf);
>      =C2=A0}
>
>      =C2=A0static QemuInputHandler msmouse_handler =3D {
>     @@ -224,6 +222,7 @@ static void msmouse_chr_open(Chardev *chr,
>      =C2=A0 =C2=A0 =C2=A0mouse->hs =3D qemu_input_handler_register((Devi=
ceState *)mouse,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&msmouse_handler);
>      =C2=A0 =C2=A0 =C2=A0mouse->tiocm =3D 0;
>     +=C2=A0 =C2=A0 fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
>      =C2=A0}
>
>      =C2=A0static void char_msmouse_class_init(ObjectClass *oc, void *da=
ta)
>     --
>     2.34.1
>
>
>
>
> --
> Marc-Andr=C3=A9 Lureau


