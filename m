Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6340B37F5BE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:38:04 +0200 (CEST)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8jD-000292-FN
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8Us-00080H-Bw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:23:14 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8Uq-0005Hh-Jt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:23:14 -0400
Received: by mail-ed1-x530.google.com with SMTP id f1so8175078edt.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLJXdNnAxGAfM9jio1ml+V3WriMLg8ofM43F6i7Flh0=;
 b=EWvZHN2cERhaG2CQ/cBrx9aBpdLVZSs3XPDl5drjm8I3/ml+d6HIluUsM6FYoz41lO
 Ljzxycz9xQ8qG/NMWTi/DL1J+6LgfLs78USK8v8MuMH372bBEJ87XBoQiWloeXRdDxv7
 H5H48MMtX2mg2tjN++EJajyoYyj+0DDnc+CiT1zH9RWU+ffTAwL1ev7KLILn7RUy/pxc
 RMpSmJFqYo4Nohn9ObbdyDKSTdlYKMKb7xDQmrO2sVPHjIW0qetncwagMDvWgy80daAi
 xYylRZjmbLde0MS0aPEiiCXferuAjfhp4x2YFdZFKvfdg+Yv4IyNUzcq0RfZvxa12fld
 fmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLJXdNnAxGAfM9jio1ml+V3WriMLg8ofM43F6i7Flh0=;
 b=hg+fMrjMjMEPe1ntuKAKUgHLHQZdBUB7fUhH+I7GkDT3mwzQLjreDfF+ZUW/bubX4q
 B7n7ra/TQeUR8OMgIz808Ml2lq2ri7h9XiSdJ844qA/m1CGt0sBWPsY1onIIG8mTzBm3
 vBTBEbFNlU4uUgl4gU1to1eqJw5kB2HYM962yVRSIaZj6fyLjE0IPk1spJTUMOfUYgBS
 hBK+n4PsEislCEbTXrJ/N8c/LDD6BZxlJ27GzPwXtc01jg7FeJmj8P91SG3UhIkIpKLT
 3+PHYTKLmpbHgYYPYJta4ZwroTIixjmaBxUYzVDp9xYdMboABjXJ3zAhTcNXzmZ5ddx0
 pJQA==
X-Gm-Message-State: AOAM530xqpNrJ6+W6wKD+OqsKJ/ZovRNWGi4zu2XyKtXr384NDg9MGYe
 ULvpol3xmkoU0cFNKJn1XpLicg4K1aRQda8PoIb3mg==
X-Google-Smtp-Source: ABdhPJzNUAJviUnw3VaAH3TvLWP+Szwig7III1w+TeQm8/DOzIXas5eCT2qNa2RHQG+RyP4qlHf3VI5mSkg/JnXcoHs=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr49434944edv.204.1620901390299; 
 Thu, 13 May 2021 03:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-43-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:22:58 +0100
Message-ID: <CAFEAcA_VQJViWB70nd41RP1oU1KejDaxuvnoj5++BTpxweFyZw@mail.gmail.com>
Subject: Re: [PATCH v6 42/82] target/arm: Implement SVE2 HISTCNT, HISTSEG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200416173109.8856-1-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix overlap between output and input vectors.
> v4: Fix histseg counting (zhiwei).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

