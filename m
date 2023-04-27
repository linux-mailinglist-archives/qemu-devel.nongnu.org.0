Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DEC6F03F3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:10:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pryZe-0003Wi-Qs; Thu, 27 Apr 2023 06:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryZa-0003UD-3Q
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:10:00 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pryZU-0002mh-W0
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:09:54 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-505035e3368so14349104a12.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682590191; x=1685182191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mqFQr8e6pBaDzauVe8ZGgXZVMUHo7kGeUeG+Seb+BxE=;
 b=gWFmL0qE9SSZQOKoWdtb5faHUCg2WNrnqzJYtNyOskjnabFkYzrNj7DSBdFfmS046o
 dmF48DfhJEOhKP2/Ec5xKXzPOPttcF3+G9k4q6rKTlftveCnsOFWJIh9dsEMOccGkCVB
 Dv6WKkoevlLUoR/SQd9dWrF8MBYFk1wSYwgRd4dRXJn1uZT0IEL59rtlvSPyj2A1OEpt
 XSjJCNB7TX5S+xBwjkvQc99jvAwerJJ1K6vh+yRkxZ48Xdz9nPqJqwC17c0WWdgeVti2
 e8st9y7m6nMUA0xqB/CYH/NElN/5c74WOKHwdRB/70QAZLpQOpnFDdai2L7+UbZqUGPe
 nqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682590191; x=1685182191;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mqFQr8e6pBaDzauVe8ZGgXZVMUHo7kGeUeG+Seb+BxE=;
 b=GyzTiD7HgCyWLCG9VExw5UCWfJ97TtLS0a020xIaMmQJx2TckEgXx3m/SU0HTa5g5s
 lFGAyGhIiWSpMjQn72sqq4KtX1Ap/CeSqur7O6ciPXBu7aWPbEC3fIHr/ryDqYSDr76d
 45FHLjRj4LoPGYLoEU3ZsIyRvw1XAguCDS90C1z2GIgrO8iisLps/rTKR7yKumA9K52f
 fpel4WCr2d0ukGlaqhtuGLBdzjXqawKnX8F7kItT2FP/3unqSSMvONwAPIHBlc98MkAb
 2izNmQPXYgjikPv+42whdEu43kHX2OLQyCxLePLmYd0pk1PflOyUTjmfDENReMWKw58c
 Mxrw==
X-Gm-Message-State: AC+VfDxTxcCEU4ag2sV+TLLqsAX/Vr+mH+Mbv5RQ252aXmuE5lSl5zk2
 r2irj263mwoC5obcQwTVT6i0ag==
X-Google-Smtp-Source: ACHHUZ6FT2Nu92v8rMwtV60YKlTbw6JAxAa00ZxDuG+aouGoU/8hNeHgyQWLRJINJOn4Q/zVhhSVQA==
X-Received: by 2002:aa7:cc97:0:b0:506:75d4:44 with SMTP id
 p23-20020aa7cc97000000b0050675d40044mr1039833edt.25.1682590191373; 
 Thu, 27 Apr 2023 03:09:51 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 bq6-20020a056402214600b0050470aa444fsm7721629edb.51.2023.04.27.03.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:09:51 -0700 (PDT)
Message-ID: <a79adcbf-3efb-2421-5e39-fecbb97381ac@linaro.org>
Date: Thu, 27 Apr 2023 11:09:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 3/3] migration: Make dirty_bytes_last_sync atomic
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230427095250.22350-1-quintela@redhat.com>
 <20230427095250.22350-4-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427095250.22350-4-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/27/23 10:52, Juan Quintela wrote:
> As we set its value, it needs to be operated with atomics.
> We rename it from remaining to better reflect its meaning.
> 
> Statistics always return the real reamaining bytes.  This was used to
> store how much pages where dirty on the previous generation, so we can
> calculate the expected downtime as: dirty_bytes_last_sync /
> current_bandwith.
> 
> If we use the actual remaining bytes, we would see a very small value
> at the end of the iteration.
> 
> Signed-off-by: Juan Quintela<quintela@redhat.com>
> Reviewed-by: Peter Xu<peterx@redhat.com>
> 
> ---
> 
> I am open to use ram_bytes_remaining() in its only use and be more
> "optimistic" about the downtime.
> 
> Don't use __nocheck() functions.
> Use stat64_get() now that it exists.
> ---
>   migration/migration.c | 3 ++-
>   migration/ram.c       | 2 +-
>   migration/ram.h       | 2 +-
>   3 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

