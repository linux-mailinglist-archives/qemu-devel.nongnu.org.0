Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00025FB481
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 16:25:58 +0200 (CEST)
Received: from localhost ([::1]:48158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiGCj-0005Tu-Is
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 10:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiG73-0003Jy-Cd
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:20:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiG71-0000HP-EU
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 10:20:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id w18so21860096wro.7
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGPK2Yyh9+TWR0aIykI+vXWAmtk4RH3u/leSSGlABDk=;
 b=mg61kiJtWfgGvL3bRGSkC1Aw5zl+ypLQAn94+KcKGiEWO6wvUwnH5QXjwQI+PoDVVD
 S8aSZGI6DsbFxZExtUGCoHxcqM9NKbVFjpD36AgKlh3vWk9Ij5cwiRGtu35Yq/dJPhRx
 +6bPHLsESgrXBJHfqcepFJ2dS99Meoz4VFE31lSorUZfP2ymRVpIvvCY+AT/UPIUK5Iy
 4fOTbkMIynfgx4I8LqRCmKA0zGMaonoh2BPp5MlPRvagCMzJdTl761aiZng0xjomKVtL
 xWKSBPTrVJhtixS1RkUR+cTCYQtgvRQJc59s1aep6FQjd4VGm8uTZ1GC2UsY5GUfiQPm
 1XCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kGPK2Yyh9+TWR0aIykI+vXWAmtk4RH3u/leSSGlABDk=;
 b=RYxrBXLjtZj9FKPwT9VKqZ6AmzetHH4aV5LFGmEFYl9+SJCIuBRCgXBc6h3BtXEE2K
 r5VzJ+6zsG25pYm5hKppq+7jmk7xnYOuJh2SqXag49jRJGtblyX9A26nI6PpWlEUr+v2
 NKjdDiV5pIMZQeMseqLuEWBiWm0BzL9/Wxy0DIWBKNXclhNszz3MVA6EC33VThZ5sJxw
 zrSMwHeMxayjSYVvVz2ECvy0MjZ2gTykbfR5198CQCC1mT5zFOEzpPX20Gsn1Pk5I/v2
 VkYO4g8YDpVDvg0wMVaRv4WIn876aIyxZ3SrN65UDoQbzqmapOo5sEiefdtLYoCgMc29
 tvLA==
X-Gm-Message-State: ACrzQf2zyqYby+g+rgdrMJqLS5/Ug2R0fi56cbfBdOwTQO/TzL/YsXbZ
 7iHplExUbwXK2nbMPScmqKe7XA==
X-Google-Smtp-Source: AMsMyM6HojuCGuhZ487p7fYSUPTIpLf8ie8+H5ma7opSmOKqvx9PdkglogVsrNF06xh/IP/IGoKCZQ==
X-Received: by 2002:a5d:6d86:0:b0:22e:404f:1101 with SMTP id
 l6-20020a5d6d86000000b0022e404f1101mr14632215wrs.343.1665497998487; 
 Tue, 11 Oct 2022 07:19:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b003b4868eb71bsm19364765wmq.25.2022.10.11.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 07:19:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC7FE1FFB7;
 Tue, 11 Oct 2022 15:19:56 +0100 (BST)
References: <20221011101401.81849-1-thuth@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/s390x: Fix emulation of the VISTR instruction
Date: Tue, 11 Oct 2022 15:14:03 +0100
In-reply-to: <20221011101401.81849-1-thuth@redhat.com>
Message-ID: <87tu4aqw6r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> The element size is encoded in the M3 field, not in the M4
> field. Let's also add a TCG test that shows the failing
> behavior without this fix.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1248
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/tcg/s390x/vf.c                | 50 +++++++++++++++++++++++++++++
>  target/s390x/tcg/translate_vx.c.inc |  2 +-
>  tests/tcg/s390x/Makefile.target     |  6 ++++
>  3 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/s390x/vf.c
>
> diff --git a/tests/tcg/s390x/vf.c b/tests/tcg/s390x/vf.c
> new file mode 100644
> index 0000000000..fdc424ce7c
> --- /dev/null
> +++ b/tests/tcg/s390x/vf.c
> @@ -0,0 +1,50 @@
> +/*
> + * vf: vector facility tests
> + */
> +#include <stdint.h>
> +#include <stdio.h>
> +#include "vx.h"
> +
> +static inline void vistr(S390Vector *v1, S390Vector *v2,
> +                         const uint8_t m3, const uint8_t m5)
> +{
> +    asm volatile("vistr %[v1], %[v2], %[m3], %[m5]\n"
> +                : [v1] "=3Dv" (v1->v)
> +                : [v2]  "v" (v2->v)
> +                , [m3]  "i" (m3)
> +                , [m5]  "i" (m5)
> +                : "cc");
> +}
> +
> +static int test_vistr(void)
> +{
> +    S390Vector vd =3D {};
> +    S390Vector vs16 =3D {
> +        .h[0] =3D 0x1234, .h[1] =3D 0x0056, .h[2] =3D 0x7800, .h[3] =3D =
0x0000,
> +        .h[4] =3D 0x0078, .h[5] =3D 0x0000, .h[6] =3D 0x6543, .h[7] =3D =
0x2100
> +    };
> +    S390Vector vs32 =3D {
> +        .w[0] =3D 0x12340000, .w[1] =3D 0x78654300,
> +        .w[2] =3D 0x0, .w[3] =3D 0x12,
> +    };
> +
> +    vistr(&vd, &vs16, 1, 0);
> +    if (vd.h[0] !=3D 0x1234 || vd.h[1] !=3D 0x0056 || vd.h[2] !=3D 0x780=
0 ||
> +        vd.h[3] || vd.h[4] || vd.h[5] || vd.h[6] || vd.h[7]) {
> +        puts("ERROR: vitrh failed!");
> +        return 1;
> +    }
> +
> +    vistr(&vd, &vs32, 2, 0);
> +    if (vd.w[0] !=3D 0x12340000 || vd.w[1] !=3D 0x78654300 || vd.w[2] ||=
 vd.w[3]) {
> +        puts("ERROR: vitrf failed!");
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +    return test_vistr();
> +}
> diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/trans=
late_vx.c.inc
> index 3526ba3e3b..b69c1a111c 100644
> --- a/target/s390x/tcg/translate_vx.c.inc
> +++ b/target/s390x/tcg/translate_vx.c.inc
> @@ -2723,7 +2723,7 @@ static DisasJumpType op_vfene(DisasContext *s, Disa=
sOps *o)
>=20=20
>  static DisasJumpType op_vistr(DisasContext *s, DisasOps *o)
>  {
> -    const uint8_t es =3D get_field(s, m4);
> +    const uint8_t es =3D get_field(s, m3);
>      const uint8_t m5 =3D get_field(s, m5);
>      static gen_helper_gvec_2 * const g[3] =3D {
>          gen_helper_gvec_vistr8,
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.t=
arget
> index c830313e67..f8e71a9439 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -18,6 +18,12 @@ TESTS+=3Dsignals-s390x
>  TESTS+=3Dbranch-relative-long
>  TESTS+=3Dnoexec
>=20=20
> +Z13_TESTS=3Dvf
> +vf: LDFLAGS+=3D-lm
> +$(Z13_TESTS): CFLAGS+=3D-march=3Dz13 -O2
> +TESTS+=3D$(if $(shell $(CC) -march=3Dz13 -S -o /dev/null -xc /dev/null \
> +			 >/dev/null 2>&1 && echo OK),$(Z13_TESTS))
> +

I didn't realise there where a bunch of compile time tests in the s390x
makefiles. The best practice (since Paolo's refactoring) is to emit a
config-cc.mak to set some variables once, e.g.:

  config-cc.mak: Makefile
          $(quiet-@)( \
              $(call cc-option,-march=3Darmv8.1-a+sve,          CROSS_CC_HA=
S_SVE); \
              $(call cc-option,-march=3Darmv8.1-a+sve2,         CROSS_CC_HA=
S_SVE2); \
              $(call cc-option,-march=3Darmv8.3-a,              CROSS_CC_HA=
S_ARMV8_3); \
              $(call cc-option,-mbranch-protection=3Dstandard,  CROSS_CC_HA=
S_ARMV8_BTI); \
              $(call cc-option,-march=3Darmv8.5-a+memtag,       CROSS_CC_HA=
S_ARMV8_MTE)) 3> config-cc.mak
  -include config-cc.mak


>  Z14_TESTS=3Dvfminmax
>  vfminmax: LDFLAGS+=3D-lm
>  $(Z14_TESTS): CFLAGS+=3D-march=3Dz14 -O2


--=20
Alex Benn=C3=A9e

