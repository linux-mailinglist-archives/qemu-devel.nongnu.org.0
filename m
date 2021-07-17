Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E053CC4E2
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:34:05 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oCS-0002PA-4A
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oBL-00013Q-1Z
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:32:55 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oBJ-0004G7-Ln
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:32:54 -0400
Received: by mail-ed1-x535.google.com with SMTP id w14so17208123edc.8
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gAI577ceSqnjbZ5cmoNyuMuMBu+kdwqqRJTACjm/NRE=;
 b=n5Hj5Z0WxZJ9MSebk/oD72wFvZb/YzqONj6SjA702XC3x6XOQ5k4rIoImup23FaaSB
 up1CS3t9P5h6Jt865TjMXFu+J7gUAkRYkGPI6oZPvt9PqzVCYfJiOetIZZ982uLk4R4W
 IKZjvnpHodmLQmOBUB99SUAQqKpJfST6QiYX1XE/EeBWuhD4Wdn496XXanAcHdEtj4eI
 IimAmXHsjUT6dosKFV4O8zpoL3EULAm17FyAK7NNXYrmH/0V7ya0ffyOBaedGSA77RbY
 GQU/0ud+hFtGXBcJcQWTAx3wutwZnIg9D5VuB2AYnj+7rZ//j+Q1gQAs4/5ipbMikbZ2
 WiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAI577ceSqnjbZ5cmoNyuMuMBu+kdwqqRJTACjm/NRE=;
 b=orAOpnKekJKg3U7wC8SnB7N7FXue1xNqCoxTSjtR2QnuzboRGkpNNolk9OwUcUliB+
 m7mGDaJ4zAyLK0nG15fwsz9eBL05f7DMGgNVBKwQPfEHRINeDI6Ntz4RJ35HmKcLCeam
 pkpJ9Q8myjfRl7WfqTVL8z3jkR7gmYaf/VVGZDZlXql6PfVMVZ2LF+WjRSMjCEdBYo6z
 MwEwopaz2TwK1SHSCrdOs+Y/iWH7/9wPXvM0Sd4foCFv9P4q8PN+KRgNIGqIWS+BKedX
 O/6IwMGuNXNIWBPllhgGMpidO9xLBpbFoGW4Z4liOHt+aXDhetsP2lvFxQdfxVZVyqUa
 Y+Dg==
X-Gm-Message-State: AOAM530KojniKziDxL5Y07EMBcLzJC4LI3EKx4PKAk4v4CsYVZIkzSHV
 cll20LZxPbSxJXnNlVj71VdU/CkFLdP6kTarD7bgvw==
X-Google-Smtp-Source: ABdhPJxcXjri2HjzGnkR6Qf2oHPXfIbhym7zyRumrg9r4BD9sSQomB/dQVyNIKDSMYD0mrWZb1lq//6ff77m4KjyqHQ=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr23258569edb.52.1626543172302; 
 Sat, 17 Jul 2021 10:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-3-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:32:11 +0100
Message-ID: <CAFEAcA_ZwsBO7+T1nq3Z5fqAC07i+fva+hYhEdU=C7obvqee_g@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] accel/tcg: Move curr_cflags into cpu-exec.c
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly have more than a simple member read here,
> with stuff not necessarily exposed to exec/exec-all.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(apologies if you saw a no-content email: gmail burp)

thanks
-- PMM

