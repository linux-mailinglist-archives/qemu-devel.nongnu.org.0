Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC413BFA4C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:33:50 +0200 (CEST)
Received: from localhost ([::1]:48722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TDx-0007cA-9p
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T7H-0006ne-Ae
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:26:55 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T7E-0000FT-7h
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:26:54 -0400
Received: by mail-ej1-x62c.google.com with SMTP id i20so9303004ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RGQ+EQe2MAB8bCURY9QswGb7uOYePu1MeY8jGwOX/mk=;
 b=j4dTOkhKMuD4JE7lMIK6gqtIx9Gsq+kUfyEMDVYJ3NFxxdhFaSGBZ7LpmDQyOFz32S
 +h5ya/k01LuHm+UH9fN5h/d5dFV5Iu0jBimrJeqA7XRtxHR9SnsOeXcHqdgSxnDJTnBw
 RIdx1nSo7XyW8GOPFG/N0HFXsS9N7RG3v+fLLwfThWtzFS6LWhZ1GDOJMR2MSygGNlzg
 +O+80YxunFm5te0TlALHGJTCo/GZ1/wNFIAL9UQQD2bl5NdOfBuC4tNW/t4sLMTD1hSy
 oRpiKa7ldC6nb+vUCVPvyPqPmj1ih5JDsVdXaXnSUR0LHuef7KrsuSL8ZvhVPsfnl6xa
 absA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RGQ+EQe2MAB8bCURY9QswGb7uOYePu1MeY8jGwOX/mk=;
 b=OjYc+y6v8eW6k2CovwNouT7IZZWJhciBt0l2Sq2M/V0LwrpKZzhfM5ow7ADzoM5y4I
 3d9x5QsGfWLXSvi8wzlq5Xl4y5A7L2dI2rsw11lNumSFgRQlaxcebKum06k0WFEIfuNi
 WLk+MwKOmD1GLVSC52Ov3V9bs2PotsY0tbjNgeOS859G0JgloOjGHKmK8nSCekxQcncr
 sbuErTN8X1QCGJ3FLZnSUJ/mgKoxani2fhuCg6mqqYnpCwe0sL4oNpvPYsmlFbOkA/eZ
 /B4lFrhxDk2PPRWLlcd5WH8AN25NZgDhMLfCc6PTGaM89c0LiFFAnvPCuUs0gktEOtcU
 9S0w==
X-Gm-Message-State: AOAM533aH7NyQExX5g78AkzmUzo72NerbuKBHCPvdUbhUsewGmYIh8xR
 dBrHjuJ7izAOc4OIBGI341U5a26xXRWliIj2qqP3Wg==
X-Google-Smtp-Source: ABdhPJwbHW6VobSOBlt8/PQXFXX1KOyXllWjFHkPK6o5JkfVObrrHzwzed9hs74KLApVwtm9OnV0oZ2dom97tjBzXCw=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr13002352ejx.85.1625747210500; 
 Thu, 08 Jul 2021 05:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-13-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:26:12 +0100
Message-ID: <CAFEAcA8hccp2fcLJAFq7BDqC-i=eH+U6PJoU0KkaM4T_siu0Nw@mail.gmail.com>
Subject: Re: [PATCH v2 12/28] target/i386: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

