Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09BA6E0E7A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:26:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmwwX-0006fw-6C; Thu, 13 Apr 2023 09:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwwS-0006dd-FE
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:24:48 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmwwP-0004te-5T
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:24:48 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-504ecbfddd5so1427958a12.0
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681392281; x=1683984281;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SVIQkvA2WP6zeEPbNmVjGiFz8zy4V0Km2NjASN8wmp4=;
 b=TkkUoYOvmJpx9dNAre6sOohlO+9mD4W5VBnxGxTF5Ky6kdFi2xmje6F5+C7G6NwQCd
 xg8yW29RqiCdXxBsk0dnnIAqeHlkCeRyc0B2XiHOpYnyaHNL8IfIMwFBcNSZSRmOEp6Q
 bp1y8zUpiUi4AG5dvu3SgRVQS9woi3rM0/hv5AxWPQPKxWKx2upEpTFWNcn0tKG+TE57
 uNgSK5willU1iUGs3DNQjN4UKBqC9hzp1EWzTqdSXIUybbhi36qFYXfWxY8mjklD7twY
 SQLfkCEbghdTs3ecPoHZ/gCzDCQSjKGA8EhAOw4L36Rnj4vYxtNlyRckssJ1RQT36vnS
 TLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681392281; x=1683984281;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SVIQkvA2WP6zeEPbNmVjGiFz8zy4V0Km2NjASN8wmp4=;
 b=c2AnH4SvuIl3D4ta9/Pkpkm43K2EqLRzWA5VurFEnoozb5ari2mxlQljR+Mx5YZQxh
 WdN2fqb76AXht0ICY5ijHXi5UwPNc5s+rtVDuyD2gBMcoN2zhLAcpEPRqMP5vRnyaNfJ
 9taB8M0b3AgsBUepfOnAvwyWZCLa1nAERhjhHZkNHO4ZJCji5dkrHel5CEMH1wOFW6oa
 iC639GpGPc32lqhyiZw4/go4/XOY57H5HAsAqlDG488zSw7g5fwESfO0LoWGJsyYrGhl
 GTP9BtAgm2Pbd73ZkVdW8qS1NbewZ8Y4dMaIqScTh9DJGl4xD//1Sxkl9KTy1SPjLS8V
 OuRw==
X-Gm-Message-State: AAQBX9cxXOq+lbinST7mdPX/MUZWlSWZe8mtufc63kZKp9zoCI9Wn7t7
 Ddb2apFADItPBnLQIUdZ2Mzyg0C8j8pjjUUUZcNRmg==
X-Google-Smtp-Source: AKy350ZNboqxenmpSKRMpCcoE0eiilQVRuBbcyqj58bL3NpfvV9yheUxEkCEo8b6SA0HqyM20aD5zvowJP4bUMhbX9c=
X-Received: by 2002:a50:d783:0:b0:506:6ca5:3128 with SMTP id
 w3-20020a50d783000000b005066ca53128mr1227711edi.6.1681392280863; Thu, 13 Apr
 2023 06:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230406151441.1027662-1-leonid_komarianskyi@epam.com>
In-Reply-To: <20230406151441.1027662-1-leonid_komarianskyi@epam.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 14:24:29 +0100
Message-ID: <CAFEAcA_koyJSR_7kF6TByA_rm2nJQr-8UnXrtu3JqwgpqUEctw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add overflow check for gt_recalc_timer
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dmytro Firsov <Dmytro_Firsov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 6 Apr 2023 at 16:16, Leonid Komarianskyi
<Leonid_Komarianskyi@epam.com> wrote:
>
> If gt_timer is enabled before cval initialization on a virtualized
> setup on QEMU, cval equals (UINT64_MAX - 1). Adding an offset value
> to this causes an overflow that sets timer into the past, which leads
> to infinite loop, because this timer fires immediately and calls
> gt_recalc_timer() once more, which in turn sets the timer into the
> past again and as a result, QEMU hangs. This patch adds check for
> overflowing of the nexttick variable.

This is https://gitlab.com/qemu-project/qemu/-/issues/60 --
thanks for sending a patch.

> Suggested-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Co-Authored-By: Dmytro Firsov <dmytro_firsov@epam.com>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> ---
>  target/arm/helper.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2297626bfb..2fbba15040 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2618,6 +2618,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>          int istatus = count - offset >= gt->cval;
>          uint64_t nexttick;
>          int irqstate;
> +        bool nexttick_overflow = false;
>
>          gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
>
> @@ -2630,6 +2631,16 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>          } else {
>              /* Next transition is when we hit cval */
>              nexttick = gt->cval + offset;
> +            if (nexttick < offset) {
> +                /*
> +                 * If gt->cval value is close to UINT64_MAX then adding
> +                 * to it offset can lead to overflow of nexttick variable.
> +                 * So, this check tests that arguments sum is less than any
> +                 * addend, and in case it is overflowed we have to mod timer
> +                 * to INT64_MAX.
> +                 */
> +                nexttick_overflow = true;
> +            }

Rather than adding in a bool, I think I prefer the version
of the patch in one of the comments to the bug report:

             /* Next transition is when we hit cval */
             nexttick = gt->cval + offset;
+            if (nexttick < gt->cval) {
+                nexttick = UINT64_MAX;
+            }

i.e. we just saturate nexttick, and then let the existing handling
of "turns out nexttick is too big" handle things.

There is also a comment or two from me in the bug report pointing
out that the handling of wraparound is also wrong in the other
half of this if(); we should look at that too.

>          }
>          /*
>           * Note that the desired next expiry time might be beyond the
> @@ -2637,7 +2648,8 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>           * set the timer for as far in the future as possible. When the
>           * timer expires we will reset the timer for any remaining period.
>           */
> -        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
> +        if ((nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu))
> +             || nexttick_overflow) {
>              timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
>          } else {
>              timer_mod(cpu->gt_timer[timeridx], nexttick);
> --
> 2.25.1

thanks
-- PMM

