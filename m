Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173F3BF9F7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:21:15 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1T1m-0005Rw-5T
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SyQ-0002ic-8W
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:17:46 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SyN-0006hs-UI
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:17:46 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gn32so9286097ejc.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UeXfKmxdrYneEcHArE0xPqwYqj1ZrI8b4DFEFmLMbsc=;
 b=x1QF9dg9Qc/TqTSWMst5q8EwTiBrkEkIxIIt/BpBx4sCjJz9pSyJEyf1I748l7XuG2
 3Ko4NmJfRtXpje78TtmP1sFQecX60+IE4GZp2/U8UHV2P5/RejstSdsiMVyRPPRP4orw
 wTqNBmWdAnTQm9qu0VwYOge/h1IwhJRcWRC/RsxJboTKL7rFInVtGLN09wrnbSqNalI2
 4OvYVJC1fRshDX0icsO/AnoMzlDAs4FrQZblsQL3uFI83JJGH6HJ8U9H2AkI0p94zeyg
 qc8k+XjtPz9/I0uc2AB48vM9CpsqFcsxWB0Ax8CKFBofY4w941HBCsiHrSA7uiQaclwP
 xj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UeXfKmxdrYneEcHArE0xPqwYqj1ZrI8b4DFEFmLMbsc=;
 b=L3U7EeyZ7jSH0Hz9Q20Nsp5iyQR+k7XwKx/+eZn1SfJGUK0dK4zmX6uk2ZIsiCsw6o
 mXK3ILlVPOVXgJbHam5soX+DvQ5I0ldyEpsQIhoOr1rCFQ9i8fs3hq6SRNKhbc5SoxXF
 i0axH/F8Pq5k0PHLJ4emoVkM7BgOrO9WCiChvMAAUIS7rsx/5rjBFcq/zOS0lMLZlzTe
 DldSXzJQNpu5pMMhSblC410d2Aw8vbllajpwug8rJnABwI6zvhnTFDH93aXCux7wIuGp
 VNvjAhqDB1+6IKB5v8ubcMXNDVBkTKdqNwO6b9sjRPkbsW5lKZCUlDWiqpfWiBJyh1A2
 uR3A==
X-Gm-Message-State: AOAM530hefcuEznypMp9qV3PRyDXsXDwe1fCVNvEimbN7C5iEbQ7ouMN
 +7l+VvxTEYW3UtwfJs+z5lsSwg3laRfiaH36s2SrBg==
X-Google-Smtp-Source: ABdhPJxYyb38fEVTJIpx0nTWfu77W6nVHumMTURpOJwcxoHt/RFAllXXQEoQ/IS3eNtFXhaxyDUpMdxopsyQURlqxMQ=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr12955006ejx.85.1625746662207; 
 Thu, 08 Jul 2021 05:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-22-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:17:03 +0100
Message-ID: <CAFEAcA-rdYgJ+TZwuYpYFOx6bUv1rQoAW5o_2TrcXqCxERqddA@mail.gmail.com>
Subject: Re: [PATCH v2 21/28] target/rx: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

