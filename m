Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A096EE881
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:47:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOX1-0001fp-Rq; Tue, 25 Apr 2023 15:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOX0-0001cx-Dt
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:40:54 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOWw-00078D-FE
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:40:54 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso94936665e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451649; x=1685043649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DW/b1bKpoxKOxPcUmgpPPo3BGGNeSPggRjC6qLXL/Xo=;
 b=zJTK/fDUQW38JbdmCNk7ZqnB9X26zJoro5dlBmwZxpmwXH+Jaga/SanbpBimJCq9VA
 tkyC98UaJN1VElJRv13Ph1/xsKzKHiGbwO8jshsJm+t5BOqh4/QAfU3cORumCzs6kwVz
 J3kE5OF5Gv2gUPy3SjHOb6XjI+s6p06SBYTe81bD2qMPGpmuF7nc4N2BLokQAibSp/i4
 NcNnDDGyPVWI7bD2ZdgPmXjBzlTL28hFbU4jTRVGHXS3+ldIUsWazNc5/3cmGeQod90u
 fTXScTk3kgYIq1hFKCWro1TbRH6DS7C/V2Y4pvx1uO7H3sxhf62HoMzRRU2kuBDzJNJE
 dnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451649; x=1685043649;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DW/b1bKpoxKOxPcUmgpPPo3BGGNeSPggRjC6qLXL/Xo=;
 b=fvsXV2AQZ+fHtOZZlUVhlKf+yYjkuTz2miRZNCSdrAhTE3G/lwF1Hcof0QtYIABHi5
 TIAI+e4wUudb7pBlaH/yADwBb52Z8Kfo1M6/XEqibf13M7BjDN3+T7d/42K8vx4QEb3q
 oN36y9bkEwKnOyJA2HBG7fQS2eg/7Z+4nUhb+LyU0Pz96Kh7l3bEE0nSnRwRjoQ3Naxo
 1dHqdnZfJ7HWGWdgK5n09S/bebu8TmAqLxNKM7NBviIeJGSvC3cIx6tjaIpKEgTOZSmT
 7PKs4+5MJ4UVSgZUCvuEvt1LA0NfBM7PMpPIPDvFDhjKZuYErT+p+1fTjF5JzebObDLO
 K4HQ==
X-Gm-Message-State: AC+VfDxTatfJzDBqt6LE8GkA8AggFyAcPsOLllVxjgcTA8HUlFSdRmX/
 OLz6JScWWAsTrWkTWPRHP9HRVA==
X-Google-Smtp-Source: ACHHUZ4bLk5efmiJkpPUPGdz3Ha0e3ZoLQbPapl6EAq7KQFrPGIz5Ah2Ph6AnhAmXGLDHTOBV1Bccw==
X-Received: by 2002:a05:600c:2214:b0:3f1:6880:3308 with SMTP id
 z20-20020a05600c221400b003f168803308mr43787wml.1.1682451649022; 
 Tue, 25 Apr 2023 12:40:49 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm15791193wmk.38.2023.04.25.12.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:40:48 -0700 (PDT)
Message-ID: <a4c07ff2-68d0-da68-015d-445531a3706f@linaro.org>
Date: Tue, 25 Apr 2023 20:40:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 01/57] tcg/loongarch64: Conditionalize
 tcg_out_exts_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/4/23 07:40, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept sign-extended in registers,
> via ".w" instructions, we need not extend if the register matches.
> This is already relied upon by comparisons.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


