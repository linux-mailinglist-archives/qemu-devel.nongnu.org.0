Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E06633D7D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:22:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTD9-0007RV-AN; Tue, 22 Nov 2022 08:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTD0-0007Qp-Kz
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:21:07 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxTCv-0003bT-MF
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 08:21:06 -0500
Received: by mail-pl1-x636.google.com with SMTP id b21so13600991plc.9
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 05:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RQLrlo4/7CO16+OxQa2JCx3ver4DOMuBiUaxnsHtFt0=;
 b=AmsmZIpghxAVEmTg2kK2oyUcXKY8TQ6t1IQV5wE1Od0O1MCN6dYVnE8GpPbCX6CYbc
 wcJOU2mQtYeCHZXEF3B8jqrrMRHbGoLcZ8iZ8McXkgohWuhbvhOihewieeX+Avd/RrgR
 AhB2Fj6kADXKDBwhBHo741rR45NpFSTskQmrXfKMOM6q4u8IoXbIPwmP0IAVm+Es/KY8
 AX9vlNix5rN5+ksJSZb1xIQ7q6GjCegDhb3QZ4HkMceTiMwo0eu9i0rzr+rcHVBPL619
 y+X8SYmlZXtho116hmtpau+XZWF8XWO3LLrgUfh/4OyuZr3PA9zUcMd9KvVNDR8YlY+m
 Xzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RQLrlo4/7CO16+OxQa2JCx3ver4DOMuBiUaxnsHtFt0=;
 b=RyNT5QJRm/qPjX8tksF4zhLEI6nQegmx15G6OslzmkIUQserDYIQr9q0CluJOJ5kKG
 xMvmFYihy8qy7JYtw7hBtaxXvZgFPbCpegl58DY7fRk6QBdlAMoABqksCJWXsOeHUYVW
 ILVR6loYc8K3g2APfnWTsC1YqbNJxFP72gPauO5S1X+Mpj94A3mXS8WadR77o7BNRKDj
 5vkD7iTHMHVEg5MwsvpqC2QKw3plC6kSHRXBaT6dntM0NKucKCnyh/PyHNzrCCXaxL+V
 dVeYrGEKk0+1iTKsvFcQQ6Qlcclg0aR9u7EMDUn5PGWQzJMObyKivPopy8QnC6FrkrHn
 YHSw==
X-Gm-Message-State: ANoB5pm+ziojnUUl/mR800JSw/dm8YwplM2xAzdDNc4W2MsYDszJfpww
 0XUQa9jYRbF6CkAMAgXwg6o8zMOCqEtZhisuHCGGIA==
X-Google-Smtp-Source: AA0mqf4d9qPzvCiGx/cra3tnnX/Li1ftDALGvmphhIfaADp8XZXfkVEb+lDPpmWGk/mqaHUaODZPXJXDZpTGvhh2lGQ=
X-Received: by 2002:a17:902:b691:b0:188:5240:50ec with SMTP id
 c17-20020a170902b69100b00188524050ecmr4171470pls.168.1669123259914; Tue, 22
 Nov 2022 05:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20221121174326.68520-1-ardb@kernel.org>
 <CAFEAcA_Tz1an8cJO_6kDozMQ1kpqzu60gKq+c4Rj1veFz0REpg@mail.gmail.com>
 <CAMj1kXG_AcmtvEKBUCX8eAsSv7xasGc0HAvQDSnu7ByMie5W9Q@mail.gmail.com>
In-Reply-To: <CAMj1kXG_AcmtvEKBUCX8eAsSv7xasGc0HAvQDSnu7ByMie5W9Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 13:20:48 +0000
Message-ID: <CAFEAcA-_D8JnCPEVt6pmAPGeB3cEro+n4Hk0hxoyVD0zToz+HA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use signed quantity to represent VMSAv8-64
 translation level
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 21 Nov 2022 at 19:02, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Mon, 21 Nov 2022 at 19:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 21 Nov 2022 at 17:43, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > The LPA2 extension implements 52-bit virtual addressing for 4k and 16k
> > > translation granules, and for the former, this means an additional level
> > > of translation is needed. This means we start counting at -1 instead of
> > > 0 when doing a walk, and so 'level' is now a signed quantity, and should
> > > be typed as such. So turn it from uint32_t into int32_t.
> > >
> >
> > Does this cause any visible wrong behaviour, or is it just
> > a cleanup thing ?
> >
>
> No, 5 level paging is completely broken because of this, given that
> the 'level < 3' tests give the wrong result for (uint32_t)-1

Right, thanks. This seems like a bug worth fixing for 7.2.

We should make 'uint32_t startlevel' also an int32_t
for consistency, I think, given that it is also sometimes
negative, though in that case it doesn't get used in any
comparisons so it's not going to cause wrong behaviour.

thanks
-- PMM

