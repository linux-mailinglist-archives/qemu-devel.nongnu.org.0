Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE090365636
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:33:31 +0200 (CEST)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnhD-0004nk-17
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYnbw-0008GL-Po
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:28:04 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYnbu-00078q-KT
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:28:04 -0400
Received: by mail-ed1-x532.google.com with SMTP id j12so19348160edy.3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Du8gtK9JZBugw4muWLWn55qMtlPRK/OLVfRoWyxzrk=;
 b=z4BzjQ5Hp8IBcV6SWXVi+24mTdC+4C3pdW8X9fRTjsvvGTEeDpAhb6XA3K2Fm40a2J
 iYdA0ODcaJ0KrBNpUIdsdQPVX/+XRAgkbo12orTwMjroKI64TZPlfSZZck0mT+A1nuYi
 W2VptyNIEf/cbIj4ttDo/A4a/9UBlbw+DVcg0+rJFhTG3NzG5tS3wJSXyfcj/roHRYzj
 b3h8JXN+7cEJBNV+WzubPtqhfdSN9vT6mhccLy0cogc6sNtzOy57tFNOhhDp4AE0wK8B
 2JeljGyHjdrp5qinkQDjIl8fNxwzjtceE/Y7qzj4ouGGZ1j6WrMeWGdLqAOWQ2Hrq4NT
 1Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Du8gtK9JZBugw4muWLWn55qMtlPRK/OLVfRoWyxzrk=;
 b=jEddoUZEMQD8DQlEhCjVE26v+RknBB6AfSBkH95LXPWCA6FhSvHJlkCJ/hweP4HFJK
 BXpF/5YLPG9k1hMvGkFpRPXZ7PHsntV7USPfyjr11pY5DYjQ0xOwRQTxAVF0GZwJt2GK
 9FkKmP0sVkUj2LDEoTN25HUzrgXgvrNuGWoyUIPAgBtBYCsV1Y/s/lGBR7KRdw2DW0Q9
 GAR7miREtqnpn00WDDeLxyr9YqraBQ7ndEJZ22ceG1MhocxB3WnWOaV3u+Jz41IlArB1
 nLRZFGjvfBuMwTI+QAn89if7H7jokPjSpoVeKYZOmEDLlyN0INuRC9RPOObNQrLHX/3p
 oPrQ==
X-Gm-Message-State: AOAM530ssZmZsFsUEfo+BLEbSPV9QyFOflC8WbArxDT//pvOm4zQBWiv
 /kddZqI1Qjk3uo4rVtRLjrcLbanGPdOYx8ymSYG2vw==
X-Google-Smtp-Source: ABdhPJzbKCc7bn9mlEkm/ETpKpNOBv7B0vhPbpEAnNDnaPVpFDlcbg3Bspx38/KXzuzjX0tFZN4VxQi78ZipFEQoLRE=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr31108240edv.44.1618914480955; 
 Tue, 20 Apr 2021 03:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210419202257.161730-1-richard.henderson@linaro.org>
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 11:27:09 +0100
Message-ID: <CAFEAcA_Q4FNeoS2ru_Q+KiUMahj3hXQ-0msa2SFTZrx8fmo+7A@mail.gmail.com>
Subject: Re: [PATCH v5 00/31] target/arm: enforce alignment
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Apr 2021 at 21:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20210416183106.1516563-1-richard.henderson@linaro.org
> ("[PATCH v5 for-6.1 0/9] target/arm mte fixes")
>
> Changes for v5:
>   * Address review issues.
>   * Use cpu_abort in assert_hflags_rebuild_correctly
>
> The only patch lacking review is the new one:
> 07-target-arm-Use-cpu_abort-in-assert_hflags_rebuild.patch

I've applied all except for patch 7 to target-arm.next for 6.1.

thanks
-- PMM

