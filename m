Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FEB3648DC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:13:33 +0200 (CEST)
Received: from localhost ([::1]:36556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXSm-0005Jc-Ui
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNR-0007oz-Ou
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:08:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXNK-0005hV-C0
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:08:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id bx20so40497876edb.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vSbnsjrrEEPFiTgvryEudcdqG6b1KYpQL8pftH3WNcI=;
 b=mtdAEz7FucSPgBCVpU0kTLuAlKR0P572S5FGp4UBUQpzp0cw9FRXdUvcgd6gbGYyVR
 iiHVXdjw6xhjX1iZIiNi6AWzXV6flk3YRUNpjrCFJsG1D/k2uoQBvQc4GJEOLVShPKTy
 VCg1pIxsA2OPLErhwQPyKTOImEIJqzvXGZZ0Ci5yVmIgoIlQ4twTalqiwuSq8yqvAY/y
 iCpkDSI2dxXfTNtiIHRSPqme8IKVx0Nrwc7xgMMBwsJeaeJpKn/MMeom6hf7EzmTdzUR
 QRo0Ud4vfiXcE3SHn8+WDeUDE5cgtLq5RINKCdxPvwzbgMRUnkBA8zbYbgav6y7EnQb3
 +UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vSbnsjrrEEPFiTgvryEudcdqG6b1KYpQL8pftH3WNcI=;
 b=l6WkuWFM0u+rIS3Wg14D7gLHWL0H5gn0MM2JbYGPJyl7v+DxcXqDWJRKZU9Eiim+vN
 l0og1RbJWG821XoHWc9vm0WKvrJH2geZ3EfwdEz86PnsVNfUq9441V0s8owTAg+urPnH
 VFpy0QjgEAZ9pIMcM+nkIiN6VYq+yg9b8w8LlpedqEIe+u2AmqJXHBkRolauVRuOx4bQ
 CrW3A5KJ8NlvUX7Ncgsk+qS7CFs13Y1KrfJdCmlcm03H+PKJ0QPOPAD5J4T5VOZZMSJb
 T7CMuAnDW7QbvXTEH/lLR9igdREqmtX7rfV7WdwMlIrjZvDYPkrTs68/evfarNdF/WAu
 jxjg==
X-Gm-Message-State: AOAM532iMg/o1CC/WQ0lTIfOyBqtUiS/RfR28DIM44ecZa5R7wRjXGaV
 2xTV2dS0op0Kx8eHPw3MoA/rCCTj7DSgv8DeiwFE3g==
X-Google-Smtp-Source: ABdhPJxmSra1hUed8YbNjw3DpjgjTpcBLbN7GOP4qFFtkcAEZhNSgwVT/dAQ+7JFLt21DifcOsKBLB9RRwBKOKT0bC8=
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr13937192edq.146.1618852072842; 
 Mon, 19 Apr 2021 10:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-8-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:07:01 +0100
Message-ID: <CAFEAcA83dN54S6C+NaZuz7B6fbHY-mQ9iucZAH==j8M8TrnU_w@mail.gmail.com>
Subject: Re: [PATCH v4 07/30] target/arm: Move TBFLAG_AM32 bits to the top
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Fri, 16 Apr 2021 at 20:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that these bits have been moved out of tb->flags,
> where TBFLAG_ANY was filling from the top, move AM32
> to fill from the top, and A32 and M32 to fill from the
> bottom.  This means fewer changes when adding new bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

