Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C53AEC1D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:14:51 +0200 (CEST)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLdS-0000Ew-VE
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLau-0005u9-5B
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:12:12 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLas-0003Ot-Jn
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:12:11 -0400
Received: by mail-ed1-x532.google.com with SMTP id r7so19403882edv.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0g3EcVPOGsHTviA25e5jblDV3YQjRldWq6mxICNTSc=;
 b=Yz7TSfdGuPudL0JZFM4Z6dUysfR94HxrVeiU4acMlHdor+WYudYkrxjddJWdhLP0Nc
 WHrNNQA9AgRva1qPhED0l8xfEaGmvf/xVRNsOclOXfqHrI1dOIrV3ifXWKG+WtFsTYAD
 XCT/RdDqWOZkL63xXlb7CbMkyUcXNo7GNW2KZ1UpOzkFB5ashsZ14/v8Dz6FKDBwC+aj
 1N/JIxstvnGYSflthbP+X+gEnS0J6CuYzbzBlo5tKdxBK8IimIR147La0M4kqJBk/b37
 XAP+vwHUeMNVq9V2ab22o0oWUCp7gAZVOdDSRFLiucCNqUUoPeCP1x5BKfHKcWlOny0s
 ItGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0g3EcVPOGsHTviA25e5jblDV3YQjRldWq6mxICNTSc=;
 b=CmJCoyo6Nf0EgP7dp3A6a11qYe61eYy4+wH+Q9H3D4wauUFUzUhPzRr7H3aEBgO/H0
 y7RJ2HoWxEXU8XJE0qsYSo/skE5gdvyx/J6s94u2FZnhzRLWrXAxdL19AduRT6kvJAag
 ju1+FiFCl/H7XwS9DcpXKZCiLJUgjBv0FYFihOzig5AvPJ+Hpas1eDiYuwfgXbDNvIYD
 zP6uaYVRaYCVt1/33thqVgp6A4/LxHb/xv12eV+GhmeXLPHMxt9ZThgLougg+J52nx+6
 3VnqfrUzUqMSPD+CQHwZuc+/kiidJipE3TjuU7ReJNNPdsqzPJBQe+VWcuaSbF1Lnlh2
 pLiw==
X-Gm-Message-State: AOAM532h4tbKKrIxEZM42y91iyfxu043T6ft/CO0VtT/a4W5oulaatIL
 hznlQD3+C066Ib2Si5wM1jjNCJjxiz8HD5lBZOcTew==
X-Google-Smtp-Source: ABdhPJyEKcWyXgstJI9OSn1bjjqRHnVwdU1n3CeGFuc3fdQx1md19lxJJjkAM/ud0bpW2JneM6aTZeBt6SA58NqLS84=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr21801842edt.100.1624288329176; 
 Mon, 21 Jun 2021 08:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-23-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:11:33 +0100
Message-ID: <CAFEAcA-5GVKL43R80jEx8q9OHS-P+Ey5AJsngzadjm5z+noKaA@mail.gmail.com>
Subject: Re: [PATCH 22/28] target/arm: Improve REVSH
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 09:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The new bswap flags can implement the semantics exactly.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

