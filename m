Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70160A7A3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:54:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omwiW-0001zh-KF; Mon, 24 Oct 2022 08:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omwiO-0001tm-FM
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:38:01 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omwiJ-0001LH-4p
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:38:00 -0400
Received: by mail-pf1-x436.google.com with SMTP id m6so8897935pfb.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GtPs6BSk7iG0Xyw1d5kT3P/rp11OqlJBNSYSF5SRXao=;
 b=XUC7GGTHvUZ5oaWgA8cvu0nAyluVu0xGMd2yoetliMz936Irmi1fM/epkorg71E8RA
 tluQIs/T1N35VF2KlFE/4JbUwBSBK8EXtfmyt5/EbqmymI/o/v+wtkX9s5tDXl+6E/m2
 lKVB7X0SmoYkj5JWTcYgZylDKjLGkytWNXLDRLQzajEXeR9D0EAbe1mzPpyPBU/g/WgT
 viLKPqDz4dGupBc6fQfFXIWgrADNg5L5YawgjIArN6BwDIw5qdjTvR4O1RNvNAqs1wVk
 cVadEuQ4/boDBo0LgW7E3W1kGK0RX9jKeZnows4e4paDX3KfEhGcVdzrnVjFHSJZhX+b
 jzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GtPs6BSk7iG0Xyw1d5kT3P/rp11OqlJBNSYSF5SRXao=;
 b=t+3Xv2EPQI7ZKsHyWnnL5/grBJARWTc9neGUxaX8gXc9JqM4Ene4VbUoh6CIrkr+Fc
 /aTcWXRA2AgBA6h+TSZBhrwBdqRL7dOmdbBhQH/wiavXJiqEOpeFOCdajkaOo16dPYGV
 fMsziR9683cgk/Eu/nN2cUg3cI8xyXF+zT5IZUjVVLp6H4NBFNFrjF5Y3QVUXv0taxcx
 H054tjHoVbXHnsm9tz2oXTFUbTyCdRoET8Wi0DPOeYpG0BqbMog6fgx+eLME004BHKnW
 nBm4C6m9spRfi4yTIGuKSaPbnEzWvt+P0XteCRimHP9GO50Ofkx1FA8RjELA1WwZxzKW
 hZXg==
X-Gm-Message-State: ACrzQf3ZxmWRjxheesF0sKPPt3PyyF6QIGe/Gbj7DPWbNqfewD4xnKCg
 6PjArDsP/+kyC2A67ob0s2W5YfMu7rZ3oLC/cclVAA==
X-Google-Smtp-Source: AMsMyM7gfqUNBXGjZ7Inas97zJc+EAElt7QwBqpmHhh3U2u4ckVyGAei/gs4ZDNWn7ZTyQjlO9poDn59d2IQNBV3OR8=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr28111011pgi.192.1666615073548; Mon, 24
 Oct 2022 05:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <166636579128.26670.11954825054446993916-0@git.sr.ht>
In-Reply-To: <166636579128.26670.11954825054446993916-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 13:37:41 +0100
Message-ID: <CAFEAcA_szmT55giak4NNkTaZoGU=xJSaa1zz+h-ZR8bxPdCSTA@mail.gmail.com>
Subject: Re: [PATCH qemu.git] target/imx: reload cmp timer outside of the
 reload ptimer transaction
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Oct 2022 at 20:18, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
> See https://gitlab.com/qemu-project/qemu/-/issues/1263
> When running the seL4 tests
> (https://docs.sel4.systems/projects/sel4test), on the sabrelight
> platform the timer test fails (and thus it's disabled by default).
> Investigation has shown that the arm/imx6 EPIT timer interrupt does not
> fire properly, instead of a second in can take up to a minute to finally
> see the interrupt.
>
>  hw/timer/imx_epit.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 2bf8c754b2..0b13c1eab0 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -276,9 +276,12 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
>              ptimer_set_count(s->timer_reload, s->lr);
>          }
>
> +        // commit s->timer_reload before imx_epit_reload_compare_timer
> +        // as timer_reload is read in imx_epit_reload_compare_timer

QEMU coding style requires /* ... */ for comments, not //
(with the /* and */ on lines of their own if it's a multiline
comment.

> +        ptimer_transaction_commit(s->timer_reload);
> +
>          imx_epit_reload_compare_timer(s);
>          ptimer_transaction_commit(s->timer_cmp);
> -        ptimer_transaction_commit(s->timer_reload);
>          break;

Yes, I see what's happening here. It's OK to commit the timer_reload
timer transaction first because that timer doesn't care about the
timer_cmp timer.

Do we also need to change the other places that call
imx_epit_reload_compare_timer() in the handling of CR
register writes ? (Those are a little more tricky.)

thanks
-- PMM

