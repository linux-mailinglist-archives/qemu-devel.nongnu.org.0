Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084B26DCF54
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:30:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2pq-0005yB-H9; Mon, 10 Apr 2023 21:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2pk-0005tz-KQ
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:30:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2pj-000751-35
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:30:08 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a526aa3dd5so6128145ad.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681176604;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kjf6orOMouIvoiS8Uq1uge5Ygjv7kODfHtdGO8o9QG4=;
 b=mkRMcRIZPaasMAsMWr3Yst7AMrIRwz/ztVnK7ln6xsRw/EpkZrJQ7obiAdQ5Xlhqnl
 91Wg3Wq3cngZqfj/jZyB8HwrxBqHcUE6QDXuG8tRpTP1R9g0xqJABW3iE3Hd6lzNLGPa
 BtQ9hln+IOHA9+fWcKfhbWY5jsiZnNJT7gwib17CcGqURi3Apluj24iwswBwLRZxdcqu
 rZQOc2NXaOdSYJs6aUGs69iqhQoGXnDsvb+uwINfGABW8iEmPW5tz1Lyxb2+dLzdMI5/
 UWi+ExMxhOcRzeKx5iGn+XmAd2hbckquG6842P99oDDbDzMVRMx2gjg/n4GXNcugiANC
 qJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681176604;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kjf6orOMouIvoiS8Uq1uge5Ygjv7kODfHtdGO8o9QG4=;
 b=K/Z2qMEgRYeaOp6btRANIfta1s4KOxPmqVpIjd9nvfNyP4ipoeW6KjtoR2bwDf8FTI
 UfnAPtz4qHstdZHP9sZDkpDL2Ix8g77c0V05cGJpChkeA9tqia6xirNXisU8Y3WL2wGE
 hcIewzqcB1N8QtlweYbiZ0xWbPzUu+ZFho6tQpW9sCUapiVmwVm1jUAreVAD2jx5M/S6
 d6QtoapUiDc2j5BdMOVC8P5dGUs2Beoq+5gr9bqjRIIk7z0/3Fc24t72+Yhiso9QYr6K
 1w4zB2HO6clPKWoEn25D8cWU+lhJu91PywL4KxThhgIZ0rHqbOkb+rzq5S4rGVwS9N4+
 nI+A==
X-Gm-Message-State: AAQBX9ctXKMKbujozsdHI/goZbqh5MzI/Ak+Cr/SCWzQuthUAZ/H89AA
 zeFqwJm7K85g6uEGRiLILdWPDA==
X-Google-Smtp-Source: AKy350ZTPp/eCYG+/WwUh6fYVpvIQX/qYxBikYA8jJYEIX6FCkCCulevOzF7S+Gth7OSn1U3ABqGcw==
X-Received: by 2002:a05:6a00:1c:b0:627:df78:3b22 with SMTP id
 h28-20020a056a00001c00b00627df783b22mr1237355pfk.0.1681176604571; 
 Mon, 10 Apr 2023 18:30:04 -0700 (PDT)
Received: from [10.1.0.142] (h146.238.133.40.static.ip.windstream.net.
 [40.133.238.146]) by smtp.gmail.com with ESMTPSA id
 g25-20020aa78759000000b0063799398eaesm2704334pfo.51.2023.04.10.18.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 18:30:04 -0700 (PDT)
Message-ID: <0d07641e-f37d-3589-58c9-d992ab70a985@linaro.org>
Date: Mon, 10 Apr 2023 18:29:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] Hexagon (target/hexagon) Add overrides for
 cache/sync/barrier instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230410202402.2856852-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230410202402.2856852-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/10/23 13:24, Taylor Simpson wrote:
> Most of these are not modelled in QEMU, so save the overhead of
> calling a helper.
> 
> The only exception is dczeroa.  It assigns to hex_dczero_addr, which
> is handled during packet commit.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h | 24 ++++++++++++++++++++++++
>   target/hexagon/macros.h  | 18 ++++--------------
>   2 files changed, 28 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Something to look at in the future: I believe quite a lot of these variables like 
dczero_addr are not "real" architectural state, in that they do not persist beyond the 
lifetime of the packet.  There are others, e.g. pkt_has_store_s1.

These variables could be moved to DisasContext and allocated on demand.  Even recently 
this was tedious, because of TCG temporary lifetime issues, but no longer.

Just a thought.


r~

