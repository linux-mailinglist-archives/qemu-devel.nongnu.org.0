Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E283B88DE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:59:51 +0200 (CEST)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfR8-0000Gj-CG
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyfEq-00039b-LM
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:47:09 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyfEn-0001c9-M8
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:47:08 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso4648121pjb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=imgcK097uyCRydqRsrFseJ06oXb8Vx5cIc0o0S22CTg=;
 b=rgP0VzREvVNU2UhsusxEAYD+hIB3E3+2S7NjePnyuNaI39AWXzpvnbXIPm1l6Bfuoi
 PmHsAtqWyFU0IbKPTdIfTDnMZUj+tP0WaMFDCj4LVNz6LRxEtAB9bj33PAfsmGWMHyRK
 UCa+IZZpkt2UvGDeWdcA67BTxI6r8Vu/4xz7Cwy1UDVIt9RuPOokLwRsWxahYQfbUqpK
 jLTU7y8izDzkRXmduTw4mySzsAY5/SsYDV7CSQMDztYpkCwGX+OeBNfxttfBx0pCD2Da
 lGRrzESU/8uNkCPUnJ7jjfRAppeQO/h3Ntu9OayDQStWVbq5/ZEfeA0y6ON0yO9mojfW
 KcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=imgcK097uyCRydqRsrFseJ06oXb8Vx5cIc0o0S22CTg=;
 b=taagBmWh+3EY22KaFajL9bLruZbdfHH+gDj6DOBlql5ScVpFyOSpGatTUuAoqPQ2ZO
 xNCijDwCnKEKFUWb9LtCU7MdeErcMdWe9sn0+8ccoXn9ZLyK0O3Va8OXED6kXuDR6qCe
 HZ4HE3d/tuvfR6l/B9nQfpufc6fSaiS597IzeQhN0tC/iR0kHbAtX9o+GATXjgofUUiI
 VA8SHnIrWuUEJJ/PqrJ7TA2Lf0VgYpG0sldTd3D1Vxci00oZxf8I53+SswUFOdNXsZdD
 43ISLoHlDuFmqFL4L8T4Nl2eYGpFzpNozcYdiSroGu/BULKvIWX2w1kI1WC79nLi3g7J
 OtjA==
X-Gm-Message-State: AOAM533lO7n/qvrGCJqowen+XWQHbq174AzqIjkgsSY0OwgFnsdNOsYA
 iLIh9CEymWuAjju7HIiVssnExYpbbP7hBg==
X-Google-Smtp-Source: ABdhPJwUo9D9QfUaMhSWAZFY3KKPKnuCXZox9ImdtSA1Sf0NmJ4wq5eeYIvodFoMtmihZzlG4eYsRQ==
X-Received: by 2002:a17:90a:f0c3:: with SMTP id
 fa3mr25070524pjb.90.1625078824219; 
 Wed, 30 Jun 2021 11:47:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c24sm22480727pfd.167.2021.06.30.11.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 11:47:03 -0700 (PDT)
Subject: Re: [PATCH v3] target/s390x: Fix CC set by CONVERT TO FIXED/LOGICAL
To: Ulrich Weigand <ulrich.weigand@de.ibm.com>, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20210630105058.GA29130@oc3748833570.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0233134c-975c-57e4-6679-f5a51acd4da5@linaro.org>
Date: Wed, 30 Jun 2021 11:47:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630105058.GA29130@oc3748833570.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/21 3:50 AM, Ulrich Weigand wrote:
> The FP-to-integer conversion instructions need to set CC 3 whenever
> a "special case" occurs; this is the case whenever the instruction
> also signals the IEEE invalid exception.  (See e.g. figure 19-18
> in the Principles of Operation.)
> 
> However, qemu currently will set CC 3 only in the case where the
> input was a NaN.  This is indeed one of the special cases, but
> there are others, most notably the case where the input is out
> of range of the target data type.
> 
> This patch fixes the problem by switching these instructions to
> the "static" CC method and computing the correct result directly
> in the helper.  (It cannot be re-computed later as the information
> about the invalid exception is no longer available.)
> 
> This fixes a bug observed when running the wasmtime test suite
> under the s390x-linux-user target.
> 
> Signed-off-by: Ulrich Weigand<ulrich.weigand@de.ibm.com>
> ---
>   target/s390x/fpu_helper.c | 63 ++++++++++++++++++++++++++++++++++++++++++++---
>   target/s390x/helper.h     | 24 +++++++++---------
>   target/s390x/translate.c  | 39 +++++++++--------------------
>   3 files changed, 83 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

