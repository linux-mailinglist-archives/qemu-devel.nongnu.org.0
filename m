Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4B441E3F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 17:33:00 +0100 (CET)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhaF0-0001Nf-JF
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 12:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhaD8-0007p8-07
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:31:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhaD5-0005jQ-UM
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 12:31:01 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d3so28905840wrh.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpPgaIJI7M8W0KLubpNF9xyCxUyWqSjIpnK0VZF0IcE=;
 b=ul1/Ww016duk8+byNBnIcPbO7EyrlDhTCnPs1Or5Ae1oqZl9wYXAZqhS4Cq4mHMWuw
 j/nZDv79DcR7IC2irivKF5ouIhrzhmVPReGiSXoaFby5XaIiLemc1CZVYlMdZFeuZmlF
 +yyx+PRbCL23SlPviAd8QYaPzYc+oLhghhsKMXxQwbwHQEey26XqjFs4CdBtWGQ3+fVg
 ar4mRg1pWHIbHhLuzHa8gklyfsF4ep2bNpbP74Xk57P9hOtcvu8ptVqv44/w50gX+jJ8
 R3N9OtVtBT3qhfuf+TdwwBhEDZmPMApX4M8J8vzxGM+ti0YaKbcSqRjPDWky7Jqcnefg
 oebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpPgaIJI7M8W0KLubpNF9xyCxUyWqSjIpnK0VZF0IcE=;
 b=f9JDPmsItbl0DckGEWaXpFUNqyp+/S4GK/vV81uF8qzf9cc+XlxIaj84Z9mX7R/amN
 QjFEkQ8AYLxaJM7punxPzVImYhoKXjZHvkGsyNLEOjn6DoirGkY2OZkQxkuqWGGoC33t
 K9gia+MRJTZh2muyrfN3y3spKzT+bcvVNc1x/eHRloH14gH6oMMMxJtn0i1h7bX0Noi0
 v1eF11YDEUgAKj2m3rZhRx26lNcGrxQq3Z8C6fS6rX5NmiE5XLRDjNpwLLhspVnKOLi3
 PyL4UvjNw/VwlHTRO9FxdRX6z+gyq6Yej0MzARczYOGn82GyqCTYblUAwBoVTU6R+vAo
 PETA==
X-Gm-Message-State: AOAM530Ub3ZBmlCG5oNoaXw0o9JfGM1sV2mW82qIBH7fNt+byMTqEb3z
 xtop9PxDxFfsAhl68KCSdaNcHDMYOXr68xpAuEtlcA==
X-Google-Smtp-Source: ABdhPJxBHdD489q2I/JlO4RuY9+Fnu3tdHdkuH+F9VVOIrHUHSBwQB2yQmlR3gELWcrplZ4qWIfoy0w+vrsnpZe0Au0=
X-Received: by 2002:adf:e984:: with SMTP id h4mr35341346wrm.149.1635784258258; 
 Mon, 01 Nov 2021 09:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-24-richard.henderson@linaro.org>
In-Reply-To: <20211030171635.1689530-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 16:30:47 +0000
Message-ID: <CAFEAcA-h7xhKFTjOKgOw22Le2wQPUaT2VxtFcNFMP=xHs2stFQ@mail.gmail.com>
Subject: Re: [PATCH v6 23/66] target/arm: Implement arm_cpu_record_sigsegv
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: f4bug@amsat.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Oct 2021 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Because of the complexity of setting ESR, continue to use
> arm_deliver_fault.  This means we cannot remove the code
> within cpu_loop that decodes EXCP_DATA_ABORT and
> EXCP_PREFETCH_ABORT.
>
> But using the new hook means that we don't have to do the
> page_get_flags check manually, and we'll be able to restrict
> the tlb_fill hook to sysemu later.

We seem to be restricting tlb_fill to sysemu already.
Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

