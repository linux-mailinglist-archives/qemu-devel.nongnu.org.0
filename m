Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E16D86D7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 21:27:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk8lc-0004d7-A9; Wed, 05 Apr 2023 15:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk8lZ-0004cn-C3
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:25:57 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pk8lX-0004Uv-Sp
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 15:25:57 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-4fa81d4f49cso657005a12.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680722754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zr5mZhnnP6XqKNXTumm1NFnIyzdsvWbHHFCBUHbquGw=;
 b=oEurNs9TAI/aR3ZkMx+b8Iad49wNGbMb5W12bCt+T7AazY3OCwax5dZeJIiqpmvvkZ
 EmIQprub+JooRFrI6VfnThvn5aOr19uVmCM8caOBoDvuKwO5neY37fNDF2TzjlTV+mU+
 6gDom3s51gYKqtP8tOUBLLjJ2Xqc5gwMiJbS9HrTHaobUVASdC3a7fijUqRB6bLzDS+w
 D77ayA/HLF6DqHvMFSywiSH3j1GTtX7Z0md9v1S3K1BZkryeSzbVjKJ/Qaveg5U9oTqa
 fIzspT0MeSuhJC6SgKaTxa1p6Qil9FJokEPvxM5zAcTxggNdafOMRGAiBNORnU3bhSwX
 dqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680722754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zr5mZhnnP6XqKNXTumm1NFnIyzdsvWbHHFCBUHbquGw=;
 b=56u2Wev6/aFzzfdcsUSwjt75I9SJ94YyIaFEbIJEz+Jq5SDpFAlqCsXMQcc9fyJ6dZ
 iiXnd8WppIc0j+PgwJbATUVnkx8DwXYeG0x0rgO/+nXSiqvgC/6T+VNY+jnYhjx3h0qB
 ghX+RuAEC/KwQuCs+qJMaanZl1kurib3MnY+v3XO6GZp9wLl0HSZFkyr+KJEVmL5ZCjR
 BVbrh4ZkgTibTVfq6lWmppBNwTWHruuj2iZrdoyKj6aEMtVgSszltw45h1/Q2kLxA8Iw
 VTbLT21c36H+bV2Y3Jx1bWb33kOScINTAzGmu9cVWNxR2jSpF2D8Uiop426uI44y/vEt
 xFZg==
X-Gm-Message-State: AAQBX9cNSzQcz5rTHARUz0vXPoIshACnpIn9/izLIK26rMjoLlf3HxxB
 VD1Cax+WqqgwLssFa7IvGDaxu1v15u9n/aICLl6ruw==
X-Google-Smtp-Source: AKy350aMt1xcIiG2APPHUrdAbgUw+bsXyQyeEjzswg7q7xak/D1CF2Ywz6If4DtVMspfy+d6K5MKUgh1/dSNB9sexh4=
X-Received: by 2002:a50:8adc:0:b0:502:3c99:417f with SMTP id
 k28-20020a508adc000000b005023c99417fmr1727838edk.6.1680722753922; Wed, 05 Apr
 2023 12:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
 <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
 <20230405185720.2yxd52njk3tcsauk@amd.com>
In-Reply-To: <20230405185720.2yxd52njk3tcsauk@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Apr 2023 20:25:43 +0100
Message-ID: <CAFEAcA8dC3iKNe-s4mrZirYPWhUfK4gY_b+utzPv=NCDXE=5WQ@mail.gmail.com>
Subject: Re: QEMU stable 7.2.1
To: Michael Roth <michael.roth@amd.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Wed, 5 Apr 2023 at 19:58, Michael Roth <michael.roth@amd.com> wrote:
> One thing I forgot to mention previously is updating the wiki with the
> release schedule once you have an idea of when you plan to push your tags.

On a slight tangent, do you have the process you use for
releases (main as well as stable-branch ones) written down
somewhere? It might be handy if we ever need to pass that
duty on to somebody else (or if you're bored with it and
want to rotate it between multiple people...)

thanks
-- PMM

