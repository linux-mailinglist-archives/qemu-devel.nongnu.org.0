Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733CF2CD523
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:06:05 +0100 (CET)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknN6-0004VW-Gq
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kknJb-0001gk-34
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:02:27 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kknJY-0008O4-KJ
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:02:26 -0500
Received: by mail-ej1-x643.google.com with SMTP id lt17so3100094ejb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 04:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=l2EX9rFVjdU8ZgSy095fWUbIKXz7hjNnhxld8X3d5FI=;
 b=HdfeOvDKg+0k+ivKN1VzVjNfTTmsGN/JGslYCvK52MN066+KjVXo8mCCCXcChoUlYJ
 S0D76iiQAApA1SwPpIOSD+LxwpCfPBW1mTrCaLhdeRPomZ/EfH0lRXPBHpOSNsRx27BZ
 xdEvVXGGx3Vge5AzbqhRyKbGpXeZXWRLk5XYbt8THj+rizAlIv6wQOT0txRYhyBUiQwG
 Pn7Dyv2sJRKNTnHxBdUDSYlrGUNNThU7JKlR75E6ZWSKp0FSqQkllJix/cFCfG7KYYq0
 LXl4YzUDScOFY+KBHg76dgXOq9w2HIlui6YbhOzEwvJx4a4WocRd2ts5obNTbw/Pu50z
 a3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=l2EX9rFVjdU8ZgSy095fWUbIKXz7hjNnhxld8X3d5FI=;
 b=oQ3/RKXubAF5b4pDkLgEknnWThu9DWQ+w7xpBxp3VnFnE4Fjnn/QwQ6vqQ+r28mrxu
 L/cC4bZVStkdPYdObo2emBlsmqjKEzkQm0WhmcSRU2u+0JGFY1bvdq/G1lf7VrxTgjN7
 dlhrHInkche3RS6RMivItHstImVUt5NkCQdbW9lMfcnyJUrpbJPslMotrmjHvwrTYHZ1
 NeYkNUPAH7PNABZFu0kpqTKTst9qUtJ6f8Ql3tBV5uiJUZZlD5kYHqvfxZLbDLbjxee1
 tXDTiM1/tIoN89nqNc2HJLO5wcSeNjg0mGihxDVoBIushDfOOUxgnXfLc7ky4qMbezPO
 +TIQ==
X-Gm-Message-State: AOAM531g/ipt2DUtZUGmvuS/WCfjdZVVwAmTGMgxhvkL/EvFmjt8L19J
 xiUQ5WDQv/V1l5+n+yk2KGOM9GuYd5+3Njid3HiubA==
X-Google-Smtp-Source: ABdhPJwPX64QAl2RqwP+oLbHMnTZnNXLfX49yY6UXwnrWn0viESPliWsbQhGZdBltqc7FN9CCoRdk5e1LxSlTbi+5hM=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr2154051ejf.407.1606996942513; 
 Thu, 03 Dec 2020 04:02:22 -0800 (PST)
MIME-Version: 1.0
References: <20201119215617.29887-1-peter.maydell@linaro.org>
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 12:02:11 +0000
Message-ID: <CAFEAcA8kzf-PuETU=3WuDnwJ3Nw+MceO6UwEA5A_ky4a6nKRpg@mail.gmail.com>
Subject: Re: [PATCH v2 00/28] target/arm: Implement v8.1M and Cortex-M55
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 21:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This is a v2 because it's a respin of "target/arm: More v8.1M
> features".  The bad news is it's nearly doubled in length.  The good
> news is that this is because the new patches on the end are enough to
> implement all the remaining missing v8.1M specifics to the point
> where we can provide a Cortex-M55 CPU.  (There is as yet no board
> model that uses the Cortex-M55, though; that's next on my todo list.)

I'm going to take all of this series into target-arm.next except:

>   target/arm: Implement FPCXT_NS fp system register
>   hw/intc/armv7m_nvic: Correct handling of CCR.BFHFNMIGN
>   target/arm: Implement Cortex-M55 model

(since the first two need a v2 and we don't want to enable the
CPU until all the pieces are there).

thanks
-- PMM

