Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2AE2FB810
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:29:27 +0100 (CET)
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1s0c-000837-L7
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rz8-0006zg-Pg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:27:56 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rz4-0002rN-Dh
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:27:54 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b21so12911204edy.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpA7f4MqKuh5FapD2PFmnr9qNfRsnw1/7uBkIAgNY0w=;
 b=cpAesGjyABtAY3EDvOmOIgZBHdYDBskfRppwmHK7JlUBUjBaPzBBgtr1A33+ljy1LG
 nodPiQU9DIXeAyUjkG1Nrp6C6m1lUjJiYG6S8T5I5ORPF8vSDIshDp8cPIKBgGPiQV3S
 /ZVBQXLoM0rSO20zXzcteyCUPg/DyhqK7zMA+G5xUnF4y8v7FchoH1dyrdBzE0BSKN3X
 JFfIIzB1+Yt+lPnyiaAn/24QFg0nq67IWlBneXd/8/Ppn57PzkYZF8Ff+68GFqwaMKzR
 uOyKd4lahrt5tM3YzfFqHsY6JcBKCw+aMcVRM6tksqshxhgP0zLP3QfNVheDd0jTPBhP
 +r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpA7f4MqKuh5FapD2PFmnr9qNfRsnw1/7uBkIAgNY0w=;
 b=JHIHA3F2CAjpJ/MWS/etZiWY2/ChLMtlfTURuA08UTSIKr/ebvcAWwF8azNlXQrlRe
 MOqL44S0qjRBiHcVFM1GYynHKpto+UN26kC8iwsQdTsOG/sF27XNeDi1UGGtJVP6Niav
 37bzBsLFd4kNbeJswU0fTAvDX6/obAj7+XsaVlYO4eCtK8FtVbm00WYXsgl4+m6jtMwA
 ULhMML5J8SplxI0elZigiUP3+2r1K1aPaWG9CLOQSteiiNnbAQf4GxRhmUbfA+R+TF2t
 ByyxuIS0mUunpLMsyCcMZAEFFDkLo3oj0VpffkXGmI14t4FWFPchkBzBRU7Ip2DQ0Xxw
 KXig==
X-Gm-Message-State: AOAM532xWa4VGCGZdWGaMVB3cEkIlMeBv/tdL3n4WfVmM5vYhn4tRI5o
 QZjf6aSPEpkPVSoZ6ZQdPZlaXJxqSFnqQwd3nMjwCA==
X-Google-Smtp-Source: ABdhPJwHc9kKtDqrJx/gYdeR3vuRATn4JeS7n2wALzQMzTz08gnjuja879pxDVR6wX7nCQZc5soTKz4P9WLvxxw56Z4=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr1565866edd.52.1611066467368; 
 Tue, 19 Jan 2021 06:27:47 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-3-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:27:36 +0000
Message-ID: <CAFEAcA9Ng8hysJRf+odugoSUcrjzBNUvmhpTzOLmSYKELWF0TQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] tcg/i386: Move constraint type check to
 tcg_target_const_match
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rather than check the type when filling in the constraint,
> check it when matching the constant.  This removes the only
> use of the type argument to target_parse_constraint.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 050f3cb0b1..74637f654a 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -263,13 +263,13 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>          break;
>
>      case 'e':
> -        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_S32);
> +        ct->ct |= TCG_CT_CONST_S32;
>          break;
>      case 'Z':
> -        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_U32);
> +        ct->ct |= TCG_CT_CONST_U32;
>          break;
>      case 'I':
> -        ct->ct |= (type == TCG_TYPE_I32 ? TCG_CT_CONST : TCG_CT_CONST_I32);
> +        ct->ct |= TCG_CT_CONST_I32;
>          break;
>
>      default:
> @@ -286,14 +286,20 @@ static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
>      if (ct & TCG_CT_CONST) {
>          return 1;
>      }
> -    if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
> -        return 1;
> -    }
> -    if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
> -        return 1;
> -    }
> -    if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
> -        return 1;
> +    if (TCG_TARGET_REG_BITS == 32 || type == TCG_TYPE_I32) {

Where does the TCG_TARGET_REG_BITS check come from? We weren't
testing that in the old code in target_parse_constraint() that
I can see.

> +        if (ct & (TCG_CT_CONST_S32 | TCG_CT_CONST_U32 | TCG_CT_CONST_I32)) {
> +            return 1;
> +        }
> +    } else {
> +        if ((ct & TCG_CT_CONST_S32) && val == (int32_t)val) {
> +            return 1;
> +        }
> +        if ((ct & TCG_CT_CONST_U32) && val == (uint32_t)val) {
> +            return 1;
> +        }
> +        if ((ct & TCG_CT_CONST_I32) && ~val == (int32_t)~val) {
> +            return 1;
> +        }
>      }
>      if ((ct & TCG_CT_CONST_WSZ) && val == (type == TCG_TYPE_I32 ? 32 : 64)) {
>          return 1;

thanks
-- PMM

