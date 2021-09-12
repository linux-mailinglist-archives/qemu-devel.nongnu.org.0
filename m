Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D964081FC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 23:58:58 +0200 (CEST)
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPXV3-0006rW-Pc
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 17:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXU7-0006Cb-Qc
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:57:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPXU4-00070F-Mt
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:57:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id y8so1642739pfa.7
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 14:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RTu1F3lRHCffxoD3ds7LKCx1SHmXRxVF8CBJesQe4Qo=;
 b=xtHbEkCbbqa6qlUSjV6j3zJpwRLGCAs97ISIrPDNSDY14Mjb3+fCOm56YmYSIFYEh3
 R7Ig8UH0bgxElLcCGOKtZSMVTnJkSAI7qAQR5WCmhzPud8M3U2iFadwVkIFL6cmvFAwx
 wuYhccUsvoxCs/WkyKfs2gtoiwD6kLc4TCM4pODue733LqxYS1q6Mle6N+91MRRFxOuC
 s/aMPDqVAMw3MbiznmisLYrVS7a5mmry1X7MILEmW+82TaTZyk51m6M4WU9+5Z95Ob2i
 OHyqKvXcp4UfoXNvSvTauXVes88KIobas4IuXdGqgQYbuE1skTmOYxR+JpRhZV8bIZC9
 Giiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RTu1F3lRHCffxoD3ds7LKCx1SHmXRxVF8CBJesQe4Qo=;
 b=S2gxBGMkZAgJxw1VyrQmYIQ9uof33zKlLMgr3vCte3IHVcCQM9ES/vhJmnPrDo6KCa
 xfFFZl8HUSVGptkuxAvIVuQyBv/hDPOMoq6UPPcbZ/Wot+iJxx7Qo6t7EgroVdGIUcoG
 1MIbfjcOojH3JpsRf6v9HYlnekvnIdliYueuP+KmLy2lFTzd1FAefF36DWbhxIggNU5C
 ZgsNEMLKVYWKjKpwyU5HPXkMSj0vUZnsuqDCwH0m3L4J7+1KJzEF5oCs5RgmNLOq3232
 L8OVw8vVmbBAoCUpGqIw/du3k86AyCrJuM1RD6cuuLtmV1gQCmiMNm0WCIXk6cbcDxBR
 w0rg==
X-Gm-Message-State: AOAM530npaHa8M25owIDkv5uFpzzawX6UfxEw0f/SZ0LxCJ/swUqYTgC
 jYDSdzvh1z7ePsJFq4er6NKjaw==
X-Google-Smtp-Source: ABdhPJz2khPRRNofNgEaSs75GUzUivTkHIoL1JoGqgDZWZQbuLqPCT9ud0R3Rroq8+pE3HOlfiqmPA==
X-Received: by 2002:a05:6a00:1750:b0:40c:f3b8:dc76 with SMTP id
 j16-20020a056a00175000b0040cf3b8dc76mr8069702pfc.22.1631483875157; 
 Sun, 12 Sep 2021 14:57:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 31sm5374588pgy.26.2021.09.12.14.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 14:57:54 -0700 (PDT)
Subject: Re: [PATCH v4 00/16] tcg/s390x: host vector support
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
Message-ID: <fc42f428-7c7c-4a68-5b53-b328eaebb6b2@linaro.org>
Date: Sun, 12 Sep 2021 14:57:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210626050307.2408505-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.  The branch rebases to master without complaint.

r~

On 6/25/21 10:02 PM, Richard Henderson wrote:
> Changes for v4:
>    * Fix bug in RXB (david).
> 
> r~
> 
> Richard Henderson (16):
>    tcg/s390x: Rename from tcg/s390
>    tcg/s390x: Change FACILITY representation
>    tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into TCGReg
>    tcg/s390x: Add host vector framework
>    tcg/s390x: Implement tcg_out_ld/st for vector types
>    tcg/s390x: Implement tcg_out_mov for vector types
>    tcg/s390x: Implement tcg_out_dup*_vec
>    tcg/s390x: Implement minimal vector operations
>    tcg/s390x: Implement andc, orc, abs, neg, not vector operations
>    tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
>    tcg/s390x: Implement vector shift operations
>    tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
>    tcg: Expand usadd/ussub with umin/umax
>    tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
>    tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
>    tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec
> 
>   meson.build                              |   2 -
>   tcg/{s390 => s390x}/tcg-target-con-set.h |   7 +
>   tcg/{s390 => s390x}/tcg-target-con-str.h |   1 +
>   tcg/{s390 => s390x}/tcg-target.h         |  90 ++-
>   tcg/s390x/tcg-target.opc.h               |  15 +
>   tcg/tcg-op-vec.c                         |  37 +-
>   tcg/{s390 => s390x}/tcg-target.c.inc     | 925 +++++++++++++++++++++--
>   7 files changed, 982 insertions(+), 95 deletions(-)
>   rename tcg/{s390 => s390x}/tcg-target-con-set.h (86%)
>   rename tcg/{s390 => s390x}/tcg-target-con-str.h (96%)
>   rename tcg/{s390 => s390x}/tcg-target.h (67%)
>   create mode 100644 tcg/s390x/tcg-target.opc.h
>   rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)
> 


