Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023A8369822
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:17:20 +0200 (CEST)
Received: from localhost ([::1]:51756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzQd-0001de-4E
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzP0-0000iS-4E
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:15:39 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzOq-0004dS-EO
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:15:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id n2so74909167ejy.7
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6kjTWKvEBdq0vRGdTVFI8/y3ux4Q63HE5UFdN1Y93Q=;
 b=SULlEsRvarZNc+roUhUj3c/vB2RLhmvEh8+8cIaZXG6hfvKDj6tPeiDq08xMWmIEfu
 iNxJgpOQb5wogKBpXcC25kuTwMDX4++ihtfmMy6yuaWt0nvBPyIoiheta0k+n39NeeaY
 3n1MnV2HLGddHUPFVlCHHhvDN4FLFzoS2Hoem88bZcmT2MjZfFClBqx03zGVl3N+8Ws1
 ymfE9oPW8AMtobEENx+qhJZZEypmRnxn7vvxzrzOPSnoRTk8W2uX8k6Cnvl3ZAE0cqM8
 fHEeYlGaXKYfEOg8stFOiQ9FQidLENnMbbR34c16qLWeEhX8xbWh1iZWjZRNe/+S+TeW
 Vwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6kjTWKvEBdq0vRGdTVFI8/y3ux4Q63HE5UFdN1Y93Q=;
 b=XKHpxwzaNHiF30n5BgJTFMRdg0lM9cul2vpCDth0mZR/i8WRWZT4sPC/L2sNaerl3x
 78mKByJPzN9OSkzl0LVhATxxPYC7fCXM+YQgf8WhUwXcNFk5HL5PQ8GhJB74hwUwypIO
 Lx17T4Id5SaNU43d5rQw10HvzcVFwSXUTk95H4xIENkDsdkYkE3yJBVCwGiH7UgJ2SHV
 TWdo/p/rUXPPGnXXF1tLvCtucp/o5CNEJkwoaS4zMAxmZY2/VFJYu1xC29wzv9AN3mi8
 oWJCPAqxD9I13sIDMUVSxu55g9fWaPnYO7TmIsUTGvAEzk04Px1XnXg1vifgDTXnTbpi
 OBhQ==
X-Gm-Message-State: AOAM531jltpt1eBzXdvaDAxrn/NRpYMvftkooEl/1DUj8Yuowman/Rvd
 gqiGdo38t0ue/QCllLPr2OCwd0PB9/126t7mEkQnxf/w9Ho=
X-Google-Smtp-Source: ABdhPJzJGQkZDbdpCHSno7cUSVF0MIniJEwRCDwQNYVD16kJdM9UMiicxQ9rduWNDaE/UFO8JE5CRDLxu5HXirPyWII=
X-Received: by 2002:a17:907:9852:: with SMTP id
 jj18mr5285329ejc.382.1619198127022; 
 Fri, 23 Apr 2021 10:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <20210423165413.338259-2-richard.henderson@linaro.org>
In-Reply-To: <20210423165413.338259-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 18:14:31 +0100
Message-ID: <CAFEAcA_YCY9fxMugvr4uLMv6bUbo=CS4YN0c7SKASMZT_Jowyw@mail.gmail.com>
Subject: Re: [PATCH 1/4] linux-user/arm: Split out emulate_arm_fpa11
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

On Fri, 23 Apr 2021 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pull out the fpa11 emulation to a helper function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 153 +++++++++++++++++++++++---------------
>  1 file changed, 94 insertions(+), 59 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

