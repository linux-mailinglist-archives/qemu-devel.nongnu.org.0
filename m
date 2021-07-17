Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49A73CC4EF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:39:33 +0200 (CEST)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oHk-0008Gf-89
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oFx-00071Y-Hp
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:37:41 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oFw-0007hy-7b
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:37:41 -0400
Received: by mail-ed1-x534.google.com with SMTP id x17so17205196edd.12
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qspD/bzkRLw8iIG88pVe8ADLBdY0doKk9C9iOMgKnmI=;
 b=nHC6arSeWm8qbFCZedPf+CAhUvcq1VyYS9YVOI/NHmGKYrqvj7w0ke/bKe8ARTF4I4
 1/UPneAaBstYofitrnLfmRFmsDIu36QIWvk2UxfSEbYidGfWiayeTO/Bs3nsoyy9x2OX
 bmk+n1gn66dj9EVtrSXMSiubEMoWp0hWqm49s4qRgxaElWAblxeV1a1ctQouvJKub7Az
 a/h4Wo7xaDm8YNnZD0xkFfdMaeNmZ5/ar6lGfKq/pGw5f1D2G9Y1wDW9TQT/QOcreS0f
 DAsVO0OZ1uMH2UVXfwKDHvO9lOX5Fl8aVZsa93jTGYEBNEq9mkJmX7V4SE51A+Pc2u5k
 xnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qspD/bzkRLw8iIG88pVe8ADLBdY0doKk9C9iOMgKnmI=;
 b=R7Lgw6N8dsLKbjh2nyhlLcTy94q5OEbYTDrdTRBoGh5zaii+iGpUfN10dUVOUdUXMa
 OZKjba5f7Jtt8NneUOrtQIpAYDFLoV7al113lomXhJWFS/BQLgdtHXj2V2jP2+V5svLf
 ItR+xoeDTgRpHJj+Tu/uaU6M5xm2z2KelevGQk0wLgBbPuYDx5CcsOGZjfICon+7qhxG
 U+LNuR2KYmowEq8l5I8msA9U1sMfcr0UPyd3zCSe58Unsu1DvmtwDrDgGtbV7QyHzqdY
 XiSfwNhXkyl3FjIn5UfDqR1OknxIRlOwz/GZfTeKyetVG4bXiTxetGLtJYgzJ0NStAOm
 EcKQ==
X-Gm-Message-State: AOAM532oN5Cqf3+T7E7yh1wOvyi0Vzw4sullqsMPxWh4xENKpcc+0Wxp
 p8Nt5f1XbztvQKT6Ve6NaNJ3QHQFNgOHUfgmvU5Igg==
X-Google-Smtp-Source: ABdhPJzAeUjkZX6cChG8DNW0QUM0IaV3jB0GTZBsoYa9VuAz/Pju7lQuVI6wTKM9iPVy6MBuJ13UyN8AzIZbOMxcqAo=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr22958507edt.100.1626543458817; 
 Sat, 17 Jul 2021 10:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-4-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:36:58 +0100
Message-ID: <CAFEAcA-Bq4MSJo705m5xgW6rARgTd20yN0KqyazjvbbUD1u-Fw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the -d nochain check to bits on tb->cflags.
> These will be used for more than -d nochain shortly.
>
> Set bits during curr_cflags, test them in translator_use_goto_tb,
> assert we're not doing anything odd in tcg_gen_goto_tb.  The test
> in tcg_gen_exit_tb is redundant with the assert for goto_tb_issue_mask.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

