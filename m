Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C2A37A9D5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:48:43 +0200 (CEST)
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTgg-0005M9-GH
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgTeJ-0003Km-8r
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:46:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgTeE-0006cq-Nr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:46:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so20433285wrx.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/EjaigTzXCfuCoU1KhLlL1gvBuLwPYAaPp+N6ctAMIY=;
 b=mTIOH8xLEu+Omyo4AWB9WkmTUXN6mGnH6Ydx7NMhounRsdftyepeiv2Z5e+D6x09xC
 /6GWZBX3uRncxoIaM9u2hVs/hYtYGNo/ZnAd3VVF1yOCMCECSzxgNq0e+vw2XpooEWOm
 m+i2Sh31Dbbs4FIPgNHS3J0Mt6zpSyENe4TTQZzcDthk3lU1mKo+E/ftsw0lD4F5GJ/2
 4i8fyz9TZHp33rlQgtV8J2cEe9tB1vo6Rrt9uICSxfrCNUulWWrWsIaJpsNoxCknAK4W
 pdqdsw8zFLylFLFkiM0L1GiTQmnjdAHEfJqG27hLmcz8YLlOrEV09dLmSCeZFrmZ3BDa
 1NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/EjaigTzXCfuCoU1KhLlL1gvBuLwPYAaPp+N6ctAMIY=;
 b=HAB3P10aL1WxZVVEoteDKIv2QZ9Sbr3yjkWGRIxQUvx4OntQ8bZumiPoX5wQ0GiN9r
 MwmxAKP66wD6lS373Iuq6VTciL7XGsfPjnFfcAI1xvS1uh4f4/UfjPAXW28cPI9gSRb9
 Hdj0SO36/88FjkLjz74l3d54QAAXGELfW1nBVANofvFJ28yX5xTKNRbiI1oqDR378iDd
 RBMdR1m5gmBC1Sx5tk+P/RWL5wlZ14/9vW3SQ7g+eEom3oUxOceKk/+xUP0BUloTxcuS
 4Sk2NDCOj3Q+x6DaDLCj5Zvkz/IebZsK4YgD9un5qwrOSRkqVrfUrHVTuY/1POji9yxV
 WeSw==
X-Gm-Message-State: AOAM532cIsmNuzWsi5bfrjn1+sGqWbzmfJ+41K+T3wphFeLOjdHczzXL
 yy39KdZF/Y767+8n84ylz+/LSw==
X-Google-Smtp-Source: ABdhPJyiLbA/fp4jtOl89Ko+tGtUzCKQaMJ0Gk22RxU2/NNh3gBYxIYZsTlDabHteKpD9ZFm3QeUXg==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr39042627wrr.19.1620744368992; 
 Tue, 11 May 2021 07:46:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm27154779wrs.48.2021.05.11.07.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 07:46:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B9E91FF7E;
 Tue, 11 May 2021 15:46:07 +0100 (BST)
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-9-alex.bennee@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v1 08/25] gitlab: add build-user-hexagon test
Date: Tue, 11 May 2021 15:41:51 +0100
In-reply-to: <20210419145435.14083-9-alex.bennee@linaro.org>
Message-ID: <871radgwgg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We special case this as the container with the cross compiler for the
> tests takes so long to build it is manually uploaded into the
> registry.

Gahh, something changed underneath me with the inclusion of:

  commit 46ef47e2a77d1a34996964760b4a0d2b19476f25
  Author: Taylor Simpson <tsimpson@quicinc.com>
  Date:   Thu Apr 8 20:07:50 2021 -0500

      Hexagon (target/hexagon) circular addressing

Which leads to the compiler complaining:

  hexagon-unknown-linux-musl-clang  -Wno-incompatible-pointer-types -Wno-un=
defined-internal -fno-unroll-loops -Wall -Werror -O0 -g -fno-strict-aliasin=
g -mv67 -O2 -static /home
  /alex.bennee/lsrc/qemu.git/tests/tcg/hexagon/circ.c -o circ  -static
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/hexagon/circ.c:257:1: error: un=
known register name 'cs0' in asm
  TEST_LOAD_IMM(b,  char,           bbuf, NBYTES, 1, d)
  ^
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/hexagon/circ.c:242:9: note: exp=
anded from macro 'TEST_LOAD_IMM'
          CIRC_LOAD_IMM_##SZ(element, p, BUF, size * sizeof(TYPE), (INC)); \
          ^
  <scratch space>:9:1: note: expanded from here
  CIRC_LOAD_IMM_b
  ^
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/hexagon/circ.c:75:5: note: expa=
nded from macro 'CIRC_LOAD_IMM_b'
      CIRC_LOAD_IMM(b, RES, ADDR, START, LEN, INC)
      ^
  /home/alex.bennee/lsrc/qemu.git/tests/tcg/hexagon/circ.c:73:23: note: exp=
anded from macro 'CIRC_LOAD_IMM'
          : "r4", "m0", "cs0")

I suspect the easiest thing to do is to drop the patches again so I
don't hold up the rest of testing/next. I can include the initial docker
image patch but I won't enable it in configure.sh/gitlab.

Would one of the hexagon guys be able to send a new image and verify it
works with the current tests in master?

>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 52d65d6c04..87d1172b03 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -413,6 +413,17 @@ build-user-static:
>      CONFIGURE_ARGS: --disable-tools --disable-system --static
>      MAKE_CHECK_ARGS: check-tcg
>=20=20
> +# Because the hexagon cross-compiler takes so long to build we don't rely
> +# on the CI system to build it and hence this job has no dependency
> +# declared. The image is manually uploaded.
> +build-user-hexagon:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-hexagon-cross
> +    TARGETS: hexagon-linux-user
> +    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
> +    MAKE_CHECK_ARGS: check-tcg
> +
>  # Only build the softmmu targets we have check-tcg tests for
>  build-some-softmmu:
>    <<: *native_build_job_definition


--=20
Alex Benn=C3=A9e

