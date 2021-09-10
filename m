Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D68406912
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:27:17 +0200 (CEST)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOcoV-00046l-PD
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOcnO-0003NE-K3
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:26:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOcnJ-0007Np-LI
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:26:06 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so1651477wrh.10
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 02:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=alOc453SYFs6ifCYhHYw43zA4dMwryzYMBKAb/tIUeU=;
 b=BR6fBo8S8+jtuUohvM/pZl2S9Zw6gQF8qC5HjB0ztH23JJWyWtpAkfQHiAUkxkJ2VV
 CKwf/ReONk9OGt68N3AhkGaELOzMalHOzrbia8UbkOHbhWoD3pqM6PBrD4gpO+0KeLIb
 6lBHDWJ1L+pbwEf6zyrI8T/LB0CtOAiCBFWNvF6EqVCDfNaGA2OGzJ0tJUFSMzdCwuoY
 a8LK4nUFBS2pfy0RTEbuIx9xhsyw739H6lY77iAZ8JVIRss7gPl4m3+RnlXfAjvvbmwg
 fn8D/SGSd0Z2YCslkBdsXahPk9HP4rLjrKPglG7Sz02kUWzqfJAjguUF2Y4oDgs8lGBz
 MC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=alOc453SYFs6ifCYhHYw43zA4dMwryzYMBKAb/tIUeU=;
 b=wknoad1MJRLszhran3cWps1Wc6ZqWB82lWSa6VyNwfZpBLjXehbkbbCDe0escAwee5
 s1hmx5ar1ya9kCXVl3NbJlvt8iQEiH3qtg0t2s7EUjgRViTw1XrU2BBVMmx7eeBVOGru
 COicL9+6b+fucLaWb4hTlLXnM1AgGJbd24sODnk4Zpwpq+w6V0v/2o+K8ZOH5eygtl4/
 PkI8qXJcP+n/SNNWAD/jxxRKaKc4FSgHxBv1iMnhAGFlcBkjiuviOjd7Jy08Zw2A9hb+
 acbFqrWyADW90fSFgVqAQ8CWTxl2KK4aiO+e5JjGyUfxyeNPVLbnBYll/9LmFznXxMxI
 3E3g==
X-Gm-Message-State: AOAM532Xo1QTxvduvLiKalXqaQUArYQEF+UJwLXHfKnv9yzUtQqzlm8+
 xaut3GajotzEZw5jOBSqKsCGzeMdkOGogBFid7KyWg==
X-Google-Smtp-Source: ABdhPJzKyrOo5KebtPqtpOpe4A0paTtDKJDr4+Y/AsN5906nP9hc+Bn82MzrEa8+/DVJ9+Wi1u5znGreGxtSQvJM+FA=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr8446583wrq.263.1631265959551; 
 Fri, 10 Sep 2021 02:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
In-Reply-To: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 10:25:09 +0100
Message-ID: <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
Subject: Re: SMMU Stage 2 translation in QEMU
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 Sept 2021 at 21:18, <shashi.mallela@linaro.org> wrote:
> I am trying to understand the approach required for an emulated SMMU to
> convert IPAs(from each qemu guest) to PAs(respective host addresses)
> using stage 2 tables.
>
> The questions i have are:-
>
> 1) Since SMMU stage 2 tables are expected to be created and managed by
> a hypervisor,if there is no kvm support,who is responsible to create
> the stage 2 tables in host memory? is it even a valid use case to
> consider smmu stage 2 support with no hypervisor present?

So what exactly is the use case you're talking about here?
Do you mean "purely emulated QEMU, but using a host hardware
IOMMU to do device passthrough of host devices to the guest"?
Or do you mean "purely emulated QEMU with an emulated SMMU
that handles accesses to emulated devices" ?

thanks
-- PMM

