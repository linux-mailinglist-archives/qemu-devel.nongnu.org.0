Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E112137A74B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:05:16 +0200 (CEST)
Received: from localhost ([::1]:55530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgS4a-0001tk-0E
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgS3H-0000tR-Eu
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:03:57 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgS3A-0002mb-5Y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:03:51 -0400
Received: by mail-ed1-x536.google.com with SMTP id j19so390813edr.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0c1JpvEDRqc+UHNhvIsDN5GTFnLZ9YqQOOBcT7j6Zo=;
 b=e5cZQxweiXNPvwbel4L0t0hH3785CuAi376RJ3bvk8D8sf2NRO8aPBgJfVCj9A/3Of
 iGBveM4up/r8sx7Uf5Y1CFmbv3PdVjvS7FAn6Brj1zG3ZHHujX1/cKW7cTqmAaO8S/Ls
 XiJzNAW3DBghNI4V1vRsDVyYqdzvVe4gsJCRdPGcC5+vInz+J06x/9snwzUzCN4clyZ/
 afs1RfsZ+57zsipBvGrLmfJDmfjfSUJaq0sY8RT4sKyyoNa0olzrlqsi25Mwo5iiObH+
 Mug1WitgrwEygIW/PdGjoapEVhdTpsYTL3fzzjIaYG8TzhIvcpEzsK/FyR4CNpAe5qlH
 Z1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0c1JpvEDRqc+UHNhvIsDN5GTFnLZ9YqQOOBcT7j6Zo=;
 b=NXWrCthqYIpVMLdv2wHE0BNv1BV1HfcBeoYJepyWV6x0XFJHxb4ENbv001hg/wJHRI
 fOErM/E6LHE06CYHsXkJ0srBm33/r1OJq3UDOQnYpu0JJeg1skNRbwnhVW13rLbE6u8s
 FyP0E9flB/LTrUbjed+Kw/DS0aCWBWk64XjeRn+n8y67n0Gxhy8xSMU/t9YyQa8Vu/EU
 GSVkx32EqABMf2ReJvfbt/xzcjEgNIXLV77+VPN501b0JxTZLDFXbC2cKkx3YtYf/HSv
 FzBj8uCD3fm1Aa8HodjajImw/LbfnLDMhz/G+uFPVkptWitZH+DMag8SLIsu14GaIlAu
 nn8Q==
X-Gm-Message-State: AOAM530IunSW9CYXrUnKTK8cVgboMQWwXdYbFUgrduAl7nvm1inrn+oP
 0Ml9eU1CNnW85GY6Nd9Myf3nOhEQi0AE5/0om1YgS2okOSM=
X-Google-Smtp-Source: ABdhPJxwOjbC9z36lI+HTjjxU4Cpj6dWltjasjBR35lss27H6FI/NE9qL5MTPQhuXwhXM++q+uMDElmg+9SZ8yMVkDs=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr35654415edv.44.1620738226556; 
 Tue, 11 May 2021 06:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-19-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 14:02:34 +0100
Message-ID: <CAFEAcA83Gsd=WeqTGUWOSJwHfPaip62gBw1Q1+XXnzs6Xcxn_g@mail.gmail.com>
Subject: Re: [PATCH v6 18/82] target/arm: Implement SVE2 complex integer add
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Fri, 30 Apr 2021 at 21:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix subtraction ordering (laurent desnogues).
> ---
>  target/arm/helper-sve.h    | 10 +++++++++
>  target/arm/sve.decode      |  9 ++++++++
>  target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 31 ++++++++++++++++++++++++++++
>  4 files changed, 92 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

