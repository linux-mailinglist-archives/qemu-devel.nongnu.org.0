Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A814142F29D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:28:14 +0200 (CEST)
Received: from localhost ([::1]:38008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbNFt-0004jY-PD
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbNDM-00025t-6C
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:25:36 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbNDK-0000gi-Bk
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:25:35 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so2973744wmg.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 06:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Wxz5ZuW4jLx+Pp9EE9fOet39Of2bty/j/9LxLAk2JOQ=;
 b=Ex8XPkD622ezeBVv+zb9MCSwR8Fmlve8v//u4PAjSG7pN3iAkG7LPey03aKtKM8k1O
 a9UU5s2HG5IC7JgR6LNFNz661122z18FR3ZjZnp2+mTX4CojOAYpDEpvYMjRfLrUCi4Y
 SoEDg+dM2l8+0qDMg1O+RCWArIpUa03Tz73XIuuJP/Po7ofnw3F9LT72oLs2DIs6WYBO
 NstwDlMaUH4tK5nJ9IgkuzIDwzo3vkKEc+Dw8OJGcUzQ9x3algnykC/QzDRWLwxXS6Gw
 BjmZkUl3COplKrHzir/PRKMGOIftHoFpvBhxdF3f8qBuhZKYNSkjMLQMcdUfUqn1n94I
 dT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Wxz5ZuW4jLx+Pp9EE9fOet39Of2bty/j/9LxLAk2JOQ=;
 b=GLUdsSCvxW7H1QXy/dh/zSw2gGvRLCgQZXLw7uuSfxzoU2qUaQfKbCO9Csji244Jk1
 4WNVT8VcGn82N6TpJbYUkoyQUPupEgkIJO0ZlgtB8zVsg53fL+iknctaHmnUqL/FDRsg
 2l2x4mQkGs41QYNqbyw4EmRGUQ9VthDxkpOlkWvIgeA+rtO2p4HdJSJGf9jIE7fcnSqa
 4NyXqY08BIDcJOSPk/Hr2PxOCP6Jh6t2V+vPiktMugwHPtMtlsDuP5nNJH11SJNbc3nl
 gWx6xsXqsAbdiL9xC4GWa+bba8nexjS39XxWtFzbz3YsoQ7+wQ5Gu2ABVDavGPYuWt5F
 Kb7w==
X-Gm-Message-State: AOAM530KmvWD0Vn5foCizHi/0uGR57GX26ktXRtL9DSYK7jFk01lLP3h
 MOkd77t2ZBDzDpQwZPQQdzOUdVnqpfKZNQ==
X-Google-Smtp-Source: ABdhPJxIPwylAL18BdAeGbEFo8gRIcuMnXWP2Tqj7AYlTY2ODhbgiNfiAXUbXDNxkfFxBWkQUWHilA==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr26073950wmr.118.1634304331832; 
 Fri, 15 Oct 2021 06:25:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p18sm5006419wrn.41.2021.10.15.06.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 06:25:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF00F1FF96;
 Fri, 15 Oct 2021 14:25:29 +0100 (BST)
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-2-richard.henderson@linaro.org>
 <87h7dmw4kn.fsf@linaro.org>
 <71e6a11a-2c64-24e2-1883-2c352475fd9a@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/9] tests/docker: Add debian-nios2-cross image
Date: Thu, 14 Oct 2021 18:25:46 +0100
In-reply-to: <71e6a11a-2c64-24e2-1883-2c352475fd9a@linaro.org>
Message-ID: <87tuhito6u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, crwulff@gmail.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/12/21 10:03 AM, Alex Benn=C3=A9e wrote:
>> We need^H^H^H^H (might need, see bellow) a separate patch with:
>> docker-image-debian10: NOUSER=3D1
>> to ensure the images we base our "handbuilt" compilers on don't
>> include
>> a potentially clashing uid (which should only be added for local
>> builds).
>
> I think we ought to push this further back into docker.py.
>
> I think that we should always have a separate image without the user
> installed.  When asking for a build with user installed, copy the
> nouser image (perhaps cached) and simply add the user.
>
>> We need to split this like in hexagon and have a second stage which does
>> a:
>>    COPY --from=3D0 /usr/local /usr/local
>> This will limit the size of the final image (and also avoid
>> duplicting
>> the UID in the hexagon build).
>
> What are we eliminating from the image with the second FROM, since we
> then go back and add in all the build-dep for qemu.
>
> There are one or two extra packages required for building gcc itself
> (e.g. libmpc) but they're not large.  Where does the major savings
> come from?

Hmm that is curious:

 $ docker history registry.gitlab.com/qemu-project/qemu/qemu/debian-nios2-c=
ross:latest
 ...
  <missing>      2 weeks ago   RUN /bin/sh -c id rth 2>/dev/null || useradd=
=E2=80=A6   330kB     buildkit.dockerfile.v0
  <missing>      2 weeks ago   LABEL com.qemu./home/rth/qemu/git-alt/tests/=
=E2=80=A6   0B        buildkit.dockerfile.v0
  <missing>      2 weeks ago   LABEL com.qemu.dockerfile-checksum=3Dfc3e779=
ae=E2=80=A6   0B        buildkit.dockerfile.v0
  <missing>      2 weeks ago   ENV PATH=3D/usr/local/sbin:/usr/local/bin:/u=
sr=E2=80=A6   0B        buildkit.dockerfile.v0
  <missing>      2 weeks ago   RUN /bin/sh -c cd /root && ./build-toolchain=
=E2=80=A6   973MB     buildkit.dockerfile.v0
  <missing>      2 weeks ago   ADD build-toolchain.sh /root/build-toolchain=
=E2=80=A6   2.14kB    buildkit.dockerfile.v0
  <missing>      2 weeks ago   RUN /bin/sh -c apt update &&     DEBIAN_FRON=
=E2=80=A6   17.3MB    buildkit.dockerfile.v0
  <missing>      2 weeks ago   /bin/sh -c #(nop)  LABEL com.qemu.dockerfile=
=E2=80=A6   0B=20=20=20
  <missing>      2 weeks ago   /bin/sh -c apt update &&     DEBIAN_FRONTEND=
=E2=80=A6   715MB
  <missing>      2 weeks ago   /bin/sh -c cat /etc/apt/sources.list | sed "=
=E2=80=A6   854B=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  <missing>      2 weeks ago   /bin/sh -c #(nop)  CMD ["bash"]             =
    0B=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  <missing>      2 weeks ago   /bin/sh -c #(nop) ADD file:99db7cfe7952a1c7a=
=E2=80=A6   69.2MB=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20

yet with the split build:

  $ docker image history qemu/debian-nios2-cross:latest=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  IMAGE          CREATED        CREATED BY                                 =
     SIZE      COMMENT=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  24fbdeba931c   4 hours ago    LABEL com.qemu./home/alex.bennee/lsrc/qemu.=
g=E2=80=A6   0B        buildkit.dockerfile.v0
  <missing>      4 hours ago    LABEL com.qemu.dockerfile-checksum=3De7d363=
1e6=E2=80=A6   0B        buildkit.dockerfile.v0
  <missing>      4 hours ago    ENV PATH=3D/usr/local/sbin:/usr/local/bin:/=
usr=E2=80=A6   0B        buildkit.dockerfile.v0
  <missing>      4 hours ago    COPY /usr/local /usr/local # buildkit      =
     1.77GB    buildkit.dockerfile.v0
  <missing>      4 hours ago    RUN /bin/sh -c apt update &&     DEBIAN_FRO=
N=E2=80=A6   781MB     buildkit.dockerfile.v0
  <missing>      4 hours ago    RUN /bin/sh -c cat /etc/apt/sources.list | =
s=E2=80=A6   854B      buildkit.dockerfile.v0
  <missing>      7 months ago   /bin/sh -c #(nop)  CMD ["bash"]            =
     0B=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
  <missing>      7 months ago   /bin/sh -c #(nop) ADD file:3c32f1cd03198e14=
1=E2=80=A6   69.2MB=20=20=20=20=20=20=20=20=20=20

which makes it look like the artefacts are bigger than the whole build.

--=20
Alex Benn=C3=A9e

