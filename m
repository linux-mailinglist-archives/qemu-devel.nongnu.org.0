Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4D39F324
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:04:47 +0200 (CEST)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYbG-0002ho-5z
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYa7-0001Ea-Oy
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:03:35 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqYa5-0007o0-4S
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:03:35 -0400
Received: by mail-ed1-x52e.google.com with SMTP id r7so9440981edv.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fAK72jQWfvbsBPebqRLDxZshnWftBCmkAJFK//pLDOs=;
 b=MMS4LvU3GfiYpykcgTlH24GLc+5IUNl72PRoVnTFfozRbLnZrbkg6VFlVse6wA/Xc+
 LQxzcMiSizBpTxM/AEHaZFOjz4Mqve6+sW79on2IryOksenEiJBNE4RBnGh3/TWk2wa0
 +ZLe1E+oiGy/PV2Tkn2AfJRHKI2vCOUe4/cKnT46OwNttXPdjlHJFTXw1M19NLCbvx+D
 P1XzdkT7VZs0mOSiW+0ZwdfB7IKnwf5u/jTWFW2N0edHSN6GROJNgJY2qj/rd639Mt4p
 r/9hNEGu+hnX5wPHIOLmmK7mYd7Yj8g4/j0auXBp3IP4hkT01Zcz4RJkdOFnnI48sarP
 xv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fAK72jQWfvbsBPebqRLDxZshnWftBCmkAJFK//pLDOs=;
 b=NZgjmX+jcX5znG1Gt7xZYQbCNH4rbQEXFyJPT7Ol2QwYh6uhdv4djPoKrFQ7cAVcAj
 8vjPt95C3Qb6+t9P8Pj5oFVxjO2Sxu0+zF0PJylq1e/PYhwT8xZyPRr/nfOCMCcMlpLi
 hDKs946oiC7/4IAheBSVOj/lMeXxGo4pMxljcIHhMySxO/plJBaIevNwCIHuLaU2YZ71
 2jTdiqd9TmnDZGRM0/ugA9AY22nabztqsTmM2j2fqpvyujERemxayoGAj/EV7CmJf0Ip
 W1RkWOnSsEvESI/j3NHo1Qe3dF5FOzyYglj2cwRvf39kl7aqc7FsC/d7NEDnysyz4oFq
 1G9w==
X-Gm-Message-State: AOAM530S1fCak9iQTbWiDtiFSUGrIqbGsCjJCBPAMFKmU51oj/xqHD/J
 iLeQU8cgmg2/msrOLUx60sjdWqTs4n6Of/60TtxtrA==
X-Google-Smtp-Source: ABdhPJyj7LS4/d54tY7IQVZ8IUHumNRbw1ooFAk91jQ2c+rHb28wml5RsUEktVwHSXx247pEWmw/jlfxyTALqlpK5+k=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr24416453edu.52.1623146611697; 
 Tue, 08 Jun 2021 03:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-2-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-2-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:02:58 +0100
Message-ID: <CAFEAcA80dnOL4CmNO6wPa9FyrojcyRZPuy-3zLuOYDdf4xNvDw@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added register definitions relevant to ITS,implemented overall
> ITS device framework with stubs for ITS control and translater
> regions read/write,extended ITS common to handle mmio init between
> existing kvm device and newer qemu device.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c                | 240 +++++++++++++++++++++++++
>  hw/intc/arm_gicv3_its_common.c         |   8 +-
>  hw/intc/arm_gicv3_its_kvm.c            |   2 +-
>  hw/intc/gicv3_internal.h               |  88 +++++++--
>  hw/intc/meson.build                    |   1 +
>  include/hw/intc/arm_gicv3_its_common.h |   9 +-
>  6 files changed, 331 insertions(+), 17 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3_its.c> @@ -129,7 +132,6 @@ static void gicv3_its_common_reset(DeviceState *dev)

>      s->cbaser = 0;
>      s->cwriter = 0;
>      s->creadr = 0;
> -    s->iidr = 0;

You don't need to delete this -- leave it for the benefit of the KVM code.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

