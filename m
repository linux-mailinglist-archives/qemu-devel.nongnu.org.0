Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BA061A4D5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:51:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or5WV-0001VE-1M; Fri, 04 Nov 2022 18:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or5WK-0001Si-0L
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:50:40 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or5WI-0003W7-GN
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:50:39 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 x6-20020a4ac586000000b0047f8cc6dbe4so873265oop.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=24oXYSvFvnHaVl1rUjVXlbxD6lLZj01gCdU9Kn8ZJlY=;
 b=MRgWeCizf4/VewBa4M8rnLIFz9Dvr2Job63QvV2jT3q2ekUHUaNORjnVAr2cfg4PdI
 0rnJrPc9Vc+TNaZsd19KXvadci6tUiLkC8kHMR+xMCCxegN19zbzSG7uZdiTrwrLEBGY
 4jD4Rlzhj7fyC9S4t/pHXhNb+fQySFV9KdHEa5BT74/ZpaiCbpEa3rR4cee/tpFmvRqZ
 Oc8+UwsJGQYP0Kp3GqIkzeRcNYPi6NT9s0Z4QCAMacV/jjJFLhQG3pzLKBdeSvwNfpY7
 /fbEC7G9tu6AeSu1JsdNIgCfx+F8H+6o+BGcLmWnIw46cESgZm+1uskd1a9v/n4eJ7nV
 AZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=24oXYSvFvnHaVl1rUjVXlbxD6lLZj01gCdU9Kn8ZJlY=;
 b=rHigES4xAvPv+4OWtHIbBvCTnO9LGdrjtaKXjZnBmjUhKNE0QURowGyAUS59cho0KI
 z1crsHLI10zAgMwVq0bTbBYOpIEJhOXBre/4vogIz3DLUa9KD4/NjFrkC2DYaMr5mo9I
 ar901b29XeNnCAXO/H/x22ZsrPXjFrLCFXpXUDJQT0+nil8uOo27f7/9nfucZSe+OErN
 oo3xwwIQlLmiPDjoMcMMrARUSb5HY7bcDyN8+2VI7KsQUYO8YwgVLmHrzuQdp0GfRY0z
 HEX22dSEyHHjHuDB2B14kisZzGFolKWufxLf0/NKAmr/1bBjOjklVhk3yqj8OIAb32+8
 0rtw==
X-Gm-Message-State: ACrzQf04OfOev1Qh8tK6WgaxgMHWWGBJUKelsW4llwNJzphrLONjNFok
 PFA6lSaHWwHfY72qg3RoRe6xOQ==
X-Google-Smtp-Source: AMsMyM4/f5HNNs+teWzQFw44NS7l6yzdSw6lxXikQpdZPxNBuN1/7AQcpBoGOxeyR+hPE8fDlJV4ow==
X-Received: by 2002:a4a:e24a:0:b0:480:fe38:5628 with SMTP id
 c10-20020a4ae24a000000b00480fe385628mr16219324oot.25.1667602236009; 
 Fri, 04 Nov 2022 15:50:36 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b0066871c3adb3sm261885otk.28.2022.11.04.15.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 15:50:35 -0700 (PDT)
Message-ID: <052d1929-c2d0-4a19-bc64-06c9355df9b8@linaro.org>
Date: Sat, 5 Nov 2022 09:50:23 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 02/11] Hexagon (target/hexagon) Fix predicated
 assignment to .tmp and .cur
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-3-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-3-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> Here are example instructions with a predicated .tmp/.cur assignment
>      if (p1) v12.tmp = vmem(r7 + #0)
>      if (p0) v12.cur = vmem(r9 + #0)
> The .tmp/.cur indicates that references to v12 in the same packet
> take the result of the load.  However, when the predicate is false,
> the value at the start of the packet should be used.  After the packet
> commits, the .tmp value is dropped, but the .cur value is maintained.
> 
> To fix this bug, we preload the original value from the HVX register
> into the temporary used for the result.
> 
> Test cases added to tests/tcg/hexagon/hvx_misc.c
> 
> Co-authored-by: Matheus Tavares Bernardino<quic_mathbern@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino<quic_mathbern@quicinc.com>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/translate.h      |  6 +++
>   tests/tcg/hexagon/hvx_misc.c    | 72 +++++++++++++++++++++++++++++++++
>   target/hexagon/gen_tcg_funcs.py | 12 ++++++
>   3 files changed, 90 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

