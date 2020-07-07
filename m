Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D709216A9B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 12:43:11 +0200 (CEST)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsl4A-0007i7-6c
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 06:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsl3Q-0007It-JC
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 06:42:24 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsl3O-0006sX-Sa
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 06:42:24 -0400
Received: by mail-ot1-x342.google.com with SMTP id g37so10221499otb.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 03:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xe6wzVtyFtO0yZFy+dMrqSP+KugZ/vZTcyMjg7ltY3k=;
 b=IrLdUdwJydVRUDfscBw7MuZf8KTVKDtqf4ZUGGNJweccyiuBoMsVclKSfRUuXTaQ2l
 paoy6MPjUWGA+ghyuLEb4Nw7HIUnVT8ydaEJDTwUi0SR0xI4ofUP7pZf6Yg06rwb12R9
 ELOWyoZeDtGgEQa+LNi7SjtxY4Zr/ww9DxZka5hI5KA1E20QPvp1xfLLX68PgQs2Xrzu
 b8XsySKCieyZvtiAj4GFUs9Wygc0eB5NnTNq38tqU2k70KCds9Od8/ZYP8Dwl50Y7h7v
 vjR/zQT1c369z8bk3nCONO4YIqUUgUOikEN/34Kmuyw71uvWwnem6a/iI02EHdAiwdaA
 erJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xe6wzVtyFtO0yZFy+dMrqSP+KugZ/vZTcyMjg7ltY3k=;
 b=b+TlIJoXT69Swl5Zg1vID5UFXQWjLRKgLptJbdjnufK/y9avfL1suhWewKI1oEIAtl
 ywZ8TuKu4PNNrBYBfuYpEdFUoHduIvJ3piQl/cyQH31qgIwKbZcUZ1H5YXYg7bKYx2j6
 Pxu1/BRCq9Hu5I+hcVC3ZgOTHMGeIcwCnNWaq2OoGbjkTNgkZtRE1na+Zh+c5lY7iiOk
 CwXJ4cHuEAc9YuYdfxk/eUVQXduOl20BJpA4ofbJQKRImwns46Z83dyHTuVavkfXKfnf
 tt8uU4yKlWD+C/IYEjP9mBgROtPY+mKc1/vH/w8DiLcS3vakXnU94JLMr5ZKAQq9w4pk
 b+mg==
X-Gm-Message-State: AOAM532p2YI7ZiAPLvpSGDDq9NAQ59aSbnyI9OUAbxCLQPTfSnFaK49f
 A8QdAvHGFXmGoYaPSiCsL+tUcWjRvwA+ckMf358xLg==
X-Google-Smtp-Source: ABdhPJxBfZ38Iu5UipXG1+lFDAsSQYkYbOsrt03JFmbWuRyRLvz6kMHmxK2spD6LSDl7zo2Wu3vPI76LffC0/JYVAZ0=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr42485377ota.91.1594118541398; 
 Tue, 07 Jul 2020 03:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200706202345.193676-1-richard.henderson@linaro.org>
In-Reply-To: <20200706202345.193676-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2020 11:42:08 +0100
Message-ID: <CAFEAcA9u46jMWPi2oyH3AiPP8cCfC83n_-LukcA2qxseAcwozA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix mtedesc for do_mem_zpz
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Mon, 6 Jul 2020 at 21:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The mtedesc that was contructed was not actually passed in.
> Found by Coverity (CID 1429996).
>
> Fixes: d28d12f008e
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>


Applied to target-arm.next (with the commit message typo fixed), thanks.

-- PMM

