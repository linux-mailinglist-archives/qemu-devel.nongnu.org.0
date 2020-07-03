Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5622138B4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 12:39:04 +0200 (CEST)
Received: from localhost ([::1]:47878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrJ5z-0002OT-66
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 06:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrJ4G-0000SP-Iu
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 06:37:16 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:42881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrJ4E-000554-Ni
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 06:37:16 -0400
Received: by mail-ot1-x331.google.com with SMTP id g37so2622901otb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZcX3ndpVQgJvadTxo6qh2NP64rCXUcYtfO0TglJILvQ=;
 b=CFzXIDMfsOOAKs+cwvSq+CPlYoAJLrTRh6O9z8t4eQ0NvP+Je4IBz3IPJNfpn3cxAG
 DkhhQ/3groUsjTWuvniWxubiSqN2+vqyvaJoCSEMABBTgyH4x5q0i8Rin5R6PPoilyk2
 9Uw/kWA/Ny+IJ34Ztyo4FfMvaYYrSFaHFWxe89LXITqJ9Lolp2MpArr91z7UsFChdwMu
 V8glk8m73//yOnFON+MbHNBFSnjrMzYuGmuVYN1TaSonpE6pcKDcp83tP/qKGELpQhyX
 lF2HTEVMoOW2Nbh5hqqPmoolLU7nq9cPtzsNBUQCYzywLXTtIiEMLBpoA+GUATOvBTu/
 g69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZcX3ndpVQgJvadTxo6qh2NP64rCXUcYtfO0TglJILvQ=;
 b=idYczS+zCZv99NbbhJdmXAciUVIZk1rKPEWPR0S+qv1tqWTLmk0WGS/tQhHDZs5x/J
 aR9LP+v2YRwjRwezWP6xRKHSuqW3zmGh2rN5SfQiebH+1cClp+w04UTIicAW7/LQuC5e
 Oc/bTmSRi4G92SPumUeDB8FzaAjrJjSYIkEcR0t83k5YtA4tJKUYMOqemeukneTmuKNB
 PFN+70RADscJV6aQxsfAC3LIYA5FY33SrAUjYVZ8uMMldfziZ0iiAQNpblsdz+KkiaqG
 VDP1IJ+pfmKb2ISbZyxRacxxOheQBtQovgT6BmSVuEf7oEinTNQ0DqTIwjZrib7UzzS/
 DRTA==
X-Gm-Message-State: AOAM530Y5jCi+mdSfIq6n51SA7xFUzMnY6nRX1OLXPQ4kghhubV2Zpld
 pUbGAPb3750HZyxnBYkwlrXCSuB3EXhzyB6XOsmywA==
X-Google-Smtp-Source: ABdhPJxtcHZVoOmYQcKmDpFxytZ4Ppxw3kMY+SaQKWMfDkPIzUbZTOY5Nf6o6EExjUhYC3TScodU/gJoP/BGgSHKxow=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr23952809otk.221.1593772633484; 
 Fri, 03 Jul 2020 03:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
In-Reply-To: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 11:37:02 +0100
Message-ID: <CAFEAcA8RU6fS8PX7LMhn4U33nKoRvcO_mnyBFcmW3iOpA40sCQ@mail.gmail.com>
Subject: Re: [RFC] virt/acpi: set PSCI flag even when psci_conduit is disabled
To: Heyi Guo <guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: yitian.ly@alibaba-inc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Jul 2020 at 10:44, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> vms->psci_conduit being disabled only means PSCI is not implemented by
> qemu; it doesn't mean PSCI is not supported on this virtual machine.
> Actually vms->psci_conduit is set to disabled when vms->secure and
> firmware_loaded are both set, which means we will run ARM trusted
> firmware, which will definitely provide PSCI.
>
> The issue can be reproduced when running qemu in TCG mode with secure
> enabled, while using ARM trusted firmware + qemu virt UEFI as firmware
> binaries, and we can see secondary cores will not be waken up.

If you're using a real EL3 guest firmware then it's the job of
the guest firmware to provide a DTB to the guest EL2/EL1 that says
"and I support PSCI" if it supports PSCI, surely? QEMU can't tell
whether the EL3 code does or doesn't do that...

thanks
-- PMM

