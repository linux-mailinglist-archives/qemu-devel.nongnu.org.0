Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A1F209D3F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 13:08:16 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joPjr-0002hh-GF
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 07:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPic-0001v4-18
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:06:58 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joPia-0004hq-C2
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:06:57 -0400
Received: by mail-oi1-x242.google.com with SMTP id r8so4596206oij.5
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p4iSLMOu1Y9rQ5jWCq0Ve0C2+dwY/ICyj7L7/+KdNio=;
 b=r5FBsNJ0vqjezSYgl/rMt6spMQgTZ1tGVc56eV8A7OqzaGsPRZcwktRvWnQmM/eayR
 6j3zrLJcqGC0bB3d9iL9onFANVyd0ZGaJ5BVKnB7UUeU9pJMDmhFxcpPCqatrAUrwooj
 mOpO+HTcZIgXcs4k7e26O7a5I3QNXGKshdcbvGRpGBiQMyjyoz6ArPHhQRnbHG/OaB/5
 yGx6+i0sbIFmYk7bFjdWZH0/MlnMNKwIFoQC9tRMIOnah0zLcSjnx0jU9Y3kRnExvjj2
 zLATJx+ZEkd0HBIOj7Vrb6PJNxJljPGn5nxRQZzbEfpwCQYROPJWBzoNDoTDF+M+y0a2
 CUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4iSLMOu1Y9rQ5jWCq0Ve0C2+dwY/ICyj7L7/+KdNio=;
 b=IzLknez9t1Zkqv1t2AFdNg2DBcXttaFc7w/22UAqrPEd+MJX+VNqFiLhzmh4oANjD5
 mA9MUQ5Pjd+HO7YP4rd/ega76wv0FfcX1dfe+3k4JVBJbWZf4JKsnLAFS+p/NBk2c4ul
 qP7ME9c7+TpmsIJrxw8n0gjH6Y2hTTsHS6C7dC3oJks2afaa8uUDLrMxkYxfzzBuvYaW
 awKPefg8nmUnyExsTT9cuKi/4XH5Eudw6NcBmN60ETkXnRKqWPDU6Sv9VmJbfA53AfBz
 IMrkVsob6J+0qMXtsVmlQAolaVJzPatSCLtKgK2Tdw0vyNMFybU/EPXmgoLZFI8lCX8N
 j6tA==
X-Gm-Message-State: AOAM533DcmgDx4wRGQJ6VtI9MzPcgNQhXLfZ1gx91nGa694U+xfm+pdv
 2Q0HgC0bfw4x9NIZpYgbAuYjmiUUbA0ybuUNQQnZSQ==
X-Google-Smtp-Source: ABdhPJzB8W6KEIycLqHbFZK8asxFaAiNl4sCRIrjuX1nZ+dGICJ3zanE/TP5nUPg2DFnMKF0Va4+fSoYc7KTsAgQ4Pw=
X-Received: by 2002:aca:568c:: with SMTP id k134mr1580095oib.48.1593083214651; 
 Thu, 25 Jun 2020 04:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-29-richard.henderson@linaro.org>
In-Reply-To: <20200623193658.623279-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 12:06:43 +0100
Message-ID: <CAFEAcA_B8Wha8b4t_qE4O83SNiDwxBr9zhef6r6-AagW=-iBsw@mail.gmail.com>
Subject: Re: [PATCH v8 28/45] target/arm: Use mte_checkN for sve unpredicated
 loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jun 2020 at 20:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v8: Drop the out-of-line helper (pmm).
> ---
>  target/arm/translate-sve.c | 61 +++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 28 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

