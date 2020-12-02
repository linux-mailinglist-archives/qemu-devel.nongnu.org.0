Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EA52CBE60
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:33:25 +0100 (CET)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSG4-0001df-PM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkSCW-0000LA-TX
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:29:45 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkSCU-00053L-RN
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:29:44 -0500
Received: by mail-wr1-x444.google.com with SMTP id p8so3962782wrx.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 05:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=WJrfXfcQT9mhCG53gG16v07Gv6deY3ZDCshiC/Ujil4=;
 b=vVlgNtUScJAYl9YKD15zuAvejKkhEXPtys/186jUgTXLltPfOSGBEx1h/1/koSsfbM
 nGFoh6KoVSi0MgGD1Fsp+fy/cbqcOZEG9IJHr2Ef1/R/ndGIpyQwN5jtpXSn2hytNEbj
 MbbnFUen7D1AoyU43k/9UWPsCaC3A1vyeDtN73RFzWgGMkIfTaWwRwVDDTLrBOnw8zEW
 49GlTMA14Dqi7OQ824KcDhFjXfKbA0+DYESLIkKHg/w4USzc6Ka5/twYrLvtb6s/OXGY
 f9Qz/hfhueCEJ1XbQ8rViI0hBWASPnDy2oOKYa9nnV6ado4ebXezWv444shvENktNw0S
 1HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=WJrfXfcQT9mhCG53gG16v07Gv6deY3ZDCshiC/Ujil4=;
 b=qpILpbOdrgDdkcBwXm6T5Vb48UacFwHlF6b+EOTrL/ktqJlrpaio35R5WwDv22LvB5
 JId+wqRNdPLyT3voH/wYZHBuopOems7DUcg19XVALnQ4coO/dPANYPb+EkVepG4WH8Ub
 2OtZwiVGePrAQdBTqjxGggr6j4LUnROsaqA3lyP3yuhwfkfLsI7jLf0eL949ZUKFbJT5
 kTkS3rf+I+/PO8xSmlq4pR0GpUZD96We0DgL3yVweK35uKyuYJ4TmIWSMQgAXBGm6ucV
 /iE2dD5C/NHkQNjJoztfiTGHyDSO1/llrzY/qDuxJ+qp8rnkiYQoVcEsTYJUgfOC4ZyQ
 0TsQ==
X-Gm-Message-State: AOAM532Pt+GRtKqSWdvtKMxLKBAEqkBjyrCwIzqOUiJaUooTCZzMT5mt
 5FTTf+a8B3Zkv/hiKzvY/gg1Aw==
X-Google-Smtp-Source: ABdhPJwMvhkZz0rLnyetBgE4+GQMkuBet+jcpdsHpWpVaKoKI0b5WwxNd6q5t6R073bjm1eACI9L2w==
X-Received: by 2002:a05:6000:104b:: with SMTP id
 c11mr3396535wrx.329.1606915781141; 
 Wed, 02 Dec 2020 05:29:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l8sm2066434wro.46.2020.12.02.05.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 05:29:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F06CB1FF7E;
 Wed,  2 Dec 2020 13:29:37 +0000 (GMT)
References: <20201118165206.2826-1-steplong@quicinc.com>
 <20201201200939.19823-1-steplong@quicinc.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stephen Long <steplong@quicinc.com>
Subject: Re: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
In-reply-to: <20201201200939.19823-1-steplong@quicinc.com>
Date: Wed, 02 Dec 2020 13:29:37 +0000
Message-ID: <87mtyws5dq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, mjt@tls.msk.ru,
 laurent@vivier.eu, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stephen Long <steplong@quicinc.com> writes:

> Alex Bennee <alex.bennee@linaro.org> writes:
>
>>> Apologies for the unclear commit msg. I was also seeing a SIGSEGV in
>>> zero_bss() with the binaries I was generating. I was using LLD to gener=
ate
>>> the binaries. The binaries all had LOAD segments with a file size of
>>> 0.
>>
>> How hairy is the generation of these binaries? If it's all doable with
>> standard gcc/ldd command lines it would be useful to add them as a
>> tcg/multiarch test case.
>
> We are linking with an old version of musl. I was able to produce an
> ELF with a LOAD segment just for the BSS with the following:
>
> volatile int num;
>
> int main(void) {
>     return num;
> }
>
> and compiling it with just aarch64-linux-gnu-gcc -fuse-ld=3Dlld -static a=
nd
> linking with cross compiled musl v1.1.9 on Ubuntu. I tried it with glibc =
and
> it has a bunch of non-BSS variables, so the data section gets created.

Hmm I tried the following patch but evidently there is more to be done
to convince it:

  13:26:24 [alex@zen:~/l/q/b/arm.all] virtio/vhost-user-rpmb-v2|=E2=9C=9A4=
=E2=80=A6(+6/-3) 2 + make build-tcg-tests-aarch64-linux-user -j9 V=3D1
  make  -f /home/alex/lsrc/qemu.git/tests/tcg/Makefile.qemu SRC_PATH=3D/hom=
e/alex/lsrc/qemu.git V=3D"1" TARGET=3D"aarch64-linux-user" guest-tests
  make[1]: Entering directory '/home/alex/lsrc/qemu.git/builds/arm.all'
  (mkdir -p tests/tcg/aarch64-linux-user && cd tests/tcg/aarch64-linux-user=
 && make -f ../Makefile.target TARGET=3D"aarch64-linux-user" CC=3D"aarch64-=
linux-gnu-gcc" SRC_PATH=3D"/home/alex/lsrc/qemu.git" BUILD_STATIC=3Dy EXTRA=
_CFLAGS=3D"")
  make[2]: Entering directory '/home/alex/lsrc/qemu.git/builds/arm.all/test=
s/tcg/aarch64-linux-user'
  aarch64-linux-gnu-gcc  -Wall -O0 -g -fno-strict-aliasing  /home/alex/lsrc=
/qemu.git/tests/tcg/aarch64/zero-bss.c -o zero-bss  -static -fuse-ld=3Dlld
  collect2: fatal error: cannot find 'ld'
  compilation terminated.
  make[2]: *** [../Makefile.target:103: zero-bss] Error 1
  make[2]: Leaving directory '/home/alex/lsrc/qemu.git/builds/arm.all/tests=
/tcg/aarch64-linux-user'
  make[1]: *** [/home/alex/lsrc/qemu.git/tests/tcg/Makefile.qemu:42: cross-=
build-guest-tests] Error 2
  make[1]: Leaving directory '/home/alex/lsrc/qemu.git/builds/arm.all'
  make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:54: build-tcg-=
tests-aarch64-linux-user] Error 2


--8<---------------cut here---------------start------------->8---
tests/tcg: try and add a zero-bss test case (WIP)

3 files changed, 17 insertions(+), 1 deletion(-)
tests/tcg/aarch64/zero-bss.c                            | 13 +++++++++++++
tests/docker/dockerfiles/debian-arm64-test-cross.docker |  2 +-
tests/tcg/aarch64/Makefile.target                       |  3 +++

new file   tests/tcg/aarch64/zero-bss.c
@@ -0,0 +1,13 @@
+/*
+ * Zero BSS Test case
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+volatile int num;
+
+int main(void) {
+    return num;
+}
modified   tests/docker/dockerfiles/debian-arm64-test-cross.docker
@@ -10,4 +10,4 @@ RUN dpkg --add-architecture arm64
 RUN apt update && \
     DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
         apt install -y --no-install-recommends \
-        crossbuild-essential-arm64 gcc-10-aarch64-linux-gnu
+        crossbuild-essential-arm64 gcc-10-aarch64-linux-gnu musl-dev:arm64
modified   tests/tcg/aarch64/Makefile.target
@@ -84,4 +84,7 @@ endif
=20
 endif
=20
+AARCH64_TESTS +=3D zero-bss
+zero-bss: LDFLAGS+=3D-fuse-ld=3Dlld
+
 TESTS +=3D $(AARCH64_TESTS)
--8<---------------cut here---------------end--------------->8---

--=20
Alex Benn=C3=A9e

