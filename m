Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFE745B79D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:42:13 +0100 (CET)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpon3-0005gs-Vx
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:42:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpolR-0004n2-3g
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:40:29 -0500
Received: from [2a00:1450:4864:20::333] (port=54854
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpolO-0000Sg-US
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:40:28 -0500
Received: by mail-wm1-x333.google.com with SMTP id i12so1658020wmq.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xPq81o8kMgNNKSsZzx7ifsHlBWfcJhblDFPdb8DW/3A=;
 b=Q2Yge0xIbHu1rRUbTtZPFdarBToDql2T1WVrLMzKGSwaGkEFxlkZq1OmIbsZYnDAZV
 TR0TVH0XPJrLvhjQbM8odtQtqQsWoxz6Si/yfvsAqIO7xLDRlD4utAmyz+9CT3fwyS4X
 sM0+bLarXtt8MkXl3z24gLo4J09jOYGm0AmRBsFmTP7dwVWxO4cHi4eQ3Jzob8ljSBA5
 ZRZtBz7z+ierX0OF8iVQE3HWYcffHSUJo4K201SEDiC9vUebf62Za2C6ScR8FhGtnaoD
 oo+iH/uJweUKH8fiVarfJ5mQF4bjwnR5FXOH3PHb09HxZ1t6908U2ftWPrc6pNrC6Jvo
 1MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xPq81o8kMgNNKSsZzx7ifsHlBWfcJhblDFPdb8DW/3A=;
 b=1IyBn02a1xdgJC2gU9AsrQ3z72Y4XzybAXYMx2G9rrm4dIeZgW9UMAC+8GMLrDm/aT
 5xITW162wbP5AhmM5DBTYpb6YY/Isg36Uo++RWRcyVzygY5sq9hu33rntzEFjUVQ18iE
 JL6JXFwhESfy+ohC71rIBTfyRUGv8HhSc4ydj/CHleYrszIlc0Ah95ko1kywFUCEOQT2
 UjVJeD8mnds0oWSqiDdAC9O3jnM6Qmf2pGjZCvrBuStEh6shtYbt7biSf3vOdX4fNRNJ
 kbwosnU73dtoQMNmkLaP81kYuVtYR8mqxw/Vu1yYT+SnQGLOXfu70FDyZDra8Jp7+t3R
 Wmzg==
X-Gm-Message-State: AOAM53302iH3YCOx4MNaG8QC1pMe+CE7T1rN7XdsG0S4rHCDcJLvqWuV
 Iyr7StS7qW2kV2c61CcmJo3wDA==
X-Google-Smtp-Source: ABdhPJz/2aUOlHlL/pLNMqK3FswDU1/BLbeQeGtNknKXpTdufLlTbElMJzCV+gjsfaWXnQbyzzsFUA==
X-Received: by 2002:a1c:208b:: with SMTP id
 g133mr13214453wmg.128.1637746825343; 
 Wed, 24 Nov 2021 01:40:25 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id g19sm4274374wmg.12.2021.11.24.01.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 01:40:24 -0800 (PST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: gaosong <gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
 <4b0f0b90-23c8-3609-fe2f-91b086dde081@loongson.cn>
 <42490620-1333-42b3-f8bb-f0c5d24cd856@linaro.org>
 <aa805420-e24c-2011-3999-1b9ecc9311b6@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21a2cfff-69dd-eec5-9eca-484c58e3e7da@linaro.org>
Date: Wed, 24 Nov 2021 10:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <aa805420-e24c-2011-3999-1b9ecc9311b6@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 8:50 AM, gaosong wrote:
>> No, sc_reserved does not match.
>>
> uint8   sc_reserved[4096] __attribute__((aligned(16)));

Yes.

> BTW,  should we set scr[0-3] as 0 ?

I think so.  The LoongArch Reference Manual, Volume 3: Virtualization and Binary 
Translation Extensions, v1.00, is empty.  But I do not imagine a world in which 0 is not a 
safe indication of "this field is empty/unused".

>> No, pad0 does not match __unused.
>>
> uint8  unused[1024 / 8 - sizeof(target_sigset_t)];
> Is this right?

Yes.


r~

