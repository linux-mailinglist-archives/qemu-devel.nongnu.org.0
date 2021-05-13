Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94E37FC2D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:14:14 +0200 (CEST)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEub-0005ro-8Q
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEqd-0002ZR-Lk
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:10:08 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEqS-0001Jb-C1
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:10:06 -0400
Received: by mail-ed1-x531.google.com with SMTP id a25so7650816edr.12
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a8uX56FiX1L5CrIfT/e/dPdgQeW7UnI68JO4fWOWOgc=;
 b=qUBT5KFEoavFTK18wRqh/pW2wWMjeBbDiZAGD/z4HJVPqw8hBAHp18MVZ1So2/N556
 4w3FimgWqTzvAjIRtelJeXc14J3SBkUYi8IWNBmr5O3GeUSl4Ryo8lyR0yCQ6ha4JexT
 uUDk7CPPxQZHkF1sq9jzsedg0vXwfqKjv/eGupzRtRakf4f2S/sdQEQDhpESNUphi5iW
 2HNBV+thCKSmJKaN1z/6mElU4eZjE/Z9s+QMjKw7cxU8CjydG36hCyCes3tkpNETyQQn
 pmGQLAboNH4d9PfX50ZSSryvTLem6mwuXTBuxUTfK/20cVfkcK1qJ5ldrl57VP1K2bZw
 jerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a8uX56FiX1L5CrIfT/e/dPdgQeW7UnI68JO4fWOWOgc=;
 b=g9uRfFGUjwGq9wFsdmz8/aAvmYOsM6+JLzm/KVA8ikwCEvfO5mvrqhDfGUp576XHbH
 c9hD/eBeoswMRKS8UI/0+lpfCJb13Dr2QkajMrWFZVseS1g4SNaDM5WHnSaCUl7Bo8LE
 kjtIe9Ykh4ULkPVvkcMsAcp/qiUeFfGnc9dxaEmBDSbn6Bu+jsZj62JZ9jlEsGYxsjRa
 lIDv5cEEKa4pOYI62GXTu7zyauv1SL89VP5Q15dvKxDdBXZAx+FZ24EZ/DATx5QztSHx
 tgYcCD99eLRmaa2+rH+kraMgxGW7P/+PPlPZ22+fW3c3qF+TnL/CIXPMupSLPnwDYtAW
 l7DQ==
X-Gm-Message-State: AOAM531Vo+NNKAd+Jv+Q3uD5/Z29LuiY1nQzQu9zECaitXa/m/qG2+hj
 aU1Ljc31TMw6yyeVr+w7Q7+h8dX6Mac4JaAPLEXGcA==
X-Google-Smtp-Source: ABdhPJxqqRZYIPX2oGemNgYZ7pYH4BbIZbtmFD7GLmpp0KMJOd6hOVL3mLalv+9N4ZckjKap6LrBUosJ83kr3dguUs8=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr50856853edd.251.1620925794115; 
 Thu, 13 May 2021 10:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-75-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-75-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 18:09:42 +0100
Message-ID: <CAFEAcA8j4XeXu9fPxQdJfy2i-37QR+e84t7J1=ZhtnpqhxY8iw@mail.gmail.com>
Subject: Re: [PATCH v6 74/82] target/arm: Implement aarch64 SUDOT, USDOT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 30 Apr 2021 at 22:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++++
>  target/arm/translate-a64.c | 25 +++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

