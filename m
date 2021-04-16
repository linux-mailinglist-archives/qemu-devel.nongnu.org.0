Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC69362898
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:27:33 +0200 (CEST)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXU7o-0005rC-VW
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXTz9-00039H-Jp
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:18:35 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXTz5-0005aW-So
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:18:35 -0400
Received: by mail-ed1-x535.google.com with SMTP id z1so33551047edb.8
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xQ50nJfYxuKPsva+LWRGT805gpOlHHQSE1O39nYKRhE=;
 b=Qr837y6VSXTYrV7k6basXyn5xKHal2tSEKpEhXvrbuQbwY1Hk7QsWwreLypc6TegOz
 ElSz2cTqDvv+R4yNmAllhSfockOAcjR2FGLLn9qP+DXcBSno0YpWnISRnNBDUtu79fn/
 EvnWjLPkuKy9+Kss/VVVZMv7n68LyzW73h27Y7y0lmwtyUxNtFsaPMJR79Uxk9UNEFRS
 XmwaKUzmI/VeOGha8KScexvrR7P47I7oTY8WC0cogJ7dpfY33rNeVSqDs0iLOdBwG26f
 YeYjX4OJsWvqGS/JYeD6SNmrXCmN7Q1Cj1HAZ+Fle12B9Pbd9DGLbd+VZg/nG9HSsoWY
 hcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xQ50nJfYxuKPsva+LWRGT805gpOlHHQSE1O39nYKRhE=;
 b=FWLy5ZIrn0cajmpJk9cwb3ycuc0nC4mLlK1n+iQn2MeNIiw8WR3Rwh7aiDAgGenPIx
 QNbYEknlx+PNt4jHfIiraR7R7vFc9ymBFtQ2iSAx5tRnLhW0+6D4c/Fdj78tTlbgbMBX
 uqIbZSWG2ne9e3p8mZQNWcf/U/61RGTEY38rm1yr5BKWib7hn6juiLIXfKXcNFE1eX50
 OaT5zHb0I5XNHjV20SEie2wvmc3sA+4qQw9Uje3JTnNPfdpHe3649wZMWhTG6NjoxyHL
 yju0BKYBckYvMmW5Tvy2Ezt+f8cbXlnIh1S27k1Dg5MEWx8kyvZeq7GUJPKmgnR3MN4B
 r7lw==
X-Gm-Message-State: AOAM530mBLNTOS+drEWe4Zb3epwBqVf8G1IhOoQ5I/DQmEletSwf9lpG
 DMyNp3I19oAAHPcB+eHDGElpNg4dDdOz0WDUY1+uKg==
X-Google-Smtp-Source: ABdhPJzkUKsQ8Y7NTLLC8zBFvoE1cqSJAPJwxTQY8RKrHwZZc2ylB/AN/kX50TdxGl+pPRBqBpg/97ozDDNlsSv6Fq8=
X-Received: by 2002:a05:6402:2746:: with SMTP id
 z6mr12022678edd.146.1618600710140; 
 Fri, 16 Apr 2021 12:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 20:17:41 +0100
Message-ID: <CAFEAcA94XeExOTYxF8owHUjKN_dbpXx19OonuEMGGTNBksPg2Q@mail.gmail.com>
Subject: Re: [PATCH v4 for-6.1 00/39] target/arm: enforce alignment
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Fri, 16 Apr 2021 at 20:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20210416183106.1516563-1-richard.henderson@linaro.org
> ("[PATCH v5 for-6.1 0/9] target/arm mte fixes")

Subject says 00/39 but...

> Richard Henderson (30):

...only 30 patches actually sent. Are some missing ?

thanks
-- PMM

