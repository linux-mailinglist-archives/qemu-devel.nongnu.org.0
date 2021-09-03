Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509D4001FC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:23:47 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMB2g-0002o4-HQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMB0g-0000i2-FV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:21:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMB0f-0004h2-0T
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:21:42 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b10so8783277wru.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kuUoYaSs5EmtTlWML/oxj1StBWDDRyk+vKyZGXXxF1c=;
 b=gDJM8DtlIifequ0wGoDoI042fPb6FJA78rc/vAsXRWGO2vY0OPDIbwLhW4M5DjZjyk
 HPd3BecCVeCnmkPsxmTlLDVwjiC3tAYCkaajLahSpLaxol0t4FbG2G/At8AQ8Huvy+k8
 4Yh99aY/FY2QlxYnyoURq6SviqwRvVSuyT/LWnyptx9a7CyJPsDJDaa+eZwAGO7Fa21L
 tarNb0qKxbt31mQbGvEhc1WBPanSI8wHahrrFLdNU07VGXDcpu+gstlfEhsbJeD3/MAP
 qMUNKswRQS1nfZYNrwl+EpYRwaS+AKgOL4rraz0udESmS2CPUjxDiMY5Q4tNB1Jx+nVi
 b0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kuUoYaSs5EmtTlWML/oxj1StBWDDRyk+vKyZGXXxF1c=;
 b=hWlS1UKAnrmZnp74XmPKQC/cQoamglQc9t2SCAuf2iIeFkFnNcFZ2SEDBaWjAvP0Nj
 /P3afHACsTtCO8tp+ymBJHhrtBnjU+UArgrGyNjv4H8QplzyttShjnABW/NWCRVVJyBS
 ZP4alrcb0pQSopkOF0UYMuz1sVZsqH7zaFIRZfRoKe4mbijkJm4CEhCDboS1R00h9jW7
 LHQezwSR+noK/kKFGmcDXei1rnSMOf1TS2lVB5MeD7N8Qg51RIDn9gF6bSpm4n5zm8/b
 Rpz8hi6MhTGg0Lg7JflZUZFOLOZmwWXOe6MBr0WqyJszQ5Va5XQ4bYAHjXXZOilH89gn
 Omow==
X-Gm-Message-State: AOAM530xeJoXMoGRlC+iO3vInaaC4Z1TjfZeH70XfQIL+ElvFlkznTT5
 X+5AhNVRVeLhHlPzVyMtHJ8KWhdKHthdK2KAR5iD3w==
X-Google-Smtp-Source: ABdhPJxhl4NaJC16OMjLpS3RGJADaHmF6sDH7eEPyIAnUCGDRYSPrNS2dc+bqnyWZPEgDYXXawfOnjIAFeVfN0p76Ck=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr4874618wrs.149.1630682499153; 
 Fri, 03 Sep 2021 08:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
In-Reply-To: <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 16:20:50 +0100
Message-ID: <CAFEAcA_uq6bWPQxvPz5AWEwcZdg7V0tybvxNtwNaQeOyT9ChYw@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

On Fri, 3 Sept 2021 at 16:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/2/21 5:09 PM, Peter Maydell wrote:
> > Richard: if you have time to scan through the MVE insns
> > and suggest which ones would benefit from a vectorized
> > version that would be very helpful...
>
> VDUP
> VMOVL (into shifts or and)
> VMVN (which seems to have gotten separated from the rest of the do_1op)
> VSHL
> VSHR
> VSLI
> VSRI
>
> I think that's about all.

I guess also VMOV (immediate) (vector) ?

Thanks for the list, I'll have a look at them.

-- PMM

