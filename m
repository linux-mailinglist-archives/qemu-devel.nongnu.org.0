Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691CD3B738F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:57:17 +0200 (CEST)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEEm-0004ZU-E2
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyECL-0001oS-T8
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:54:45 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyECI-0004p2-2y
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:54:45 -0400
Received: by mail-ed1-x532.google.com with SMTP id n20so31436187edv.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WPaKFAZoKEvgNPARIT/NXavQ5odyFKkQ5uHico6xuZc=;
 b=f5xZl/t07KIFGHZIMw1JyLkLRgb9cdvoiSJR/NCBkNV7SWB5g1fx+yypQ18SZ/8pcX
 bQ4hwz4fmbQfL37Tlxck9N478nmI70wsMUSaeVn64DD/MpsNISwIUrQLXcYS3fQZ1EHE
 o1Ns9fyly6r95nVnjn1wfX3jg4IUcEdt1ns/rfiF/jyvTRMB+FTJy96sfP3U+jQQtEFv
 kWgPwkH/LmGN9dBv0Rgu8Vs5nUBCHgAdATX6QEZQ57hp1HfP6Hj8uzIeLosaRuo+oMva
 hpzfLtz6XQMIE3tmpw31cVNbOfGJ733gsZRhYcqWS/99Dt6op/L5jeieDkNMx63D9+8V
 ZY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WPaKFAZoKEvgNPARIT/NXavQ5odyFKkQ5uHico6xuZc=;
 b=BTXbq6f0shiSoczydQ/ggta+os3KL8eaf+EDux3vjY/ytePzfTdQtT4x5KYmysMdm5
 wZ46yNrT9zdQXfozRdb70Hq79Neug8xSxi3rXFtdKH18seBXn1du/NTbRAMunnk8W63c
 B5Pqbty4auJtGTyOEiI/MUwHZ0OMX+3jGV4WDXu8hROdQufoaXIESkB0nrOKT1DKYMFI
 ykB+q5Fk7lwdwQUZ/0QhWGUyzQXdVlxO968iL4DsptVs15aPH6rNRih8XzOcCoWfdibd
 nmFnwqmkiqG66LJ5zVGcXhMsy+daUgO4vpsIVPjV1ZICds+5wmqVkFJzbDlQrFHDJKqe
 VKSg==
X-Gm-Message-State: AOAM5326aFPyxt/qi4a2UIqLWQiAOsnRO5wTmTJCLVY+1Uk3Y31BkrmH
 qdaF94Du6OskAsOQJoslCqBdwWiDE6mPgd0QahITiw==
X-Google-Smtp-Source: ABdhPJydxA2ty4zLFCSlGIo+auDtm81szUwaXqZ44zTX3EdQYKaeQZpXILP5a2k4Zd8u1khZ8U3LJ7Alfb8whi792Kc=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr40200464edz.44.1624974880177; 
 Tue, 29 Jun 2021 06:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-5-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:54:03 +0100
Message-ID: <CAFEAcA8kLZnpYjrdRyiUFmJqtAWKMw8xLW_GkW6pbenoYsb3gA@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] linux-user/arm: Force v2 frames for fdpic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The value of get_os_release may be controlled by a command
> line option.  Since fdpic was added in v4.14, and v2 frame
> were added in v2.6.12, this makes no change under normal conditions.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

