Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC830BC04
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:29:42 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6swH-0003m9-DH
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6suA-0002fx-7D
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:27:30 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6su8-0002QV-HS
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:27:29 -0500
Received: by mail-ed1-x531.google.com with SMTP id s5so9392337edw.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kDdfEeCYRik4cDZrmRBoM1D0iYOoCJUk5fPHfHXbR4s=;
 b=TKffWAJrX9ftbdpRiEe0SlFPh+SKCqeVMkUitQmiOBNBuQTeJ8Q9MV5ruurE/an062
 q0HBFfVyQPzGy+XeYj0Yhssjo4bynQuGPXBufvqiEWkQ1lLB570Qc18PrJHkkyGBHM1X
 OPxCJVBEcf+ceSEU8g/hwd48xwiPDq0gFHyANsmSST8snCpg9IQHxKlCo4tCL6lrNrfp
 0EFmx7xNcH2y1jWoshHFjNdUH0VT1QiRnr4O92HzzujqH9k8gbmuoZRaFFnSrKdtJVzv
 lr7nGQ58F/te3wDERXVkvUiWBBhZRGis8tpp8MA31kazHzXa9NnhaZaB1Df3ZPfN6G97
 52lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kDdfEeCYRik4cDZrmRBoM1D0iYOoCJUk5fPHfHXbR4s=;
 b=nNIQxqq7BFjYZ/gwkWMt9od1wXaCoh8v7bNxqmJneZ4NHMtxVPuz3FV/PrQL3QfjhP
 +i4QKlvZ7nbvxvB5jRk6lVu/bE2etq07GjcGdQrxvl6igELe+grs6+jbRABm5En3B+DX
 M3JaXVgLzZ0M+SHZ/R8MJoDLvYr7J2bRkplPt5AxK1BYN0Hvs5AAqE/BJ/gXqpLq6MpN
 oWZVaqbI4xReivLRcc9gxR5dBBV8iyn5WG89R/eJLNxpUQIsMlFQr0DUtiyhVAFHXmmF
 hWJ5EbhSZ/7RlhhwMl+i8PpNH3BzdMtJUF7Vf2wLjqQoeaBw6+JLmDeTFz3qkOWPFe13
 o6RA==
X-Gm-Message-State: AOAM533tdO3eRuvxTnEnivGFcNAuDzS+btvTdBNGXM3eSW+3lbyngXKg
 4UZQYARlP+k97dGfAbP5kT6AE1fuBZPlgFU095Kcdw==
X-Google-Smtp-Source: ABdhPJyjieMhue9m/ZSHg2DaVLDwtYXycxHGmUUkJTxE+YKG6zb01ySp2l6Xlmlfl+de9RAKiSEKO7TTlPVspSEazd8=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr22609762edb.44.1612261646734; 
 Tue, 02 Feb 2021 02:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-3-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-3-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:27:15 +0000
Message-ID: <CAFEAcA_bzd26RfYmtV54fe18aFiWsPSc5t644s0V9Ch+nGivHg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] hw/intc: add helper function to determine gicv3
 redistributor size
To: Leif Lindholm <leif@nuviainc.com>
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> GICv3 sets aside 128K for each redistributor block, whereas GICv4 sets
> aside 256K. To enable use of the gicv3 model for gicv4, abstract this
> away as the helper function gicv3_redist_size() and replace the current
> hardcoded locations with calls to this function.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---

We're going to need this at some point and it's nicer than those
hard-coded 0x20000s.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

