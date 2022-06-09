Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DA654523E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:45:33 +0200 (CEST)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLHn-00033F-QD
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKA2-0007yS-Pk
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:27 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:39254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKA1-0002Df-2Z
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:33:26 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3135519f95fso74885417b3.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqdeI0LnulE82Kiz0cR+AAU/Q28ML4+90WKXvDm2gAQ=;
 b=muClPK2QvoPlnm+7uLNr4/IPCOPlzb4UIsaSPMqw0NKs76ughzGQ9TARiclc9wxxb3
 BaPBMZ1Pjp5SmYM49OsN5kKj1c0+62V5J7fm9hgy3vyQNXAgx1UibZPLBY6u+1txkbv8
 n30HEmKgM8D9cDk0ZC3N59FJWkKJ8SXzObyHTQ6DzZOw4jdA5B/+ukOpVdgvldGKxdqn
 bDCzfJ3eczP2a255TVVL1A4VDaxlhApwJv41Dymsq42iCm+dvmrEJekgswbuB/HUbeOb
 3z2HSXcqJV/yx1EJhQrlp175qdB2EaKbEgzMupL13+fABIDrYIq5Mk5Ry/QWBooWWIf6
 XE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqdeI0LnulE82Kiz0cR+AAU/Q28ML4+90WKXvDm2gAQ=;
 b=nPQnT58WqSMFNQZ60dpuDvc+KG8GF1CKkp1o8zDF86OSPGByGgIwb+5jlNJLEFmgas
 ZGI4q4F4R1uffQnOaKEkCAXO6bLQ1Anttsb3Fev86NR8JmuLUHyDA38Zvq9oz8/epQ4f
 PamcTTi78ne4ZfLJOJPgJSU4Ww6D3r/2mSgOYEVE0gmTRyprbk4wCgH/M0Aws4pbVftc
 1ZKtu4PLxB/ngaO+bHSrJUk8SRfTkAYVq5YXojolsic+vJPUHgPuS9rzjHSUzhMdhO6K
 XzutOQEsev3FApuhkJYXCO1kF1ZT6TQM0uUQvMJ7RtGsdAsoovO7XgG61bmrK1Rn9MRC
 2vFA==
X-Gm-Message-State: AOAM533Ivd2Y0nbnfTzjJ1rxs+yoCccwBlL3WVluk0essYufOo2FfVK/
 15vRrwVmzucJOngaOKylBsjuvl1QS/epTpabdA9ahA==
X-Google-Smtp-Source: ABdhPJyttlTN6Nvy3XHU3wi6y5QgAQsf3H1iksaBsWmTC01Tj9olyA2gj29k6ag0lnW4euUtYy1jLu5RvHfFojfzIY8=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr43790633ywb.257.1654788804051; Thu, 09
 Jun 2022 08:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-39-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:33:13 +0100
Message-ID: <CAFEAcA82JYna0e7ebgirj0Ad92OBNcZTVFM+8kQo7t77PdofiQ@mail.gmail.com>
Subject: Re: [PATCH v2 38/71] target/arm: Introduce sve_vqm1_for_el_sm
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When Streaming SVE mode is enabled, the size is taken from
> SMCR_ELx instead of ZCR_ELx.  The format is shared, but the
> set of vector lengths is not.  Further, Streaming SVE does
> not require any particular length to be supported.
>
> Adjust sve_vqm1_for_el to pass the current value of PSTATE.SM
> to the new function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

