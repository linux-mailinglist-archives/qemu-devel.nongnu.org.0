Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A91FF93C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 18:29:48 +0200 (CEST)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlxQA-00056L-St
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 12:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxP9-0004KC-IL
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:28:43 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlxP7-0001nr-96
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 12:28:43 -0400
Received: by mail-oi1-x244.google.com with SMTP id j189so5599584oih.10
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KOZc7w2xFsluC74qyPSUVXOw/N6fRxF3MLKa8m9157Y=;
 b=FmSyCUxJaFrXXTaflf8CIKAEHBtCJ8vmE2LrR1Sw3DoAKJ68ocV+dhg1tOITCC38nB
 dcEefVjTyLPoZ9PtqdA6QJ4C99rK3ZY2ZQPKbO+ZmjyH9OhrE3ynA/TaHM/YRxwGvHRv
 aBTQNi8GXZNh+Xxz/N9rUyFO39A7Ihv2FxQ7MU0wqLZNTWV/pryMsef9rfHKYeb+2Vo0
 d+qzIpowo15bVZBfPsa7Bx9Oh0H0ncfZWPWNG7+wI6uFP54Vtr9sqhOBf9bUamA6U3Wm
 scaql9NeijNzbbvuuNh9lVuvm+kQ3c3q5fZg6DeY6IU3hVPNTsE52m3XYLQ/ozVfYY1C
 i1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KOZc7w2xFsluC74qyPSUVXOw/N6fRxF3MLKa8m9157Y=;
 b=rK6GDooxeD98eFmKrWJ6WPdCTOmLQdQwJfGrOLbN0FKdrD1iHWQXEbE5wNFseJVWKu
 zuDcSvh8RFpxQf6EKNBMa0uTbesj1jOPz1H8vN2+kE2/FQmD9d2Q5uh65gcy9Gp0HIBg
 x4YUWpw4jDEAe9zQxRAY5gCW47JPmYZ4NfWVazcOZ1i0QOPjGiZdGyVuXGE2LZ7b4JVp
 yEBSa4WiiI9rh9QddAWmokmFrQ9e6h9rSQyM+3SyLQcSYiZ+5oJbCTTK7Za4zy9d7ZVo
 YdmQUGcKFtVyHuFvgf4GvDnpfb9n/wrV5BnL2R6cedk37CgskMaXS2kMMXNXBi8JQi2V
 Bcog==
X-Gm-Message-State: AOAM530Vqj620m7/mIZtV8Py/NnSMfvSijD/4lfr3Unr85zuuH5Y2eQj
 dB2r+3uS57degP4ykjQPvu+nzvt4TZoxL9Cj9wgLNQ==
X-Google-Smtp-Source: ABdhPJwOYk5DGhA07PTAVpzNODzmSa857B7a1pleW1zcKzKgGvPooY0eq5sXeMn6w+w/7OugIZUhDMMcFubDS6AAjls=
X-Received: by 2002:aca:5152:: with SMTP id f79mr3545603oib.146.1592497720112; 
 Thu, 18 Jun 2020 09:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-21-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 17:28:29 +0100
Message-ID: <CAFEAcA8B=DQH4h-uTV7veaa-bCVsYjKkHDRsTj-zeU-7Zxg3tw@mail.gmail.com>
Subject: Re: [PATCH v7 20/42] target/arm: Implement the access tag cache
 flushes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Like the regular data cache flushes, these are nops within qemu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v6: Split out and handle el0 cache ops properly.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

