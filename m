Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08973FD4D6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:01:23 +0200 (CEST)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLBS-0006Oi-PX
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLL97-0005ZJ-0A
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 03:58:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLL95-0005gd-EK
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 03:58:56 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so3179758wrc.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 00:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lej0VSNVGdliuCMK5zY4jJXhNcn2iGO2dAjwZanBW/k=;
 b=g47jNh9UDHpKhRxCMuMzglm0C1IRA4wxRiyUAn5kxqCtLYVZAmeC5L20OYuJ6dKr5k
 o3x0px+hgWpmIx5vPLNdAxCjmU3Czs7I5JGEzeDwIsXGXqN8/43DRxTmcm3z9VcGm5nh
 /BTEsQbae0X5bHMVofG36Gjv3ysxryKG97BAUUy4xHaR6JFSGkYXaCfNSrGUwoihNz20
 4RBXhZ8LZRceuLQil8Sr0Pd4C/iYerKGf6QDBzQaNmhU9QX2ODRMQmygxux/0i0Ptz81
 xDTxqQnB95q6RcWiuKRFZ8MO38foawRUzWcWhkwh87dvQrrGfRBZhw8pY1gGUSpxF/8C
 MrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lej0VSNVGdliuCMK5zY4jJXhNcn2iGO2dAjwZanBW/k=;
 b=VAamfFqYYJCvpdZA+n1tmkSPNBxvk3ObSDzaGYXaiBfZhKaMlD/EnFIREjzNMKFO7P
 0RlGxT/vB+gU6eKrYwlmSW2uvxRRuO44/VtuaaC1RTc7J3vlygEQatdkHN+VeriFNeLR
 +2M+g1MZ4CnAW89+jGTu9cB2z39y41eN9rGI4F3VoGzQ4PHXHPlcIViGKoRIMuIjwjOH
 aSIk49ZgelTuh3iB4QZ0dG0pNr0Xnnuwgej4+BjWc0pLSRkQHkMGLC8Z9k5qwut5+jSG
 ZYOV3cv4Dl2QT9NOdwwWFrD0cDm7j5LPiFLmEdNPACEghNYzXf55JzrVwXCNPfHm3VKH
 YUgQ==
X-Gm-Message-State: AOAM5318RkUb2HN0a9rmSlyogz+dTdLBeuIGrMPv1GvBLTz9t0ngorIx
 MCHwie4agfazDXMt0BZgG1ahftIO1bk2eiJso81Sp7U75gI=
X-Google-Smtp-Source: ABdhPJwJOXgFjFWBc1IiuC1h9BmrrOzcwCu4yC17McohaSuBWFwUO4zwiaDJujLoQY+UQywI1MFybhamT33vriLXh54=
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr35558267wrg.386.1630483133369; 
 Wed, 01 Sep 2021 00:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210724134902.7785-1-peter.maydell@linaro.org>
In-Reply-To: <20210724134902.7785-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 08:58:05 +0100
Message-ID: <CAFEAcA9zMdFwJ6TPG2G7+boV4zPGrg2nZHXzUmBKZ-BkHdnqjA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 0/2] target/sparc: Drop use of gen_io_end()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Jul 2021 at 14:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The sparc frontend is now the only user of the obsolete gen_io_end()
> function (used for icount support). This patchset removes the
> use from sparc as well, and then tidies up the generic icount
> infrastructure to remove the function altogether.
>
> This is for-6.2 material because it's just cleanup.

> Peter Maydell (2):
>   target/sparc: Drop use of gen_io_end()
>   tcg: Drop gen_io_end()

Mark, are you planning a sparc pullreq, or should I take these
via target-arm.next?

thanks
-- PMM

