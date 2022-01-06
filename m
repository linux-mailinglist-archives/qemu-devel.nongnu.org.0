Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6BA486A9A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 20:44:20 +0100 (CET)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5YgN-00031K-Hd
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 14:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5YeE-0001U7-Et
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:42:06 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42626
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5YeC-0000DV-UR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 14:42:06 -0500
Received: by mail-pf1-x42e.google.com with SMTP id t19so3351177pfg.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 11:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zi7qxpDJHqV6x4BCP4hPIMM237a+gpZhMq66QNiSxOs=;
 b=s6OCLqfEfwHFlF2SYCRQayAFKQ0Wm3hLrTVMt7dkWtgcSKGV10dd8SdpWbPnUJSuym
 fc4ftZ78enzSd+zT8/7Z4KXF8pDa6a48c0PPnCwUcZJzHVVLydSrG96Nxs+USqwYwibM
 41VcbgzNRBhKilDhV5auLW2iGU5LxS6ud7/Mtfr+yCPSngLU5Hb8Dkhxh2stCZ6MLUjo
 iWap5MZObZkfwloCVS7Hs0UPf0scicKoWHtEILgNcdKRJjj7F6UFatQPE6pVGkR2bJIc
 JSJnAKNBVWBsnz5+oHwIo85M+R7fwnjMewiCyD4OwlehgitVmnHxyR1oWT3CGVyyzhGm
 6pSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zi7qxpDJHqV6x4BCP4hPIMM237a+gpZhMq66QNiSxOs=;
 b=mDqPpD5tqu1zKCmPZavTHZtZnaiCa8TFmXGq82wZ3eTeJhq/adG2MmGXPgAspjlNDE
 oc4loVDtguuMRIC5tKr0mNWx6i+rKmSj6kOIPtuU8tvxY1P+4UAQqhBD2MN5yyPSKonV
 0eMnF5O062JeXEIfDqvMXgVIXAKL1Sxpr6sP1zD4OlvrmolQ+cQnDQdhlwrQtOI/LNVw
 iWz0x3u3nmk1Znmv8Ht3EajAOL4BBqp2Mo4bG3CgqMvrxwdhwjZwDzFLTx3yA70rwXjN
 xMGG5cRMSKbZvp4ZZiF49KVO/vf7/ogixzICgQ8zhEt15sDyvfblIUuASGKQ+i3jq5cv
 n53w==
X-Gm-Message-State: AOAM530W9uVmXOWuB95vCLvNvGz8SrPawbmFInDcZlOTBgTsg6a9Vlj2
 cllfR8Y7MUo2vSM08qIL2p6O7g==
X-Google-Smtp-Source: ABdhPJzcDafGdtxYIvNvG3h8pD7cG/jbIbHYit0bnYqi616Ahdn3TWounhiymK4rWZT3uLH1LmxXmw==
X-Received: by 2002:a05:6a00:2189:b0:4bc:3def:b662 with SMTP id
 h9-20020a056a00218900b004bc3defb662mr37228426pfi.5.1641498123564; 
 Thu, 06 Jan 2022 11:42:03 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id j190sm2664189pge.70.2022.01.06.11.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 11:42:03 -0800 (PST)
Subject: Re: [PATCH v2] tcg/loongarch64: Support raising sigbus for user-only
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20220106134238.3936163-1-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3e3476b-0692-48ac-c1fb-502af8c351f1@linaro.org>
Date: Thu, 6 Jan 2022 11:42:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220106134238.3936163-1-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 5:42 AM, WANG Xuerui wrote:
> Based-on:<20220104021543.396571-1-richard.henderson@linaro.org>
> 
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
> 
> v2 -> v1:
> 
> - Dropped assert and added comment documenting reason to choose
>    bstrpick.d over andi for the masking operation
> - Collected R-b tag
> 
>   tcg/loongarch64/tcg-target.c.inc | 71 +++++++++++++++++++++++++++++++-
>   tcg/loongarch64/tcg-target.h     |  2 -
>   2 files changed, 69 insertions(+), 4 deletions(-)

Thanks.  Queued to my unaligned-user branch.


r~

