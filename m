Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C938433EC32
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:08:16 +0100 (CET)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSA3-0002O9-TZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMS93-0001xM-NM
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:07:13 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMS91-0003rx-So
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:07:13 -0400
Received: by mail-ej1-x633.google.com with SMTP id p8so1321687ejb.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=otzuO0skIc0PC0rlaw7Bthjlck94Sg9mjShRly5hAfU=;
 b=o8aj+OudYuFGiTgF1UYUlYJZW0bN7QGSEzBZOna+cBkvfw/TTuklgoZKT71xRi0kz6
 qQrZvHaXzZJZhrMgzFNqjaNcBUZJyRz7EXD7bvqBwOtFWwuuJy0MDextzPkGPrOltuH5
 nNvCsYoYsyvj/WauU1+qM7k2B86q9+0wA6q6hKRm5QiY0LRNRkXOWiNG8aRcOcu1+6/I
 0ks1XVRuj0Ls2YyLdpA2YUQfzmTkH5zackfnArgvFGuUcOMKSTw0dkjOj8t8MSyon764
 Tl9X5vckrKfZcLPvPku30QLHJrbfEBxVw9cPMFul7hs6jg/isPEE/eC6xs26WrhCFg96
 ws3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=otzuO0skIc0PC0rlaw7Bthjlck94Sg9mjShRly5hAfU=;
 b=H3ni89kaBOQz3vq8yJG+2qpMrW70M2ClakGrUAOoHOUGOtH66dvPNLZPMx82qW60IZ
 txpgU0UUMSDe4qErXBhnYUCe8eYwWyW7k+DjrlMAhsW0ba6unVXt/LI6O7tHyICGk6be
 bnpe7KuZQwf7seWcPrIklsank3pzaNZFxg3viYzQAeDLLSipHdL1WomJZOLDryA+vuER
 m33XWjMkV8/lsTBO9ykPAMGatVOmdi7s8dHbo9y8k0NKFIL7AaSvUqMiDsRstSXg0kgC
 9av0Yq+C4GezPcI7e4XqMdJYYH7fbJnrwOSUqpsOOjUSDnTiF8rBMN8MAPwubbI8JAQ1
 IfrA==
X-Gm-Message-State: AOAM531TV83JyPgiHJX9vkWXm1Bl16lvaWkXTav7sBbVN4nHHgXapkNb
 +WDBtLEhRdWoPfal5SY+7sLIw/4Ggz/7kUHKk/E/1g==
X-Google-Smtp-Source: ABdhPJwtbEIOBqeAr5NrOsVJEWHn03e1Cdrtqa1NDzQUE6SheNfZt3UA3nidZMdcL9tFgB5QDK0RbYlJ5tvS0Qdc1xk=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr34952420ejc.250.1615972029731; 
 Wed, 17 Mar 2021 02:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210315185117.1986240-1-richard.henderson@linaro.org>
In-Reply-To: <20210315185117.1986240-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 09:06:46 +0000
Message-ID: <CAFEAcA_UM=A7D6DH9JbzyACzNDso2kroGv7ZYMPD+5JtOQv=xg@mail.gmail.com>
Subject: Re: [PULL 0/1] Fix qemu_strtosz regression
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 18:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 51204c2f188ec1e2a38f14718d38a3772f850a4b:
>
>   Merge remote-tracking branch 'remotes/bkoppelmann2/tags/pull-tricore-20210314' into staging (2021-03-15 15:34:27 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-misc-20210315
>
> for you to fetch changes up to 7625a1ed013a042748753750c9d9b1a33c9cd8e0:
>
>   utils: Use fixed-point arithmetic in qemu_strtosz (2021-03-15 12:47:08 -0600)
>
> ----------------------------------------------------------------
> Fix qemu_strtosz testsuite failures for i686.
>
> ----------------------------------------------------------------
> Richard Henderson (1):
>       utils: Use fixed-point arithmetic in qemu_strtosz
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

