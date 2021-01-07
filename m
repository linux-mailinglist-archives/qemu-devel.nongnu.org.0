Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BDA2ED40D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:13:17 +0100 (CET)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXuX-0001Ed-23
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrm-0007PI-4W
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXrj-0002Cc-SX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:25 -0500
Received: by mail-ej1-x633.google.com with SMTP id n26so10420554eju.6
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=QtS7BAGFsQkjrNu1IHHAc9N+KI7PAjZnrVC4u7wIK/qDEm14eU4hIQ0qt/p4lAcxxS
 80JFxqplz1D6g9HATD8WRV8IfnGQ/yV9PYmH9NqwPUhf+f1AS5bGxmpchayZID8RfZWL
 GOD1NMdGY0tDpFJyA63O/A63yQSloeuewiyk7QYHNC5dv12eWyGPj/svkOggd0IXzrB0
 sZBdxXIUYYpvp1JYPBTnDdc3kofggtVKO4LHl47vsxiWh0z0ebcE1cnv5xrAbE+1UE7i
 +SmsWSBU6DSFXFVlpn9qHmEcokPaZIrx5e0chF3CyKIm5RgVZ7OISlatq5fnjWSrY8xf
 5XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmVuJZO1xsnixICZISkX1EleJkGIpy81PREPkCLn7tY=;
 b=WH9mFU77CO49tK9lq6/j37Ywfo79RNGnYTXPMVS3zDXS68XX4Ihc4GzJ3XzdWJQ6gA
 Cxq4Ctl9pIxBmm6SaiivJpj3EF8OlZdUKEZLJJpN2qIr0rdTtViJsmsDcED5DVQpk7R6
 mwPiSV9YwaPYhkR30tocYXU+rvJvSfO4fbkLZbupi88MMjOZICOsKVLLeK82vUHB7n6W
 2ztlkxhQEH4m5wJc/wuWD6YUdAr/0eLGygyvXse0+2tMd4NbD49ltSCTHBKz00myr7te
 ZikkUbDQL1cQdUIwvZVV7Adhel5MRW6VO68LNSghE3Lq87DkvCL72NSuvBa0cEHeTiGG
 sgTA==
X-Gm-Message-State: AOAM533mzUtNMgQFRn6KI2KOpz2tofvDIOC+Hpq89n1b/Dz1eunlD16S
 +mLQRnEGB/oqKjc4UfveMhciDcSBCpqDEHtsytCeng==
X-Google-Smtp-Source: ABdhPJwoKVB1vJK203/edjkGQsdHJ9CvWX7BVYvkmrCMK5/juM+pYJXEuDry4aDxO1WS/tq8ExgqDudjmk5zBXRCC2E=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr6580781ejb.382.1610035822057; 
 Thu, 07 Jan 2021 08:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-10-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:10:10 +0000
Message-ID: <CAFEAcA8PjDpouHHSQW_se10BcaahFQu5=etJ90Y_u7D--yGZXg@mail.gmail.com>
Subject: Re: [PATCH v2 09/24] target/arm: Enforce alignment for LDM/STM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

