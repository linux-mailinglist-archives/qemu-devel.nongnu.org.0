Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0173CC6C9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:28:47 +0200 (CEST)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tji-0001O1-NI
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tgw-0003VF-6B
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:25:54 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tgu-0003ch-K6
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:25:53 -0400
Received: by mail-ed1-x533.google.com with SMTP id h2so17990428edt.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ya7DX6pDr5FKgjbZ7spaCu1K6JbLW1jJWtdYYgQ17Ps=;
 b=MidZwg1nDF1wz10j8K6KZteOSTtKgswg3TB0LVXENnkWye1K+YD+f0cyRZxNiMLGGg
 zGF2S1o0yyJDA7xZqcA2K5yiE00j2HwDXUotAQBB1P8GjNghHroFboSB6Nq1RieZYeV9
 lj96i2hSAgG6fmRr7zh0YdazxX2NhCV/dzSBPmRmbP/7ExlnEDvjfz3DFB4yJErtbHPn
 YBAo0VDeA1TasCCbHLc4yB5xcOZFEvJvxQcyeiSQ3ZeXonT5i9VBb00pz0wF26SrIL/S
 JqbR2Cb3uNwiKmPDsOC2dyNgHNzNsJ853jMsm8tEfzANHDjla7DPbz4Yb3b1FlavEl9B
 HCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ya7DX6pDr5FKgjbZ7spaCu1K6JbLW1jJWtdYYgQ17Ps=;
 b=UT+LW+bdRDo5+lHA08/1Q4yPz1oSo5fGcU+hai6KanRihiRTKg+gWAIOTYGOQcbBHS
 hQL2s+UCIa+ajYCZnvwYDUO2Mmabwt3zUUqSuPNxKum3M4uJf/WSjZ21PlWe8iDkgK1+
 U8Qc6Xh4URty2lJFDgGIJeFV+r17StjSEFO9O8NjOvl2aIL3CYZehcJzjbGTzlucxeg/
 /NoHtUYhRm1fyhKThPxJahJ59hMRdgnOmX1fzu8gZAncfBdCP8mtrrKURJ4gdkvgMuoH
 UmFngLRu5UHxlVl1R2s/gq0q5nXOI6nCIQ3gf/vKfSdjIWxfDUDHiDp3mB+HnKd+g+R3
 aZIA==
X-Gm-Message-State: AOAM531sn/XzcfoJVD3hH/UijYdvr/k5+Mr4tttygKTphLthriSLvJ8A
 gSu2eyOdilgxbby/p3/aIMUhKyq1TGSF43jvhr1nIM/fdZc=
X-Google-Smtp-Source: ABdhPJxWurw8OOnH1dLesz/mKYwzRAruHohVFu6HvNpjTiOXzDvZa4m1/9yYzIRZEx37pUdfP+EzAwA1JEFUoEPBr0g=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr24446777edt.100.1626564351214; 
 Sat, 17 Jul 2021 16:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-11-peter.maydell@linaro.org>
In-Reply-To: <20210717232103.18047-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 00:25:11 +0100
Message-ID: <CAFEAcA8CVgnUiZgM=AOjzJ1Sk-D3pamAoWwkAcchZU5x0HfHOw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 10/10] linux-user: Move DEBUG_REMAP undef to
 uaccess.c
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 00:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Since commit 687ca797893ca1e853, the code that looks at the debug
> define DEBUG_REMAP is all in uaccess.c; move the #undef line to
> there from qemu.h (thus reducing significantly the amount of code
> that gets recompiled if you need to turn the debug on).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h    | 3 ---
>  linux-user/uaccess.c | 2 ++
>  2 files changed, 2 insertions(+), 3 deletions(-)

A minute after sending it out, I realized this patch is wrong:
there is still a use of DEBUG_REMAP in qemu.h. So this one should be
dropped.

thanks
-- PMM

