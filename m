Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E53853849F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:21:04 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhCZ-00044G-CT
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvh3B-0008Ea-Vr
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:11:22 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvh39-0006h0-W3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:11:21 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f83983782fso112896827b3.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N24CqIO+A/gKY32uNb8F3Q30EG4HLSnFbSCFywL3BaY=;
 b=LmFAH0i97D4wMiyKH6hFZfCvTlLlzxEjkAPOLtadVFapUOiG9lRAmtZU34HchCsr2X
 6B4V3kUAl8nr/umM4PmZzkJxwXf2Xq1A0zPdqGzCaWNSxA0eq7AlPLftfJimkb4IK5Ex
 sVH7rM8KZ2nm+bOcq//LLQPBTkZ6517LRrsnzVAsbRsRjdCfGnT7ScWquHr0u3Qj9LDD
 1BX5wz5qYGNHMvwZeV1EM2wVJMP1o7jkHm2sa+HA/YSGsNtaxOVTXn1Nag7eYdjCyF4H
 bTan6lQsnh+9zIi+FkHsrBtyyuwZaB8NMKtEByAVm/Eqm4CIXsSO3QRagqzkbWl0XBib
 WU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N24CqIO+A/gKY32uNb8F3Q30EG4HLSnFbSCFywL3BaY=;
 b=ubqOaKGmHqrWoi6vmyo7F6PNd7sMMawcQIBT5WKAG8/VUQFJ6kmELgBic2PG8MwEz+
 qKgnkeCZWUGqJqIfV/MBjmE93fbZTVXfzpsiiExTNTT5SLPKrDDbILtXSqUCjS/g434s
 OlEyq4tZEx+xsopVuKDTuqnW2HFI4Ssx4SmiMQd6OGTPDFOps7UfHfWXByobx6Z9iShW
 lakUFcKRFGJPbbaC0FlB/+mehAUNNtKZ8Yw9J2gGmMvAq8X4UOsVONT2eDquJG4nSpul
 5vdQmeJeqUhV/nWAPpTvdf1jCxPuFNDDMvbba4nNbe2dvYL/vWWxhpEkaVpTW79/Gh63
 3FJA==
X-Gm-Message-State: AOAM532QY1yiCjuObtiXWMGAtFJbmIgVieXWUIdIn6T/f9cLu2Eg7K29
 dAGG7BpDTSQL8Fe4O5v+NSLdufqlSGs0y4zpTuhQJA==
X-Google-Smtp-Source: ABdhPJwS9EaY3ubPvR8kzf/e3aVup2Qy1RFJENInDBsV+XSwq7HEsiMvyV5F/BfLplD2pZF1KKBqEO1yNBC9yk7OFpI=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr58739980ywc.329.1653923479044; Mon, 30
 May 2022 08:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220527181907.189259-1-richard.henderson@linaro.org>
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 May 2022 16:11:07 +0100
Message-ID: <CAFEAcA_SprAaCjMf5MiE1VCXZhcCpo29jwRgNq-NPN0sJ777ig@mail.gmail.com>
Subject: Re: [PATCH 000/114] target/arm: Rewrite sve feature tests
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 May 2022 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There are SME instructions within the SVE encoding space, and
> technically SME does not require SVE.  Thus we need to move:
>
>     if (!dc_isar_feature(aa64_sve, s) || !disas_sve(s, insn)) {
>
> into each individual instruction.  Use a macro trick similar to
> what we've been using over in target/ppc/.
>

Series:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and applied to target-arm.next.

thanks
-- PMM

