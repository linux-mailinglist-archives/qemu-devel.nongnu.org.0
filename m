Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC992FB9CE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:52:18 +0100 (CET)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sMj-0008Vr-5X
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sKv-0007JM-GI
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:50:26 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sKt-0006Jh-OZ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:50:25 -0500
Received: by mail-ed1-x534.google.com with SMTP id bx12so7821342edb.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Az6t6LPVgWdNwa0Vf9Kr37FdnP+vMTBeUi0OGywfT/E=;
 b=s21JUZJ2L3TRHvKUeEczHVoS6AR/aoNfHYwgTUGiP5SOWsNwzvtx5d0oB1qCxcqQjv
 Uq98DJ7ZlGNIcQWwUtcp2HXJIQSFJBJ7ytdsy+zSKQhMZ3BdfgicIblOg7gc/1GxoW6E
 UJ8VHYrssI3a8ryHqJuMfEUY2a5SFudNutouxbwusKb2ly9anpxmELuPk34F0qwr4t6c
 HrgTUUjsPouZEzCPm/0coxS3B8I/BGAFpuQyqJ2hecVOjvQs5MOywYAHALoukgn0NFEn
 e4QwzzPpCf/ymoQXxeQwYfLeNTgtFUVTGFXKQrAS5Wil8vgHbPLIxceFaAReRHVVVpH7
 QPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Az6t6LPVgWdNwa0Vf9Kr37FdnP+vMTBeUi0OGywfT/E=;
 b=MfRKE229MShmX2oGUNN57XV6b8K3Z/H4QgHkSHpasUa9jQsNbvmjeRuYuV6Ipy9OrD
 Z4gvdU57L31D6DZ2UbgS9VXkn/+8XKIlHOuBkD9vL+o6CFBZ57oC6tToE14hgI6WnPvv
 JoVU+Kt/Xf+fKLjZdaKuy2FB4CRN0OUZh71nluLwr+7lUTtdYMGLuV9TEvBlCLjPYPhL
 cmaousXQPKyfEtYYfHzlPCQcoIrOV1m8MIYnQvw9CpUDo25Jd9Oc3TZOT60bkNKk/XI0
 A7R097NOGfEtAoP097YN7HyjcL2/g9VxrQcKndVyRhBp5TgPFiBXc3ftJEpso8T/rklJ
 81bQ==
X-Gm-Message-State: AOAM5303oCoI2ooYQKJRVqJvUlX6QxnCNlODVGiuqDouAtA8aPYkd3Yy
 l728GT90PI1eTbaahPUsqosCH18mBbSr6DYfZX6I1A==
X-Google-Smtp-Source: ABdhPJz5E8s5SG9uWVOBA/HC6mRzAa25mxMfjL3LYl7pai2cLaJQN3HwG85IiiIrWHHK24+q3C9M4zdhB/DjYNv10Vo=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr3570889edv.100.1611067821961; 
 Tue, 19 Jan 2021 06:50:21 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-9-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:50:10 +0000
Message-ID: <CAFEAcA8AfTABU67Z04urM_7JALD8kYVmWYEeP=Q=NRfwq=1xZg@mail.gmail.com>
Subject: Re: [PATCH v2 08/22] tcg/mips: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target-con-str.h | 24 ++++++++++++
>  tcg/mips/tcg-target.h         |  1 +
>  tcg/mips/tcg-target.c.inc     | 72 ++++++++---------------------------
>  3 files changed, 41 insertions(+), 56 deletions(-)
>  create mode 100644 tcg/mips/tcg-target-con-str.h

> -    case 'Z':
> -        /* We are cheating a bit here, using the fact that the register
> -           ZERO is also the register number 0. Hence there is no need
> -           to check for const_args in each instruction. */
> -        ct->ct |= TCG_CT_CONST_ZERO;

This comment seems like it's worth retaining somewhere.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

