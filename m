Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32E3B61A8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:35:10 +0200 (CEST)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsLt-0006iC-LK
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsKe-0005Jk-Ci
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:33:54 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxsKY-0007e0-8H
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:33:52 -0400
Received: by mail-ej1-x632.google.com with SMTP id l24so1038091ejq.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8u/mhMfO5z/Zb0IahUh4PPcqAEKZlvqnZkMFRTLfrv0=;
 b=Wjda6lYLe47NUizJSZF6k379WouzLqp+hvcoar2J9bgVeCI0wTKkXr8rEvMtSaRk5A
 AZGQteyl/KqsyfW7rHWqsYucXlrSvE6/G71JefzvdPIqSyk3TspphZ9voBUFYSFbeYai
 Mudc7+s/bwn5HuCgxTGRkZVQOEfwGrkOV/rY1nrtug+7nhIZz5HXepwcgQvLrfTcrSj8
 5ZVKWRSkVCY/O4gsNPi1/8JCzY3RDGob2bB7PGrpImdX7mGJIw2W5IHs9v/OL/MKDahb
 d0nBKlKjbmN7ATNXkXU8eKiwbCRnhIF74Z1q70FfXQ2H+dYZNnOMN2W0xRWs6DKHpdd1
 r4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8u/mhMfO5z/Zb0IahUh4PPcqAEKZlvqnZkMFRTLfrv0=;
 b=HJLOIiIDLBrLDd67kthPqZ/jWPQFHIgsB+Cz6cZUkyCncDtrn3OwvTXq3doYEwRZq9
 zAp4bP+YAWPln/r6sVXYDRQ/6YE1qNy9Qi3wlz4UcgTqoK+Eu1EXSjJ1+qhWKLNqDQxd
 Wsu/PybwUHrs36hlzoL0mnfTocCKnz9M5VV0ia6tUOm9IFO6/Zr31OFP739qMbhlUwms
 IgdKtsmigUS0WFc2iUdFqjBB4PuqUu3IJy8+hEv4BjNSmEOchV0fsiEpbPyiv1eQo320
 g+oyQfOBhK7OmYtcEsCy6WJmoJULb/F9pQQhFhe1vEet3s8Vmwe+fumBgbGyWetUUMFB
 YawA==
X-Gm-Message-State: AOAM532kSA3D89Djz2FgVlEh61KX2Re1DZEI3TZW6lNB0T9DskZ41w0R
 WYU+MZhkOXsRSwOP0vp6f1moYLkgpdANXPedEPKt6Q==
X-Google-Smtp-Source: ABdhPJz5ElXwETHRgV31dNQxaJxR0XEjrprpL8cF1LDxy+jhIo6qC7BpssD3ShRFfxi/vvRS0GfhJuXGHaz0XTgLe94=
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr25035791ejb.56.1624890824153; 
 Mon, 28 Jun 2021 07:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-13-richard.henderson@linaro.org>
In-Reply-To: <20210626063631.2411938-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 15:33:07 +0100
Message-ID: <CAFEAcA9njnXqgx=wmfizZEpW5j4kzxJhKC5MExmqOXeN28ig=w@mail.gmail.com>
Subject: Re: [PATCH v3 12/29] tcg/ppc: Use power10 byte-reverse instructions
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Jun 2021 at 07:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> +    if (have_isa_3_10) {

Side note, why do we call this have_isa_3_10 when it's checking
for ISA 3.1, not 3.10 ? The kernel calls its feature bit
#define PPC_FEATURE2_ARCH_3_1          0x00040000 /* ISA 3.1 */

but we seem to have gone for
#define PPC_FEATURE2_ARCH_3_10          0x00040000
in our elf.h.

thanks
-- PMM

