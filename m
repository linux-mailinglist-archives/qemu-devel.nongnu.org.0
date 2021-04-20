Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F33654E3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:10:18 +0200 (CEST)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYmOe-0007w8-NC
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYmN3-0007HC-3Y
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:08:37 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYmN0-0001Qb-Ty
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:08:36 -0400
Received: by mail-ej1-x62f.google.com with SMTP id g5so50439169ejx.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwBa+lwo/ny02GX3VwG6hW3qHxMAV4pZTFThzWnEbb4=;
 b=loQPlSH4ehmnAda3upuQxnm+bdUKEGyF7ormpMMA67WzvzZT+fWfqM/LibLpaPjc7i
 HQc8CUFFe5h6KTSe8Ql+6MIjHOpAacSAIRdqdaHDjR13imfCkSHevKlZd/oi8qscW5fy
 7ZdnJ04v8cEw1O9dwYJlcd3l3Rutb65T4Ds169hUOLwQwRQJxRCxghEIubgoXco8gNSj
 28NBuGNUlfQBFv9MleTRPZUkutpnOXoJsmmk3DjHd4Xm3m81g7Gfex2QW/Sgd4IFXAFw
 ooMB4kvPTh4u9OVx5WzKFCkKA82XUwaHLxIlKfduh/I1zADdhDGLtC8rn3pgSFoo8O9L
 Ug7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwBa+lwo/ny02GX3VwG6hW3qHxMAV4pZTFThzWnEbb4=;
 b=pjBT18UZb3Bdl3NJIBhr7A17azoki+llh56W/6mL6E2BcVkYbg4iNVEn69t45zl7Ps
 WIRJAhYW5UG1554ib2WhqPQyZTb/uBwkTnUyJUIiGhfwiN1XvRSfWqLfQuNRd+VcGT9e
 xB6nFuIq2Yph8LLSAOdTYql1Lb68FRLceMSdNakHkp2U2J+WzPFbQap7zVNYpd+pZ5Sd
 mnx/o7iU+H7Om6TCjQ6KvrSUAp4Yc4H8JEiAQKkD97OkuNmrxPqvGrgIQbdJsHjzTjl/
 XrY0T5NBxfRfta60wqk8sEKWAvLvx3Sf9IoTiju+YPGx9FTTrdgX0vl41/ppWYxMiYN5
 4wNQ==
X-Gm-Message-State: AOAM532DjzGl0FaNQOXC6YRY1GLa61lwZcifQsZhZASq2E8GlDndHG9n
 mWZ4gVkKwikbEchvYjT12ORfGgGi1tK3SujX9rWqSA==
X-Google-Smtp-Source: ABdhPJwIdMzZcV/96ZRNC5BFsV2xlczKsv7ggOJ2wW6ArPWmfAs95tEPYwfNM3TQin7NGlOuzWsgzHwf/X8G1HDMmjg=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr19406437ejt.482.1618909712203; 
 Tue, 20 Apr 2021 02:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-8-richard.henderson@linaro.org>
In-Reply-To: <20210419202257.161730-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 10:07:40 +0100
Message-ID: <CAFEAcA9zQ8qCWJw7smVRK-z0wZtmxY1r-9SdSUOpn=B+YhAKWw@mail.gmail.com>
Subject: Re: [PATCH v5 07/31] target/arm: Use cpu_abort in
 assert_hflags_rebuild_correctly
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Mon, 19 Apr 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Using cpu_abort takes care of things like unregistering a
> SIGABRT handler for user-only.

I would find this argument more persuasive if we didn't have a
ton of other places where we call abort() or assert() or
g_assert_not_reached(). Either we should have a consistent
mechanism for assertions in linux-user turning off the SIGABRT
handler, or we should just not worry about it on the basis that it's
a "can't happen" error anyway...

thanks
-- PMM

