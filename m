Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE1B48F67E
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 12:10:40 +0100 (CET)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8gxA-0003Rk-La
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 06:10:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8gvN-0002Jw-OP
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 06:08:45 -0500
Received: from [2a00:1450:4864:20::334] (port=54810
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8gvM-0002lS-Aq
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 06:08:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id p18so10784878wmg.4
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 03:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FMA6ooDKJVyAtxR7p2leDvZKznMCxarXJ3rs4D6zjE0=;
 b=CKJZiSWKR9NdoNJ2ayioHmYGsjEEe/v4B9IQu+IUfEe9QS7gVEpj2GKU3conSjisRn
 Yw+lOfr9MkfFcSMT95u6SIU1xBZzL+PMdAf8+mLen+zPMXx922nvIX7sfCdfic12m7VX
 KT4cWvxEfsCllHokOR07G99bNhgHr4LmHhH4OKpHRN8EF2jtEV8eampDvRf/g8alUceD
 IcP3xTzm5kk6qUS2vHB4z9E8Wwx33EahD/fg69irjv7Z1Ep3mIGRK4HEjixLJzZKRlDf
 +KffGf2UxybHbtSzQgx903WzkZ0cQoS8oNJwkLY937Mmi6xkgejdmbH8g/HcDKt9m9gq
 8hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMA6ooDKJVyAtxR7p2leDvZKznMCxarXJ3rs4D6zjE0=;
 b=r7JU3odg8FptMKWUdCv9lpBQIRjOgCXpialkd6AZPLO8TTWzNgiWjSn7LP5bf/tiRs
 jYW5QUrD5MryZ7ImsvRFDy/4Q/tArAUts1YThXBVmOTcbXrun6CeXU9gMnHZ83yYWkf9
 EbzTt7IrPxtSrH8CK+sR2z3BMv/7crJ4twydRAHOOa2Ezs3TY0SOF8RX20FgMrnDpIhY
 +q2Gmd/nEkrZDvglOUW9RYk6EN6yGed95u6lTDzfdV6eKQGYQnbv06mV7PPZwNfxqwuO
 EMHCDG1LIxUkn4vn42NrwmnMNNkDd/YwuaKUh80jF9rsksryNkjua7WMo9rqp5Aw77fd
 5eMQ==
X-Gm-Message-State: AOAM530v65HnCq13btPl4XnJEJDbo9XXBxnK/0zJNXV913PlujIrmFwu
 BkWGHY/kHsboVTRgDAB5ee8PWDb4y846bkw+qbOlrg==
X-Google-Smtp-Source: ABdhPJxbG7efGGw3gKJNtSRl0YrWegC9wKZXHmRa/C3CLa95Nu6xap5iwHrZK/uKaEVkcIpKfoAzC6Dt40jBQmDHSXY=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr940552wrp.295.1642244922751; 
 Sat, 15 Jan 2022 03:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-17-imp@bsdimp.com>
 <CAFEAcA9ikK-GV6fy35wZHpTKZkQ8jD8=xm1z+25OdPG56yS=Ow@mail.gmail.com>
 <CANCZdfroBqUPuu8SU5-WzbFP25ansqgmf==XTcoMRsRGim5WJw@mail.gmail.com>
In-Reply-To: <CANCZdfroBqUPuu8SU5-WzbFP25ansqgmf==XTcoMRsRGim5WJw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Jan 2022 11:08:31 +0000
Message-ID: <CAFEAcA9wmfUKW=2C6sZnDA2JT5=C-kzKB1p+xyS9Z81WroxtLA@mail.gmail.com>
Subject: Re: [PATCH 16/30] bsd-user/signal.c: host_to_target_siginfo_noswap
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 Jan 2022 at 06:19, Warner Losh <imp@bsdimp.com> wrote:
> I need to work through those things in our development branch before trying
> to fold them into this series. And I'm not yet sure the right way to do that because
> many of the things are likely to be largish changes that may be tough to manage
> keeping this patch series in sync. So I'm going to do all the trivial style and
> tiny bug things first, then tackle this more fundamental issue. I've thought
> about it enough to understand that the code in this patch series has some
> conceptual mistakes that must be addressed. Having this very detailed feedback
> is quite helpful in laying out the path for me to fix these issues (even if I don't
> ultimately do everything like linux-user, I'll know why it's different rather than
> the current situation where there's much inherited code and the best answer
> I could give is 'well linux-user was like that 5 years ago and we needed to make
> these hacks to make things work' which is completely unsatisfying to give and
> to hear.

Mmm. To the extent that the signal handling code you have in your out-of-tree
branch is "this is what FreeBSD is shipping to users and it works more-or-less",
maybe we should just accept that upstream with (with comments noting that
it's got issues/is based on an older linux-user) and then update it to
match today's
linux-user as a second round of patching? If we have a definite path to
eventually getting to the right place, I don't want to insist that you update
all this stuff in your branch first before we let it land upstream if that's
going to burden you with massively more work.

-- PMM

