Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14773345AC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:51:14 +0100 (CET)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2zJ-0007aK-O1
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK2Tj-0001ax-Ks
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:18:37 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK2Tg-00048T-5a
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:18:35 -0500
Received: by mail-ej1-x62b.google.com with SMTP id c10so40156949ejx.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DMBI/PfElUf548TVsJFxfmWhz9UswWna3wkX93XAh50=;
 b=KqwUs80O533JnWblBrQlRzpgO0TRJ/MfXd7LIHBWnUHDQPV1ut+1wOkg03ax70FpW4
 kGvpmq+lS2u6099Mw72SE6zxAYLlD5cU3cTa91LI6CjHTmA66tyrGFPCljsw1m5CIWpC
 p1Gy4QD7AQoh6aFHEe3/4j0vCDcLyguDaAe5TeKXVaSpgi1/bx3c9jAh7NLpMxBgwPlk
 F2ItgrUWVDI84beeJFYSvYPVemi0dVHIUra8UoBbwx+ZSAbqVN8bozKfOBWQciPMyrI1
 a27COcWI869yf7n41+NcxBUjJMEAxxfeAG5sj6Dxr9sIMet11e/qmaXtKcmIFILVwNS4
 pZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DMBI/PfElUf548TVsJFxfmWhz9UswWna3wkX93XAh50=;
 b=PxDSwWy0+uk9bhtlN9Skm1Espahe1CeYVD9FbO/WAdYvOsUYV1kUzBqAJ1Dg2aBs19
 1r0fPbe+9YH4Mi57AcG8fUI/Rzsr5SU/NiwaqI8viK2Q+qkqt5DaIdSLC1lk6dRCamGN
 4vC1nqPnrRAgYgP2+CXC0y42Ut/gE6cjc6XXbf3ZbZmCi2KxsUlE1LFUiS9NFHf6wCLW
 Oi/w4/RXtualEs81DcC1Hcfoq62MyQFBzj0DaAiUkqQhw7VuGl1X82tYDJbojAuWu4vW
 3+qrtc2mLOnduCAbwXG7M4ptgrlwcX+vz/v/2qFHqR4xcCrxVxePQmbmarRFto2dNtbm
 nSnw==
X-Gm-Message-State: AOAM53343sCmwKYNxEVl8mW0cld07FkvdLn4zr2PsVUIcHjw0u9kndTc
 zzZ3uK4/ixwgVqhUMO0856JPra1IFEtThKfxm7WwQQ==
X-Google-Smtp-Source: ABdhPJw1xO4x8SpVNXk9Kz0u/Wia/kNwLfxfQzDTygcIs3OZEH6GCBJev1dDffO8cdIL4bMTVmSIV0VPphEPobzTDec=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr4781772ejd.85.1615396709820; 
 Wed, 10 Mar 2021 09:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
In-Reply-To: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 17:18:11 +0000
Message-ID: <CAFEAcA-mgsMd4roQc_7QYkMMMqXeFyXiQGtCGp1Bju1P2MCi5w@mail.gmail.com>
Subject: Re: [PATCH] baum: Fix crash when Braille output is not available
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 at 16:08, Samuel Thibault
<samuel.thibault@ens-lyon.org> wrote:
>
> When Braille output is not available, the backend properly reports being
> unable to be created, but 5f8e93c3e262 ("util/qemu-timer: Make timer_free()
> imply timer_del()") made the timer_free() call now refuse any NULL
> parameter. char_braille_finalize thus now has to be more careful with
> calling it on baum->cellCount_timer.

It wasn't the intention of that commit to make freeing a NULL
timer invalid; I think Paolo's patch restoring the ability to
timer_free(NULL) is probably the right thing here:
https://patchew.org/QEMU/20210310154526.463850-1-pbonzini@redhat.com/

thanks
-- PMM

