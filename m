Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C56ADB85
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUJW-0006QM-Di; Tue, 07 Mar 2023 05:12:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZUJV-0006QB-43
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:12:57 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZUJT-0001ml-FZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:12:56 -0500
Received: by mail-pf1-x42c.google.com with SMTP id z11so7674218pfh.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678183974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/S7vCmQ6oJN2iQJtVl5RQSnCFa0uuxr0FbbyEc/0Ke8=;
 b=sduZ3+ft2DDqIUu91Ljz34pt5AI7XPcRtb2RnMdmD9rbCkbnKUI/y6obbBPDWpOFE7
 CNXQNPbJZQLD9X9lQ96Ga1Q2ZmNh0EUVpXqIHFl3yiKQRlxYxoVykrIzh7sD386BM4vd
 hKJqD/EGGkawLMfx65N+80EzFkHsbd8yi+9R8L4gPtosBqhRz/ADOzeQTLizvxbCAowN
 i0VU0cKpjrM7EQtUEjSRuacnozpjZlHwS5s0jgnlBlx7aCDKkZSTuKvsgx+80EndC8kB
 TWNux2q8cSacsV/KoCmplmTayvmts0OEfc7S1ABlT5TtKz8ZqERIRzh39ArpN31QhA8X
 5TJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678183974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/S7vCmQ6oJN2iQJtVl5RQSnCFa0uuxr0FbbyEc/0Ke8=;
 b=wa60w9tM+wK0yeDN+h2zV74lTg6OLAmDkecubz/Jjwk3gilRItZRiWvt0O+F4scHFm
 TzZ1VtWB/CXEr13y2iFtxszeeYUwEdA8WHa/yx0FkArp94GP60jvliLw0uPapxGIaVbe
 ftJpdB1Qumm82DWybXOrQXyj6wBmykJ+Ydzuh4ptM2XFGicVmpRKxk+n8+TMcQT2RuPR
 eF28dFgRccbFQui1UWxrp7LdE1MoACuNXckE/3ds7P4jjlJzUSxy8VM9ASnfV9a2yGZM
 vSbjXWBISbP2PUKpWDzCIWfrgf0ksY97JikzdmcdhvgDQQqGSLE8/Wx5PYFSM7p+pL2F
 SH3w==
X-Gm-Message-State: AO0yUKXvB0xmd4U8XV0qLydPfaWE5DZlBXlbtW0jD56yX5CnoSYFmSC/
 mzKQT+rQ/Tk7RXMjP3q18s8e3aZlFJoH32cNt7cH4Q==
X-Google-Smtp-Source: AK7set/DAmMRBxt9q21PdIGl06T5622px6EJS7zPKulaIVTblfBqmk7SKGn8ld6k/8IWEqwiyL/QBwYGPhB/di+s5Nc=
X-Received: by 2002:a62:ce4c:0:b0:606:63cd:506c with SMTP id
 y73-20020a62ce4c000000b0060663cd506cmr5940320pfg.1.1678183973922; Tue, 07 Mar
 2023 02:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-2-richard.henderson@linaro.org>
 <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
 <004c0c81-958c-ba34-a743-6f2a4a4d133a@linaro.org>
In-Reply-To: <004c0c81-958c-ba34-a743-6f2a4a4d133a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 10:12:42 +0000
Message-ID: <CAFEAcA8M+1jSK4+gzA6rkoQQY579RuBpMDM9eQk=aN5gPhHNbw@mail.gmail.com>
Subject: Re: [PATCH 1/9] linux-user: Diagnose incorrect -R size
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Mar 2023 at 21:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/6/23 04:56, Peter Maydell wrote:
> > On Mon, 6 Mar 2023 at 02:14, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Zero is the value for 'off', and should not be used with -R.
> >> We have been enforcing host page alignment for the non-R
> >> fallback of MAX_RESERVED_VA, but failing to enforce for -R.
> >
> > I'm pretty sure we have users who specifically use "-R 0" to
> > ask for "definitely turn off any reserved VA".
> > Here's a random example from an old gcc bug report:
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60681
> > and somebody using it via the environment variable:
> > https://www.openembedded.org/pipermail/openembedded-core/2015-January/100572.html
>
> Odd.
>
> Well, it won't actually have the effect of "definitely turn off", it will merely leave
> things as per the default, which *will* enable reserved va for 32-bit guests on 64-bit hosts.
>
> The only remaining question is whether we diagnose this oddness or silently accept it.  It
> feels like someone playing with options they don't actually understand and an error is
> warranted.

I'm pretty sure I've issued the advice "turn off the reserved
area stuff with -R 0" in the past, for working around various
QEMU bugs where it wasn't able to allocate the whole reserved
area it wanted to but the guest program didn't actually care.

thanks
-- PMM

