Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767530BB3C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 10:43:11 +0100 (CET)
Received: from localhost ([::1]:39450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6sDF-00047t-Uy
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 04:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6sBZ-0003Z5-4v
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:41:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l6sBU-0006rz-Ii
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 04:41:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c12so19676408wrc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 01:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iG/P6JtustSWsc0UiVsU3lE0+Ynql7LbAYk3oXru8TY=;
 b=w4UTV1cmVIt3Ro3y1vkD0gAivKMqof3yFC1C3/f8JxIHnjdH3Sywumxe8nyNq3iQvl
 tZv17YNact1e1MoYNZr/0DJb08zq7xe71Ch850XNQuUbzDWq4TOaffA1u7qeJch+pm8y
 5PFlp9pkzGxDM272dghI3oi3JyO7tP3FcrrLhYKAi1mj2UFnOIuaHzbg9nVJy2JQeApX
 gyScejl9jDhlEtc2ZGkZvBqasYrq2NxkOVFrhrVyACtHWARLFkkBwVKk/M0x4PJNq3Dx
 Mjv2HJ//waav4TvuZ929bcf97E/D7s1VxzAytHUNv4YUY/FOfK+h+GCU84q9QJAsO9nd
 UEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=iG/P6JtustSWsc0UiVsU3lE0+Ynql7LbAYk3oXru8TY=;
 b=fJGmNyzWVf9F8/aqI2AEcyNF0e9lktQulaJSDXK/M9gLVTHNJJVe47u6aLCwJiG3yv
 fJoXodvr7KoiAmEz+OWHWMK7uFgpPtpjGMuiGUw5rSm2bbgKO7onNoHAchrKWb1jVgiL
 KIwIThnVzdKwNGzcwmz6bNM3HZMVOSP/Zchf9++I/fT3RQWVnqeJ69dwf8ALztDa7Hck
 vcw/w3FX+JCYaYSA/YlB/0r9r+9VbqnPj7AWgc5PIi19ru7KjdhIMi1s6sjLeVkGgCLz
 6uP67pmKPSif3x1A8fv0iARPvAQ0QJfXlK72eLH0lQCtTbbbzlV64qmxSRb3hoMvQXmH
 cGXQ==
X-Gm-Message-State: AOAM531qPRwo172iIEqeeGcOrpyI55VPvEcnm2F+ngqbSr23L0QNRlYi
 ne4J4RghG2+1g0Rqc+kPVE3jsg==
X-Google-Smtp-Source: ABdhPJx1p2nThNuyG0qtELpTfZCaVKypm98IstYn/zTPtFWeyu/cAeR36Ip0xV1z/Z9W9JZTX1M25w==
X-Received: by 2002:adf:8295:: with SMTP id 21mr22389096wrc.32.1612258876892; 
 Tue, 02 Feb 2021 01:41:16 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id v13sm1676132wrd.51.2021.02.02.01.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 01:41:16 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 93ba75a0;
 Tue, 2 Feb 2021 09:41:15 +0000 (UTC)
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
In-Reply-To: <20210201153606.4158076-2-berrange@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Peter Gabriel - Up: Sky Blue
Date: Tue, 02 Feb 2021 09:41:15 +0000
Message-ID: <cunv9balsck.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::42c;
 envelope-from=dme@dme.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-02-01 at 15:36:03 GMT, Daniel P. Berrang=C3=A9 wrote:

> It is useful to know which CPUs satisfy each x86-64 ABI
> compatibility level, when dealing with guest OS that require
> something newer than the baseline ABI.
>
> These ABI levels are defined in:
>
>   https://gitlab.com/x86-psABIs/x86-64-ABI/
>
> and supported by GCC, CLang, GLibC and more.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  MAINTAINERS                        |   2 +-
>  docs/system/cpu-models-x86-abi.csv | 121 +++++++++++++++++++++++++++++
>  docs/system/cpu-models-x86.rst.inc |  18 +++++
>  3 files changed, 140 insertions(+), 1 deletion(-)
>  create mode 100644 docs/system/cpu-models-x86-abi.csv
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fbb228ef2b..bb8d60c458 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -344,7 +344,7 @@ F: tests/tcg/i386/
>  F: tests/tcg/x86_64/
>  F: hw/i386/
>  F: disas/i386.c
> -F: docs/system/cpu-models-x86.rst.inc
> +F: docs/system/cpu-models-x86*
>  T: git https://gitlab.com/ehabkost/qemu.git x86-next
>=20=20
>  Xtensa TCG CPUs
> diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-=
x86-abi.csv
> new file mode 100644
> index 0000000000..4565e6a535
> --- /dev/null
> +++ b/docs/system/cpu-models-x86-abi.csv
> @@ -0,0 +1,121 @@
> +Model,baseline,v2,v3,v4
> +486,,,,
> +486-v1,,,,
> +Broadwell,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Broadwell-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Broadwell-noTSX,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Broadwell-noTSX-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,

Would it be useful to add an explicit negative mark (=E2=9C=98) in the slots
where the CPU does not satisfy the requirement? It makes reading the
table a little easier (my opinion, of course).

> +Broadwell-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Broadwell-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Broadwell-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Broadwell-v4,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Cascadelake-Server,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Cascadelake-Server-noTSX,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Cascadelake-Server-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Cascadelake-Server-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Cascadelake-Server-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Cascadelake-Server-v4,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Conroe,=E2=9C=85,,,
> +Conroe-v1,=E2=9C=85,,,
> +Cooperlake,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Cooperlake-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Denverton,=E2=9C=85,=E2=9C=85,,
> +Denverton-v1,=E2=9C=85,=E2=9C=85,,
> +Denverton-v2,=E2=9C=85,=E2=9C=85,,
> +Dhyana,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Dhyana-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +EPYC,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +EPYC-IBPB,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +EPYC-Rome,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +EPYC-Rome-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +EPYC-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +EPYC-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +EPYC-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell-noTSX,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell-noTSX-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Haswell-v4,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Client,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Client-noTSX,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Client-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Client-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Icelake-Server,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Icelake-Server-noTSX,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Icelake-Server-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Icelake-Server-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Icelake-Server-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Icelake-Server-v4,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +IvyBridge,=E2=9C=85,=E2=9C=85,,
> +IvyBridge-IBRS,=E2=9C=85,=E2=9C=85,,
> +IvyBridge-v1,=E2=9C=85,=E2=9C=85,,
> +IvyBridge-v2,=E2=9C=85,=E2=9C=85,,
> +KnightsMill,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +KnightsMill-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Nehalem,=E2=9C=85,=E2=9C=85,,
> +Nehalem-IBRS,=E2=9C=85,=E2=9C=85,,
> +Nehalem-v1,=E2=9C=85,=E2=9C=85,,
> +Nehalem-v2,=E2=9C=85,=E2=9C=85,,
> +Opteron_G1,=E2=9C=85,,,
> +Opteron_G1-v1,=E2=9C=85,,,
> +Opteron_G2,=E2=9C=85,,,
> +Opteron_G2-v1,=E2=9C=85,,,
> +Opteron_G3,=E2=9C=85,,,
> +Opteron_G3-v1,=E2=9C=85,,,
> +Opteron_G4,=E2=9C=85,=E2=9C=85,,
> +Opteron_G4-v1,=E2=9C=85,=E2=9C=85,,
> +Opteron_G5,=E2=9C=85,=E2=9C=85,,
> +Opteron_G5-v1,=E2=9C=85,=E2=9C=85,,
> +Penryn,=E2=9C=85,,,
> +Penryn-v1,=E2=9C=85,,,
> +SandyBridge,=E2=9C=85,=E2=9C=85,,
> +SandyBridge-IBRS,=E2=9C=85,=E2=9C=85,,
> +SandyBridge-v1,=E2=9C=85,=E2=9C=85,,
> +SandyBridge-v2,=E2=9C=85,=E2=9C=85,,
> +Skylake-Client,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Skylake-Client-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Skylake-Client-noTSX-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Skylake-Client-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Skylake-Client-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Skylake-Client-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,
> +Skylake-Server,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-noTSX-IBRS,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v1,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v2,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v3,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Skylake-Server-v4,=E2=9C=85,=E2=9C=85,=E2=9C=85,=E2=9C=85
> +Snowridge,=E2=9C=85,=E2=9C=85,,
> +Snowridge-v1,=E2=9C=85,=E2=9C=85,,
> +Snowridge-v2,=E2=9C=85,=E2=9C=85,,
> +Westmere,=E2=9C=85,=E2=9C=85,,
> +Westmere-IBRS,=E2=9C=85,=E2=9C=85,,
> +Westmere-v1,=E2=9C=85,=E2=9C=85,,
> +Westmere-v2,=E2=9C=85,=E2=9C=85,,
> +athlon,,,,
> +athlon-v1,,,,
> +core2duo,=E2=9C=85,,,
> +core2duo-v1,=E2=9C=85,,,
> +coreduo,,,,
> +coreduo-v1,,,,
> +kvm32,,,,
> +kvm32-v1,,,,
> +kvm64,=E2=9C=85,,,
> +kvm64-v1,=E2=9C=85,,,
> +n270,,,,
> +n270-v1,,,,
> +pentium,,,,
> +pentium-v1,,,,
> +pentium2,,,,
> +pentium2-v1,,,,
> +pentium3,,,,
> +pentium3-v1,,,,
> +phenom,=E2=9C=85,,,
> +phenom-v1,=E2=9C=85,,,
> +qemu32,,,,
> +qemu32-v1,,,,
> +qemu64,=E2=9C=85,,,
> +qemu64-v1,=E2=9C=85,,,
> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-=
x86.rst.inc
> index 9a2327828e..b964b29c78 100644
> --- a/docs/system/cpu-models-x86.rst.inc
> +++ b/docs/system/cpu-models-x86.rst.inc
> @@ -39,6 +39,24 @@ CPU, as they would with "Host passthrough", but gives =
much of the
>  benefit of passthrough, while making live migration safe.
>=20=20
>=20=20
> +ABI compatibility levels for CPU models
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The x86_64 architecture has a number of `ABI compatibility levels`_
> +defined. Traditionally most operating systems and toolchains would
> +only target the original baseline ABI. It is expected that in
> +future OS and toolchains are likely to target newer ABIs. The
> +following table illustrates which ABI compatibility levels can be
> +satisfied by the QEMU CPU models

Missing full stop (or colon?).

> +
> +.. _ABI compatibility levels: https://gitlab.com/x86-psABIs/x86-64-ABI/
> +
> +.. csv-table:: x86-64 ABI compatibility levels
> +   :file: cpu-models-x86-abi.csv
> +   :widths: 40,15,15,15,15
> +   :header-rows: 1
> +
> +
>  Preferred CPU models for Intel x86 hosts
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20=20
> --=20
> 2.29.2

dme.
--=20
All of us, we're going out tonight. We're gonna walk all over your cars.

