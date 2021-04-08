Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D955358B82
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:38:02 +0200 (CEST)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYbR-0007ry-4H
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUYad-0007QT-Md
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:37:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUYab-0004Tw-P3
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:37:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so870617wmg.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I4U2Dmm3Ct4I57UJOM+aUoQBbkCUbcPKYcebHgwdIG8=;
 b=tvRIZxQtIOcAbCKEAFZEZS/JKH+FssYDNA5WjM3ABoeQOPPUi/XhLxhnsI4Qr93CO0
 hdgETDTEFhO1sxpokI7VShuq01SNYJGDRriKiOmbEk+fjN9QcuxUyr5nX+AOkUNMMsbx
 7+gk9OiIOlkjBp1lnu+fy1FybSt6VmrGSHsajJaNNayWc+OaCgYoc+48S1JPeQIQT84Y
 bVeKF8xBHabp07a5FYWNEjWerfBJoHUSNJgIq8Olux7kpt1+8y7SGAEnTR9P/TmKmPxl
 LscDwPQQk9MM8Klf+l/NRfO0glVR+WF4yDdaNxlSPC2eXUQ/hsmQzogLRYqPL+GJOyqv
 0PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I4U2Dmm3Ct4I57UJOM+aUoQBbkCUbcPKYcebHgwdIG8=;
 b=MDB9cKq50d8JU/cqn7tFIsxTDRWl+mIzVA64K20YrdATNG4CrS8Jofsx0/PWwQGL64
 JKTkfOK1b+lxy1h2WxQn/7tjLCRKXXqPcaje9isJZj7NCbgch1a4tW6kMZ3JgFls6Ckf
 rYY8PPp1i2dDMoVRwl/B9tWJlruWxSuV26Ks+YR1SKTMVjXiu31PzW3G4PovevY3YS1f
 vzLLkM8itRVvzKs+T/7VwP/1zYX3Zsvg99JpSYAc9zIHF02ZlYHl/f3oXvm2KTrAV0m1
 GaPtn0jfC+oenVoyJB/tIDQN8cPrbzcAj0cjNJdBon/k6P/gH7pTr/qwF4+iArdWGfoV
 w/zA==
X-Gm-Message-State: AOAM530672u1IXJharDriQZxg1AaFHP1qGgoZ5pYrKUvQm9UdUd0XGg0
 giIhibawV2N4Ni5PAhS+hrV+dA==
X-Google-Smtp-Source: ABdhPJwrPmR5p2Ra5PYJIv0LUgOVq9D2L+40omirRF+dBXOwRG7aToK7AyUq8+45aYjVpt2i6GHaVQ==
X-Received: by 2002:a1c:2186:: with SMTP id h128mr9918676wmh.166.1617903427642; 
 Thu, 08 Apr 2021 10:37:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h25sm17584299wml.32.2021.04.08.10.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 10:37:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2E891FF7E;
 Thu,  8 Apr 2021 18:37:05 +0100 (BST)
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-9-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v12 08/65] target/arm: tcg: split m_helper user-only and
 sysemu-only parts
Date: Thu, 08 Apr 2021 18:34:58 +0100
In-reply-to: <20210326193701.5981-9-cfontana@suse.de>
Message-ID: <87r1jksmny.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> in the process remove a few CONFIG_TCG that are superfluous now.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/m_helper.h         |   21 +
>  target/arm/tcg/m_helper.c         | 2766 +----------------------------
>  target/arm/tcg/sysemu/m_helper.c  | 2655 +++++++++++++++++++++++++++
>  target/arm/tcg/user/m_helper.c    |   97 +
>  target/arm/tcg/sysemu/meson.build |    1 +
>  target/arm/tcg/user/meson.build   |    1 +
>  6 files changed, 2780 insertions(+), 2761 deletions(-)
>  create mode 100644 target/arm/tcg/m_helper.h
>  create mode 100644 target/arm/tcg/sysemu/m_helper.c
>  create mode 100644 target/arm/tcg/user/m_helper.c
>
> diff --git a/target/arm/tcg/m_helper.h b/target/arm/tcg/m_helper.h
> new file mode 100644
> index 0000000000..9da106aa65
> --- /dev/null
> +++ b/target/arm/tcg/m_helper.h
> @@ -0,0 +1,21 @@
> +/*
> + * ARM v7m generic helpers.
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef M_HELPER_H
> +#define M_HELPER_H
> +
> +#include "cpu.h"
> +
> +void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
> +                  uint32_t reg, uint32_t val);
> +
> +uint32_t v7m_mrs_xpsr(CPUARMState *env, uint32_t reg, unsigned el);
> +
> +uint32_t v7m_mrs_control(CPUARMState *env, uint32_t secure);
> +
> +#endif /* M_HELPER_H */
> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index d63ae465e1..8f3763155f 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -1,5 +1,5 @@
>  /*
> - * ARM generic helpers.
> + * ARM v7m generic helpers.
>   *
>   * This code is licensed under the GNU GPL v2 or later.
>   *
> @@ -7,35 +7,11 @@
>   */
<snip>
>=20=20
> -static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
> -                         uint32_t reg, uint32_t val)
> +void v7m_msr_xpsr(CPUARMState *env, uint32_t mask, uint32_t reg, uint32_=
t val)
>  {
>      /* Only APSR is actually writable */
>      if (!(reg & 4)) {
> @@ -51,7 +27,7 @@ static void v7m_msr_xpsr(CPUARMState *env, uint32_t mas=
k,
>      }
>  }
<snip>

I guess there is a question about why the helpers can't just exist in
the header and maintain their static and become inlines in the the one
place they are included. But this is M-profile and I doubt the
difference is measurable so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

