Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB34B7A59
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:19:02 +0100 (CET)
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6A1-0002CB-Ay
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5uw-0004Sz-Gl
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:03:26 -0500
Received: from [2a00:1450:4864:20::430] (port=36372
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5uu-0005Xq-DK
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:03:26 -0500
Received: by mail-wr1-x430.google.com with SMTP id o24so343942wro.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lez2I1+JDs0T5dxCUfNGxGo5ZQgrc54gk+UNfLAs7RU=;
 b=kyYyPsKQhxIlwSMo7E3QLFXYtN7UIydJXwtIawkwj69JzkHIu2GuZ7aQ5pP0wcrrzR
 9hGgfaD3Ul5UoDc8Qf/xs74KFT4ilasfxYokluO7E/zJxi1Vp/P6DXJ9TdlRvDFJ+zZF
 ZVugqoFnwGrK3h7ULpTtnfpzBetb09AmWo4K9Mak1LM0MOBb2jbd0L4vcnPKFsBBu6BT
 NemaWUzvS1ejErPjawBgQsGxoEeECUV2AYyDTHRk4F/vOuDBnHbzuNFOC5BrGqFhnT45
 7sKBHJ/V2G0coU6yVPMdD6bdxkVLtq4cMtfIooTSbFy3Vj86DtWXUbMFNIMwr/cRE6Xk
 rINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lez2I1+JDs0T5dxCUfNGxGo5ZQgrc54gk+UNfLAs7RU=;
 b=1Vev/+U5ikeZhilddOG+0OzMrTXYAyv1/cUwV5qmzq6+hdK5BUV54TB12fwWkGN2pR
 B6Bu7dT5R0fHXUVyfSKDe5a/OAzAqqfjyTZGH+txym/5yCCyZY9JMBwE35dzNRTChiaC
 dbRdJIT7HHNkJqC3+OjHAodYmTYkButfWNSvMBolOPIn+b+0VwWd1PNotxgug3ZrgQ+4
 IKsohOj6VpaRnfTiFw3YAdXFvNCMjnqvy8DkHSuTfiqncfoGqABWmYygSLZGWWNg4ncK
 06TFme0YoAVwUEimC5LKY4r8p7YNbT2o48Pk7COqvyXJrx0gFrFeiql+IfobxASCprET
 82Kw==
X-Gm-Message-State: AOAM531ILwVAa2R6LJ98urF5KfmOH+UH42A7wbPD+tE61L091ZqivH28
 YgXKamazqF3sAfxvgoKENvq1fA0cZw31dgq3mkbqrQ==
X-Google-Smtp-Source: ABdhPJx2FdLfFrxfC2xqYXI6JFhXm7f907NW8QzHFfSxUAEoYzIpS4Q0I4OyJEU1yRgtMsg4r9iJl6v5r58cDEdjT8k=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr747159wrs.521.1644962602936;
 Tue, 15 Feb 2022 14:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-9-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:03:11 +0000
Message-ID: <CAFEAcA-kK1s64RRuicRir6rfLX_39W7yt+VosvV4eYh-uw6FfA@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] target/arm: Prepare DBGBVR and DBGWVR for
 FEAT_LVA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The original A.a revision of the AArch64 ARM required that we
> force-extend the addresses in these registers from 49 bits.
> This language has been loosened via a combination of IMPLEMENTATION
> DEFINED and CONSTRAINTED UNPREDICTABLE to allow consideration of
> the entire aligned address.
>
> This means that we do not have to consider whether or not FEAT_LVA
> is enabled, and decide from which bit an address might need to be
> extended.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

