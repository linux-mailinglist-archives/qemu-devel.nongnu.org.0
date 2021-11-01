Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C84421BA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:35:35 +0100 (CET)
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhe1m-0007oW-LT
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbuJ-0001S6-VD
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:19:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbuH-0006al-Fa
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:19:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b12so24925455wrh.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V2yL+xgcThm6PQ2A/lAI34feMIWyDirpqVtqKV3Dd2Y=;
 b=WVAtcGT5RB+nHi2/0xz1ovPW+uWZ9lsWyZWtywQ5s2Lb1cBtMdvfrsSECSk1DYEHRq
 jj9BHCWXDXQnLNkRx63J8zXxHdpw60+PVJUQRtkJoFWZF2jOGxCrwDckCFXKoc9XJ4qu
 EF83t7syMlnkQomHbZcg2mFkrW297MLqOV+3nSUfo5mN1baa857CriNsJsQXiLdbU/0h
 74By8+hLKFaxQ+AZ8sSPWqVNPSqO+a1Mw1zwNPQajDEKzOVelO5Ra6S9A98iR8ImK6ik
 2kFm4pz0bxy6+9UoVJyGRdC7LDriSld6ymwvCPzyAUyZKGIS+Qj0thyxdBzuzm89iihQ
 5VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V2yL+xgcThm6PQ2A/lAI34feMIWyDirpqVtqKV3Dd2Y=;
 b=rrSfT/k+/7gmSl1Tao+SZYeFiFT2xw1AwKJ66VKB2mtPMQcRsm/WbzgC6MKWcD1w08
 qsYKRs3haus0kU1Bhh/rXnv6LWmLzAsSEPoI664Nv+1vCAiPjIqwjWmTxQM5A6ABw5wE
 55Hyie16faD2ZeRhgjHJBg+2VbO2NTKs2okFrEFwD866cDQCKzNTHir1zqweupGLm6c5
 wEHG6UM/bs54bBi78JhwkSYwzTzE4kCpz/orcvTko2Ad2U+SoHa1fAIWqvP/20FVfcMa
 KBuBFEQnAXm/YcpBrqvdBr78lSlyAGOnrqbcAHclEePnwMZLFKicKKWyTDyMiI6kfg4i
 +nrA==
X-Gm-Message-State: AOAM531DjwcpjUsXhoRBLun9nS+s8XManHhg7t6CzzWKgdfQ0vYirU1u
 0shIY669CreIIQ2Yq10M0TDWsMhFuHc2PjOqv6kpXg==
X-Google-Smtp-Source: ABdhPJwEqfDi77Imgnk6StXV3MEaQHJ+lgko37+sJZXJryJVN+9+dOvlDVAxuyWvI7+8PK7zcgwMt9dpwX0+iYaCJJw=
X-Received: by 2002:adf:e984:: with SMTP id h4mr36069820wrm.149.1635790780237; 
 Mon, 01 Nov 2021 11:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211026071241.74889-1-agraf@csgraf.de>
In-Reply-To: <20211026071241.74889-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 18:19:28 +0000
Message-ID: <CAFEAcA9VzPErsiAVuwAogh6_GDXvGZSsKSMSK=HAiTan2NWRuA@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kettenis@openbsd.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Oct 2021 at 09:09, Alexander Graf <agraf@csgraf.de> wrote:
>
> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
> into user space. For MMIO however, these have no meaning: There is no
> cache attached to them.
>
> So let's just treat cache data exits as nops.
>
> This fixes OpenBSD booting as guest.

I agree that "ignore cache maintenance ops" is the right thing
(among other things it's what KVM does in kvm_handle_guest_abort()).

But CM=1 isn't only cache maintenance, it is also set for faults
for address translation instructions. I think (but have not tested
or completely thought through) that before this you also want
   if (S1PTW is set) {
       /*
        * Guest has put its page tables not into RAM. We
        * can't do anything to retrieve this, so re-inject
        * the abort back into the guest.
        */
       inject a data abort with suitable fault info;
   }

Compare the sequence in the KVM code:
https://elixir.bootlin.com/linux/latest/source/arch/arm64/kvm/mmu.c#L1233
where we check S1PTW, then CM, then go for "let userspace do
MMIO emulation".

It's possible that Hypervisor.Framework handles the S1PTW
case for you; you could test with a stunt guest that sets up
the page tables so that the 2nd level page table for a
particular VA range is mapped to an IPA that's not in RAM,
and then try just using that VA and/or passing that VA to
one of the AT instructions, to see whether you get handed
the fault or not. (My bet would be that hvf does not handle
this for you, because in general it seems to prefer to punt
everything.)

-- PMM

