Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871530C2EF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:06:57 +0100 (CET)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xGa-0005qy-8E
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wx3-0007ut-9w
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:46:45 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wx0-0003Kn-T7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:46:45 -0500
Received: by mail-ej1-x629.google.com with SMTP id i8so13903095ejc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fBMKLjtoB57sc4ZtakR345EdP2jcOh9tuWkUtAui6SY=;
 b=AQ3zzyxe/vkvkB9kHLy+z2NWk5GOip91rE4hzV7+DtoRjscIQmBDX3Vdr+s3TkSALp
 FSq5tfovmjOGsSAEj1+w6OcHcB0dL9fIKpuNAdBRkj/PgBuWZZt6RxGrdgtBhdzfD+HH
 nz+7DUh0t/cs5wftfc8NxW66RfwDRm5VhfJ+G38s3E40XTQ+KkHaPhbrWj7mfRIXwN1+
 NvpMg99QxFfGE32dV1/dW9cxd0mUICH3hFFNntxMSp39j+ZCV5JpWwwMJRm9jdYTXUbn
 EqZxaS1efwpypLm+zBW2D6BkiV1jzeM1/88ChmdyRDjUuKrAYEIZD29BNAUh3Qz9Dn1O
 atMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fBMKLjtoB57sc4ZtakR345EdP2jcOh9tuWkUtAui6SY=;
 b=pwDyPxBCqQFqUZJSCE3ADNY4IHxkJyGUMIMSctJYrgMCS7csymKqMxauhuEAf2WowE
 qJv8qOvXLM13ocQu/LT3FX2ZTRAjJppZcOHcccy/E3PUqVqx/s6rrd+/upMkzNB77B7X
 hUNBQdCznNGBklw2ZImj6iijPOwPPymXypnGS74vtusLCyNJszRvEEfa1WWY4rTI6Aqt
 ovHRx7I9TBBtjDNgXwqLOAKloKRfLsAEGcwmJ3jbodwbrExB6qCJO3bN5RWq5Ao8sTQe
 fO/2RyQnpqwcxytX8iK1d3Jx1ow30nmM88cRrpfNrtI0f3lUuVLAczfmX4KfyqdEStNK
 zT4g==
X-Gm-Message-State: AOAM532b6dguznNrq5PDWgkWaJhDbh9HF4FTgGQWcoNxJ4bRdxbDCsUY
 YawL4WLcrX4bg/2JvKr0QXHiNm2MHM9615sEfZGzYw==
X-Google-Smtp-Source: ABdhPJzHsHvMomb4bLAMwgh1pdvE4SRtbpIzdDj0B5zmHceGtmysm5soLo4t328bAKSlgnWUukHi5hxhW0AB7D799mo=
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr22545236ejv.4.1612277201078; 
 Tue, 02 Feb 2021 06:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-21-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:46:29 +0000
Message-ID: <CAFEAcA_sXsYkngC=1uM7hGP_h_J7u2oHUo2zE+1xm_2gWFzmaw@mail.gmail.com>
Subject: Re: [PATCH v4 20/23] linux-user/aarch64: Signal SEGV_MTEAERR for
 async tag check error
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The real kernel collects _TIF_MTE_ASYNC_FAULT into the current thread's
> state on any kernel entry (interrupt, exception etc), and then delivers
> the signal in advance of resuming the thread.
>
> This means that while the signal won't be delivered immediately, it will
> not be delayed forever -- at minimum it will be delivered after the next
> clock interrupt.
>
> We don't have a clock interrupt in linux-user, so we issue a cpu_kick
> to signal a return to the main loop at the end of the current TB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

