Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D6E3F1D63
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:59:32 +0200 (CEST)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkS2-0002Gr-TX
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkR1-0001as-6R
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:58:27 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkQy-0006I3-C2
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:58:26 -0400
Received: by mail-ed1-x52c.google.com with SMTP id d6so9583193edt.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXsU7l2tRYoHyrnvlU9Akr+jDhBlo5eoxpnVnjLP0pU=;
 b=LwH01fuGLwPoMfMVOWWp3+1MLJvb0pxL4a0Juj5fG0AjxmBEcG5IVSx7Uyb5UW2aEk
 Gt0Nq8s79FkCcg1oS0FbdVLCZ3YNXnW+ZVaaGfjXtiFZyyDZUUDGV/jiiK2piJ6mGUpZ
 ajvMKUFN0IIPTQaR8xzOBVqmtVg40GgEpC0p6Q0z3l+s6Vs++2+/KfNO7jcOFFfzKLgV
 XPDY8XIOTzMjmTHkHKstBsa1/oGhaxU/ZkzBQPzufZQ1Lz8pRVZKpHM7IhfkUhvP2lYq
 GCXjO5yLfsm/buFCJM2SYKr4lVQepFCk9JIX14ng0Lyfn5HIFsfe+D/1oRE6n9R/nRwI
 Jq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXsU7l2tRYoHyrnvlU9Akr+jDhBlo5eoxpnVnjLP0pU=;
 b=oSkEb63p+9/yfrR0n1xhdBXyfvjQe/ytYsor9uvcMp36zEl1sNISKJ8/Xqwq7mC/i4
 KfJzF64gFBaHlE2IH0woI+sOJRbbAxCLpYVALHco4uOhOt0x6GhC3caGIWaJWIHvaWN3
 DmPiPL7syQ1JgrW9LULMeKJz+NhaKIdgWQpdyykEZ3TKocv+vBlfg/4GOqPaqO4fHbxV
 rW1bpNcA7U/smneOE0NSz24v7lZHxLdQzu7e/BjQq2Pc/kRfBrwSA8zqVuBhkjqe6oxH
 6EdbOMdFIojZNHw+nEJLDR31A2VbHqGZwlwZc+ptBZE9P3xORSsJ0rJWkmcBqCaiBzIB
 XKJQ==
X-Gm-Message-State: AOAM533PIMneUgpNAwt6dA+E/GOqSKgs9kII476VIyMtYOPblp9pccN9
 1sIrEivY1pf96NBCxzDi/crefJ5ucPu0W16NeiTHlQ==
X-Google-Smtp-Source: ABdhPJxQNEJxhOFYNzXfygfNVX4hhqBBr0tlsPt0GRb29e/23BOJ0OinmrUqGn4aw6DeF/6cqRqTmVJccy7Frh4hXmU=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr5852175edp.146.1629388702544; 
 Thu, 19 Aug 2021 08:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-36-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:57:36 +0100
Message-ID: <CAFEAcA_5f5kYjEzLm1Ov1MxE_dQtDrzopnynya1uwC70+tCJjA@mail.gmail.com>
Subject: Re: [PATCH v3 35/66] accel/tcg: Add cpu_{ld,st}*_mmu interfaces
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are much closer to the softmmu helper
> functions, in that they take the complete MemOpIdx,
> and from that they may enforce required alignment.
>
> The previous cpu_ldst.h functions did not have alignment info,
> and so did not enforce it.  Retain this by adding MO_UNALN to
> the MemOp that we create in calling the new functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

