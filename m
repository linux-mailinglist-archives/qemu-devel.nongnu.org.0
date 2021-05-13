Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDBF37F814
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:38:52 +0200 (CEST)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAc8-00034z-0n
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAV5-0007kp-OQ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:31:35 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAV3-0007Y5-Tt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:31:35 -0400
Received: by mail-ed1-x530.google.com with SMTP id f1so8550877edt.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=75mqccxlxw0g5IQUmmFBhsCvq6DpzdnDDK4dnEszIuA=;
 b=J5p4XvpVNDkVuKt/MYcHrdu0Cp2EnduqVB3AcLbDen6THtvg1ciGAZhoSYsMqXv+Mw
 f1vRfbibAtiLaSAFG9D/MesSqcCneern1wouCoYN4w+mggBF8wgo/7XHviVwARg17Gnn
 Bh8p1XN9gBT+fZdCpHTGBcd0qFRNLwT8aWrd9D8I0gsoy2Q44jONoRX92ao1DOnRfu1E
 jWEjzZOH7wbf/CsCyRS4a4r53WRT3bxToLpX565xJ6/Q/afF6Ic7aWUGIRkDhayQcqAw
 ETnZXX+liJQ+JjgzGtMVljr0ELvTQTzOgUItjSJBk5PckD0ViS55vNaZWdgFWv+JJiY8
 tL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=75mqccxlxw0g5IQUmmFBhsCvq6DpzdnDDK4dnEszIuA=;
 b=r2nUKEmB2a0DP4x5LlnghUE5HF+7+j1vp5ez76chiOR+ZrIZIG3TUbWhLPhS6FeGpE
 f3vi5ti7ILiHoebCYOhJ5yvHHdsfmISopdM0ocPdNe9on4f5WpZZFN5eo6DIKwTz1QRU
 cdWVgbNqP+0+6CEZzz2/RkWNVLv9Jty7yjc76fDHnd5olMqSZzX7KaxrqmR6hi1qNZi+
 RG2UGfHdPbmPNq9j14pDauRx2BTyZnPc/XoaeYoy/W3E9/EWjKEdpjsKxzVcC5PM14bn
 NiQJh7BYSTn+Jcp1rHu74BdMqAocNyzi8LsGvXwKMMwjbcH0xE1k+mA4fvxGuEyWm11q
 0h8Q==
X-Gm-Message-State: AOAM53011uqxkbzVmuo7OBZOqEd2mPh7mxVAZ0tGnZUv3wkTf0dUP3PG
 0unJM6SoSwOPsvkJEr6CNvj79vpm8jPHnEijXLyRsg==
X-Google-Smtp-Source: ABdhPJzd1P+MzsxrHM2LD+qcZYcaXxwrbFVy+Cw0uFwtMq0EEIRrIoXx2uE95vzYsq+sr7WAWpKeD+FJ26ernSOSwzg=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr49454096edd.251.1620909092240; 
 Thu, 13 May 2021 05:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-53-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:31:20 +0100
Message-ID: <CAFEAcA8XSAbReFbJeVN7WwbvzOUPsC-XWQVYKiSxiT5mrBxD=g@mail.gmail.com>
Subject: Re: [PATCH v6 52/82] target/arm: Implement SVE2 integer multiply
 (indexed)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  7 +++++++
>  target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

