Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244373AEC10
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:11:12 +0200 (CEST)
Received: from localhost ([::1]:43566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLZv-0002qF-4A
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLYI-0001e2-PN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:09:30 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:40564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLYH-0001av-8r
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:09:30 -0400
Received: by mail-ej1-x635.google.com with SMTP id my49so29290047ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nrifIVBbJxrxdt7peOTsEjs3YIjZNdrMkbcYkUuedUE=;
 b=Vl0Gm4yJq6nMx+qpVs0OUKszQhaXLvKZ42JemFAyjCiOR//yv9A87u9E4bbHl/Yg8R
 BAxOAcUcf5HtjN/AjtVyN8yc2bXZ5fCLmLj91EBh7WShCyEddtxi9Hutv1HQyrt7tPcD
 pGulGxD9ZehmF7b2lkxnYVe+fyqEJ3oBsP3HOKN1rfGWv0eLQc8zzxa28YTWKPTMvORa
 livMSP1whC11mRJFVC6rhqIn3wNETsLaoqQIwWuYLb9QFokPghMrlhUieV/2dLw8Gm7g
 tPKgHXcvle6v4SmdVsE4kWXXNhkX6gT6iQkTZTZIVURUhACGes5jSlDInw4bRVrxvHBy
 OY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nrifIVBbJxrxdt7peOTsEjs3YIjZNdrMkbcYkUuedUE=;
 b=UIP8jKpWMSncW+KqtCspd+Wc2EbktFPbp2gC41q4l39253zsxO38cCJUfqfidc8aud
 MuTIO9mbk4PaxnzFX0XgDHTn5rSXGTp+/a5DZggZIIe5/URatf+FYtPWmx5IshcLt3G3
 Rmhzo6GLtxR8zHk+3ClxhydzrDg6QnFYp+eCd1QA6gUTMo0P+ClY5XvMee6PD1mTBdka
 pBsjm1yTZz02IRzOq8OYCWhbnqee0Ywl3NkG4JPCgKfslcqpq6fcaM2QD3Ym4w9OoZyj
 bRirfnhxnDOXPiL/ebtl0RBOtw6+sNaCSuk7a0rhz1Z0IXYDgR6Qdf57qj9l40QYYPTT
 uj6A==
X-Gm-Message-State: AOAM533qoZay1PPB97Us6X1jtftFbPZYoRsgCiLoOHIh7YEg3kwtiFZh
 rQ61giywi6xrwgSMRCn4Fo/NFRNztzvIR/UGyFTyvA==
X-Google-Smtp-Source: ABdhPJxFRAvwvHrUeHn7bcvNxSocIAfPMwvPhvtdMVTsH7M8MYEmj2kYYKFJ0oYgKnrU4J5I+yNr9U7DBUv1Y1i70OM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr25051321ejy.407.1624288167603; 
 Mon, 21 Jun 2021 08:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-21-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:08:52 +0100
Message-ID: <CAFEAcA8DHe2_KMKDXPZ4XC8jd6VncbV1=J843R=QmYqKEqPYyg@mail.gmail.com>
Subject: Re: [PATCH 20/28] target/arm: Improve REV32
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 09:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For the sf version, we are performing two 32-bit bswaps
> in either half of the register.  This is equivalent to
> performing one 64-bit bswap followed by a rotate.
>
> For the non-sf version, we can remove TCG_BSWAP_IZ
> and the preceding zero-extension.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

