Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D3265EB20
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:53:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPI7-0003AZ-Is; Thu, 05 Jan 2023 07:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPI5-000381-Ed
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:24:13 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDPI2-0007U6-QF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:24:13 -0500
Received: by mail-pf1-x433.google.com with SMTP id x26so18953527pfq.10
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BudTyNHSL/cxLA+L2U5eO2Ls8z9m7jsXk1TD1P9Ewpk=;
 b=OnSzvRV1R9ZpndfzRUHCmBnoh+fgqgqeknYtSzXAv9F48b/IAkLdXeuJqJeWmMCzwd
 u8Mu4b/vM4p35NqmeH28CxlRx5Yu+JJw1EfZQ1QYq8tTze01OI8wyyvbKMA7qCvdC03L
 Sx6ICQHCZgaIXkfEjMg4jaZmcJTORYyGGEyhnk3pghf3yIgMGF2qAoKAzwub36eVd2CS
 etrJQa5S6mQ7G6b2bdP4HILpmvSyaFK2Ux2vil8FjxFhbovMwvIzEI6wfN8vjF+2EHPk
 LtdnKW950YWPkMcstDVYCHNbjiLlxPtYvYoew5Ke7IUuI2qxczSDhyu4rAUqw4t5mgQ/
 H02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BudTyNHSL/cxLA+L2U5eO2Ls8z9m7jsXk1TD1P9Ewpk=;
 b=FKg4OK1QDbRunJG7zBXWZhIPbIf7JlK05LaY6SxgQwJtVxU/EAmgrGEZbCpMyJpj9F
 DDfg0bnvDu0mtyq06rCjWYRCxgxkdPgkrMG2W+9GSTvUkmSeVsUojsi8oNqvEuCnOF4a
 MfIf2LwNgZ4yuf20idWXr2MVlnk2jbNkxHn80Ebm//D58GpgjnsTwWQY9lsHY2oJvVVH
 h677CebXfmaCZ7llgZN2Cocp9cX7GUIOcph/ZfTnmedlb4kibTnB0Yng2ZOmHYhl5LbZ
 L3hUovTjO9erwT/4yC9jnvwEMGDDuRKcBI7hw9XP5oSpYpKSEdKyfn1FvFhl8vN01UZD
 Ovcw==
X-Gm-Message-State: AFqh2krdlvA7unG83BhqzphUU9FuHhzIFrxjIGRH2i+x8+VZtrXPCD9w
 DplG/EYOcpt0N/979ZW6tNx9C/9/6sd6wAIRWn0l2A==
X-Google-Smtp-Source: AMrXdXtE7XKKR3drK+Hb5cN7x8mS+aJyGbQ+dcXRBMvqBzUS1jcpCDGPJokreeLVVgRrmfPThhAdJdG+csqwV1QpMJs=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr3350916pgq.231.1672921448561; Thu, 05
 Jan 2023 04:24:08 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:23:57 +0000
Message-ID: <CAFEAcA-pyZ+GENR-X4C19LoL4MTTV1PcY7Gs26_DzTaFX0g56g@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 0/8] hw/timer/imx_epit: improve and fix EPIT
 compare timer
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> This patch set improves the i.MX EPIT emulation:
> - fix #1263 for writes to CR
> - ensure SR_OCIF is set properly even if CR_OCIEN is off
> - hardware reset initialized CR to 0
> - interrupt state update on CR writes (e.g. software reset)
> - remove explicit fields cnt and freq (they are redundant)
> - general code and documentation improvements
>
> v3 addresses the comments from the previous iterations, but still keeps
> the scope of this patchset limited to addressing the obvious bugs in the
> behavior. It does not try to improve the timer accuracy, thus the
> following remarks remain to be fixed in a future patch after this one is
> merged:
> - don't use PTIMER_POLICY_LEGACY. Fine tuning this requires more
>   time and currently this is not a major concern, because the timer is
>   working reasonably well.
> - replace the modestly harmful sequence
>         counter = ptimer_get_count(s->timer_reload);
>         ...
>         ptimer_set_count(s->timer_cmp, counter);
>   by something better that does not lose or gain time. The current
>   patchset does not introduce this sequence, it has been there
>   before already. Again,  the current lack of accuracy here is not a
>   major concern because the timer is working reasonably well.

Applied to target-arm.next, thanks. Sorry it took me so long to
get to this.

-- PMM

