Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B237A39A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:28:14 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOgX-0002xN-OM
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOUW-000143-P3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:15:48 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOUU-0001oD-6o
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:15:48 -0400
Received: by mail-ej1-x632.google.com with SMTP id b25so28655469eju.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PYpJGs22xYc9s8p2fK+/ndMD02IASYL82At2D3QXvkA=;
 b=cD/DMhv29ewUDV9aJxhbUt1q/aSOalUT5cZLWODEmruFw/h7iPCW8LNhh7FuZDTpgl
 UUbvwoj3s3UgJ4AzqOYHQfyBq6gDqJcjurhVffzVq4GX6zvjxOJp75wg9Osp/X1NgHKd
 VJEPhesKAkObwI41OWjXXKh8lVpn1umXQ64pV988fxHwohGAJ0ZBZ9FB2Vdd7qOyk4xI
 n+DVe5KEJZDmbk5GSN4TqYSUCh1kJAx8uZRqUT1/wS4L/qyQTBzKrFRm5FuRKC6mm5mt
 5lmhLzyi/XiUBc5r739WssHNNJ3VhFGJfrWe/BcK36kXk14e0+lbnUpHnu2pfALVHSx2
 ly/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYpJGs22xYc9s8p2fK+/ndMD02IASYL82At2D3QXvkA=;
 b=B6jSN7TapUrQl4uv3l5V6cgKuPhRmRMLDIdxroS9pZ+Mssrh37OR+bMWwFAfd0w7rr
 J/D4Hd8Kst3N7JyMh12LQvqz+I78pU6U1uylAOHGcoOSmtEVivX+T+4U6JTBXs85mPYP
 JeM6AGJgMrsEBP7HxAekly9GpVxFAPcmBTHoHBt+i/wee9jk3xsSzHlYGuEDCjOx5uR8
 ulOdPuKXwutQ7aZibXQOWF2AyNofjKDN45G3umEtDY0PViyt05tYJh6u01zg8PrXd/wX
 rXTU8L3ExRQ4mq6peS2v5+vW0s5lujMIQNQM77MAACa5pP1VsfzQKmkNh+FcPTLAtkEj
 f2ng==
X-Gm-Message-State: AOAM5301jFpNivWzlkFs/C8/yFVh+DZLivzvJsRZy2QW7okNfkq69zIl
 ttASD8W5boafaZ4AmgX9jOj2wV2bNMy4Ns/x7tvheQ==
X-Google-Smtp-Source: ABdhPJzh7Q2veOQLhs/SEVOiQHU2HwwNtVs1e1/FmdX7Xr2uN9gREgMeNhfOpSk+yAe6+Z1DB+lnhE5AmV6WE4oIIDo=
X-Received: by 2002:a17:906:254c:: with SMTP id j12mr268902ejb.4.1620724544997; 
 Tue, 11 May 2021 02:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-13-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 10:14:32 +0100
Message-ID: <CAFEAcA8Bi+uwsQn23hRva4Uwd2VT=EP3AwKv=GNyywH0Sy+s8g@mail.gmail.com>
Subject: Re: [PATCH v6 12/82] target/arm: Implement SVE2 integer add/subtract
 wide
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Fri, 30 Apr 2021 at 21:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix select offsets (laurent desnogues).
> ---
>  target/arm/helper-sve.h    | 16 ++++++++++++++++
>  target/arm/sve.decode      | 12 ++++++++++++
>  target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 20 ++++++++++++++++++++
>  4 files changed, 78 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

