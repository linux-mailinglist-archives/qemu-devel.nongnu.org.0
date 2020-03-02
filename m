Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78493175D4C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 15:35:52 +0100 (CET)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8mAh-0001B5-I0
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 09:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1j8m9X-0008GW-AM
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 09:34:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1j8m9V-0000Ni-Vq
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 09:34:39 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:40167)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1j8m9V-0000NW-Rt; Mon, 02 Mar 2020 09:34:37 -0500
Received: by mail-qk1-x744.google.com with SMTP id m2so10154092qka.7;
 Mon, 02 Mar 2020 06:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m7MYwitUFdtMxx08rtFG+jpeAArMJLive+w98GKtXXo=;
 b=Ictk1YxIVu20CnjVGzAZ2bWQvuicKkM5ke2oTKAvn7zLNs0i1poGBOZycQDcJ/T0tB
 E0vk2wE4MhUjKyrLcyp9BYOpcQS6XhBFoYQlKPoEq04aCPypMHOdKq216mTD+49Xm1Qu
 /VV2vlmzRNkEVIAVipoMEgsPukNkOr7DaNKXmHdy3z4G9+o+18Yu/x/VKzUN/tlL4n1x
 71pdl9Dg5aaocx45Hy2UuzXT8obbSS0XhaH+L9+5H84JduOHG/8osFIh5GRuSzwD71HA
 pgnp3H0ibdMEDINaZybt7htdrLymRLjOREmFjS5q0OAFAJdK2eg2fG5YXnrY4ryzVEIl
 J5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m7MYwitUFdtMxx08rtFG+jpeAArMJLive+w98GKtXXo=;
 b=k4algJGWLuDFDmXD7tdMzRdSZfLa3gEkhmyn7lLBzBLic+pna4wcDs4ajCs9GrL8sn
 u7ZY46SgXU5hNLDu1PBlMGJuXsjdXZZ9sZumRAQ50Qxh6Cz9leqDOWOcDXyTBcekJ2Bc
 6lR0UhRgPSESE/KkWJwisf2WvwioGm+oYQhBA2Oa001tesG6U0WqirNWXWdN//UtKAm2
 TjSxce32Fp/uRrdvSTH56qwKmKbmaR0mIk6PzgnamgoVgKOmJ8IR/UibCGbA1Sh/w2Yu
 w19mCIgOkxAp6cBHWxcAzXq3MlCW1iJaCC1j7op50UuDPw7Re94WuBGUbtKFOsO56Nkz
 YAgg==
X-Gm-Message-State: ANhLgQ2DMQGb1qxcTeXBzIW+jTJv4rPR+pCncuflr6nl7UuQTQRBhDjs
 rMO7woys6NAZ2gmrmHNl1EsPPWvwgrbMkM0qGng=
X-Google-Smtp-Source: ADFU+vs5h6mmwbJ+VzL1GVsnGbSz5oPJ3yGF4NwtGdLTUOBsrQ7Yre3b2lvO4aSPQg6RAxIkfSL2Lv85JVrg1jdT2gU=
X-Received: by 2002:a37:2c84:: with SMTP id s126mr2015745qkh.370.1583159676576; 
 Mon, 02 Mar 2020 06:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-2-pannengyuan@huawei.com>
In-Reply-To: <20200227025055.14341-2-pannengyuan@huawei.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 2 Mar 2020 14:34:24 +0000
Message-ID: <CAJSP0QXqOhrEz9T9=2bBO2kCqdRh+_O1+FM+TY66_gHMHY0mJw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] s390x: fix memleaks in cpu_finalize
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Euler Robot <euler.robot@huawei.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 27, 2020 at 2:42 AM Pan Nengyuan <pannengyuan@huawei.com> wrote=
:
>
> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390x. =
The leak stack is as follow:
>
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xef97=
0)
>     #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>     #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include/qe=
mu/timer.h:530
>     #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu/ti=
mer.h:551
>     #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/qemu=
/timer.h:569
>     #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target/s3=
90x/cpu.c:285
>     #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/qom=
/object.c:372
>     #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new/qe=
mu/qom/object.c:516
>     #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/qom/=
object.c:684
>     #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x/s3=
90-virtio-ccw.c:64
>     #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/mach=
ine-hmp-cmds.c:57
>     #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/monit=
or/hmp.c:1082
>     #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/qem=
u/monitor/misc.c:142
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: qemu-s390x@nongnu.org
> ---
> v2->v1:
> - Similarly to other cleanups, move timer_new into realize(Suggested by P=
hilippe Mathieu-Daud=C3=A9)

Hi,
This email is invalid and cannot be parsed by the patches
(https://github.com/stefanha/patches) tool that is used by some QEMU
maintainers to apply patches.

The character set is incorrectly set to "base64", which is a content
transfer encoding and not a character set:

  Content-Type: text/plain; charset=3D"base64"
  Content-Transfer-Encoding: quoted-printable

There is a UTF-8 =C3=A9 character here:

  - Similarly to other cleanups, move timer_new into realize(Suggested by P=
hi=3D
  lippe Mathieu-Daud=3DC3=3DA9)

Since there is no valid charset the =C3=A9 character cannot be decoded.

This might be a mail server problem but it could also be due to your
git-send-email(1) configuration.

Did you set the charset to "base64" or override the content transfer
encoding?  I think other people on the list will have trouble
receiving emails like this too.

Stefan

