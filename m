Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BEC3AEC12
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:11:55 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLac-0004Mb-JC
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLZZ-0002zo-Fb
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:10:49 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLZW-0002P8-Fk
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:10:49 -0400
Received: by mail-ej1-x631.google.com with SMTP id g20so29456669ejt.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KfwuJooLlny/RYMppWK04w8vtk6ielZvGxcoAkddvjo=;
 b=tneUsrvDGqKVmxqVw84jCgVi9Cq94DqLd1glPuFcFWWurZPW6aJaU7uU/e8rWNjTMs
 1EaRE6uoLdoScOY0Py1+liFZdbNJeB5gJPs7q723mF96RecfKp6Uy2kcGjcVLc87dXZe
 4vN+Vdqq0BqXp5i147OAu0tLTnQOLyEUtMSiHk/jtG1mJVGEiX4NGAj85BRfVRfSlsyB
 TnN2szhmmr4s4oGuql/n1zi5M8pJTIXFPf7fVz5nzMccyfkyolIIeA2iMMkXdeVDsIiG
 26B7RlIXY39cXFClx2nnWWfBtWfaZZgvXuLRd4xk4xyHyzszv//lzWbiJ+8bpBaiJEWT
 dtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KfwuJooLlny/RYMppWK04w8vtk6ielZvGxcoAkddvjo=;
 b=Rza2DMBJsaVhJ8Rq4oD+HIzpHsXms5xcI0xv+uOMRkdE7of8z+4JYEtl85tdMw5PZO
 xdC7aCoz8+8y4Bemo4R83TxHnsi3xNxcxwDFK5j+JsZXd8TjfQR37XxfLtEHfrVcawpS
 f2Qo8/1d+8TXG8+PgslKyjJle4JwTZJyt5WrTVom+3SgN5RU6WHITIdRSsWclEDT9JKM
 gziNlFFUkpX/kyUUmh+SWrs3wGVVlb1/uzl2Eq9rKdKCh2ul23g3oEpxDiD1vvpvpa4S
 3oJdQ8op3IzRXcAJNaP0iQKnleln55HNiQBkfF0f4+7ifKHDnEgKs5182fq3YeQ8fNKQ
 LsRg==
X-Gm-Message-State: AOAM5337zmd5A+UNrDEJuNNvO+/x9ebgtAYTTZFbhxTp0eOU6Vinl9ax
 G5O8DVS3+kqjaOrJMIj6Q1Lvi4md2ozwhr3uj1BJtMPbPlFv9g==
X-Google-Smtp-Source: ABdhPJwT+lZPb9gBskMNZr/AvOeA+b93obbEwKLdivMBh2b1ByrWEmf/dt8caYd00tABOyEN1XjygXjSJFDfE7gX0y8=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr23619777ejc.482.1624288244507; 
 Mon, 21 Jun 2021 08:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-22-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:10:06 +0100
Message-ID: <CAFEAcA8YJyySrn0rrosj3QqOY7oKAqgVx9+bvTFQRuaWK8uhNA@mail.gmail.com>
Subject: Re: [PATCH 21/28] target/arm: Improve vector REV
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Mon, 14 Jun 2021 at 09:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can eliminate the requirement for a zero-extended output,
> because the following store will ignore any garbage high bits.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

