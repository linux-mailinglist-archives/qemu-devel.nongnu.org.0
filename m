Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1A6F1305
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:10:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJAq-0006d7-3W; Fri, 28 Apr 2023 04:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psJAn-0006ca-Uo
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:09:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psJAm-0006Bp-51
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:09:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50a145a0957so14617777a12.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682669382; x=1685261382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dM0ata4LC+twWy5HNfJ9sVUsYboWsLln458B6YRzkpw=;
 b=FKqj1cq52036kGnG8sVcxaG7S58wniwOxM3oOYSE3TVhhCAvIo4LcPy0ek859AOCUT
 a7AhzXjz8ZQAiom2mfnqXRAW78NBh14+RSQf0jO8KTe2kDRYu+KKu0xXGnTwOlvtn3Ck
 PieQLPrrNYRkwTS5oycKjvSwlXyu2ocBwC33sDVt/ukOTsF2vBhHsoNLad9Evnxta3kP
 c4tvy8OqFbpf1B8ncbj0RN6t3N943TJGQSyGQdwuYyhHsP5tBxVQAtmUd1kNzLwwAAy0
 iMZ+Wxogom5Zu0iT7mUmzdirYHQZPxOsp6L8va2bciIXhKgK0yf4+OvzJ4aHtC8zlSM/
 5aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682669382; x=1685261382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dM0ata4LC+twWy5HNfJ9sVUsYboWsLln458B6YRzkpw=;
 b=l+xuMIqo9iUAoGhJMhCmY0Q8B9WoTIBj9EqjBJ2mLkm5DiHViyLDZljojXqtYcIuUU
 LLbfAv+kK6f6XdePCOJXTxcajZ16ji8kiKYJ7cVvpuD7SKQ3jAuZx1kXw89YjrabRSSn
 0/dAurZ0wUpqa0ZQ3Xc5pzStgDYNohR2V3hcyTJSMCLjb5iPA/4gAjk+2F4TZaa8cSSD
 E7MY9haWtRuj8fl0Z9v1G5MNRpVk+arV9oIdmODw0D1sc5bINgq0slhTMtTDERsfLGH4
 Rq+rpjxnFGpg+NSiZdQpTvuKFy9h9MEp3472EXAzisByiwesjhru5Z/yxpZGTrwkH83T
 9SrA==
X-Gm-Message-State: AC+VfDzwvnOb68Dk4P4CBVEs8oNnLOBqAsh6/J87gke/i1jLRAsU2wai
 6hZKka2kE0TU77j5xpGs8Mbm5A==
X-Google-Smtp-Source: ACHHUZ7xdNfjJig+ku6nnoHOQEFt2MgH5Ry5U6TNah0PIwqADKHKg4K0+dl+O2JnrNu0ydsjyXU8pQ==
X-Received: by 2002:a05:6402:1911:b0:506:72f8:eb10 with SMTP id
 e17-20020a056402191100b0050672f8eb10mr8397440edz.0.1682669382206; 
 Fri, 28 Apr 2023 01:09:42 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 de30-20020a1709069bde00b0095fdb604a3asm2225379ejc.77.2023.04.28.01.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 01:09:41 -0700 (PDT)
Message-ID: <ac2efb98-7c35-fff1-ce46-d85e4fe4774d@linaro.org>
Date: Fri, 28 Apr 2023 09:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 14/21] Hexagon (target/hexagon) Short-circuit more HVX
 single instruction packets
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230427230012.3800327-1-tsimpson@quicinc.com>
 <20230427230012.3800327-15-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427230012.3800327-15-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
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

On 4/28/23 00:00, Taylor Simpson wrote:
> The generated helpers for HVX use pass-by-reference, so they can't
> short-circuit when the reads/writes overlap.  The instructions with
> overrides are OK because they use tcg_gen_gvec_*.
> 
> We add a flag has_hvx_helper to DisasContext and extend gen_analyze_funcs
> to set the flag when the instruction is an HVX instruction with a
> generated helper.
> 
> We add an override for V6_vcombine so that it can be short-circuited
> along with a test case in tests/tcg/hexagon/hvx_misc.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

