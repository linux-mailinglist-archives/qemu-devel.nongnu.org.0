Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E443F66C2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:26:39 +0200 (CEST)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIaC6-0006kY-2Q
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaAL-0004e3-29
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:24:49 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIaAJ-0002Ru-MR
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:24:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cn28so32816624edb.6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/7S6VHuh8sCejXDpA5cb8X8wVn3R7K6bG+BRxCdaeNE=;
 b=uWZSN6ipB1H8MES2AdrcFHe6bNndtVMTQ8ELpynWGna+y1Dd5BaEKz5Ib9s9c30CYp
 mPbfz4rUnwl7q5Doo9Gqd31ivHEuXw4eSW7Hzm9LFK8FWcE/zqFv6VYFrHfF0pGR1Iz8
 NCIy/PU6zcvRFazEjYtRI9bt4xPcTseuy6Qu0BoDiPs6Yn7q55bJz1Yz0kXMpOHGadDU
 LZqEWax/CfuEdf5k+MG0RLgVBGULsdmAVSAfP9vfLBsXcUCHVkSkjlCouMbMP0ieyqGU
 XRfdvf3+xjzmmzMDNFKdZUb+bhfTOSRB36sHfl6yD2lL9HnNM9zkFH4/1J/Z4USj5NiC
 0N8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/7S6VHuh8sCejXDpA5cb8X8wVn3R7K6bG+BRxCdaeNE=;
 b=qcz488sVKi5r9A6LY2llvzg0RwfY8o7nt3eArQajcJvIwWyjC2iUrFn8HcS1tLE6JX
 peF8h0ASuQyzyZn8DQNuVqcBtk80IN4PNiFafrOsakrwTapJEFno/lG+xtjKmv3yQ+Df
 qVY20jYmrcJxeG53lxRQuOsK6uIcJUgxCdmIIr6z6UhU2ZOU/wwKS8RWI6D36qKoHwqq
 fr2MLts/UUIdXR1giyZFg/fEAVcjBiO/BCXmPF6l/BL+ZrxsChqxSNvezavgs1yuR5rd
 d77V5yVF0nDGslarwH8DSYTZpq0yC3BDNPiawV0sFXdXnUmSB8mSRpRRZOsUTWUubKVe
 mXqQ==
X-Gm-Message-State: AOAM533V226BER5yl1xwwtaPHviMcrD/RODjuVgJWZxEa+mcdH4NDkYF
 8RbZcbp635fev3hQe88NKbU2zIK4xMtCnwu2SINlXQ==
X-Google-Smtp-Source: ABdhPJw799f6Y/cTa1ZbOLYYnWnDFgeBrcDPRDooFqIKq98ZsO9C0N9X76MWUCBzUyI8PmJRtRxoEmzyvYFPlaG8qyQ=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr43895413edb.52.1629825886353; 
 Tue, 24 Aug 2021 10:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-28-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:23:59 +0100
Message-ID: <CAFEAcA-2_AvqSykgAwPxetQmyBC0-i3wPGsboQ7Xru1JAPFaYQ@mail.gmail.com>
Subject: Re: [PATCH v2 27/30] linux-user/s390x: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/s390x/cpu_loop.c | 16 +++++-----------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

