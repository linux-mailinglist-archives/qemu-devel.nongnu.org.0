Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C673B700D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:23:46 +0200 (CEST)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9y5-00013W-Ow
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9wk-00085G-C9
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:22:22 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ly9wh-0007jy-H0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:22:22 -0400
Received: by mail-ed1-x529.google.com with SMTP id j11so4828560edq.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ftfcko5geJm77VWShgBFZkj2MRZQ6znKnEBXsvthiTs=;
 b=ncPn3E64KdhymqYx/AWNNfqXDtRb7oo5QasAwPMBy62Cyjcz5ojAe1rHIrRaPikxlN
 /eSiwh0KNYVUsUStDRLtibWb5znT3ZFwhNBspK6LgHZ4/xqJxNER5wRBgRUNqwqqYYYY
 iaEAncwL9TinElZTCxbcSKW43td5MJShwTCZ2lUfk11Mjedyf4Tc2+xosRhKKv6tR2r0
 fGDztACJX2P/idX/L0RJcuddIfKaAi+wgFmzykHuCQH0tvU4H+rele5isXecmbuMvKMS
 qyQKNa04Cj4izOIIZkmJTXyL/VzocS+6EQ/y64/N9jVifTVxxNS6jebaN4ZMlbAvmpl4
 aWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftfcko5geJm77VWShgBFZkj2MRZQ6znKnEBXsvthiTs=;
 b=rPhjkl2ej/RYT4Z+d8MJJ30vYfYmVytSJ91Qnw6BNmL122tWnkfGs9kxXdnQUwMkB+
 YCMU3Is3QFgF+rBzxDdaYQQ735eQhBxoMVOWTAi0yGZB2XKIzt8XsMZTvRsHzk/viP0X
 FjdYqzh/ZpVLVlU1vea16e8wlTu2NbU3DK4VH7zaKrgg1coxmTyWrjRrbIBJXJUkOTMt
 DgVCExNsnj88ljQMTTUAICDOHWIv1F2A4+IP33/EV/T/mW1eTjfcWzsFSq3sK5YFGWok
 8vzvHjxVALaJpd9Nv+ddf9pWkPOGvaRh42OVSqWvaj3bTV+9ybuyBBqUyvxEEJe3+htT
 xB4Q==
X-Gm-Message-State: AOAM5311OsMHCKSqD/VyUb1/pV6R8dChTCO3HeepAoqMNo1f4JlmSxos
 xgfnkbfe6wFZ5rB2gwtD/Cs3VZvWz1lLWO2VrfRyhg==
X-Google-Smtp-Source: ABdhPJzjE1uiXzTN0movtzxCDfdApogdIrelcQGNWZvC4CaAWvI3/BGcJJd1yHBGTVbG1jyx83I6MONZZIFLlYKLgoQ=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr39527368edy.146.1624958536586; 
 Tue, 29 Jun 2021 02:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-6-richard.henderson@linaro.org>
In-Reply-To: <20210628220810.2919600-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:21:38 +0100
Message-ID: <CAFEAcA9DBj6+hRYf7ji2x239vHY0h26egrbVC3aTUubo2munKw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] target/nios2: Convert to TranslatorOps
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 23:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

