Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E982EEADA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 02:22:12 +0100 (CET)
Received: from localhost ([::1]:54248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxgTj-0008Sy-Cp
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 20:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxeao-0005eF-UO
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:21:22 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxean-0008CP-2u
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 18:21:22 -0500
Received: by mail-pl1-x633.google.com with SMTP id t6so4685803plq.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 15:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y0tJuyDEzyxT6uxpk/LQ7kuQcZZ+wYiZ8d01IZTeHqE=;
 b=HWfuArjx188ZlZ2YJXGXJRvOyetq3zNA2n6bB653aDpXaxg2VKbI56vP+GNPIXUcST
 D6eMjZzirwAe9wH739h3601NyBQN9nRvpTlxeLE1T7UUBr5LMMSxpcdeMjcGIjWnJoKK
 q68cZGQHy6dFsyAHdPSV7biNPtFFGPdoLdFJ5UyoyOpfNgdqgelBdBGe99A94aQruosY
 LttP6oGefzp6buUi0C2c3goIuAweJnnnfzXBV+Y9ymgSRBWGFgQcsf5oeexTVMLMjyHK
 5UtInvLEnG6qfzLXclFjqMss86CJkFfnb188Fx5bAZV4wNFSqjAV086LhdT2DyUHW4hn
 9DXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y0tJuyDEzyxT6uxpk/LQ7kuQcZZ+wYiZ8d01IZTeHqE=;
 b=I3cqQtf2bA1PtJhv8CrWfKuIBysupW3nQjArqs8zUfs0NLvi6CchC5dC/cHBUjqQmW
 oaR7AUtdS+BjxI9V0xLi11AVcxIzA7DwyGyAlwW93jjxau5uW75+fnZNuHOuGizgejBu
 YEHO1f8kNOwDmKl/q3v825m1SK7+oyDtcjmTmG19mbXS+uaQv3gId/wGnSQa1iKy4Ox5
 RPIa2EgfdQI83MaBaxFNywYsXP3WUBMuqKVk7Z6sKE5NZfh8Ap/zhCmjt5CFwn7BXxg4
 RFmVpGvNwB522HYMRMOnsh0IqRpQtB5Yc3bXfd4CNPILqSipwcIxl5SdDfP1XjG7Z/71
 7V4g==
X-Gm-Message-State: AOAM532omGKX6sw0BsUfNzJV7o6AVkKHfbUGmhKC1Gylato/QpgWW+Wc
 mjaTNkfjmOhTPFO6XGQzOK9UM28UsNCAkH3lbnD0kg==
X-Google-Smtp-Source: ABdhPJw5Ri/cPL1Lay0AY8OTS8AnUhlTJit6wxlNNfizIKjRSXB+tnnOQHE+CzixCGi6yAjTMKXBiejbCUYehhoTmYM=
X-Received: by 2002:a17:902:ed14:b029:da:9da4:3091 with SMTP id
 b20-20020a170902ed14b02900da9da43091mr1040622pld.29.1610061678150; Thu, 07
 Jan 2021 15:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20210107231322.56345-1-david@redhat.com>
In-Reply-To: <20210107231322.56345-1-david@redhat.com>
Date: Thu, 7 Jan 2021 15:21:06 -0800
Message-ID: <CAKwvOdmE=Z9pV4txRw-kpcv5FOSr6eEXfmGnc++R_Vzv8MnRDQ@mail.gmail.com>
Subject: Re: [PATCH v1] s390x/tcg: Fix RISBHG
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=ndesaulniers@google.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.382,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Jan 2021 20:19:43 -0500
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
Cc: Thomas Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Heiko Carstens <hca@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Nick Desaulniers <ndesaulniers@google.com>
From: Nick Desaulniers via <qemu-devel@nongnu.org>

On Thu, Jan 7, 2021 at 3:13 PM David Hildenbrand <david@redhat.com> wrote:
>
> RISBHG is broken and currently hinders clang builds of upstream kernels
> from booting: the kernel crashes early, while decompressing the image.
>
>   [...]
>    Kernel fault: interruption code 0005 ilc:2
>    Kernel random base: 0000000000000000
>    PSW : 0000200180000000 0000000000017a1e
>          R:0 T:0 IO:0 EX:0 Key:0 M:0 W:0 P:0 AS:0 CC:2 PM:0 RI:0 EA:3
>    GPRS: 0000000000000001 0000000c00000000 00000003fffffff4 00000000fffffff0
>          0000000000000000 00000000fffffff4 000000000000000c 00000000fffffff0
>          00000000fffffffc 0000000000000000 00000000fffffff8 00000000008e25a8
>          0000000000000009 0000000000000002 0000000000000008 000000000000bce0
>
> One example of a buggy instruction is:
>
>     17dde:       ec 1e 00 9f 20 5d       risbhg  %r1,%r14,0,159,32
>
> With %r14 = 0x9 and %r1 = 0x7 should result in %r1 = 0x900000007, however,
> results in %r1 = 0.
>
> Let's interpret values of i3/i4 as documented in the PoP and make
> computation of "mask" only based on i3 and i4 and use "pmask" only at the
> very end to make sure wrapping is only applied to the high/low doubleword.
>
> With this patch, I can successfully boot a v5.10 kernel built with
> clang, and gcc builds keep on working.
>
> Fixes: 2d6a869833d9 ("target-s390: Implement RISBG")
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>
> This BUG was a nightmare to debug and the code a nightmare to understand.
>
> To make clang/gcc builds boot, the following fix is required as well on
> top of current master: "[PATCH] target/s390x: Fix ALGSI"
> https://lkml.kernel.org/r/20210107202135.52379-1-david@redhat.com

In that case, a huge thank you!!! for this work! ++beers_owed.

>
> ---
>  target/s390x/translate.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 3d5c0d6106..39e33eeb67 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -3815,22 +3815,23 @@ static DisasJumpType op_risbg(DisasContext *s, DisasOps *o)
>          pmask = 0xffffffff00000000ull;
>          break;
>      case 0x51: /* risblg */
> -        i3 &= 31;
> -        i4 &= 31;
> +        i3 = (i3 & 31) + 32;
> +        i4 = (i4 & 31) + 32;
>          pmask = 0x00000000ffffffffull;
>          break;
>      default:
>          g_assert_not_reached();
>      }
>
> -    /* MASK is the set of bits to be inserted from R2.
> -       Take care for I3/I4 wraparound.  */
> -    mask = pmask >> i3;
> +    /* MASK is the set of bits to be inserted from R2. */
>      if (i3 <= i4) {
> -        mask ^= pmask >> i4 >> 1;
> +        /* [0...i3---i4...63] */
> +        mask = (-1ull >> i3) & (-1ull << (63 - i4));
>      } else {
> -        mask |= ~(pmask >> i4 >> 1);
> +        /* [0---i4...i3---63] */
> +        mask = (-1ull >> i3) | (-1ull << (63 - i4));
>      }

The expression evaluated looks the same to me for both sides of the
conditional, but the comments differ. Intentional?

> +    /* For RISBLG/RISBHG, the wrapping is limited to the high/low doubleword. */
>      mask &= pmask;
>
>      /* IMASK is the set of bits to be kept from R1.  In the case of the high/low
> @@ -3843,9 +3844,6 @@ static DisasJumpType op_risbg(DisasContext *s, DisasOps *o)
>      len = i4 - i3 + 1;
>      pos = 63 - i4;
>      rot = i5 & 63;
> -    if (s->fields.op2 == 0x5d) {
> -        pos += 32;
> -    }
>
>      /* In some cases we can implement this with extract.  */
>      if (imask == 0 && pos == 0 && len > 0 && len <= rot) {
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers

