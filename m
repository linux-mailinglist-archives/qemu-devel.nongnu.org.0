Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1068E146
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:33:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTgt-0005kw-V0; Tue, 07 Feb 2023 14:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTgr-0005kG-Qy
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:31:41 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPTgq-0000Qg-5d
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:31:41 -0500
Received: by mail-pg1-x531.google.com with SMTP id x10so127270pgx.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c8DxGxHyLHz6Ij/kNiJqQ6UwvKTZ9779gTDQJgz/OR0=;
 b=Xdu7gS9HlHRWsxF7ehiWxKESugg/JDCgY+uktzIN26LZVqc8IvQiT50j3PdIq2+zPz
 T+5gVIbryXwUf+xi4MyoAaTJOgFCfBfEcscs2kk82h99drO5Tnz3q0m+f7X8Z/jGlQO/
 7vCTNCL9m141sP52kMv0UDFNo/yFu0Xwmew0I73T78HZpLgwU1S3BSuZ+Ew4XTRKLvhg
 aso17Yw9VRVZ9IErlFlYJ9cFYu9tqVpHG8f6eLQc+pqfomZRea6S/qirwQOoqotY0OBI
 UB5nlOxxjGwyVzDpNr+bM2si3zPqy1IF4zSqi4DLm2NIevms5lNyFIhGJD5WEdjJhz+Y
 +P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8DxGxHyLHz6Ij/kNiJqQ6UwvKTZ9779gTDQJgz/OR0=;
 b=0vFxjJOWwA9zXdzx9VwNHFMJbWas0ddvS/amLsnkjTmVG8grH6G24W34BKZjDKKvcP
 sE8GkwgF32j/PjTXFhYsFoA1Cu3SiBYhwvrvZo+mKk0jdylzKFqFE487p2gtiUmOrRw2
 O7wGbTmXSZxCW9K/XcbmUwsbjS9CuxAfhzF236p5OcW7VwwVnL1Fjc677saW0N+1hjzV
 tnsBSAIe5J11UFKNbRVvb1LnpsO+1H1aRO5swgS9aGa7j2Us5H7t7A8GrooeOkL3DaiV
 NX6Rb1T9jDkn0XCYVf5ULVNBHv9pnSIuCnn9Tk0vQSWEZ51MgFAPRaOLQJ1EAQ/KkpEG
 x2Gg==
X-Gm-Message-State: AO0yUKU3PVnGKQbnQocs6nHVIvR17IaAJu3JeIg1yxieSkyGReu0Hl4r
 NE8m5K+Au143Ljjp8XFVDNYexQ==
X-Google-Smtp-Source: AK7set8mxKBce9tPm3/UySQ1cviTr5hWyRs63F/kkkXmSYbDbrylqyMgG9OXeCb29eryvgBTbCGuMw==
X-Received: by 2002:aa7:9a0d:0:b0:590:7526:713f with SMTP id
 w13-20020aa79a0d000000b005907526713fmr3704733pfj.25.1675798298150; 
 Tue, 07 Feb 2023 11:31:38 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 c18-20020aa78812000000b005818d429d98sm9557801pfo.136.2023.02.07.11.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 11:31:37 -0800 (PST)
Message-ID: <ca9fc552-ea38-8dd2-abc7-a9ade0c2b277@linaro.org>
Date: Tue, 7 Feb 2023 09:31:32 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/22] target/arm: Rewrite check_s2_mmu_setup
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-3-richard.henderson@linaro.org>
 <CAFEAcA9+BLL3m+SO6ht8hZktSHN=AKpmK9vzJwoWoZeGHC=hYQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9+BLL3m+SO6ht8hZktSHN=AKpmK9vzJwoWoZeGHC=hYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/7/23 06:00, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Integrate neighboring code from get_phys_addr_lpae which computed
>> starting level, as it is easier to validate when doing both at the
>> same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
>> especially S2InvalidESL and S2InconsistentSL.
>>
>> This reverts 49ba115bb74, which was incorrect -- there is nothing
>> in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
>> pseudocode is consistent in referencing PAMax.
> 
> I'm having difficulty reviewing this one:
>   * the latest version of the Arm ARM doesn't have the pseudocode
>     functions you refer to, so it's difficult to cross-refer against
>     the spec

DDI 0478 I.a certainly does have them (typo: S2InvalidSL not S2InvalidESL).


r~

