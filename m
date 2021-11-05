Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D84467A1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:14:02 +0100 (CET)
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2mv-0003gN-E7
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fe-0000X2-Oi
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:06:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2fc-000661-0A
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:06:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d24so14783363wra.0
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nUNbQ4RSWYaBn/83BaODcM8BQR19f+Zxc2obfN0eZtU=;
 b=KmdsL5OOALyKxT0QroX5s8dDNIXCof+tkwYAnhXhAX3VhahIKVeUYxHQqEe5T5Xo1q
 vRX1qCjPAPPf2l33Ip1PEHpTS6b33/+P4oOs+zQXTkt+9mLSvCyeE6uuD4dDI4ZSj4p8
 4hRGKxxOkfBmovY7AR8hYpGclZyWIfjEqdt8K2dit8aSRonde99CowUkguA+dav1yN9L
 NYYUB6TKbqIP3k8hceu82/4kkjBnjkST/C3qfOWT1iEn4ZvOq9e8Xdup5uWyNUaoSNi3
 zTtDnsfYypX8zMpHImOia2CqGx/DGSbkJjTxHi2k03/NUYghx8RK2myqQo3IGAD50MDt
 Bthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nUNbQ4RSWYaBn/83BaODcM8BQR19f+Zxc2obfN0eZtU=;
 b=lN2qlUuCpJaB5v4dxqwEaULJ4LvJNtQAKIxrroNuvkcIaTdDst3IkwZSyQabSEzsjT
 GBgMGzU9plwMquPsePsy3ymwJBeUdcEqJSrVAZwsCYw5d2CWCcbyC9yqJFjquKFuvRL/
 Y5fM4ixI9LhnBXWXeXwpJvPDzd4KfNH2+OPM2X5KSdPzG5LxLSxhJrBwT+zPfU0HItz6
 R+DBUzH35ybt/0SBkiO28abSqQs99X6vdlxeCNptV2wOTQnw6Js89ft9afw5KKUEIEM2
 qI/isssazYlF48RYEipvK9VpsWfn2hQnA1g6TyZOE4T2VFLO+CwyX4zG1lB9mp+ZJcYp
 OXxQ==
X-Gm-Message-State: AOAM531j0QgOuoESJ4rL4ZbjvFxYejWniJPbcV1H3535kD8fUxPh0T1v
 2j1SywH7CBp4djzRD01m/nIkfQxSx5j6ksH7BuWxBs9UJdM=
X-Google-Smtp-Source: ABdhPJyjCNrrbLle8nBj/QZkBTIBHRWSIqLMDQ7mbM18GyKPsW+Il7JJzWaGe8D3ynLntIwS2TcaloFVu4dal1Nijos=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr22938974wri.376.1636131986178; 
 Fri, 05 Nov 2021 10:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-2-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:06:14 +0000
Message-ID: <CAFEAcA86ScZxrm8j7PC82FZgB-SimpK0fasLGey_yaUF8sDBEA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] target/arm: Hoist pc_next to a local variable in
 aarch64_tr_translate_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

