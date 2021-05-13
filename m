Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A1737FC14
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:05:47 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEmQ-0003aS-Sz
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEVz-00048i-DG
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:48:47 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEVt-0005v0-Uc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:48:47 -0400
Received: by mail-ej1-x62b.google.com with SMTP id n2so40774695ejy.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wZlNz2bDsuLs6L6KptR9cBk9rffE8cXeSkyZYnQFjyo=;
 b=zmBld3Nfec01FPGCcj5kjoeR2/it0EddWoBJBNqA6tjzvz6ZsYuvI+5BqUOjgE0MQ3
 YwggtD5GC87HUb8M8gmVzerQCbKgf0RZgixp+UTV4y8WiyVPxIkwVAXJjpa7se3bEfsh
 RxhYb1BVoltmNlha1XLuovPbtU4tjAt2CcZK/P0NNs7WcQkIPJ1RX/vlbehoFcOMnnwb
 cIHW2mYPGJTf9pYPqRxx4BSw75hA+ab6+jCmT0kiCnZop+VlHT5NL185Muh3s3VmPb6q
 m0ikvHU8seWnjqv7NwzFLAkZ0tjyad8WqBVwmyzDtiK38WamUQG8Pd8Bfpe03pft89Dq
 cAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wZlNz2bDsuLs6L6KptR9cBk9rffE8cXeSkyZYnQFjyo=;
 b=bBfvMR2OqWFGUWMIJMVGKLfqNrhsZyBhib4ayaJKLz/ukqBl/ililm61WzPf+drPSg
 UqnvjAcnNMoed+ZyOF2YbMmcApWh2bffT7r+KNRJl9vDB6GRpi2Fce+2WYawhI7LZJ2z
 N+Pzuqwa32tEHepiO6hSz1RMF3QFWMd1aKgcvX3LQwzVVluIUYYi/L1U5I4Yie2BDvlT
 iWmicZZ7KVETy8/OrBc3Owiz53fytdBdsMHP6SK3ywDGm0l7iZJ7WvMuNMhHlenZBeXm
 YtyTaAQ0xjjPqQzKZIORxt1O6SkvtTcwMM3efQna7Fs0r1erFfzvvz1QHRX0ex5wDAbP
 /BRQ==
X-Gm-Message-State: AOAM530MToUePvg422LInQMPK/cmiWlYnsCEoZPCWrZHaLSEqSRExjEz
 fciygHge7F+eC0+0FC2h8yj+2KquvL9GGSI/HrSHew==
X-Google-Smtp-Source: ABdhPJy/la6ck3559W8iwsidnj+SC/lAJ21YzKWvXVDoBgBK4Uh7ifWxLUMxCh+5w5s5gO+xMcx0Qn1q4bKrANuTrPI=
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr13984545ejb.4.1620924517503; 
 Thu, 13 May 2021 09:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-72-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-72-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 17:48:26 +0100
Message-ID: <CAFEAcA9QoW_-nW-eEy-KZJKpaZ_SpFaSKpnwShtrtD74HNLL8Q@mail.gmail.com>
Subject: Re: [PATCH v6 71/82] target/arm: Implement 128-bit ZIP, UZP, TRN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  3 ++
>  target/arm/sve.decode      |  8 ++++++
>  target/arm/sve_helper.c    | 29 +++++++++++++------
>  target/arm/translate-sve.c | 58 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 90 insertions(+), 8 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

