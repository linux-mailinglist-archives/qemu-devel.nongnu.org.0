Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8237B8E6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 11:11:56 +0200 (CEST)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgkuJ-0006JL-4l
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 05:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkrh-0004yq-OP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 05:09:13 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkra-0002M6-8O
 for qemu-devel@nongnu.org; Wed, 12 May 2021 05:09:13 -0400
Received: by mail-ej1-x631.google.com with SMTP id f24so33900369ejc.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQJww8A5QoxFrBjoOiXtQv1qCgOH9lUFrDON1t21/aw=;
 b=l7MYgi1K4przHzw/eCFJ8zCp27aiGu3gJfGix28GHxw1H2hT+FNQT6JVcvUvOvZwFD
 GGxkaPZxWdyN7/pJB7ZuOW8MxBAs/vW4mh8YslUwsVE92FW4fpHuTUmUEhvOPiEqtFLT
 WWYc2NcrMvlEaQ0xBHjGPFopNOQxnhsfft/J1bp9gQmahr5C3ZdoznVRa8doEJAi/osq
 9iKXg60ke4mVHZCxRr7EbKfbP+94NXei2KSdQiU5pxcJSpLsl9F4xYUnu2j6V2aMhhHJ
 ZXf7EUtMkb5oWJB1IirryioNAtOVE4Kz0PsRKIgsh/69N+x9La0Z5D5ERINhUIkZVKYq
 e7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQJww8A5QoxFrBjoOiXtQv1qCgOH9lUFrDON1t21/aw=;
 b=O5AYkSSmR9pcdcM5zFGIdh6skb9h+hcg5nFR6anBL9ywraixdTjgkEG/UwYPBpk+f8
 lNdjBmZ+Ru1e18mXA2CgmaULTWRHYUV4BQKSjkP8jxGDLDbVYavgVMMTd04T8pRFb+4q
 wV7oiZLYzNGBcpfoN2Xa5+c9lF5PYkBjNDZ09/yEjDBikeqgyFOGnqPW5SflCBJo5+gJ
 0UyLw6xdWw6hdwm2f89Azv8Ovdk0jVAl/p+RdWIBOknZ4Ro4Pe1EyxHEiHcdohTYRLke
 xK2vAnl8ClqPRYsfvtGxXgTPaVpF2WX3+lxJJD2NdhdKiEe60hC/fMOZaaQ80fH0IEeL
 FKog==
X-Gm-Message-State: AOAM532mkMr+j2vqW0OKCER6+ZItQKtV+PmQsUFyPPbSgP9ywVFMWFIy
 QvrbPbzDlofwj7SceN6C5/qRaaYAtcV95xq1sq+lcw==
X-Google-Smtp-Source: ABdhPJygYilj/hmW7hU6kzU87po19gKl0ZJJGPIljGiEOaYk9EYVsMbUAcOPGEndBllabpph8RdsS2QL8BFQJoeW8yI=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr7096514ejb.482.1620810544388; 
 Wed, 12 May 2021 02:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-31-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 10:07:51 +0100
Message-ID: <CAFEAcA_X==5NGx6WWmvvCvJYx8rbO-EkSi=F=FtjWQ_C+qufbg@mail.gmail.com>
Subject: Re: [PATCH v6 30/82] target/arm: Implement SVE2 WHILEGT, WHILEGE,
 WHILEHI, WHILEHS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Fri, 30 Apr 2021 at 21:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename the existing sve_while (less-than) helper to sve_whilel
> to make room for a new sve_whileg helper for greater-than.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Use a new helper function to implement this.
> v4: Update for PREDDESC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

