Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178DD37AB9F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:15:20 +0200 (CEST)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgV2U-0002xT-T8
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUo0-0006jN-3F
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:00:21 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUny-0004A3-3i
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:00:19 -0400
Received: by mail-ej1-x634.google.com with SMTP id j10so3479346ejb.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVxjKm21Pd6EhfWtuoTBoJWysrzleiAeeZQGyzS0l9s=;
 b=D1TMXqJjSJYHxhl+3sVmAbFOhNkDT97yCFI31qQKQcOKL8kdOnMblqve9wm6LFVIkr
 UGFFRIMji0aBNGI0HmwC4p2vrPIHfB72P97qqfkvw/aOCU3hsc3XU6PSfyXtABxpqqSm
 siPMZbTrcSlW5QySvKKf0KQAAx8AxU3Miym1R7C9K+eUPsMJ6r42vmJK1t2F/dmj0/DJ
 TenyDelguI6wBDQqeInoRDYEWcTX0hxXFO2O01N4zdKWMhJy0IntXtVkengKtDtvl4gE
 HwjT3/vY5tPc6qKUa3/bHRuyoww3R89BRss5x0nclQqpeuiV5wh3hRLvtD8Zv3e3Xv0w
 F/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVxjKm21Pd6EhfWtuoTBoJWysrzleiAeeZQGyzS0l9s=;
 b=pGFKfhQoAcfOvB8kpwefLfGKocve/J4yQOtqtabMpLG4o9tXNaOav10EaFh7jfW7GU
 xY8BdiaBXALq8bpUJrzAoCqtMtPUTxMWRltvM39KfBGoVNUD5+fVE8EfOYE9XePH7MwR
 URTTxmRYheY0u3kKLrwKtzgBOnUcv9PFGrCvs4x87w0Yz30AmK1ZObS4aQDH5T2WD5Z/
 O6pg/WnPqrJwPMJom38tra21I1Vu51pt2WewmUBpFIYErnSrQmd8LVk0+acw7KsmnUtv
 d7h6fjAseLJIQO0s3ABw2wN77S+keYJ1TCv4UdfpKJpztrl6+d7odgGJJNa4SFbSyhuu
 cM1g==
X-Gm-Message-State: AOAM531Ir7vJ8MM/eHo2hV9m4cld1YsleMCQ5d/Yf4fVF3zD6BCzjDQM
 PqOPRU0DeSGTGIIRhltxEeMMB6JdAB2j8c1af43sIQ==
X-Google-Smtp-Source: ABdhPJzS/wEvPZTqr5KRBwjnWSM8l8a659n7qP18cVQpIN/gf5EW5Ewhszqh+eE/aPDjQpcwOnvmQvZfTRAWL0Q93FA=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr3105270ejb.482.1620748815997; 
 Tue, 11 May 2021 09:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-24-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:59:03 +0100
Message-ID: <CAFEAcA_ZpS65=Z=TW8OMCJX9rK4gN4yDERmHUe=1g1ROtYgrvw@mail.gmail.com>
Subject: Re: [PATCH v6 23/82] target/arm: Implement SVE2 integer absolute
 difference and accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Fri, 30 Apr 2021 at 21:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  6 ++++++
>  target/arm/translate-sve.c | 21 +++++++++++++++++++++
>  2 files changed, 27 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

