Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA832ED3E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:36:46 +0100 (CET)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBZN-0005wM-BV
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBYP-0005VC-BN
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:35:45 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBYN-00011K-H1
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:35:44 -0500
Received: by mail-ed1-x536.google.com with SMTP id l12so2899213edt.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Oe7H969e54YkPB6hUqhabTnIM/XSiNgvMOlcZTjOnI=;
 b=oYF38pQyvEAxs+I2J0v7adpEeKZ7U3SQLLrr/oUqtANqjtKWj5d2dkyvDeR/5rcKd4
 3ROzud5hyeLCsUFzLRx0ZAYStyRC1Xvy3sGRKDllGVAR1yoYAAQIiLLq+GIIdVTThjgK
 439Dl3q/f7wHgW/y7ZLJtDCHTrhnjp2euqLiwE7df8aIE/Ka9NlnKeIGJ46rE1y5qX2V
 JFYlCm1fNZaqTxk++ecK7Eb/8aHbo8zYlEDNuuZ518BYn69gB9cwq5e5fgfAhNk6YZNW
 bf06eIjQl35i0QHwo/3VOmR4vV2g20VAL0BQsGnSnYWahkVcbkWyxUP7AkT1VX3QdaNr
 FuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Oe7H969e54YkPB6hUqhabTnIM/XSiNgvMOlcZTjOnI=;
 b=qEzlb2gSVY+7deoj5iUFU6RxaV9X8AHTqMzvx/V+46S3tSZHwAuwEIuzfXFjZxZaSa
 4FEElPWei1zzFCJFlysoJ7jOHUAJwNZbYLDeH4agROxMCxvJg+kS1MS92+Xa7x6JZRV8
 4Jtj5y0duk+RdX0KJWDAfzsz1NnYxH9LBZcgwKO5ts6Ntyp/NwLCcLoe2UojAEK/kM2s
 G9XxEYkX78tqQ0EGIZBfkKW8tnj4nE+6w6/d69/sdGYzLv23Ny/xQ6iTVW6vXKvUNDCq
 1mws9Jskm1kp6zUNSLPEfF0op2yo9iYlsVD3grUI+Grwi0pqShCC+KTOKBT5ZxWd/jRn
 Q/yg==
X-Gm-Message-State: AOAM530PiBzhAI6FfNZ0Y1VBPMzHICtIM29ypszl1TgBuz+3L76LGV1t
 +3sBEh66wawHDN3n73AN1ugeq7lKuem/5SbCcCJ0Iw==
X-Google-Smtp-Source: ABdhPJzKAuDRAIorgvmNFgIBzrouUmxchdNwiPsY4tQuk+fkeGiKdUrrLGfInngl3WO0k2IMaWCLMifxivqr1BeRiHk=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr9561357edr.146.1614954940758; 
 Fri, 05 Mar 2021 06:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-4-richard.henderson@linaro.org>
In-Reply-To: <20210302175741.1079851-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:35:25 +0000
Message-ID: <CAFEAcA99rVOBmvuffHWR==Z4KsdsfatbNHTXA+=pu5vXkxqtgg@mail.gmail.com>
Subject: Re: [PATCH 03/27] tcg/aarch64: Fix generation of "scalar" vector
 operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Mar 2021 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For some vector operations, "1D" is not a valid type, and there
> are separate instructions for the 64-bit scalar operation.
>
> Tested-by: Stefan Weil <sw@weilnetz.de>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1916112
> Fixes: 14e4c1e2355 ("tcg/aarch64: Add vector operations")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 211 ++++++++++++++++++++++++++++++-----
>  1 file changed, 181 insertions(+), 30 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

None of these I36nn section numbers match up with the current Arm ARM,
incidentally.

I did wonder if it would be more readable/reviewable to have

#define FMT_I3611(U, OPCODE) (0x5e200400 | ((U) << 29) | ((OPCODE) << 11))

and then
  I3611_SQADD     = FMT_I3611(0, 0b00001),
  I3611_SQSUB     = FMT_I3611(0, 0b00101),

etc, instead of the raw
  I3611_SQADD     = 0x5e200c00,
  I3611_SQSUB     = 0x5e202c00,

But if you like that you can do it in a separate change :-)

thanks
-- PMM

