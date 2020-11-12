Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD802B0908
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:55:24 +0100 (CET)
Received: from localhost ([::1]:57118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEwV-0008K7-Hh
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEuQ-0007T5-P7
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:53:14 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdEuO-0005mr-Es
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:53:14 -0500
Received: by mail-ed1-x544.google.com with SMTP id q3so6807766edr.12
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 07:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p51dq0/9XZQRYlkDP7WAZgPpu7pIGdVlazGXebcV2RQ=;
 b=Qo2zAMX/VHhAfw0bHY3STPLsrdnK2tymXrXxrSo4CxS9CygOB7Xe0GahOdZDyXu/uk
 Wyhls4SpmkvNvH1khT5eNL23fROo6T8/cSkMo0nQD4IMoRqFB59+K/nx66JuD/qKxGSQ
 qj5ROddOBUGChdRz7V/jzSEYBN/b5qrYrmhkd5M+dMIf6w1Qd7UeSdsR+jdQXiJ3QzdZ
 HEBAPB/m1bi6QizC+LWbk+xbOtZIQfa5Xzcoi4KIXWgvP+Cfdzj6XzJEOUvrIA2lLIZO
 PQUBHp9iaPENiP/rfP/mzoitra6uYAmy9eTE29pvdofTomNq0s4JIQLb7Zk1QOHGo6C3
 vqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p51dq0/9XZQRYlkDP7WAZgPpu7pIGdVlazGXebcV2RQ=;
 b=hA+qcCilYsAlAjT+/bvKX4QHDup+n0ZlA5TmZ8kOXJj6DEYFuTXNZ2g33NaObI1GOT
 miKwCw3ukBL0PEjf7jZVYQVIGyAsCavVGhv2iuCpd8C0pisayHnb6CK9lXCCbJB+2a7s
 7BI/lUbX+D/IeoT8X6IJCd68WZcycYtUk/QAmH6UiXUDhyfHR1XPeBYdecuzCyqXQrB1
 DKG6koGkR6F5yWVrKxeyp4iyyRqcCzhcVCSyJuTybMQg1zfUBhG/pK4PhYMFmiOwhhvS
 4UkJ9Fa4gJxjA8FeTL6hoUkvonOGPFRsY4FC8LHpspmPwAWcgNk7qjYm1M0ar966ov/V
 5kkw==
X-Gm-Message-State: AOAM532Xl2YSqysaaDiBXV8RiGCsE8kq8BJZxW82b0MbcN5GTSZ0uRHa
 U6O2IlRFNuJKs6Tp7QWvjAxc1rxd7R3z5g0FkbJmFQ==
X-Google-Smtp-Source: ABdhPJw+rxMpl8SxpAll59gUlTUwVSIPUXLh0hb7jm4QgQf46EqT5OIcNFSJxFY4NKdyv5FWg6/NWe2qchkVR/bWdVk=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr446479edr.36.1605196391178;
 Thu, 12 Nov 2020 07:53:11 -0800 (PST)
MIME-Version: 1.0
References: <20201006074829.488968-1-pbonzini@redhat.com>
In-Reply-To: <20201006074829.488968-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 15:53:00 +0000
Message-ID: <CAFEAcA-jxdu9FqP5Jq_wCo3=WG3BBGWpidNBzwB-Y_dBJvo1Tw@mail.gmail.com>
Subject: Re: [PATCH] target/i386: avoid theoretical leak on MCE injection
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Tue, 6 Oct 2020 at 08:54, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> g_strdup_printf is used twice to write to the same variable, which
> can theoretically cause a leak.  In practice, it is extremely
> unlikely that a guest is seeing a recursive MCE and has disabled
> CR4.MCE between the first and the second error, but we can fix it
> and we can also make a slight improvement on the logic: CR4.MCE=0
> causes a triple fault even for a non-recursive machine check, so
> let's place its test first.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/helper.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 32fa21a7bb..f64379367d 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -908,16 +908,14 @@ static void do_inject_x86_mce(CPUState *cs, run_on_cpu_data data)
>              return;
>          }
>
> -        if (recursive) {
> -            need_reset = true;
> -            msg = g_strdup_printf("CPU %d: Previous MCE still in progress, "
> -                                  "raising triple fault", cs->cpu_index);
> -        }
> -
>          if (!(cenv->cr[4] & CR4_MCE_MASK)) {
>              need_reset = true;
>              msg = g_strdup_printf("CPU %d: MCE capability is not enabled, "
>                                    "raising triple fault", cs->cpu_index);
> +        } else if (recursive) {
> +            need_reset = true;
> +            msg = g_strdup_printf("CPU %d: Previous MCE still in progress, "
> +                                  "raising triple fault", cs->cpu_index);
>          }
>
>          if (need_reset) {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Might be nice to have this in 5.2, given it is a coverity issue fix?

thanks
-- PMM

