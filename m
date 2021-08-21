Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D409A3F3C38
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 21:08:06 +0200 (CEST)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHWLd-00079d-Vi
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 15:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHWKV-0006Hn-Hi
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:06:55 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHWKS-0002oA-SH
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 15:06:55 -0400
Received: by mail-ed1-x531.google.com with SMTP id q3so19178286edt.5
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELjMJlR1CJv3rN0TrwyybDjp6WRAdqelPanEcJPtEoI=;
 b=koxpZPui1jQlOEnLQdmtvpNPMsPhE6Uk9cyNAZrN4E6v1MbbE5G88WVIX1FBrhsYPd
 KClVrRFBBP3/nil5NOxmjlq+2FIr/v+VVMOqABfTJkGxGvuqgEYoM+LemuOHI2TgKEzv
 Hy8tj9IBJSRjIz1fQ7aAd6srlwa2TLfqGBLAbjavu9Erfs9cLNjWNTE09zOFt0a2mafD
 XpF/wTIZFxhckC7Z0dRuoxPrUV+izsDk0g1g6Fs40Ne3qUdmNRFRKU+4bs5reob3gWJ6
 qFYhnE4b699ocHYCfJ6k1A7c/UpHPbKrM+ieRogJVZ2W7zY/1HAlB65jVqG2ze7SH985
 2UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELjMJlR1CJv3rN0TrwyybDjp6WRAdqelPanEcJPtEoI=;
 b=aLTBj9iNF/KDxHtWnfwrYa03pduGJDrcfK1Gu2w03xilK3lgcS0VmaXac4Q6NpyZlK
 EgZS7h0siaeIUITmGv/KT4W2PA+kookOueLZSYa2fqP7+N6F9LMTPnO3Wem6pJrYb0q3
 FBY3ZWm+o630pUwRqMugw2JZAik+k6WLbufBgNCKxgxgbdJ3+scvEQbR/cVdjRf4sPbe
 ZRUcY/HDpSvs/BizUabB7JwkW1OxUMI9yiCoo0O6tKrTLaLnjSHUzfVbAhxjuRudNcAi
 2IvSC8+Iv3k+X/ReZQDQrwhRzmHpofe5xdAX0HUjqqFQ9cq97PuxDoF+jyQSTpCgdez4
 IlkQ==
X-Gm-Message-State: AOAM5312Rjxw92hQYNbLI1UD0yos+zytqqQm8xZQDfUxedhQJZRCzwVe
 VmFlx8olm3jxCl9CFHoNgw2laFL5N4uE55Z53QGygg==
X-Google-Smtp-Source: ABdhPJwJm2hPYt7Q9IM+wYATks69Cu9ZgDda3H/ZXw5E9HPFYRu0NuIFbh4rqAiFUaAMdbuax6SI89Hrqe7u/tGk288=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr28826087edc.204.1629572810867; 
 Sat, 21 Aug 2021 12:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210817162118.24319-1-peter.maydell@linaro.org>
 <20210821185912.22401-1-richard.henderson@linaro.org>
In-Reply-To: <20210821185912.22401-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Aug 2021 20:06:04 +0100
Message-ID: <CAFEAcA9DQHYsjcLDEmhGN6Hfsp+i1keU+8SeYEf8ZA5hs_dyFw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Take an exception if PSTATE.IL is set
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 Aug 2021 at 19:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> > +static inline uint32_t syn_illegalstate(void)
> > +{
> > +    return EC_ILLEGALSTATE << ARM_EL_EC_SHIFT;
> > +}
>
> I just noticed this should have the IL bit set.

Yep. (I remembered about that for the BXJ trap in the other patch,
but I wrote this one first and didn't remember it then...)

-- PMM

