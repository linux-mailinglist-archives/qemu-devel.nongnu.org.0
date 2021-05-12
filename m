Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22837C3C5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:28:14 +0200 (CEST)
Received: from localhost ([::1]:49234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqmT-00074X-5R
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqjq-0004DY-VA
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:25:30 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqjp-0004m2-9x
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:25:30 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l7so27595469edb.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JvvYo6RNFIX9kQ59m/m93tMWcNfN0jWwMrDYrgeOWgE=;
 b=Q69bVv6znYZwV6v6YZfxy3wkPVUqpwkbtv+cFAxH4leukpUJs8XbwNO6g3PP9yoaan
 4hilZ0KCbMRbp6M2EYoBlwRUP+ZOMqY+i/PvoZDmsNaBbXYOOJ0/4CpnvKUwdtp07rQd
 2GZfYIeN+BL3J0wb2MuIXBxPYVsNnAz4Qu68MKn0XJkn3EIW+hedct4h1WEIb3kqcNF5
 jIdqEMF8WjI9QQ15JnLoeXUaZV9Lp5+Sp5H4jCS8hiOvwIs4deH3cBk9mhnzm09RdLKj
 iBa9YyzPvXK2CDFMGRhI9FbFtlScpOHkkYDie2F2LL3KKva+CcTMPe1fWUphSpdS7W83
 b9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JvvYo6RNFIX9kQ59m/m93tMWcNfN0jWwMrDYrgeOWgE=;
 b=LLWF6ZZx78exvM807l78nYrFEhC8/FK79nx3rAoJsB9PpKys781G3nzFng9Tms51qI
 LanHb4LpaUcX0oW/A1xx0sHBWX4k4td9+VHWXYdqvllh1ZMMa7rgTQWWkyPHOpvd0wE+
 +cJByup74SOmWL/ZWBJmshL1T6k8efUQZv72mNj8Y38ol01s0iXwowjqhMT6AsT5Lu2i
 54a4h5KuIPgDBrkcaPECmR5RBc05j6WVcl/rSZrUU+1isK/z6VFc987BWBOJQ5Q3MGnR
 yYZKB5NC8LUVZUMFC2bZaoBUA+QhWuQEkiYFfcd6ZSF3YnxGANpDj3WVPjng7MRAEBl6
 az9A==
X-Gm-Message-State: AOAM533jbsIpwgm+eKDAJwxRP9+olBC92c+CDLwEhayzja3//fHBmCQk
 Ab8dKNq2kD8pJk1IClQ5WvmBb+HYRVnvI3Tkubkr8A==
X-Google-Smtp-Source: ABdhPJxvYHGta7dkiAtjTOBkJ8IXmob+mLZmH/XwK8obet7N7caFGtgg1Ke2CbcwY21+eBZDZajXsqwlZMgqhWhHKqA=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr43515876edd.251.1620833127842; 
 Wed, 12 May 2021 08:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-40-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:24:14 +0100
Message-ID: <CAFEAcA8pYZH8qVrso1bw1WnPgXNGWD_mgAX-=n-4NPee5=Np5Q@mail.gmail.com>
Subject: Re: [PATCH v6 39/82] target/arm: Implement SVE2 RADDHNB, RADDHNT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200417162231.10374-3-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix round bit type (laurent desnogues)
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

