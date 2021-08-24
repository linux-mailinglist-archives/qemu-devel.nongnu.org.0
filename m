Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379093F6326
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:49:01 +0200 (CEST)
Received: from localhost ([::1]:59670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZbg-0001VH-Ae
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZOe-00018g-5X
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:35:32 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZOb-0002oV-M4
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:35:31 -0400
Received: by mail-ed1-x52e.google.com with SMTP id d6so32680882edt.7
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=heQqNRfA1mowlX83uczh2S2Wf50LZxWLWp33sAFCSaA=;
 b=ho7Faw5ent8Tm829A44q/oaYvq3iD67TjnfOekjOgvq8sfOxhgOyatW9fZgm9pmSxZ
 hcPEfUg2MsOwaatBv3BemZY58eW43fHyaJFKjJ3sCyuwsvhW1OW1qgPAGU+zgJ7NP6xX
 9Z2rtrrEQJqjYNkrr0BROTi1B0EZIuUJL2jdRUEXXBJVaYJ+g/+FyfaB8G2AH4cS7YEv
 /7LR9+VwOxzAyEJmjwIaR+kwThlIvAof9fUkEq/AvQdq3jheIZAsgp7RkGR4GXmxeEPe
 tF9eCXh/Yf5ryF1LW/bwG9pjj5S7BbHI5DTKDTERspe+s3oXCkVOVVW+nm/Y3SPJROgw
 ZLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=heQqNRfA1mowlX83uczh2S2Wf50LZxWLWp33sAFCSaA=;
 b=JwOG+iiJ06C/6s+CW663sQHfvakOhde6jhwJlyCG/T8xD8uKI0Iswvkz1szNMdqX1Q
 k1RwRlGU3gUttuZ9PP43L23u5Gk4RZJMLH/8Nr7683vqTePfQNUT2WbRWHgrKqSKHf4v
 PW0Kb752QxG29MteQr/gLIOlbJulfVnFYejvd+ZfjyyiXpP1MPTzYxzp4bVlD/1T7gQT
 /ClIwpHWHJKNK8EvUMaxVLAGkHQchsIxypkHm/EC7P1EKdjWzYjcRNq12WDfn5UTq27z
 LL9HHa6lcNgND1AhP8BurLO9nQaj2vKEniNk0G2jlPOGwavCycrQBw7d+5AfLYnswew2
 gyTA==
X-Gm-Message-State: AOAM533efOd81KvaNFSlPD7+pjqjy9Og47/PBqOHI3Gwl7Xpo+auRPob
 OzNjqkxw02w/0GcwErvirItxYp0y2gzEyJoAcZ7AoDNsj+Q=
X-Google-Smtp-Source: ABdhPJxOplsxGIDSxC57szBVg1YZTdHAqn2jg7HJL2aoTIok2KeAqc8ln/kwsfwFF4W7ls6TMxcJE6MEYozNC8WXrAU=
X-Received: by 2002:aa7:cc0b:: with SMTP id q11mr22738788edt.251.1629822928111; 
 Tue, 24 Aug 2021 09:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-16-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:34:41 +0100
Message-ID: <CAFEAcA-BT9ih71QzUcUhHDq--15rTrO-YZQZV9C_GrNfK6jCGQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/30] linux-user/hppa: Use the proper si_code for
 PRIV_OPR, PRIV_REG, OVERFLOW
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These si_codes have been properly set by the kernel since the beginning.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

