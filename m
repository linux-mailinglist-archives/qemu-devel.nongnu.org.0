Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCA641C64F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:08:20 +0200 (CEST)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaFv-0001TM-GL
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVZug-0004TF-9T
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:46:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVZue-0007oR-Py
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:46:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d6so4342520wrc.11
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ppLAFrg6NzsKKLCJxiHmL0UU5/HBTKMEfD3kBN8/F0s=;
 b=uh/izhkijmuE4BGWLrwPFwaAXkwn4uUhPN9A/VSVtahsVBZWQAvBIOoBeQVh/2ALlk
 mOIQv9tAZeAXnqC5a8CegmU5lSY4fsNg0FYAkJGha1RWtjPvBXXRLD8xZYYd3BSxl0zf
 gCQxml+0zz3HQNRyOqBJEqbRv/euvuwD3Pfc5Fe1sSrIQTHDHDMAvymg0ZO/MGg/yMM0
 /V9LQ/8Ewp4x9bgcMJI+4ZiWdOuHoYC7835n1sDrcXqV1+zaYOHIB2KS/ho/aZP5UiZr
 VquhJ6EZm/DyeDg5I/ioTBtonwoKjvy+5UjC06wi8qYbtg/tNW1n/aPC0YI5dqizkXEh
 caeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ppLAFrg6NzsKKLCJxiHmL0UU5/HBTKMEfD3kBN8/F0s=;
 b=TFuyy5+NqOqffrL+2uUk+umMnofrUy7Y41cV0R4O0aeG5RiETo4vtAr1j99/Ftdhrv
 h+3kbJgwFj9hNM37aDeJhcJlethkp+SwX9isgjWKZiIyuplMcbsYhqOrNOsHQS1e7k+z
 ATYJiuptD83P0HThKw4Ye1yrJuhL34NSe5XvNalkVbWid0ILP7QgJww/oNq9fYjd1Gr5
 hcBaMDSa+fONj7eutj4iyDttYLk+GVh4erzmp8C7/0vcijNlfdVpeWHYdN3uS6JWoK16
 2vijmMwrpOWYtflajkV78zUitwUL663hJ9Z3VWa7p/RukWUknKwUzGs+gBGkC1KPkoJd
 821A==
X-Gm-Message-State: AOAM53011uDhlHocnSdUv1pqR00NmNmOyGt0pR9WWeCXanph9W4wXjPP
 gZHodn51Xhblfn87ZrCTq1uUvH9i9FNWR1iu+kJ5aA==
X-Google-Smtp-Source: ABdhPJym6u96UUp1ef4YKsd/yroZS9xIKUDdLZowN1Hx+5yYKM3SMMu4wiQizWcwSJH30KHySXSO7QYWnXa8Q817kQs=
X-Received: by 2002:adf:ee48:: with SMTP id w8mr7100861wro.263.1632923179284; 
 Wed, 29 Sep 2021 06:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210929130553.121567-1-richard.henderson@linaro.org>
 <20210929130553.121567-6-richard.henderson@linaro.org>
In-Reply-To: <20210929130553.121567-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Sep 2021 14:45:25 +0100
Message-ID: <CAFEAcA8zASkSVOYB+NVb3BWgzg++FEcG1258e5SpN-BO7mJG7A@mail.gmail.com>
Subject: Re: [PATCH v5 05/26] linux-user/arm: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Sept 2021 at 14:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mirror what the kernel does in arch/arm/kernel/signal.h,
> using the old sigframe struct in the rt sigframe struct.
>
> Update the trampoline code to match the kernel: this uses
> sp-relative accesses rather than pc-relative.
>
> Copy the code into frame->retcode from the trampoline page.
> This minimises the different cases wrt arm vs thumb vs fdpic.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

