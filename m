Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BCA2ED423
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:16:55 +0100 (CET)
Received: from localhost ([::1]:51320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXy2-0004Z5-Aj
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXsB-0007qg-Tl
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:51 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXsA-0002TJ-Ee
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:51 -0500
Received: by mail-ed1-x531.google.com with SMTP id cw27so8271402edb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=RW126Fsi+SCWSE+DKdTJv9a364VbK60qNccEpBqnNolJIWtjkwQPZ4Y01hOFXdEGMT
 UpuAp7VGseL8oStpPfQ6FbwjPrhOalF5FoxjnFSuV4+3xMvoQtMU1yH6HeIEKVSVCvm4
 isYrwUneP6iuSSoSuKrGhfO5mscxewn/FhLaNDPh4hqN/TOZPkLscbngv6bC4IdInSGC
 LmOkp/Wlw94WO4GsHR4v1bSc4KWqsyP06C+HHTX1nqJe0ruJ1+M0yC1u4zD7goWWVfgf
 R9Sg1Uu8NU83LVL8QfbObC/FMTFv9DvAeRU5AonpcbbWuWME2R7u3nj9LFS6Q4yqJBaR
 iydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=T7Sb9e/pzPe4M1lp4a7LFVvlVYsRIXFLfLvKw6lrdOCpB2YBfUVEeSReBfAZwk81LI
 aSszWUjfb2ditNDUnThfwruPSWKBvf3nSJDUQaQ4kh2KxMQxkzwRD5YyAI9lFcFCAfKZ
 9QN/tkE64QO2cWpjhPpZ5Q2o+SWIxeZtW9GVIMpiy/+gkX/YJR3Aq4rtTCsEKltymroB
 syFISheMY5N9CvbFWdzW1SMFGOAEOte0aBpByxk5V8HnDjt0HlstJYgrI682arChgcLK
 qy3VrnqgSHV0WpTSM0iTzodDfnmwcxPSTruEPGAIBookwzqFe1tpy0dkDAEv3rwl1IEr
 F/sg==
X-Gm-Message-State: AOAM533UWOuzS2yA5qX5zc7qj8DVzjjbNIhXCrehqvRwEm6X4tNI+E5P
 VAr8R8rtz3t0T7LY71FRmppMlw9fS1fsO+rGBxnLMQ==
X-Google-Smtp-Source: ABdhPJyetNl3t4+XaV9TLhjPILMm40/BFhYjtEyflz39zpE1tbKRrw46pRG/f9hGSJi1sj2BKPPW0ps5nFMNfudGldQ=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr2260531eds.146.1610035848887; 
 Thu, 07 Jan 2021 08:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-12-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:10:37 +0000
Message-ID: <CAFEAcA_tJ1ERy2bxhYUSZMWW=m4-XMvgoS27N_YFCsz+gb52jg@mail.gmail.com>
Subject: Re: [PATCH v2 11/24] target/arm: Enforce alignment for SRS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

