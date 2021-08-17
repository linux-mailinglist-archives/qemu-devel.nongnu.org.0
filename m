Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9F73EED88
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:34:59 +0200 (CEST)
Received: from localhost ([::1]:33084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzF5-0004L0-1P
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFzEF-0003gK-6L
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:34:07 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFzED-0002Bd-M8
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 09:34:06 -0400
Received: by mail-ed1-x536.google.com with SMTP id q3so27495938edt.5
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1MvMgBdv+UxvN+H9aPaZ2vBwax8OAsyUQzPcCcPXy+0=;
 b=YE0I7YNf5bwlKwpxasB370Ll1x+jZosz/NDQWz3HydToCwZ6cL5sbblVKtjmE+FSBk
 BJCa8P28nJadFG9GE2Xx76afWICK+Aw+j0QQnb4kSekjVCLfc7SLsgfbl1QygDmq90Pv
 skPo2+EDyame/sj7TTnRzUFTTRAq6nHnkFLtH2ShvuhR37M2hqNswCV7950aNY+5aiuw
 WIohe+TQihmj+H5dMQ5MLcN45u7X8G55Q33XsRycqq+ZrU4izLBB7Ymi+lA2JGmYLLAs
 yTroat7l9t1ZfCiLL7NoJkCu+SrPtYq2UCS6MQhEqdDfBRjEOwIoIo+nZzq8OTyiYerV
 ODug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1MvMgBdv+UxvN+H9aPaZ2vBwax8OAsyUQzPcCcPXy+0=;
 b=Tm8g06AOyaTetjmzz5QMZefyKIh4+87wGp8rMH0kC/7YXtRDl9PBdFhYtsu+sf3rvc
 JpSeNIVRujhxpTNPjiAJL5b0ERQnOcM0X2EXXFSI6kU0r+QiiWFvFyt/EsXRMRFssmLB
 VnM947qujvf2XMEWZvghz9X/LJhpzJfLfrXs4m81cXTeapmvQH72aHW98BEcZBA6KB9P
 /LI3uuEU/1u0tpRCaZwoT/v08dWdXjy64qqPNTgBNnG4ETD6uYyMmxNEaDX+wwb8Jn9m
 9yoznLNebHEkusRVUPiirrk41C8p9lTriwLF7LTeshxRl/+Y763dc0Uc8val7rdhyK+o
 OHtg==
X-Gm-Message-State: AOAM533fdbkjjZunREsrTj1TVW5BuszdiX+9MeAaM9JvgLxuKuo5M/f9
 /2oDo5KPLASiE7TrNUO8lGJ0nKrU+az3HdMvFsVr2A==
X-Google-Smtp-Source: ABdhPJwv2FqytEQef4HG3XpXAcTd3R4tET0lLhMBZuad5nEY4i5zwN1fSRRjgpFosmmNo1QlDdWfngP3zVUgZDSUVEo=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr4194177edb.52.1629207244089; 
 Tue, 17 Aug 2021 06:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210721195954.879535-1-richard.henderson@linaro.org>
 <20210721195954.879535-25-richard.henderson@linaro.org>
In-Reply-To: <20210721195954.879535-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 14:33:18 +0100
Message-ID: <CAFEAcA-nH4xYDG4wh_jYcSZt9ahNrt3WK453tqwD-0mqYekzeg@mail.gmail.com>
Subject: Re: [PULL 24/27] accel/tcg: Move breakpoint recognition outside
 translation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 at 21:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Trigger breakpoints before beginning translation of a TB
> that would begin with a BP.  Thus we never generate code
> for the BP at all.

I happened to notice in the Arm ARM today a corner case that this
implementation approach I think gets wrong: the priority ordering
of exceptions is supposed to be (among others)
 * (architectural) software step
 * instruction abort
 * (architectural) breakpoints

I think that doing the bp check here means it is incorrectly
hoisted up the priority order above both swstep and insn
abort. We probably didn't do these in the right priority
order before this series, though, and I dunno whether
we get the insn-abort vs swstep ordering right either...

-- PMM

