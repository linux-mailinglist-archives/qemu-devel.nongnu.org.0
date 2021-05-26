Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A9392176
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:25:29 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm05o-0000Yu-Sy
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llzzo-0005FB-4K
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:19:16 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llzzk-0008H4-PQ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:19:15 -0400
Received: by mail-ed1-x52f.google.com with SMTP id s6so3011982edu.10
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OYgI2l6wKSQC3iK2wQ6wZMXmqjegXbKeiYF0nCVjXSw=;
 b=xwHGJ5DTJxREk2Fb2u7gb9yh0i1NC8+a63BFiVUDVZouuIZ5K7dtzc34QcB1uatooh
 k+qbRG0+arq9FaomiL2xI57GtYLsNVyNSGDU1WYxIwF9MiZgP8f/H50PcM5abk9nJs5W
 GCoHLgiPmau1ZRkuW5KRZjnXm9lso1RJCZtvjMWB2Q8YrfFFV5uCIFDu8JGWsKsqDhbp
 H0SXJTJ8lw0C7wwIHMJsbqfInT5y2KQh7Otn5aLUTgyzYeWjjZWpaWqY5Fzl+wcEty5N
 4sNyaInD+l8UX47PxmWudD0Ef1dL6F2amsAo0yQKxM46BTbatB242aALy+FNQP29LRlk
 j6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYgI2l6wKSQC3iK2wQ6wZMXmqjegXbKeiYF0nCVjXSw=;
 b=MZwG/IJSBZ8VhJ3vAmGo641J0J86rVE5AF7LQ4kdH3C7+2j0TZDI12PtHWGSB/MtT6
 5ijkEck1snOPkJPwI9wl3pmr43qzk1jZPBWJ0TGngFdwVA4ccaIF21gHumhstPFrACck
 bJFzP7YpsWkhlzC5Bvm61lUrmAizLDSBKQM8QB+/rW7pA8FJVuRuWOT4GhJ7SkpZQHg2
 oDXcCY0/ntUxiNK4fI+OKk6o+d68FXsHaxBUQHiTowScKhZ6SmiT0P3mTmiwamgiFjbr
 mpF+gdBNIhVFg2wPqchdM7kuxlAET8poOW1P+uXoDzaYWndQ09myGp9EfLHZHjaIqwL7
 iLaQ==
X-Gm-Message-State: AOAM531A2MXM/BFKFNFWRlMpKfgfgUwACV0T4Hrs29y6FAYnMX0Ys6A4
 1prbwldFLOvHkLirA8sn1XvOHCAcNkF+fAXObnyWvw==
X-Google-Smtp-Source: ABdhPJzCkxd3SWgKzxYW43sElBFOrmbpyHK9NOAXfvrXt0ICNKpZTkwNymPPcoDz4qJ4Yn1bSy1beprbZ/CP1X1EMn4=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr53138edb.100.1622060346242; 
 Wed, 26 May 2021 13:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
In-Reply-To: <30eafc8be31446f9aecbc40f487467e1@tachyum.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 May 2021 21:18:41 +0100
Message-ID: <CAFEAcA-BnxgejNgo0XFU_aegdXfN2mFr9E6xa5BPRxHLdfSt_A@mail.gmail.com>
Subject: Re: Denormal input handling
To: Michael Morrell <mmorrell@tachyum.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 at 20:07, Michael Morrell <mmorrell@tachyum.com> wrote:
> I see support in QEMU for architectures which have a denormal
> input flag bit and those that have a "flush inputs to zero" control
> bit, but the implementation is not specializable and seems wrong
> for x86 at least.

> For example, in sf_canonicalize, if the input is denormal and
> "flush_inputs_to_zero" is true, the "input denormal" flag is set
> and then the value is set to a zero value, and if the input is
> denormal and "flush_inputs_to_zero" is false, then the input
> is simply normalized.

This is the intended behaviour -- if a target arch needs
"denormalized inputs should be flushed to zero", it sets
the float_status flush_inputs_to_zero flag. If it also
wants to be able to detect when this has happened, it can
then look at the input_denormal flag. This matches the behaviour
that Arm needs, and it is for Arm that the flush_inputs_to_zero
and input_denormal flags were introduced.

> I think the behavior should be for denormal inputs that if
> "flush_inputs_to_zero" is true, then the value is set to zero;
> and if "flush_inputs_to_zero" is false, set the "input denormal"
> flag and normalize the input.

> This matches what x86 does (I'm not sure about other architectures).

What in particular does x86 want that it isn't getting at
the moment? If it needs some additional variation of behaviour
we can look at adding a new status flag to control that.

thanks
-- PMM

