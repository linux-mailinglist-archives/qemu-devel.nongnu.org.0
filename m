Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2699C3CD4BF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:30:35 +0200 (CEST)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SPq-0007ge-7T
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SM1-0004f3-0c
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:26:37 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SLy-0002ht-1C
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:26:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l26so23655405eda.10
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ap/QSv3GkUHYeojHm4FBBQCj26SJBmPCdu4ADGYVg24=;
 b=GZbIdGmft0+a5oyFU1Cuuo1tka5ATKL0ikL3qM99+njD6X3z2dyi+eAJohFwzUFbg9
 2PkDuryfiWxx19A2qILTawS5Bo73K1jVuac5PV/svJuJaFpd8IRemS2w6VJ9WdyrLs3w
 eJUptdXgmwIYhDQN/CNNf9qCrXOKu419YI1bMlks8R7uU7FQ6+rzyrrvGse+vyCv6G3N
 1igQbGVLnYDg+qwRIfp98KBipHQ4yp0wxhkK26RLG9AlNuIe3dObQcDbBM74h6hijJiU
 eg7Oo6fJK8132wVrc8W9h6EAmB2y5iNxKpklJ/VHxDNY5pKfgVKreCk1IBkO15+5xEA5
 mWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ap/QSv3GkUHYeojHm4FBBQCj26SJBmPCdu4ADGYVg24=;
 b=iWGM3/myMe9TAPHHGvKbllTjfoo4l7q484dYMfRrS8GPxXrMCZ1cCOh6POsY67vGs2
 2hXkULbZdnlIeKxcj/WsH80wD/5Dse1HV3m7PhCnjdZvbwR/s6lOLsBgUCFq8/ClRI9l
 0cr3mtRJjqYx60eVEpI13RKAkdQdHIXJ50MHHYMZJR2LXfXCWb4y2n79EkZ8sgU+47o7
 0rmjDyh9CR9ABG97yBx3gFpQXzEKHov9KfDppVktuEiDCsqFABPBrITykHBlWzCt/UUw
 yq/r9j0fo6EBNr/G5jbN1fYe4zF/oRkDsAtdPq+cQLWz2vDovIjdHlnXHI1fjMny4Jq+
 wisg==
X-Gm-Message-State: AOAM530EqplQ3wAzvdiz3tRwHbP4svBOu6wjcwK0bwADeRRZflfz+A2z
 ZIxrPA9HqmdgEd+bbyfWmU0unnPFypJDMKIzT4d/3g==
X-Google-Smtp-Source: ABdhPJzvVyl2GDgjwIJ32GLSLnWqP9H5KdEhR5B57VJYjKwNrn5CqDZtLnKlY3Zsr/qKdbu34fffeiBun9HH7Yhx/UM=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr33587702edp.251.1626697592513; 
 Mon, 19 Jul 2021 05:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-11-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:25:51 +0100
Message-ID: <CAFEAcA88bar3A4ovboEk7w4E1YMFcTBdL7OTjyBYzXZXq+NVtA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] accel/tcg: Push trace info building into
 atomic_common.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use trace_mem_get_info instead of trace_mem_build_info,
> using the TCGMemOpIdx that we already have.  Do this in
> the atomic_trace_*_pre function as common subroutines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/atomic_template.h   | 48 +++++++++--------------------------
>  accel/tcg/atomic_common.c.inc | 37 ++++++++++++++++++---------
>  2 files changed, 37 insertions(+), 48 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

