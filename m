Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7241C1CF6A0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 16:13:35 +0200 (CEST)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYVf4-0000VJ-IF
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 10:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYVdV-0007GX-SW
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:11:57 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYVdV-000198-5h
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:11:57 -0400
Received: by mail-oi1-x243.google.com with SMTP id c124so18093792oib.13
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8clQVz3fsMWPSciXXBVDCSdAONJh6afu24HoRBgs+A=;
 b=SGNTe57eLXYz1x4AlOggby7/RD1PLoxCSWFt3euNuX+ptJgRqlY7fLfj7YMXtFWgLT
 4jqVoIjakYAEom4xjC70Nj4Pu1wxMUfnzpj3kFJzqxDggferlmsTGH/UJPx7IW91LPAw
 bOP2j7ObhCrw9B+GlosNlebQ7qNZz3SEUTNUoA7i9FCzYomwZbztfXbj6jJJBZomvg4+
 fme0ud95df71a5TERWbyioZaYoEs1AC+dTYGEmHEvsMGb2YfpCNuKyf9Wv6eNfSsV8Ih
 GlZITD5EqMy2fnI7rjQaj4dRs0yr1yR0cxXQJcanUa/8tq2o6dOgUIJBPiQ+XgdDxeOo
 WRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8clQVz3fsMWPSciXXBVDCSdAONJh6afu24HoRBgs+A=;
 b=Q9FoEW5CfLLvYlmss0BdGsls8mLzTHgrst2//QlT1L5Xtzb1VIvY1JymcJEjZVUF4L
 mKvr+OqBCMjAKG9nWj7+up8UJXOcw9PIzAgaTKRjSBfgQaqm4h6lToVEQha2+fH1FnEg
 wSak7TzPd7RQtfxtesp9lvCmpyLbmmQQ8ZwD2oslsESsOCQpQ6+E0x4OOCENG6fhvRzo
 goykc09gAsUF1CGFFAe6S03wfSMy9xH2XUNwrubkqeoWiKGybTRojobujBbCKDqYUZGO
 LOcRCTUFVhiRtncFOt8MEighEekCNjwoZg41PzgsIjiZVZHnO/05iQ6ewPsHz+f2QfQe
 AwGw==
X-Gm-Message-State: AGi0Pubgu9hiNiy8kR1PuoRfS+Sbqtam8rcBf9zoAuTFGF15yclPkkD1
 3QYMQHddKrXtksojPI7g9T8Q+Vo0/xoCwSe5KYf5Yw==
X-Google-Smtp-Source: APiQypIH9e+UwYCC0wNkMYrz7k04pGEdtf58qucFNsG7UE8awg9DxlOywI+0D+TZKfLnRhT+f3m9Sz4c+CvcYJf0LNU=
X-Received: by 2002:a54:400c:: with SMTP id x12mr22652129oie.146.1589292715548; 
 Tue, 12 May 2020 07:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200508152200.6547-1-richard.henderson@linaro.org>
 <20200508152200.6547-8-richard.henderson@linaro.org>
In-Reply-To: <20200508152200.6547-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 May 2020 15:11:44 +0100
Message-ID: <CAFEAcA_RZGTzopTOdaDwV1Ow6Y3tEX1XpJyjvxYf4=dLp89LoA@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] target/arm: Create gen_gvec_{mla,mls}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Fri, 8 May 2020 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Provide a functional interface for the vector expansion.
> This fits better with the existing set of helpers that
> we provide for other operations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

