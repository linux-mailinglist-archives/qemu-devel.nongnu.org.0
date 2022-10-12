Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412BD5FC54D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:29:59 +0200 (CEST)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oias1-0007wV-HN
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oiaog-00042F-Ty
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:26:30 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nivanov@cloudlinux.com>)
 id 1oiaoa-0000Pm-2c
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:26:30 -0400
Received: by mail-ej1-x633.google.com with SMTP id k2so37664502ejr.2
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudlinux.com; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mekTU2AOYS0kajA04LS7ScLjd4O5eyaeV32cgLBOvgg=;
 b=TWvwzBH60USS4kX1ZRFQ8WoiPh0XourqAn06jamRJfslg4r2oUWToUrkNiBsKrAnBO
 0Xkba30APdzne+Q/ZThIvj2hzAjmqpXP3FVSJMOv8m8/zs133vymj4Xsyp3zfvKT2nNq
 cIm+EbsFGSNJtNbs1EYX9hUS0dKxeqwW7fM6uTFGkTCVQM5Rjxzio9mFG0VjxzBR+GOf
 ctSx7VYZFCCMWzMjSVGIhxrEvXYD/xxHpsT/5VaG7m13Wzkh8be2VHZej15+8VnevpEZ
 Tno1vZSIyuGOvUpst/23nnt7Ss6/iNJgCV2Db4AOPUPwFy1pBrDIY5vF+83uD+Xk+hS1
 1GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mekTU2AOYS0kajA04LS7ScLjd4O5eyaeV32cgLBOvgg=;
 b=hqRgNJWAJQMqJqJv9Xt8ekfPKC7ZYzuKRvwWoH+ukV7H8jAuOw/pLgf5m9Mz7t3qTd
 PqgUJBws3IPLabiJOOU/Lpz1bVyTLGtcBPqmfJkHOKBPzlCDZaDv5cvEC3LpGHF7ROV3
 hkyDnJOXOdxKd4PGe0ABqMguE3JuF/W1Os7AKkDVl0DIULYs/L7pRMM9ZQg9IzIlrivi
 +zXUxykprV50hUG1zVqjTWu7K65iYcWW3OtYOuovMjUT2y6qa0ZoKjXgQLoz4cmQf5wT
 bCUsxTb/6jyuOzIo0sRsgNY0nuM0jvEqowH40RzNaXKthcQYAAWi8srxj6bjWiIRi/9P
 pP9g==
X-Gm-Message-State: ACrzQf2e18c045JYRoCdfUMXT/nn72Ei5Bwp38RKDfHMCj5D+tMqH6/N
 EHYoRSe2JNGIZre98mN02DdCV0hBR2VJ3TYaU825YnwT7b0buSFf
X-Google-Smtp-Source: AMsMyM6mXHwfSXYZHt/0ATY9nwjxCzoTVvCVyeB79KJUo4WXp/bYojffUoJzCM5W+re0yggOKvdTPzkAwkUf6A3Rtss=
X-Received: by 2002:a17:907:6e93:b0:78d:dff1:71e3 with SMTP id
 sh19-20020a1709076e9300b0078ddff171e3mr5495862ejc.94.1665577581242; Wed, 12
 Oct 2022 05:26:21 -0700 (PDT)
MIME-Version: 1.0
From: Nikita Ivanov <nivanov@cloudlinux.com>
Date: Wed, 12 Oct 2022 15:26:10 +0300
Message-ID: <CAAJ4Ao_XCJng9kqdmT6+QheVZqs5o2nKZjqx5fyZp_jXkRz99g@mail.gmail.com>
Subject: [PATCH v2 0/2] Refactoring: expand usage of TFR() macro
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "cc: Christian Schoenebeck" <qemu_oss@crudebyte.com>,
 Markus Armbruster <armbru@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000139fdc05ead580bf"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=nivanov@cloudlinux.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000139fdc05ead580bf
Content-Type: text/plain; charset="UTF-8"

At the moment, TFR() macro has a vague name and is not used
where it possibly could be. In order to make it more transparent
and useful, it was decided to refactor it to make it closer to
the similar one in glibc: TEMP_FAILURE_RETRY(). Now, macro
evaluates into an expression and is named RETRY_ON_EINTR(). All the
places where RETRY_ON_EINTR() macro code be applied were covered.

Nikita Ivanov (2):
  Refactoring: refactor TFR() macro to RETRY_ON_EINTR()
  error handling: Use RETRY_ON_EINTR() macro where applicable

 block/file-posix.c        | 37 ++++++++++++++++---------------------
 chardev/char-fd.c         |  2 +-
 chardev/char-pipe.c       |  8 +++++---
 chardev/char-pty.c        |  4 +---
 hw/9pfs/9p-local.c        |  8 ++------
 include/qemu/osdep.h      |  8 +++++++-
 net/l2tpv3.c              | 17 +++++------------
 net/socket.c              | 16 +++++++---------
 net/tap-bsd.c             |  6 +++---
 net/tap-linux.c           |  2 +-
 net/tap-solaris.c         |  8 ++++----
 net/tap.c                 | 12 ++++--------
 os-posix.c                |  2 +-
 qga/commands-posix.c      |  4 +---
 semihosting/syscalls.c    |  4 +---
 tests/qtest/libqtest.c    | 14 ++++++--------
 tests/vhost-user-bridge.c |  4 +---
 util/main-loop.c          |  4 +---
 util/osdep.c              |  4 +---
 util/vfio-helpers.c       | 12 ++++++------
 20 files changed, 74 insertions(+), 102 deletions(-)

--
2.37.3

--000000000000139fdc05ead580bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">At the moment, TFR() macro has a vague name and is not use=
d<br>where it possibly could be. In order to make it more transparent<br>an=
d useful, it was decided to refactor it to make it closer to<br>the similar=
 one in glibc: TEMP_FAILURE_RETRY(). Now, macro<br>evaluates into an expres=
sion and is named RETRY_ON_EINTR(). All the<br>places where RETRY_ON_EINTR(=
) macro code be applied were covered.<br><br>Nikita Ivanov (2):<br>=C2=A0 R=
efactoring: refactor TFR() macro to RETRY_ON_EINTR()<br>=C2=A0 error handli=
ng: Use RETRY_ON_EINTR() macro where applicable<br><br>=C2=A0block/file-pos=
ix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| 37 ++++++++++++++++---------------------<=
br>=C2=A0chardev/char-fd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>=C2=
=A0chardev/char-pipe.c =C2=A0 =C2=A0 =C2=A0 | =C2=A08 +++++---<br>=C2=A0cha=
rdev/char-pty.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0hw/9pfs/=
9p-local.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A08 ++------<br>=C2=A0include/q=
emu/osdep.h =C2=A0 =C2=A0 =C2=A0| =C2=A08 +++++++-<br>=C2=A0net/l2tpv3.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++------------<br>=
=C2=A0net/socket.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++=
++++---------<br>=C2=A0net/tap-bsd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A06 +++---<br>=C2=A0net/tap-linux.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A02 +-<br>=C2=A0net/tap-solaris.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| =C2=A08 ++++----<br>=C2=A0net/tap.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 12 ++++--------<br>=C2=A0os-posix.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>=C2=A0qga/commands=
-posix.c =C2=A0 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0semihosting/syscalls.c=
 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=A0tests/qtest/libqtest.c =C2=A0 =C2=A0|=
 14 ++++++--------<br>=C2=A0tests/vhost-user-bridge.c | =C2=A04 +---<br>=C2=
=A0util/main-loop.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +---<br>=C2=
=A0util/osdep.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +=
---<br>=C2=A0util/vfio-helpers.c =C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>=
=C2=A020 files changed, 74 insertions(+), 102 deletions(-)<br><br>--<br>2.3=
7.3</div>

--000000000000139fdc05ead580bf--

