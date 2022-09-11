Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636855B5068
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 19:54:53 +0200 (CEST)
Received: from localhost ([::1]:39104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXRAR-0002Io-SG
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 13:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXR93-0000kV-FZ; Sun, 11 Sep 2022 13:53:25 -0400
Received: from mout.gmx.net ([212.227.17.21]:47319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXR90-0007bU-AE; Sun, 11 Sep 2022 13:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662918795;
 bh=+VHFuNmzJKa42sxCK+AZVJeRS3wM4iQQoLrxLtXLxJU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:References:Subject:In-Reply-To;
 b=XPL22G+LU0zWIH9Gfmt1akXwN1aOMmanRYR6anR57X3BHx4sIwQeVcCmgHXI4ogNI
 oyZZXNuap1pM4/7qlnqRfwoNDtxBpD6b5hVxGoznt/YrhBMbHsZqaFq+TOrZXIlL+j
 e9aAdvE0k4I1nv1oVyldTERUbJwNDclxviE8EpcI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([178.8.103.147]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1omugt2dqa-00Jvms; Sun, 11
 Sep 2022 19:53:15 +0200
Message-ID: <71316e5a-75e4-b38c-64fd-131137feabf2@gmx.de>
Date: Sun, 11 Sep 2022 19:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Content-Language: de-DE
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-4-arwed.meyer@gmx.de>
 <47315b0d-e6b7-60ef-8c0a-f92881ee5177@t-online.de>
Subject: Re: [PATCH v2 3/5] msmouse: Use fifo8 instead of array
In-Reply-To: <47315b0d-e6b7-60ef-8c0a-f92881ee5177@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OEDKog+TFZspOosq5vdXy/S6VCR1EFKiOnN6GPfwvPkn6YwADBh
 DD+OROBBXvUN894Vhgzc1cY6JCc0ZNFreug8+QzdGrDjC0kCf6fnIaKthKmKvs94WTbJZbd
 sbBwWMR+6kybrP1cnT0hvQdFyipLr0AvCUCQVC+nlr94+PAFVqkO42Kn27c0RLxjpGH0Qhp
 zOFcFk01EBmqPljEYx7rw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Ppf+9Uo81w=:v/QgDWAbX1bedQHf5nnuM9
 XmeC+JPoRlUkQ+tG047SHrMCT2C9ojSkPFjBKEk41JZjJSXQW6LIIJyUhtLPNzmlNecth94zy
 tWi1Lb6UTQTjFsnnPaKj5nRCZbyHL82n4cas4aoG9y/9bLjNo7QguT3IWaLg3SbETz/w+ZK+z
 u9avDSffrrtXAcw2WX01irlz7bL6tZOMRZw9ucuW/nHgPK6+krhMf1Lg3Iz6BJvIA1IMagkmD
 uour5roBg2M9wjRr17/v+MJYAW84EQxx6buU4Wb05FNd2FF12Inr5SCWgGBMftlWl6S1Dhwxr
 mOMjnBoYdqmEYGLWJU0PkvFxqqGjtXKGJHpX4N5n3XakMo6skgJxBGfP7Z1NE9MfvJejMO7c4
 RZBxGB2csMKBSeqSPSUrbrDnhC7Y6B/Fkwqp5EeoBzqaXHKpTVLpdhBUVQtiPochaqlb5kJri
 9VWRW1H5sJd73TG3lDIxhVMaHPifk0zXQmZyQk5xs/G14Ijh1LEEhw6EeT4Vjh4ofd7O45HmZ
 KROWvWShdRwL5fdbRYR0v9/IyEg42KktrbnqWJf6CpH6KCeGd7P5Zdj404kQjKxG4CosTOM78
 iJX+qNdYIyJuiPWCksi0tXZnd4UMvnxLHRrp5xux2y12gvEXhN4ROl4T0EcrzZ/giccr0lJfi
 ANNMITSYE8QK+7LbEguKPLraJZEOvi2YPIKpIpxF7aIzmWgYt7UxpAuw0pNoqZvDgf7E3FiRa
 7/JaU4LPxgCSYB2l8ONBFTPX4EpdT8ijGaMh3q5tAaGnn7pAh2DBHEBrxt33gqMr/7L/ebwaY
 9hCF37DYfLiJJQ2R5rfFKJ/J4dLqzv4+41lExBVDI/v8Vkma8BMdK06QjTQchA5IQYA9Sq8nO
 MWnQ6NYC0d34anIb6C7Td/9aY+d6VC9OjCks29XKQFLTp8PxCbdPZgnDG5temT3Ysa2MxuXQm
 u5IJWAP/zbVMF7kR3M3IXuwwAVebjuo2hRTjWCuf8Her4G4rwHuAvym4myzMujxx6Qe3QNTxI
 XtGBzShtTA8BTdKdAfOEAfjUXXmWbFyC+7RcvY761fhFvWb9nximezshaLfDcLL+o3n5LF0XU
 guh7KZBstAU0ftSBAmzQS1MOLNQQriYz+O7KHePnRFCTHPloFxxkoS9Tkp3e4PGo1x1PsNGW2
 veZb6l7USKqSiP5LIhKQGMh/iK
Received-SPF: pass client-ip=212.227.17.21; envelope-from=arwed.meyer@gmx.de;
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

Am 11.09.22 um 08:12 schrieb Volker R=C3=BCmelin:
> Am 08.09.22 um 19:31 schrieb Arwed Meyer:
>
>> @@ -54,21 +60,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDE=
V,
>> =C2=A0 static void msmouse_chr_accept_input(Chardev *chr)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MouseChardev *mouse =3D MOUSE_CHARDEV(ch=
r);
>> -=C2=A0=C2=A0=C2=A0 int len;
>> +=C2=A0=C2=A0=C2=A0 uint32_t len_out, len;
>>
>> -=C2=A0=C2=A0=C2=A0 len =3D qemu_chr_be_can_write(chr);
>> -=C2=A0=C2=A0=C2=A0 if (len > mouse->outlen) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len =3D mouse->outlen;
>> -=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 if (!len) {
>> +=C2=A0=C2=A0=C2=A0 len_out =3D qemu_chr_be_can_write(chr);
>> +=C2=A0=C2=A0=C2=A0 if (!len_out || fifo8_is_empty(&mouse->outbuf)) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 qemu_chr_be_write(chr, mouse->outbuf, len);
>> -=C2=A0=C2=A0=C2=A0 mouse->outlen -=3D len;
>> -=C2=A0=C2=A0=C2=A0 if (mouse->outlen) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memmove(mouse->outbuf, mous=
e->outbuf + len, mouse->outlen);
>> -=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 len =3D MIN(fifo8_num_used(&mouse->outbuf), len_out=
);
>> +=C2=A0=C2=A0=C2=A0 qemu_chr_be_write(chr, fifo8_pop_buf(&mouse->outbuf=
, len, &len_out),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len=
_out);
>
> Hi Arwed,
>
> I think C function arguments are not evaluated in a defined order. It's
> not defined if the third argument of function qemu_chr_be_write() is
> len_out before or after the call to fifo8_pop_buf().
>
> The fifo_pop_buf() function uses a ringbuffer. When the buffer wraps
> around at the end and the ringbuffer contains more than one byte you may
> need two fifo8_pop_buf() and qemu_chr_be_write() calls to write all
> bytes. The code you replace doesn't have that problem.
>
> Some chardev frontends don't return the total number of bytes to write
> in qemu_chr_be_can_write(). They return the number of bytes that can be
> written with one qemu_chr_be_write() call. You need another
> qemu_chr_be_can_write() call after the qemu_chr_be_write() call to see
> if more bytes can be written.
>
> The code in function gd_vc_send_chars() in ui/gtk.c could be used as a
> template to avoid the three issues above.
>
> With best regards,
> Volker
>
>> =C2=A0 }
>>
>> =C2=A0 static void msmouse_queue_event(MouseChardev *mouse)
>

Hi Volker,

have to admit I was not completely sure about the order in which
function arguments get evaluated either. Thanks for the confirmation.
I'll change this to be safe.

I guess you probably won't see much difference between old and new code
in practice since serial I/O is slow anyway, but since I'll change the
patch anyway, I'll take the code from gd_vc_send_chars. Indeed looks bette=
r.

