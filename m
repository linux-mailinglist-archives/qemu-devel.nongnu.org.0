Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E233BBE99
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:02:45 +0200 (CEST)
Received: from localhost ([::1]:49482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Q7Q-0002Qc-JB
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q4i-0007wO-8E
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:59:56 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q4g-0007jD-Oz
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 10:59:55 -0400
Received: by mail-ej1-x635.google.com with SMTP id bg14so29383392ejb.9
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LdT0oso83mP4bLU/+U4zfY/foF3+UTnoughjGLCno0k=;
 b=ti4RkzvzlpWiQ6EAIpFyKjduXEno/cNOh4TFzW6i8XpSX9e9gIN5XR1GQk4sA0TRQ3
 CHRwqzt8agdwHX7Px3XTJ3kW1WJJ23W2AZXllPagEqzV6AKoVM+aRrtrtpLmUv2pcBFH
 LzfSkBDag/ykqLrilm4QYGB5vNnxUU3Nh8duWsz9KQ7C3n6d2hOgbOdqwm8uxTsuz2bX
 tRx9azYamzJKbPwgpoNcq+QMzY1upOFH7AOItJMUHrYXSyGOZ2g6/IJcO5buzRdE6Jlc
 M67zM1N0CjxzzbgXO8ma1+tlkj1jnbcUeIxCfDBcM0qVC+MHqiqX65lpsvEYxwOOH5yG
 v/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LdT0oso83mP4bLU/+U4zfY/foF3+UTnoughjGLCno0k=;
 b=CP2Tiiz1IZtmySCtQHqfWEvqap6pCEfKZbLgG/CExyT0dWkvnLnm1NSI6uFIZwcya6
 qZQpOR2bz7lcN+O9PbxS0VnKhp4Klfe4kqkVY3ztLyXXZLEdCOWZnNN8mXfWYmNtFfpF
 YC9DPACh2nD1s4VgrRb0e7ZxZru/+LxNye8kpKN+L5vgv7HtIaG0EQydZU9y4c92v4uQ
 ZsgoU00seii33Hyzgt7CzxKSI84lgm+nqPubiOWUsb3xiHa/lWBgFQCRmW489auCUlDY
 f3sGxy0VKnYrLHvUxH9r+j1WIIEf1NkKxRFrDj048TQeCO0Y2KY8R9UXxM6xJstY+y4+
 00Ew==
X-Gm-Message-State: AOAM533ScpBOzbRNhmbAvDn93x+5OaCbhiUOyz0bt1iCLU6Xz+lVKg09
 hU4aiVcfbqEAP7AttaZCMw9pLV8Xyg3E30bH0A26Ig==
X-Google-Smtp-Source: ABdhPJzc4Ov+XARy52KYJriER8pVWc8XYrrq03L9iwwiC+BuEri7iq73rkQ8MqQT/fH5lOhwbv0BogeFNGE7SjNBLIU=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr13484070ejc.382.1625497193347; 
 Mon, 05 Jul 2021 07:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-8-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-8-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:59:15 +0100
Message-ID: <CAFEAcA8UWgJwLjCZU3XjbiwecJ5sYVEgXc_e+2YbkrPfveBYfg@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

This looks OK to me. Leif, are you happy with this patch now ?

thanks
-- PMM

