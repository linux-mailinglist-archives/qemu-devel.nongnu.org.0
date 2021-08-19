Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A653F1D6C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:02:55 +0200 (CEST)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkVJ-0005YS-PE
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkRt-0002W8-DF
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:59:21 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkRr-0006sJ-TX
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:59:21 -0400
Received: by mail-ed1-x535.google.com with SMTP id q3so9594855edt.5
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MnfzKDRTgB+agrqEeoKff8VCDKaL6yK0XGmCaiJhbDc=;
 b=NO3crwdWuMOi7jqEioK5EbcqtpG8SC6NXzuyEs3ymkaozNDIwQr5t+lgR3lkZ8pS0d
 4SGa6pc+7TCHZybhnssKh39vA+i3eyso98s/jCdTZffkMjSkAIMZgznEtU23IkWxVLSy
 NXvyK9RmTYVTomCR3Q0cWaXfnoXJcU+hmWH3+q88d/1/fDMmXXKEASc5+yODv3hNtlkK
 TW0KnP0QA3EKPX5Gsq+7PT8VvwA0MyjDJ2rIirdDpGjXxJADYE0kVg1Q6EODR8p8kDkJ
 lkBsXrOFszpQj8oCMlmlxbEVSJGqsLaVxe76L8VFdBQE4eQgb0SVFT5d++bPHIR1tLXw
 pCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MnfzKDRTgB+agrqEeoKff8VCDKaL6yK0XGmCaiJhbDc=;
 b=MD0UuW1o+UZ0ql+8fOe21gyw0gjxwQ58kMCpBdKrLE74kWutS9Yaq3kR/nCRRXcNIW
 90UagCcXkiGDFQwddku0IRSlGzQ9hv6yeZzKt33qSyreauw3j4v40tr+N8AtkdFzReXu
 4+jf9B4/JeMz2b2lsD0jrBQe/KC/CZVb0ws+E27M/z0rdd3CY5yi5F5CT3w7gcwAP7no
 cx3wVwQgYLPWM6iyz19BEyfivU1P+fMl6ALRXAO0zSMY8/JIKtCVxIKQbUHFcwd/9tmG
 ahtow/eXnr9Ysw4pMfFXaFUZ4YxfBXhNo0G9sH7IBoXFfP68f7sBngYkd19mNVShuFIf
 mVrg==
X-Gm-Message-State: AOAM530fiiI6AUTKGl1maL18PkHW9ijmzZYNtQhIVnk+G0QghZXnehXd
 zKVAnP+U7jHIaneubMCJKY5reSNLZ8aaufDIyy0PMg==
X-Google-Smtp-Source: ABdhPJyJ3T/pbyGeaJ4XDt/yh2Igi7gVyh4uhWwVB+3H6xpZAAzwGePesc0oLvm1eM28LTirmvpciONmTebc8HrR9d8=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr17085051edb.52.1629388758573; 
 Thu, 19 Aug 2021 08:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-44-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:58:32 +0100
Message-ID: <CAFEAcA8wW0a6XNdemZs+Cq76nwgKUT-_Basf5KrqNyTeRfdG6A@mail.gmail.com>
Subject: Re: [PATCH v3 43/66] tcg: Add helper_unaligned_{ld,
 st} for user-only sigbus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 21:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> To be called from tcg generated code on hosts that support
> unaligned accesses natively, in response to an access that
> is supposed to be aligned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

