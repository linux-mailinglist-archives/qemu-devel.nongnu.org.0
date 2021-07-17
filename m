Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC63CC6D4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:35:04 +0200 (CEST)
Received: from localhost ([::1]:54594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tpn-00042N-Jq
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tog-0002rg-8y
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:33:54 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4toe-0000Zs-Tz
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:33:54 -0400
Received: by mail-ej1-x633.google.com with SMTP id hd33so21240139ejc.9
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EZdEM3E337uBDMeN92lACtOBQI44zFxcLKuLpgyu1nA=;
 b=IlSJtu8A6RRNUO4e+KJoRpjQRNM1DLBv2CztcXxv5mvb2gTdQVlHN7vW1Zi07SmWL9
 HYONbecviUdzbM43NTpdFXejErAeFCiZtfS+wuASiFdy0JRxhPi3UNawvTPkNcnOyaJS
 qvfBhbWUzVzphHpc6NuucodTpVyIS4Zart/LFCdyH65ddelXTy7VzI5SIMKvrdBLS5vm
 35MuHatDk3ZoOX/HtesU1tqAhq+ixOTuFW38ctktMNXWHHyGAvTpJBszWnD4EY1xb3kb
 oHSad+yIrwVllEHp4xw7X73anbGlcMEqQYApDLb2r8J+hGq5u+940fJ12Wy6YGRNKBct
 bViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EZdEM3E337uBDMeN92lACtOBQI44zFxcLKuLpgyu1nA=;
 b=WZmvdtRiDEKgTDuDVzhAJyqPA5RnxVUrCfmoEPC9rUphoFFNc3NZsZ3KYHL38rjwCJ
 KqH9v16j7SZzk1NiXgUUHiKzZzYxevdlS1eF6EWL5fB1Ih7G0oph8s76uA4ADFgVbax4
 oA3MjH//kjmiExJwkJVSLRgV6eQyARGF+lRmn+YVqmc26NNj2jSgefk7Tw1+1A/S1ZjD
 7LkHWr8qHEFwSxYeu24LHko2R1WGQTpJ8v/b5HUEJUBs3yO/KszkB2XuDBKPvFGnmdqv
 nv4GGXHPA5rsy8nirh2660Yz0OsS1COKAmj5qw6pDV/Hm+aRTzwFrJMcufQfsMf8mZnV
 z0Ow==
X-Gm-Message-State: AOAM531bmnPuzMBa1aj+LGpRwnZF3b2Si8cWBhmmWvpyN3qNpGl0B2TN
 4mqz+pfL+FAzbqAGP2i8keT8wde34WyIYTWmt14b6w==
X-Google-Smtp-Source: ABdhPJxLgelajvEHXHtxHtqI9zReXMyJDXcJxVtafe48RHNNRe2GIpCU69PktvXz/JpxqedTg0r56P0xvWrWRIQ0uag=
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr12936755eja.85.1626564831038; 
 Sat, 17 Jul 2021 16:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-2-richard.henderson@linaro.org>
In-Reply-To: <20210717221851.2124573-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 00:33:10 +0100
Message-ID: <CAFEAcA8mSa-XaQopynG=HYQgP3TyXEp5S0owikz1oZc__-0V3w@mail.gmail.com>
Subject: Re: [PATCH v3 01/13] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 23:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The space reserved for CF_COUNT_MASK was overly large.
> Reduce to free up cflags bits and eliminate an extra test.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

