Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20703D7077
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 09:37:58 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Hf3-0000Bz-Si
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 03:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8HeC-0007x4-9G
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:37:04 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8HeA-0007C4-Ii
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:37:04 -0400
Received: by mail-ed1-x531.google.com with SMTP id y12so6047816edo.6
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 00:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cnmDSLD9Sr+DQ9v7u55WYeLJ1kZn8Z9wPx9jO2I25mw=;
 b=tyUNBq957m58U1OD0bLuVToEV4UYcKdy8NQLZkd08Dv4QQeFKJSqen39yG9Emj9aAi
 nDpaJTJ2hzkVZxyJ/ojHaWu5Y56sw6Ksx6EdFjXI2lOtNDF7myHsJb9yj/IZC/Bjt9j/
 45U1ZB8fM8tltOSZ64SfuTISLO6+arynqcvKHEjCXMzdg94lzuz14O0QpEZrNJBFgBlo
 hD6f24WUrAErqQbuc22nAaCV1l0HPii7S6GO5NYGXW37BlIn0c1kgod1aDPNZUaOozct
 z+fu34qNaIQYts4iCTYyr1ci5YwDt3RC2IsTrD1n/Rh/OacEHg5qyq6Ko23YxbZdRe08
 gGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cnmDSLD9Sr+DQ9v7u55WYeLJ1kZn8Z9wPx9jO2I25mw=;
 b=Mw+QqJa2iaYfjm1gKYcq6yt2MpSmZaqVCG4kkaqYjg/8MvRIBqjqlltCSqEBUrFk9T
 ThvSoGIuiHMxtwNnTP9jv80YDb9eI3OXLxM2DDhIyWZOHfgdOoAx94kpAKnkOsQRqy8w
 3IE2exzpQ63OVD/ZgYbqIsGDuY3pvIJDg7DX6tY5M9xaHos6U/c9L+fxPUvhx4x801Wk
 bGMg3qlskUq4RU5EziU/QFlO/+DTaAAc7ZBom76CCIKjw3agX8+yV/3tC5ZCtBixc967
 pJcTLe7QeLaLOo0JUe1BA5Ke/xhcAYPKBctNB0uYoK7MmIYqaxSojc+l8BIVJu63OoQC
 qAnQ==
X-Gm-Message-State: AOAM5327iRHPBVA8BR77FVYsQl6ixaRG8boD+gc8c4hFQExjJlbFpRhC
 Tx3bD/b97mshBKVph9XXJoV5wWvH82GsOPlWUCKzGw==
X-Google-Smtp-Source: ABdhPJzCmbBKhQOuqQVvqZ7D79xG+FFSo2gsAgno7iLjMljLWIjiCe8KPaeWrFLRRaHGD9j/qgLgXhtjzdVD0DC8lTY=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr26083826edb.52.1627371421053; 
 Tue, 27 Jul 2021 00:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <87pmv4zj22.fsf@p50.localhost.localdomain>
In-Reply-To: <87pmv4zj22.fsf@p50.localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 08:36:18 +0100
Message-ID: <CAFEAcA-UZMGK3azd5fHGhk8vivzv4agY=GXLAdWJfsErDkORPg@mail.gmail.com>
Subject: Re: Regression caught by
 replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Jul 2021 at 01:39, Cleber Rosa <crosa@redhat.com> wrote:
>
>
> Hi everyone,
>
> tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
> is currently failing consistently (first found that in [1]).
>
> I've bisected it down to the following commit:
>
> ---
>
> 78ff82bb1b67c0d79113688e4b3427fc99cab9d4 is the first bad commit
> commit 78ff82bb1b67c0d79113688e4b3427fc99cab9d4
> Author: Richard Henderson <richard.henderson@linaro.org>
>
>     accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
>
>     The space reserved for CF_COUNT_MASK was overly large.
>     Reduce to free up cflags bits and eliminate an extra test.
>
>     Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>     Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>     Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>     Message-Id: <20210717221851.2124573-2-richard.henderson@linaro.org>
>
>  accel/tcg/translate-all.c | 5 ++---
>  include/exec/exec-all.h   | 4 +++-
>  2 files changed, 5 insertions(+), 4 deletions(-)

This is probably fixed by
https://patchew.org/QEMU/20210725174405.24568-1-peter.maydell@linaro.org/
(which is in RTH's pullreq currently on list).

-- PMM

