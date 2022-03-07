Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D774D00B6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:07:18 +0100 (CET)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE17-0007we-Ug
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:07:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDiA-0008Ci-Iv
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:47:43 -0500
Received: from [2607:f8b0:4864:20::1136] (port=43175
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRDi8-0007Y0-Vg
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:47:42 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so164199387b3.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f2WZcKnxnGjVm22xGan72lcbepIcBWAFKi8sQIlaN3I=;
 b=gR+mP362IaordgnqnZLZnU+mdUCioJh/X6wfTpyEA7UiMWO8kuObjoY9H3ozGS6wkd
 0N0diJFMuDCfNbwQJeMPOYZpApWvGne0Eqn+TxoZMEZMylp3eHaoj++VWOMNZqLIVHRG
 VkKEYiVd6UEb5+aFyK82A5LIxb1PUX0VD+onnA0kPIpHBX3igpMJrqdVv9y2tG2qZrG2
 y4UdbayVCkBR1mDMihhAPX+PE8DhGNqFLRoEdK5KniUUp0Awh7pG3IAlzwzis/KI3Ths
 ntdlDtdTwYECPaSkiWAuiCraff0PUkJTKM3x6SNsaWa/gBtsVWFxwYqA7nN5Sa02YpMt
 ECcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f2WZcKnxnGjVm22xGan72lcbepIcBWAFKi8sQIlaN3I=;
 b=qmDsGABT6iwmTj67rM+deP1O7E56j0Xwfic5A/vtRTxlAHWlQHAiTmL/2W8yrfKNVE
 4+1ULqv6C0KtsIvfigKG3ItCopbIPxARU84he9pzEevUS3uEx7Npv1ET/WHhTSzX2ZeB
 bkY9VnNig+DdhDv63AEAbYQGpJqYRlvAb1EwBinwk4AjdZO/IzX6tRpsTdArpRft5kYt
 GdW8zEwtPhlMz58PKP96QN2foffTdTzYTmpeEZ0hIamsjkUBLbvPAoT4vvc2efVDNbLW
 dVTzTq6eW2Y1t03jC00xcrgNxI3nQC2S/JGANxeqczXP9KZEcZlshyIoCjYVGRK9nsko
 3nhQ==
X-Gm-Message-State: AOAM531fsAzjT93uZR+6tb8Z4m5aO2YHgZzRqjlEoew7fXenxXJViUVC
 nKtOzaE+M3FjVuVsbp9LprpeSACn8WtgPbqeCwneFA==
X-Google-Smtp-Source: ABdhPJwJbna0irpxTYTXhSaq9H7u3ZBD9VNHogvbxR0fg9cgmmzZvMsI/nYqy388WFxIyXEEy/2fwoQaxvgBTSRJyLA=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr8719345ywf.469.1646660859866; Mon, 07
 Mar 2022 05:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20220306194003.13030-1-richard.henderson@linaro.org>
In-Reply-To: <20220306194003.13030-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 13:47:28 +0000
Message-ID: <CAFEAcA-BZkpX663Tka0_+i=6r5jA2c4i3=rtQ2UTKDS+T=be3g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sve2 ldnt1 and stnt1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022 at 19:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The order of arguments between ldnt1 and ld1 are swapped in the
> architecture, and similarly for stnt1 and st1.  Swap them in the
> decode so that we have "m" be the vector operand and "n" be the
> general operand.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)


Applied to target-arm.next, thanks. It seems to me sufficiently
distinct that I won't bother squashing it with the other.

PS: the keyword gitlab looks for to auto-close issues is
"Resolves:", not "Fixes:".

-- PMM

