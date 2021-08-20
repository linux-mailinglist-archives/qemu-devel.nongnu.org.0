Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E1B3F29F5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:12:55 +0200 (CEST)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1W9-00067I-Li
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1VA-0005P2-4J
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:11:57 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1V8-0006WO-5J
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:11:51 -0400
Received: by mail-ej1-x629.google.com with SMTP id d11so19075317eja.8
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 03:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/w7mL2W3kxmmSinOnkoLRdFu6QaDuaNnt/lEW+zw4g=;
 b=drBYBIEbsljdAQpf4Yzf0Nyiqoh8iAATEDeSU/APgcdZfznKpd/ihCa4dJKqEQ7eC0
 0lja6xHzV8/TZwFTISzHMrbojMXjUzwl2NDA2GWjQHZp/Rh67b/8fcS0cmv3/bNE+9yW
 N8yXDFTVWv4Qxoy/XC9obwRGRDC46BjetOP1YvHPRgYvNLDc66QqaqHKdiK5ceY3iojW
 oMMPfA19Sl2WmY/TwlOB6Gu3GcvfboawMKReaTNsd/8h7LlMLXagPi35Fj03AfpPR+Jt
 GZVmeqE1f9+8H4UxUS6G3nBvi9MSmaaqqXeYCApEXMAfmg1rkt73d3N5hNuZzUndYL2L
 i7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/w7mL2W3kxmmSinOnkoLRdFu6QaDuaNnt/lEW+zw4g=;
 b=axThvS7nGRcjnnOkK5Xc6B/zNgBSV1VL/yrjIWSp9zWj/GCe644BwVFEbpgObz9Ert
 jHNtQoevDAIxyKF8RHk4P/XWaYwB5Y0NWwnh24yap37RLRhS1UApAqqlrpAcgs6YdgNT
 KlSg622AqICovNRDd3lPL6aDTDTuYLY08gRvw1IWy2vIeCzJokc0QsE1xU6QKzVDotmo
 cI2YMtjsWLFrS7kIWp9q+HCuszvQ/qhwp5H22I14CEPeFkS55TQBzJUFEUBtnzXtGSXH
 9JxakgD7bfhPysX44/Cvb52aVAXLdG3Il8Hfhp9urt2U2RWMYomeIjcEujjUl113s75N
 JQLg==
X-Gm-Message-State: AOAM5300L5UKK3t4uAii9s8hGZowse3ySCIR/KcpqlJtofQXkgl+ZNWe
 gGfPzdDUhdmSKradEfFqikCAsbsyb2pnG9MeDHDFrQ==
X-Google-Smtp-Source: ABdhPJxd8Sf/3CzWeTvzt9rsU5h3LAoyPJ1P89xIejApz/FyLBEfJRTIUPsUJYLfCNkMc3MY/Hy4h8rIzdQy9nC2alc=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr20328722ejb.382.1629454308208; 
 Fri, 20 Aug 2021 03:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-62-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 11:11:01 +0100
Message-ID: <CAFEAcA_-pq=5PSaCNyUz2MxaYNwKJhMq1JayrC3Vpg5QkvXTkg@mail.gmail.com>
Subject: Re: [PATCH v3 61/66] tcg/ppc: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Wed, 18 Aug 2021 at 20:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.h     |   2 -
>  tcg/ppc/tcg-target.c.inc | 102 ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 94 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

