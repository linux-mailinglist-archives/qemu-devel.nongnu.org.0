Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB63F2D93
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:59:03 +0200 (CEST)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH530-0007rN-6n
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH51f-0005ke-ED
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:57:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH51d-00015j-Qd
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:57:39 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r19so14119047eds.13
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lm2acVW719P3Yd7VVUoOWfkFsjCNFWXSqZc0M/4RuuA=;
 b=g1U9NcBrDp45tDBNWa7HMj14IwfKKqptRHocC0zUjLKptnFQsTx9Z0tEWnxNf1Uw0u
 1TkTt4Cq94rA29k2GUdIlPIZgLw7H/yylqZ9/VagErvaTvtkOw5AlsmZKKPIRutdt5vX
 HZCLfUb6Z0Vyi1H9dLeOJ4mEMEQQWiIzCFP3p7tnqWHg2H3OkoN61QV42lErF/2xUZ7b
 VQ87tBiat7KVxYdc8Tw36EUPh6L3w1sHrR/vb46i6IwXOA/tq6zFrNLcN4UCaQToYN5c
 /93X4YZmCesaXWDh2fFz9tvK1On7sPLHbdHZ4S1spxgL7tu7AscsLArRssd127puaLUT
 SAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lm2acVW719P3Yd7VVUoOWfkFsjCNFWXSqZc0M/4RuuA=;
 b=CAtkgncI7R1EmqcbhyxzFTU9bLLrZWoWQ6SdxfWxGd6T8J0N6US4ix+61gHuXOGrcE
 jrp+W0h8TeFMZI3lhDVCNmkqTmbCOANPQbGmyuKpK4P2shoXuivJhGHgxpKHyanDnOsB
 2L5D6LP5AFluUJC8dTitmySP7YxQ/a2Tdx5BUdCjdZWRJTY722wicuUP6qKI+qMRTjZw
 uhZJvFbyXoAwR5lcYOnc5hyxIGdhcjWSrDxLpbf4ZEfAP0dYSf51ebPLgJZR3B2/mWpi
 lOljjIrB35SSWQdBq6TJLLC0qUS4N58U1pXpLWAfwy/PFFGyK+Jp1mS8UtXSRaRuUVqb
 1E0g==
X-Gm-Message-State: AOAM533ypVQuto0HmcslIS0UMH20y8MZPvVYtgySAoNDTLgzbS7KsRyL
 N/TW3nzxrQE1hjhh+fss+oUdJLuG8Np0c6DHjA0TKg==
X-Google-Smtp-Source: ABdhPJwsfWXLK2PmGWr6iDA1aunhpYn1xEIiqUWvqpgCbkNfDjQdQAE29kgOUwEzKEtnxqy+IEQSyCoC946n1oVBxA4=
X-Received: by 2002:aa7:cc0b:: with SMTP id q11mr1583491edt.251.1629467855755; 
 Fri, 20 Aug 2021 06:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-15-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 14:56:49 +0100
Message-ID: <CAFEAcA_LPZOP=hgnDXsWBHsxn3_GS9x==D0GBtOB6oRwG15KPg@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] tcg/arm: Support raising sigbus for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Wed, 18 Aug 2021 at 22:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For v6+, use ldm/stm, ldrd/strd for the normal case of alignment
> matching the access size.  Otherwise, emit a test + branch sequence
> invoking helper_unaligned_{ld,st}.
>
> For v4+v5, use piecewise load and stores to implement misalignment.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

