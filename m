Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20348DEA9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:12:11 +0100 (CET)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86SA-000702-Ie
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:12:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n861T-0007gf-NH
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:44:35 -0500
Received: from [2a00:1450:4864:20::435] (port=37683
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n861R-00076h-1w
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:44:34 -0500
Received: by mail-wr1-x435.google.com with SMTP id t20so4590041wrb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gAkuspT+WxiB8nOiqUKF2sNvBMMN/6bAVyIrvsrensY=;
 b=qDCQA5ns93Ww1P1AekPy+vPMRnz+sG1NFtEiBt8bwhmgJsTsN+eTXXhXM62wrThGvU
 cushOUgvX/1cUKSeNaeAywtZ0Rh2zkI4KsGxoXOY0zj1ArtI5D1u0gjICZNIZLysv83P
 u6h1R4n5pInPQQQE4DC78Z81Ux4QVkPk9TcNCfTpzaAHkaj1/imY54b6KBr8lIsv93Ay
 +LdG4FbGiIfNhU8C79XzyRH4zEDfXJD2tBzmomVdzsByPmYtPjr2ROP+mZCq3xkH+C45
 Nfc483PuNRsB+alj37Uss9/3TcQgZU0CutwTUttmBUxNOv2o8zNcHyMJQl4DeHHDOx8I
 lqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAkuspT+WxiB8nOiqUKF2sNvBMMN/6bAVyIrvsrensY=;
 b=263V3GPvgleixSvl9cqRptNvCtkNKQFyAIIn6vR6zy7sC2YXaah8EdG00qTwOsJd4X
 v29EwKCGWu48aYXz2YutJ9CzgLObjEPQppTOMGUZCwScLdflzE28Q07Bda7/sO1Nr7qB
 Dzq/04JhJphE5gUg9mEYEjigTSH5PQAo0zoCskLRU30exXwuGbJQEF4xUi+ti56z4fei
 haO3VHx/tSOaYFIGzlIdJVsJaf9otUxI1ClixRp9K4CzGQGxZ/e6iHbH99vuwrdJJ40b
 YOMItWBTgvLC5iCMOfO3F1N+Oc2+GvqaxTGrPKFbtpxiNjFseS9aMv95vvzLT2rsMh5H
 dGXA==
X-Gm-Message-State: AOAM533AHEg1/dJj3oRWEayEc+2NdDS39Fm2e9vvQVfhtNIut7/4CJtg
 iQ+KptzOpub50sQxqAQAQdRccgN8fJ4QgxeML/gSE8IAk84=
X-Google-Smtp-Source: ABdhPJwkGFJjtLCOcIycvL5rsUxqFrSgHF1TbP2cfchaGYaoeoW1T6hMcwqCDzz7WSw9Nls5oj+srpBx42foUrbagwc=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr5483351wrn.172.1642103071675; 
 Thu, 13 Jan 2022 11:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-18-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-18-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:44:20 +0000
Message-ID: <CAFEAcA-GzmmPh14dibO2WGOPkMqL0wdsayScr_OFOH+uixhSPA@mail.gmail.com>
Subject: Re: [PATCH 17/30] bsd-user/signal.c: Implement
 rewind_if_in_safe_syscall
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:32, Warner Losh <imp@bsdimp.com> wrote:
>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/qemu.h   |  2 ++
>  bsd-user/signal.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

