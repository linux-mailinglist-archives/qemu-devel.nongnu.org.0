Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E9314280
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:03:42 +0100 (CET)
Received: from localhost ([::1]:37332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EdB-0000HP-6U
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99iO-0001CP-RZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:48:44 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l99iJ-0006xl-T3
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:48:42 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c6so19163790ede.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7EpOvekMzcS6TcjPqjRFq9f2hrGZAm2fZihh7vwhiI=;
 b=tJ/1X19yhE2Z2yMoprDToY3zWS3OXuzZMp0N86Ko/na4IZuqFtTFA3rYdfL8zh1agd
 VcqNmLrpVE+d3VGVa9/xrGFtTKl1JrGKurpV9U9j/icwf8cBteEK/jAzIAMZOIBf/eMP
 tNjw8tFKF2KYF/IIrGtsPeL8y+oJ3hFQUWLHTLqn9rLq+DJchRYhitev9ux3i4kvd/Oz
 XBMqrAewwVe/yHIg76mYv4z8ZXcBjutZaEBLOW9QUQwVDwoALayGSnB8CY7FoIPe0axZ
 tMLrzmH7neIUS7la0XgNYnDaTG5GRU/jJ1lFMEuGXHqDybUydzl5EK3eTi4Dr6rFzjqU
 NmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7EpOvekMzcS6TcjPqjRFq9f2hrGZAm2fZihh7vwhiI=;
 b=mU0RfpGCk8SlyU3yCASQyOLD9ygzyVOFDK7xViDGukb408rLnqhErez1UeGBIpDhuL
 14WRUMdlZGQKJh+49JKbhI/a/2rLUSMfwGgzdQxsVimOeAwh8RMXoZ2NykAUIUFdruWq
 jDJqgaP5ExpUR+9IPd9QHM1IFWklBHYShWMeZ7uum5AxRctFaeQtB3JCjYndzbvGz5uR
 9WF6fhe83BG5w+wG+fgyBvXyGXGNi5F0fWuxAWNiWFzlu9o02NJ6XfLegnNtnCNUI8w+
 A3qPA85UkpbwdgtILlEvkizP2imIQnreZRFiB9vq4z5fAwpIwyExaR9I8AtQDpy9mvDd
 rr7A==
X-Gm-Message-State: AOAM5330F0xY8xkItGKY7b3XJT7AZ0mAjGOU91BukUzwb46wbXh7sxSZ
 8vSfe+A447jznno2L6Ki1Snz4DZmIcjBTduyGMlrlg==
X-Google-Smtp-Source: ABdhPJzCNv/8SijEpEynRICmFoVA7LYAa3E91bRygmd8fD/wCxkJ8MmH5cX5Cw+/vmP9ddqCO6XmveJTX3bPF0jm58M=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr17893871edd.52.1612802916176; 
 Mon, 08 Feb 2021 08:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
 <20210129005845.416272-4-wuhaotsh@google.com>
In-Reply-To: <20210129005845.416272-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 16:48:25 +0000
Message-ID: <CAFEAcA9Q3NrOEjf4OqYqC7xV5dtFe0Drvk0AiMctMGaVLkEWTA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/arm: Add I2C sensors for NPCM750 eval board
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 01:04, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add I2C temperature sensors for NPCM750 eval board.
>
> Reviewed-by: Doug Evans<dje@google.com>
> Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

