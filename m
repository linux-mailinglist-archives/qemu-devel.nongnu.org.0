Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F83F1A48
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:23:39 +0200 (CEST)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGi1C-0005Rj-O2
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzV-00040M-GK
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:21:53 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzS-00059D-Mm
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:21:53 -0400
Received: by mail-ej1-x62f.google.com with SMTP id w5so12939304ejq.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3P9tLu4Pugn4i7b0YliXRSdNQuDxBhHiZRSkfFzNLYo=;
 b=Ww+kUbNIiUza66YvnjfjQPzI0He+j5zgXBFOHICCaJ+umE5qFJQy2zwxlTes9Nrb3l
 /pIXaYqUE3UeLIsyGIQ4FYUL1w1E0wIJr+y8MV4vOMN5Bte6mZ64DI6gm/WHmA89BVbo
 wmmO9MhLKbFgJLmdahNe8K3UIBLA1vvPGU6g6cGTA9mfkBn6fuinE8sqV8ALnltaB8km
 4ErRbty3VqREk4Ji8DPC0nI1dywSiwjRXeqadSXREbijFoE/Y/0R//DPHEOiUfpYTv9B
 LQvraex4sM20Kdu6tIdLUTmUX3w15Yeo+b5x4s9q9pqy9kkw31BbW1wP8rCuDLmK0fSB
 xHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3P9tLu4Pugn4i7b0YliXRSdNQuDxBhHiZRSkfFzNLYo=;
 b=qbjM12Ix7nOzroyWFGRD/IuMrpxOAZEiJLkGQB7GvBxlzKeGlcPzUH9f5sFj42oNqt
 F9KK9dIJ4zBaVydcpM8cSOaYpK/F/yN6mVgip6ycKiDW9xi5OkYDtnme8lf4OdAqegNr
 3bE+YFD4huJB8PrQovaTuSKPhLJ8GEEBriNYdn2uJtfVW/+IYUPo+4NyaZ3bjQd988mV
 ZTg+4bGPF682e30IrSZToE7PBZBqxqY8ESeJtKevfACFTkwOhA10oG1RbDGbkPCH2EZg
 9azToyAfq0RoIPWsba9Qg2oPLJzwwykZywAn0pJbDMR5neOW9TjFxU2CWQb3wNKnwUa0
 zUDA==
X-Gm-Message-State: AOAM530EshLr2IcrCsN6QK4W9JknzExQPZ7ONRfOacz/Mu1aZIlAo6SU
 Vmqnc4PNLDoLPDSXeZXXvHkGXTcEE8wSlTe401RURA==
X-Google-Smtp-Source: ABdhPJxolZLgbu8d/z5TjcIW6ggnucrgSfcF2UEClHrQO9QfYZ7amL4aGo9Fnz5PPLPtT55UX7SoOk05bCk9ZcpqTyk=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15645137ejy.407.1629379308094; 
 Thu, 19 Aug 2021 06:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-7-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-7-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:21:02 +0100
Message-ID: <CAFEAcA8ucnsnC0e4Oz8qxLSXRGCvYbEZRgR8ZiHJ1oJb7mFiKg@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Implemented lpi processing at redistributor to get lpi config info
> from lpi configuration table,determine priority,set pending state in
> lpi pending table and forward the lpi to cpuif.Added logic to invoke
> redistributor lpi processing with translated LPI which set/clear LPI
> from ITS device as part of ITS INT,CLEAR,DISCARD command and
> GITS_TRANSLATER processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

