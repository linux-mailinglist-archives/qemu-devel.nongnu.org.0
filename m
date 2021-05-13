Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D0037FE09
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:26:58 +0200 (CEST)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhGz3-000135-Ny
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGy7-0000NR-4c
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:25:59 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGy4-00071X-Ct
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:25:58 -0400
Received: by mail-ed1-x52f.google.com with SMTP id di13so32207422edb.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jW2Os3wo0XrLjzNEATQoFTuZKMeIXEuoR4UgwDgofYc=;
 b=rBh9qmGAEzRtmlkjGCAMA7eMJRR5lDO7Dp771QXjC6dQHnkkVSi4lypQBftQYqYJTW
 ZgbLWSSQe3flnc4HDmdiAu0ofqyeQCx12AZ3MI68kqBxYOXkYxEUhRJVPJmnwHx3t+a3
 46b9zK2o9oBj1O4TNr6lkP7CW99hTUEo7sWtef5yStFXfk9Tv3epWykWGO4xb74hsKT9
 9UleKvK8WYNkTgc+u9ZVD+U9yCl8usG6/27fJWrWz+OamdHROQV2hiBKFXOtEoetb5A+
 QcbABAaJkJsS9V0OgNsovVcMoyXWjtkt5D3RW/2QHhFFGNjgwU+SLTr3QNWu0Lx3g5yh
 wfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jW2Os3wo0XrLjzNEATQoFTuZKMeIXEuoR4UgwDgofYc=;
 b=iHXOaB2WGYionx48UlnQmiSmCI1CHYzyDX/QJE6366aQyY3Uw5LbPhCJaIzga1Q5ab
 J2dyhTBOAadTgI932pI3wOridIDCWYH6QrRri9/5X/xtzPNxbwBbbl0fn/zCok1YjN3e
 jfKYOeVcZtyLVNdLi3T89yEDLsm3HNqQlZ0BtBDdnnKjiyoY5SInS2LbC5vitxGjTQ/E
 7hby9k0OG5YOFma4yerpWJ+dIIwGB39GIOCT6RkJXpT6tqQlf/j3nEYcDPHhfnO6gr64
 bAlVjgA2EMm1GM5vcSWYs7N6z/ckSptdEIRqpidchYLIAo0NZF63RQPzqZALsXetlchT
 CqxQ==
X-Gm-Message-State: AOAM5338CqEnXMRC06GhF18+CqyQTN5+e29KpuRjBbFNCVit8wZN5q77
 SyK/bniqhk+atJqlMrYWXwzO5/ctbP5Qr88Qq1MSZw==
X-Google-Smtp-Source: ABdhPJwW27jW4fAK14+A14MbrHxnGt6jlSGuxE/1SKuAMA09skm0tqoe85dqVyl3SUmlOCQ2aQar1dXnA/7uLvdeBLI=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr52166937edv.204.1620933954665; 
 Thu, 13 May 2021 12:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-78-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-78-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:25:42 +0100
Message-ID: <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
Subject: Re: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were extracting the M register twice, once incorrectly
> as M:vm and once correctly as rm.  Remove the incorrect
> name and remove the incorrect decode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/neon-shared.decode |  4 +-
>  target/arm/translate-neon.c   | 90 +++++++++++++++--------------------
>  2 files changed, 40 insertions(+), 54 deletions(-)
>
> diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
> index ca0c699072..facb621450 100644
> --- a/target/arm/neon-shared.decode
> +++ b/target/arm/neon-shared.decode
> @@ -61,8 +61,8 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
>  VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
>                 vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
>
> -VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
> -               vm=%vm_dp vn=%vn_dp vd=%vd_dp
> +VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
> +               vn=%vn_dp vd=%vd_dp

Is it possible to make this kind of bug a decodetree error?
It seems unlikely that there's a use for having a bit which is
decoded both by a %foo field specification and also in some
other way...


>
>  %vfml_scalar_q0_rm 0:3 5:1
>  %vfml_scalar_q1_index 5:1 3:1
> diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
> index a0e267694b..52b75ff76f 100644
> --- a/target/arm/translate-neon.c
> +++ b/target/arm/translate-neon.c
> @@ -151,6 +151,36 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
>      }
>  }
>
> +static bool do_neon_ddda(DisasContext *s, int q, int vd, int vn, int vm,
> +                         int data, gen_helper_gvec_4 *fn_gvec)

This patch seems to be doing more than its commit message suggests.
If we want to share code between trans_VDOT and trans_VDOT_scalar
can we do that refactoring in its own patch, please ?

thanks
-- PMM

