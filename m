Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC738ED42
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 17:34:11 +0200 (CEST)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llCan-0004PV-Ky
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 11:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCYy-0002II-Kl
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:32:16 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCYw-0003Td-UC
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:32:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id l70so20367870pga.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=E+1rF+gQ5BXZJh3iM48/7iy3zG5eQbhpWyUrAtHjcxk=;
 b=sFJOHbSDIplVt+wiWeuD1iqlNUg4LDtG5j46/ypDBxysfzt5y85j3ehCWRIJOgR4gX
 ZgmxZyGLDChx/JhqA2zVXVUl3fnwOe5uBCRFBFAwDmg4ohHMomemv5h+9rUIPQsqHq7B
 sd7SU3BE4oMdmIF7IGhMqDqP+TsXKNu9ZSuh8/MLHsIuTQ6th2JdNxMyBzVCXD4csWP2
 w4j+KgSNDCDuNZFkfEqr8CFck0VTl8EByI2DuHXHT8H367Rg/2xyagLUSNUg+ddIS4Mn
 B5bipshgOPP/F9OHiNNca8tTsI6WsPLieeKVBtPsuFdJ/WBtffpPY21fSarW2xk4mJ/u
 0oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E+1rF+gQ5BXZJh3iM48/7iy3zG5eQbhpWyUrAtHjcxk=;
 b=J0R7buIvzKXPJMdSYMmL9ENxbR356kuCv6m4qy6SldaHG5s0+IXDBPrltVGY/VYPq2
 nUkmR7TCnOuuBmapd/lPup1AU7W+aZ73YlAFK7+NUbpNY+boa8y78KhoJ+qfQ7NbwAiS
 zYxL4FqFGfTEusNyIdmDCeEbv3DNvI84+hz4Zp8WoEkvzqX4a5oTsdhgI9/mKYVtxVPy
 saJ7Bp5P6F8F2VwsJ+fCc5BN8ov+7bS5qdtEZIdeRmoO7LjTbVdbIASivr+2pml82drp
 xKYYXYsMgZRZZ2Pup+N6rZrAUiTonOCXLLY+GAREviUC1xCOWwReH13pYiJGWrzXhzyU
 f0Wg==
X-Gm-Message-State: AOAM533q0rCKLH7QljI0ON6IQOxaFEZUaG7El+hG05Oq4KBgef+1K3bK
 5vT0wPV6gqdCumPiBofIr45y+mvTj1qrwA==
X-Google-Smtp-Source: ABdhPJwUSCyvdZFw1vJ2u2O1DFm+k/zqQZrngu2tWRGNNqhVeRZdSteXx1m/wvIFcuux641H6qFtvw==
X-Received: by 2002:a05:6a00:248e:b029:28e:bca9:5985 with SMTP id
 c14-20020a056a00248eb029028ebca95985mr25613198pfv.10.1621870333258; 
 Mon, 24 May 2021 08:32:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m24sm1076538pfa.125.2021.05.24.08.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 08:32:13 -0700 (PDT)
Subject: Re: [PATCH 2/9] target/arm: Update feature checks for insns which are
 "MVE or FP"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <45b047d6-a287-0cc1-8b81-cbaa727347c6@linaro.org>
Date: Mon, 24 May 2021 08:32:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 5/20/21 8:28 AM, Peter Maydell wrote:
> Some v8M instructions are present if either the floating point
> extension or MVE is implemented.  Update our implementation of them
> to check for MVE as well as for FP.
> 
> This is all the insns which use CheckDecodeFaults(ExtType_MveOrFp) or
> CheckDecodeFaults(ExtType_MveOrDpFp) in their pseudocode, which are
> essentially the loads and stores, moves and sysreg accesses, except
> for VMOV_reg_sp and VMOV_reg_dp, which we handle in subsequent
> patches because they need a refactor to provide a place to put the
> new MVE check.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 48 +++++++++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

