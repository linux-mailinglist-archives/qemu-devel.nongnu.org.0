Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D813AEB1C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:21:55 +0200 (CEST)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKoE-0006qi-HS
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKm1-0003hi-Fa
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:19:37 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKlz-0005y2-J3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:19:36 -0400
Received: by mail-ed1-x531.google.com with SMTP id t3so19184300edc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YL3Wk5xcvsUp/LE7vuYl+xgysxNIaFkB8uKnMwv37BY=;
 b=eNOJCc5V6l2Yp6fBbZxs1C14KCTdbt610efsi6+FroAyyFwkgD/WiRoqjUobiyqlMk
 7ekLteHZ1SHVDCISyVyQpPJngpMhNMCrtfdO3WP/uVyFW0A2F8BcoziTlosXay8/1zb1
 mGJG/Vk5uyYT5CqnOTHQJ4Y3RV9SXMmra/SIpzSkZ5FnGdRiGu/IBvrGQspfrJ1+G0K/
 QIIkxzya1WnLx1JNnwVpirEEp0ODiNlXWdFLmvLHCYmX8v+biYVhhuPjPoVRS0th+rmc
 OEFFJCbPikomHynQzXeqPO3zhTSlUftIRtqIUlEo4/UXv+BQY84BqWr58VM3KbDIi5yh
 Pfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YL3Wk5xcvsUp/LE7vuYl+xgysxNIaFkB8uKnMwv37BY=;
 b=ed6d8n51iXGEcZ3TSlCPYJWlM+fCeqOQGJguDAskw9wnqkvJpMdbBSIQkIFmFTUfru
 VJxIK9E9uBoRUpcjWnCL6VBj1/4F6TJ5FYEqAbd3L6o6rcUB+g2VzhiDvzRT32IPbXz+
 fNUpJ/SGD9ojfUWeGQ/caxCBa2OoECHoviv/nuzcQS+q9D7uLNvbfgenunbjqTfsWCa3
 Q5of6is1YWaXw6czAnOwTlqqluFHPnQ8j8RB133WQZw0aJmQpkZxmw/4n+3pkJtBuBv2
 nRH4auX3tnUdl8NYgc9DaY4jF+QDvf0NKcJmBlV/uoPo2lM0BZexq3e9WYal4TaVcpM+
 rXFw==
X-Gm-Message-State: AOAM533IknijYWd2t/MBOT2sOqpdmO2byHbOkfrCItCGriiJzkkAeK+L
 YITLNULfPOJbEaXHcOiRfJr5sRv/lQRDDaVeZ6S+nw==
X-Google-Smtp-Source: ABdhPJyxHEYzcvyWjFK/jzM3DxfUcpL2DTEEtOLafqB3CQULDR080O5sPsVjy/gDNIUvS9G6TuU8B9dxujavElt+y+s=
X-Received: by 2002:a50:fe84:: with SMTP id d4mr19655063edt.204.1624285174157; 
 Mon, 21 Jun 2021 07:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-6-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:18:58 +0100
Message-ID: <CAFEAcA8pwOgtRDW8c7dRTMPu2bOxL3osEdeJn3kKsyThcPgmqQ@mail.gmail.com>
Subject: Re: [PATCH 05/28] tcg/ppc: Split out tcg_out_ext{8,16,32}s
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Mon, 14 Jun 2021 at 09:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly require these in other context;
> make the expansion as clear as possible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Much nicer than those gotos...

thanks
-- PMM

