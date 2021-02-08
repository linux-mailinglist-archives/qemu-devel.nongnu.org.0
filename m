Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA6313BFC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:59:54 +0100 (CET)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ApE-000888-MY
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96gx-0002dh-36
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:35:10 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96gZ-0004KO-AE
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:34:57 -0500
Received: by mail-ej1-x633.google.com with SMTP id b9so24589814ejy.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DWjXdww6s047teLzesimAI0+q8BErK77u9WoURR4Kfo=;
 b=yUp1fe+l2KsKg0O4I/IUT2Bt3SWHKf2pUf93AucUIyAuNfq5PTsYEclIPR33aF3/Wc
 hfXKcHFPOpWvJrFrTEYLCoU2vy2OYZKyfeFPC3ze7GFatZKdCK+KcKHNLYZVv1iTJAcA
 19DGOa30nyWnfe2YFXxHj4SUXH1SE9Yit0gYgv7GX/Fsk49KQeX1KzmJXlF0tH5mCWAv
 llaCB1nmUOJvxlA0kOLenFLlt9roWqhGgfGA/A2CIiBl6UAARdhOtUetXVZziPMmz1yz
 y6/f6LM6lvoaAFpVOemziMl923OAUkRioxTK9556RSpIpp1eq2GoTb3RKOdUUrrNYo31
 rvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DWjXdww6s047teLzesimAI0+q8BErK77u9WoURR4Kfo=;
 b=ijKbGv9lhWLMPNQcQ0UrdYqO9h6LWfgzdci3r7YDaE287UXK1ynQ0OwYbTI6+7KV5C
 yKPQ7NAJYclQ0jGlCuDvUCN6CdhXDYoSrpeso5dNlTBO2uU+B3nUuJ/Qz4js6OnmRlSh
 gByqzGXy1cc3+pj3mRGeHqdaef6ZNnq57MRTyDygbvvhvkkukfMnPaiY6/ZX8dGxB8+o
 QqzpgaOI141XRNAadf9WDnlCA0JlS/f7JVeX+TZkbl/Gy7BTJgz0kphJcWnRMqkJ0SL/
 cyuK9Ads/XFPjbCWjowUj8STpHXx3Jr7lc0ct5i5j1GvkBmwpYvONdlFagkbjIvgeVPl
 DSgg==
X-Gm-Message-State: AOAM531iDSFLW6ikTWZnW91qHjvNguCXz+Tq9tQ07YMT8pj9dJDqqjQq
 d94dPackLQ+gmRhMj5N4UrwmJg23Wm4NqsesrsxDiQ==
X-Google-Smtp-Source: ABdhPJw6XAyRt9f5mlpgj+nMl0597bOUkFUlmnVbPS8t+EAzzKw8ZLXRa/YVEO5Pi2/oGjJTnStXtMZmsU1ZFlT5axo=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr16932779ejh.85.1612791275828; 
 Mon, 08 Feb 2021 05:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-12-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:34:24 +0000
Message-ID: <CAFEAcA_aYKBMw+0br_qavLa9KdB67VH31sTR=tfd3Bd7iEbZdQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/31] exec: Introduce cpu_untagged_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Provide an identity fallback for target that do not
> use tagged addresses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

