Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E223C946
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 11:35:55 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3Fpy-0001vz-2E
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 05:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Fow-0000qk-4M
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 05:34:50 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Fou-0005m0-ET
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 05:34:49 -0400
Received: by mail-oi1-x242.google.com with SMTP id l204so10261203oib.3
 for <qemu-devel@nongnu.org>; Wed, 05 Aug 2020 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=St1YfYYWsh60Fl2sbgBwDYlw7o9AnBMBdVT1RxVRkfY=;
 b=vHJ0eXp9GszrjJPzaejUsmw+xnUNpDEOAD7EDOArvUY86nfFf693HFMVACX2t3uen7
 N8U02nxIG0Gjwmm+DdjMPtb7GZdrVU30M/b1GQwU560vzg4nlAFOnsk5pIdTw/4pPBac
 aIeihbUyvLpIz5uUDW77gY9cxt8OJmFNgoEvhYf5Xks5txgRrGJ4lX7GzZoDxSOc62Qp
 2Z5cKLecg0PLI51rW+794HJ3ooKrgWI41pX5k4cpTyRD5V1qsM+lv8/Bq5H2LA6kSVpF
 jGX8gMFY2zCcGyoyJzttdzOkGmiMv207KNmxlA6OUrUqUwO01kLIYMypWgCVaVoXxnf5
 MZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=St1YfYYWsh60Fl2sbgBwDYlw7o9AnBMBdVT1RxVRkfY=;
 b=qWr2WO8xStgaS8vO2KFuPtszWbQyAPRYOGnwLt3bWlcxXQ+/XvK40iFZLgPMym4vMn
 LYg7ezZ6wTJFPGv9S7JgVUkAIkrd5Ir2EBoNgZeajnRB+4Iu3xa4iywOTgpj/ycWsRpF
 7vw9Bpi15IHjOpNVe7y3DOak7y5KyAYtelRjBcvoKwxzJGNPc9QQpN6jiCPqGP3z5inp
 tdDGd53mYNUdVW80DVy/M0if4axXZ2mF86g74b05INNxBU+A49bL90qrozjxF/Um37HH
 TXisHotOug1yGitU7wzvgblGXQrxcZXt229DezkL6TDdm5mPiCsO7C04Zviu5nxjYUz0
 LY8w==
X-Gm-Message-State: AOAM532c+ywifSCcyDnJPq0Oi9MyPf6fobSMiUZ8MgFoWTde3u2gfILQ
 WqefFzrCZvbCOuxcJy5rutABUDw6r8t683s7xsgLkQ==
X-Google-Smtp-Source: ABdhPJxvJnzxfRRmm/8cpEUBFSbuAdn0dgj9qMUummw8E4O4nusYuptGLq051GpWm6YCjaq4g61iD84d3EpD1h+Zwtk=
X-Received: by 2002:aca:50c4:: with SMTP id e187mr1899266oib.146.1596620087012; 
 Wed, 05 Aug 2020 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200803165409.15099-1-peter.maydell@linaro.org>
 <6b9b926a-0a46-1660-9a85-bae29cd56cf9@linaro.org>
In-Reply-To: <6b9b926a-0a46-1660-9a85-bae29cd56cf9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 10:34:35 +0100
Message-ID: <CAFEAcA_HPkO7w7LJH1GoqPGPy-7hLUcCmZpDBjLzDcKUCmpaVQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix Rt/Rt2 in ESR_ELx for copro traps from
 AArch32 to 64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Aug 2020 at 21:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/3/20 9:54 AM, Peter Maydell wrote:
> > +    case 14:
> > +        switch (mode) {
> > +        case ARM_CPU_MODE_USR:
> > +        case ARM_CPU_MODE_SYS:
> > +            return 14;
> > +        case ARM_CPU_MODE_HYP:
> > +            return 16;
>
> Hyp uses LR_usr...
>
> > +        case ARM_CPU_MODE_IRQ:
> > +            return 18;
> > +        case ARM_CPU_MODE_SVC:
> > +            return 20;
> > +        case ARM_CPU_MODE_ABT:
> > +            return 22;
> > +        case ARM_CPU_MODE_UND:
> > +            return 24;
>
> ... making all of these off-by-2.

Yeah, this is the bug fixed in v2.

> > +        case ARM_CPU_MODE_FIQ:
> > +            return 30;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +    case 15:
> > +        return 31;
>
> I don't see that R15 is mapped at all.  Is this really reachable?

It is -- you can get Rt=0b1111 for MRC to APSR_nzcv (as well
as for various UNPREDICTABLE MCR etc cases that will get trapped
here that we have to do something sensible for). Rt=0b1111
is mapped to 0b11111 in the pseudocode (see
AArch64.AArch32SystemAccessTrapSyndrome()); it's just not
documented in the text (yet) that this is the required behaviour.

thanks
-- PMM

