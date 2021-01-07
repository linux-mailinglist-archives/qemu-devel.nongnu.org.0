Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267B2ED5EA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:46:23 +0100 (CET)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZMc-0002p1-5r
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ8x-00064F-1c
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:32:15 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ8v-0000Gq-A2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:32:14 -0500
Received: by mail-ed1-x529.google.com with SMTP id i24so8492578edj.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MBggW2AVDX0YsJ7BhRry6EfhBQlo6lJJIzikM/aRsM4=;
 b=IqXYHYeeq37y+QYAIgmmyqeXqoeCafcl6e1cFXjAb36/iaKjRF7PTjxc7yrtmryLCf
 BECDf8bmP4guNrKa1vEFDlJIgV539qfxbVokRG1I5uu2WXoyT5xorYAQauDJPwUDerjv
 mbHodBV5jBhap06x580htLRZ6VEDiKZEPfvN+qA8TtfUG6ptEV2ykYbNurpCNitjpWCB
 VezsITr9XYm8S1q8hxH2Txf13xeS0Dd2gXtHtEszqfkOHdfGIPVrZ31DDbZ/mPXlo2+5
 I1X/z4ptRDSN41uJBxp/s9UpT24brJ+cjMtOxoicJs3uW0CtvqHg5IXyBi5xcfhoj7oi
 ZGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBggW2AVDX0YsJ7BhRry6EfhBQlo6lJJIzikM/aRsM4=;
 b=rojAe7r/otnpZVfqrwcv1uVjqEVN/Fydwz9GKnoEV0a/pGOXmbHfoBo2EKqN6pL/Uq
 dKWcu9FC+cXZl298K4YFhn4TDvM2CSgP1irTvrxsMaoqTWHin/tD0KXu6twFE6df5PFh
 NgwAePXRt3d7PkABowSyKFXAU9CGa7+3XtK0sETrQgqLT8qW9IRI5WdwMR6PxcaJDNEs
 Kb0oXMjYDA30FC3IsEBWhwFLTIw2s0dtDXppVDfsvkfwYF2144RI80oP5KcgX+gSACNG
 sCiUR+yJYp++CgeCljSCWDxImzmM+T19nRJxbo/Nj9oGYvthwEkGQzCeKzeHLPcs3GsS
 LnLw==
X-Gm-Message-State: AOAM531nrtP9xC8EN4OJO1Nk/kf+Y83h94JIeYAhJv3DeYRG/rY8dsLi
 E3ox7+kNwMd0ZGTefRxnMuTWjkbrDWFlQrE7Rv7XnQ==
X-Google-Smtp-Source: ABdhPJzpaDSEbMF7A7OfjQixiLuiNCbQ6L6sTy3GKa+9x+YsIzCRNpRfVOXC3tPWgYYhtgAIjZ27allQf4KmEWyPcFI=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2423803edw.52.1610040731556;
 Thu, 07 Jan 2021 09:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-20-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:32:00 +0000
Message-ID: <CAFEAcA8xvVKYGiXpDiE6yr0mzN0aMOGoKhqaVMc1eKwNO4HbrQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/24] target/arm: Enforce alignment for aa64
 load-acq/store-rel
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
>  target/arm/translate-a64.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

