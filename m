Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2AE3F1D72
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:06:45 +0200 (CEST)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkZ2-0005As-La
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkXZ-000384-Ds
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:05:13 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkXX-0002HA-Tr
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:05:13 -0400
Received: by mail-ed1-x535.google.com with SMTP id cn28so9613620edb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6nK9jXUxJES7UgMbFUvTYiSdh03y4FG2IrZ+s7Hkn50=;
 b=n1s+xFZkzeol0IhYLbwLbFzoigp2xVwvwLOypPWszL9GTPuLFipCPGxb/+Wqk1RJ6f
 kD7GhBtkdCikq0HKkXroZmWCtFItIVp4JbqGMeIvYUhrOITtNgdWSnfqwkt4f+pQVxPp
 vIcV26ahgECcg0MbJcEg7yTDJ9KiY8GgQvg27i2TjDjjMPHdSve4HyOq/LzhPYpv0nju
 WmcKM8oTdISEwVt3DOAk66YdOSXrUqDkVQbfCQ73DSVDNXGX/nd9t/Gatt3+2Cvi92Ks
 I6qdEyBhgxiHQk5aKsBTPvC4z+3q4bFzLWYxX2omi5arb3yDFyElD4UskU7GXyyP1JnV
 ndKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6nK9jXUxJES7UgMbFUvTYiSdh03y4FG2IrZ+s7Hkn50=;
 b=TieoOSq/Aqp0NIrF68ikZKbsoL0g5RdauY01qnGS4QbqfKN3lKExFKVrytsZWqRBaW
 mXE7evcBkfsiVTXBHHMAsS3M5DRlhquY3jRHMQKS52h4m/6Wl1i2geo/Rm71Twhzfj9e
 Na+MbMeuA1iIKQ/4vHJYKpMzGy+mdsoK0kXcsO/Y/ozC/w06Bux9Iy22fCMSv3zqy1Qm
 WNO9RZ3gkNO3wrPFjaCx7RLV1fOssSsu8TlQdRqpUCWRxQWdWeXHEtYLu+If9fTm0vBJ
 CQxgk2+nClVzzJpIysOxQ8LkrJxzPSfjcvNvWVXdhRq73T344Y6L079HvwkXz6k/2usV
 fCMA==
X-Gm-Message-State: AOAM530QxjHoLqm4ngIF9Muz7PHbu2BWqChWqZPI3cihY3aca++Msa4Q
 WaPrnaeHHPdr2a4/tkS5MCS/TTsFabq33Bf0AWSkVw==
X-Google-Smtp-Source: ABdhPJziJF5uM9PNTbrSilWnreoX3Vlx3qN+A6mCqQDhiAPpPbSGIj+ExX7DDi0M5EPWaMyG/Jqb4FVGTa75pYmno+w=
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr16923849edr.251.1629389110229; 
 Thu, 19 Aug 2021 09:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-46-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 17:04:23 +0100
Message-ID: <CAFEAcA8jLg2evvD3dubA6KsAuvUZEWHLeZdmuC1eoMT7Rd--YQ@mail.gmail.com>
Subject: Re: [PATCH v3 45/66] tests/tcg/multiarch: Add sigbus.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Wed, 18 Aug 2021 at 20:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> A mostly generic test for unaligned access raising SIGBUS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/multiarch/sigbus.c | 68 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

