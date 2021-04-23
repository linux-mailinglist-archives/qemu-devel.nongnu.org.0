Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA836909E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:52:16 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZtPy-00076o-IW
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZtOu-0006bz-LX
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:51:08 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZtOs-000748-NB
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:51:08 -0400
Received: by mail-ej1-x62b.google.com with SMTP id sd23so64595109ejb.12
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 03:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZL31P3b8xbI7F66knfM7Sf7yPY5cJAs+T8XyJUzYyI=;
 b=jyTqUwePDlSCfr3h9G0lV+H3fW1C1J2Fv+jxiFtO/oHGO9hzpJOXuCf8KR1ojGkpw1
 VJXP1z5RVpqy7awaOjXoEc5kPiisL9WC5RCQBbh0xSaUYihjFuAEtdQdDLNYw55GVmAj
 Hud0Jqb+zzTrfinr4cTeo85JNemdBDHFczSyH7kS23CDNkvDXugjJfbKP/q8wxhyQWI8
 5OyW9p/zUpvoaC71qdfai8Wz1C//Y5U0vawgmQ4jT5EDKWmZHs/K95ReWJgrhbH25Sxy
 E1aKJ7p0PM4del0GRoFVu9vYR92q8CDrFl4mqlbDILNMGa2TRuH4ypl0GOoCivxxK2yY
 lYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZL31P3b8xbI7F66knfM7Sf7yPY5cJAs+T8XyJUzYyI=;
 b=OQJUIGQRWmdQLSGq1Yk6ZHIAdf86f7G3TtMJxwB2djdcTSumSw7uV9OMymN/Jzf0h1
 Rf/AaZHxdV1rqYZTmKuTqebShGKhOjLOkVcz8aWRARzZO3ql723ZjemfBLuECqHq6K7M
 PREfaYqEPE418I3bUwMc1eChClg3fEIlqCjS14SJii3we4f3gLk7glEkPJ91rprMjTbk
 ixzw8HNk5ILH715NQn+63NGa1QBOoJDs3gLDHCMNm+z/FVBx9Cp/oaie18L+e5ibVIST
 rafRuSIo8I94Amdek+cFek+xFwhJy6/KSC+JBFug4Um69lKgJ8gejUQIMSkQ/MSW5LMK
 GZmg==
X-Gm-Message-State: AOAM5312QKmIwTPzcKZZUTxDef9S2qa6vQScP2Zb81+eEiZKafGN9KcN
 o8+jrmW3RhuBApmvgZdCvQUZJLkVd0VZn3nu51yb9A==
X-Google-Smtp-Source: ABdhPJwOhVBTCMvQ9aUey0+S2wheMUfhculHhYIUK14Hgi2wFeVnYCMiJR6+Uqx47G4PrFeqtzBdNU97bSLLqL2bwmM=
X-Received: by 2002:a17:906:93f7:: with SMTP id
 yl23mr2492844ejb.407.1619175064892; 
 Fri, 23 Apr 2021 03:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210423052127.512489-1-its@irrelevant.dk>
 <YIKjmTAdVLo0Hz+K@apples.localdomain>
In-Reply-To: <YIKjmTAdVLo0Hz+K@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 11:50:09 +0100
Message-ID: <CAFEAcA9YHzMY_otap8siMeWHH0UviXQemAr7ncBXuhoa8Lwfdw@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 0/2] hw/block/nvme: fix msix uninit
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 11:38, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Apr 23 07:21, Klaus Jensen wrote:
> >From: Klaus Jensen <k.jensen@samsung.com>
> >
> >First patch fixes a regression where msix is not correctly uninit'ed
> >when an nvme device is hotplugged with device_del. When viewed in
> >conjunction with the commit that introduced the bug (commit
> >1901b4967c3f), I think the fix looks relatively obvious.
> >
> >Second patch disables hotplugging for nvme controllers that are
> >connected to subsystems since the way namespaces are connected to the
> >nvme controller bus is messed up by removing the device. This bug causes
> >a segfault but is *not* a regression and is related to an experimental
> >feature.

> I know you have a lot of crap on your plate right now, so for the
> record, yes, this is a regression, but not release critical, right?
>
> I am not aware of anyone depending on this unplugging functionality
> (which according to Bug 1925496 is and have always been flaky) in
> production. Basically, as far as I know, all known uses of this device
> are for development and/or testing.

Thanks for the update. We probably are going to have to roll an rc5
for the network-interface hotplug crash, but it sounds from your
description (especially if hotunplug has always been broken) as if
we could safely leave theses fixes until 6.1.

thanks
-- PMM

