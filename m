Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187737B8B3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:57:33 +0200 (CEST)
Received: from localhost ([::1]:54938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgkgO-0006HO-N9
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkej-0005C1-NI
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:55:49 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkeh-0002yc-Gq
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:55:49 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u21so33784867ejo.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEltHz3chvau/X6PpcSo+oMiv15kQnkzjRA91FojxEk=;
 b=Ww8ry+wzNJhVdRLM9QQqxJ996YlTWWllWIQ5dHMgnEj4gqb5sogSnY8lZO7XO+lD8g
 AKErDh22ulUElLhmcLe0SPI0rOQC8h+8sXHNdt7Z3Q3BPykgKqiTlyPlsTL9+dNtsq9F
 ljsGS8BhXclGo2RX7U6tVxct+Humx3vv0I67xAQm5wzKb0myD3a/4rjmeM+SrBowElJN
 Ekwn1UUe0pfRyloT2VvMkD/SOM15UGVw1hKbNYg6P6DpPh8hFEKZBc81QzHdSJYJrc5H
 koBCKm9cET5m7087vueHYBv3Cvsobk2mtwAo2L09+Omi2HmXUmgRlfttnblCleybhH3S
 bJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEltHz3chvau/X6PpcSo+oMiv15kQnkzjRA91FojxEk=;
 b=DZW/Wvhl4P4B5/4lyAX7pllWMZArqh38It+SXeUKgP/VJ/gtt3YG29nCSeF4bFtGkX
 zXdQHrCZrhN5XeQrQhQoPN1YQ4VqOUnd7akqlQittiZzY1VunvzBK6O/BBlsYJVjU6B2
 uuorISp6ip4nznGaEqR59FdDyTVSQErsLp8wkHmn0tVCSO6ktyrVbk70wLso8JqVYig7
 /yzSfbNqnGEc2jtoz85ZcwBjN7KS3nq7+LFgDAvrs880s4NixRMgYz9XwdWWRBrXj7ON
 bK+lo8Oc3HaCaIMTySs7UWIBKqYCsbgp8q+Hp96mobaoPFj8mmQtCil/Os+R55idIbSR
 SP7w==
X-Gm-Message-State: AOAM530z9r2RjcDQTJ23xWv9/O0qqxImT6udXYI7VXduMzgJxaTKz89D
 mWvd+omOBzm2TeU0t5p3QS5nhXfFmuneQf2j2DiQKg==
X-Google-Smtp-Source: ABdhPJyGO9ItplZkfZCTJTsJGmFmno/7J616J97rYfspAOMLaI/5grCjxDI1mPbydiQyxIpEVoM9gi8rH9k+EdP+B+Q=
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr6094019ejb.4.1620809745689; 
 Wed, 12 May 2021 01:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-28-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:54:32 +0100
Message-ID: <CAFEAcA_RCZbL+s81KY2QRXRugEnbH4sjj30Hc3WQy_D9ySGnpw@mail.gmail.com>
Subject: Re: [PATCH v6 27/82] target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Fri, 30 Apr 2021 at 21:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 16 +++++++
>  target/arm/sve.decode      |  4 ++
>  target/arm/sve_helper.c    | 35 ++++++++++++++
>  target/arm/translate-sve.c | 98 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 153 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

