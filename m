Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7C650EA8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 16:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7I7E-0004FH-47; Mon, 19 Dec 2022 10:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7I75-0004EF-By
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:31:36 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7I73-00055D-55
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 10:31:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so5818758wml.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 07:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pc5c+rt5SqAxDPTptGV/Nk/5/mKT1mgVUUw7sduiGX4=;
 b=cSypAozGZvRBCORkqbfL+fqzORV8HAAhE/qevJ4gABWEC3+BEuf3Czm8O0Ho36aMnq
 wyVIJlsOWsHy3XXAHLibSFcGi4BmGxbOdqpluVYepgA3a/SFhyahfBirC/5f6WddNwue
 5r4W0KELNR13tylUTTZfYtbYbGSxD6ZXRaQYhVMrhu1AujTBHQBQDsER/aIO2IimmLm6
 +soJEBhc61ptm/sIwdvfJ+Qywq81U3t1U/clqWtT7IOZmNXlGpD0CTp2SBTqQnMhvhG8
 PsLlwEooq1uyLGn/IUffaPL7nZsxzcZsE7lZ4jMlK6HEgQb+CA2P9fmLTU7rtiQ8WWYg
 ltHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pc5c+rt5SqAxDPTptGV/Nk/5/mKT1mgVUUw7sduiGX4=;
 b=2IHu76qF349mzdajFuB/GJu0OLUFCNFSJt1Wg4ZuQ6k1UJlGzCOGxlXFZ676UtOLzI
 VsLSSBqrFciLOujBJGhvO6tJe9THhAmURYAV0cIUGcc9qClicBx4CxHHBDKSrd6FgDN+
 a4GxSC24AgIz+yv1dxDXDOGes/LYhfgUHBLoSU3WaGonPELHw7+QsmU37CQftL5elWZJ
 QDil/aENUuuY8PMXpXsX4km+dY6o3Gw2S7qh6CyLzDNRtviT5LYY5PtCZdHVtWLaohR2
 DCxtfDVKdkQlOHd0ANpmvM8Kqrb714R11rA071MqHq1+LHXiS8gRB0D55xKHQrpsBKrc
 eXKg==
X-Gm-Message-State: ANoB5pmYb8kAIlVWyAtojyDKtqtzlTzmZE+7Ka18BpYMffitHy1pwxf0
 jR5L5a1W89dFKh40l00fFYhIMsnkvzoknHpT
X-Google-Smtp-Source: AA0mqf7e+kECjHV5+LSiE81KovzKIr3QVKltCTJ1a70g3/uw3bxF5jXpcwQLaiod9X1yJL+/e/KWUg==
X-Received: by 2002:a05:600c:3b13:b0:3d1:f16b:30e6 with SMTP id
 m19-20020a05600c3b1300b003d1f16b30e6mr34259758wms.28.1671463891190; 
 Mon, 19 Dec 2022 07:31:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a05600c4b1b00b003d220ef3232sm12085759wmp.34.2022.12.19.07.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 07:31:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5FC401FFB7;
 Mon, 19 Dec 2022 15:31:30 +0000 (GMT)
References: <CAE5MsNYXB_yFiD07FXf=KD=Zq74mQ9TCtSMBbZB9U-Vk1DE7Tg@mail.gmail.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Rowan Hart <rowanbhart+devel@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: QEMU Rust Crates + Plugins in Rust
Date: Mon, 19 Dec 2022 13:52:50 +0000
In-reply-to: <CAE5MsNYXB_yFiD07FXf=KD=Zq74mQ9TCtSMBbZB9U-Vk1DE7Tg@mail.gmail.com>
Message-ID: <877cynl8a5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Rowan Hart <rowanbhart+devel@gmail.com> writes:

> Hi all, this is my first post to the mailing list!

Apologies on the delay in responding. I've been mostly focused on the
recent release.

> I've spent the last
> couple weeks building QEMU Rust crates to enable a couple goals:
>
> - Install QEMU binaries using cargo, the Rust package manager
> - Use git-latest QEMU binaries in Rust projects as a dependency
> - Write QEMU TCG plugins entirely in Rust
>
> The main crate is https://crates.io/crates/qemu, a thin wrapper around
> the existing QEMU build system, using crate features to toggle
> configure options. There are also crates for each binary build target,
> for example https://crates.io/crates/qemu-system-x86_64. These
> crates allow users to run `cargo install qemu-system-x86_64`, which
> installs a small wrapper binary with a dependency on the built
> binaries from the qemu crate. These binary installs run exactly as a
> normal QEMU installation via package manager would, and essentially
> just provide another alternative distro-agnostic packaging mechanism.

I find it a little confusing that the numbering scheme doesn't follow
the upstream. Is it possible to mirror the upstream version numbers?
Does rust's semver have any concept of an edge or HEAD build?

I tried:

  cargo install qemu-aarch64

but it fell over with complains about various rust bits:


     Compiling nix v0.25.1
  error[E0658]: `let...else` statements are unstable
     --> /home/alex/.cargo/registry/src/github.com-1ecc6299db9ec823/memfd-e=
xec-0.1.4/src/executable.rs:347:13
      |
  347 |             let Err(err) =3D (unsafe { self.do_exec(theirs, envp) }=
) else { unreachable!("..."); };
      |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      |
      =3D note: see issue #87335 <https://github.com/rust-lang/rust/issues/=
87335> for more information

  error[E0658]: `let...else` statements are unstable
     --> /home/alex/.cargo/registry/src/github.com-1ecc6299db9ec823/memfd-e=
xec-0.1.4/src/executable.rs:468:17
      |
  468 |                 let Err(e) =3D self.do_exec(theirs, envp) else { un=
reachable!("..."); };
      |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
      |
      =3D note: see issue #87335 <https://github.com/rust-lang/rust/issues/=
87335> for more information

  error[E0658]: use of unstable library feature 'io_safety'
   --> /home/alex/.cargo/registry/src/github.com-1ecc6299db9ec823/memfd-exe=
c-0.1.4/src/anon_pipe.rs:4:25
    |
  4 |     os::unix::prelude::{AsFd, AsRawFd, BorrowedFd, FromRawFd, IntoRaw=
Fd, RawFd},
    |                         ^^^^
    |
    =3D note: see issue #87074 <https://github.com/rust-lang/rust/issues/87=
074> for more information

  error[E0658]: use of unstable library feature 'io_safety'
   --> /home/alex/.cargo/registry/src/github.com-1ecc6299db9ec823/memfd-exe=
c-0.1.4/src/anon_pipe.rs:4:40
    |
  4 |     os::unix::prelude::{AsFd, AsRawFd, BorrowedFd, FromRawFd, IntoRaw=
Fd, RawFd},
    |                                        ^^^^^^^^^^
    |
    =3D note: see issue #87074 <https://github.com/rust-lang/rust/issues/87=
074> for more information

  error[E0658]: use of unstable library feature 'io_safety'
    --> /home/alex/.cargo/registry/src/github.com-1ecc6299db9ec823/memfd-ex=
ec-0.1.4/src/anon_pipe.rs:68:5
     |
  68 | /     fn as_fd(&self) -> BorrowedFd<'_> {
  69 | |         self.0.as_fd()
  70 | |     }
     | |_____^
     |
     =3D note: see issue #87074 <https://github.com/rust-lang/rust/issues/8=
7074> for more information

Running:

  cargo build

in a checked out repo completes but I don't see any binaries in the
output. This is perhaps a misunderstanding on my part on how the repo is
meant to be used?

> More interesting (I think) is the crate
> https://github.com/novafacing/cannonball, which depends on the qemu
> crate and enables developers
> to write QEMU TCG plugins entirely in Rust. This enables a very nice
> workflow for Rust developers interested in building tracers,
> profilers, and
> other tooling already supported by the TCG Plugin API. The cannonball
> repository has one example of such a tracer that outputs various
> events
> as JSON.

I ran into the same build problems with this.

> This is a pretty rough implementation I've hacked together over a week
> or two, but I've heard from IRC there is some interest in
> experimenting
> with Rust as part of QEMU and I'm interested in feedback on this
> attempt in that direction.

I expect the biggest thing would be how to incorporate the build of any
rust bits in the main build environment. I don't think we are at the
point we would want to dump the entire build environment for a native
rust based one.

From a plugin point of view I'm certainly keen to enable the building of
plugins written in rust. However currently having everything wrapped up
in cargo makes it confusing as to what exactly is going on. For example
if I just pick up libjaivana.so like:

  ./qemu-aarch64 -d plugin -plugin
    ~/lsrc/cannonball.git/target/debug/libjaivana.so \
    ./tests/tcg/aarch64-linux-user/sysregs

I don't see anything output (btw qemu_plugin_outs uses the logging
system so you need to enable the output with -d plugin).


> There's a bit more information in my post about this on cohost:
> https://cohost.org/novafacing/post/240422-some-qemu-and-plugi
>
> Finally, I am acutely aware in doing this I've taken control of almost
> 70 crate names the QEMU project might like to use at some point. I'm
> not
> here to step on toes, so if the decision makers would like the QEMU
> project to get control of these crate names, just let me know and I'll
> email
> the crates.io team about getting them moved. Otherwise, comments,
> discussion about Rust-ifying QEMU and its plugins, ideas, and PRs
> welcome,
> as an author of a decent number of TCG plugins the last few years I'm
> pretty excited about what even this rudimentary approach has enabled
> with regards to ease of use and development speed.

Me too. I'm hoping to get register access sorted next year although
I have some clean-up for the gdbstub to do first.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

