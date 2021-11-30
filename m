Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5D463279
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 12:34:04 +0100 (CET)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms1Od-0002Uh-I8
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 06:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms1Ne-0001q6-Qk
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 06:33:02 -0500
Received: from [2a00:1450:4864:20::433] (port=43862
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms1Nc-0007jL-E1
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 06:33:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id v11so43677721wrw.10
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 03:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rupxXiCa8GPBCiXdEWbxTHJu13pIXqweYXdISbW1qPc=;
 b=o4MUoO6LEcF96kplgu5disIHCoPYgF89JkfDPTsEJx5ETCTVUtrh/Fa/4PUbD2n2N4
 8G65xTjR0KzSEJSFsjNY+zvuZHdnBGYSedh7I5HB1VDrvFhCOduovrUgGVB4dCnwlbsp
 MFaK5VREqKinfg5lJ/535yRtuYAB4nHo0luMob5jkziztM5S2VYmdG0C8Sn9wKNVZa1Y
 PDQBr8Tdm0yCRem6XXiqi0LijpCQ1bwBp/krpMgdgslbrOtQ2yCiPi90Vz96rPih1QGD
 XxXmFLIdjGB7OZsrt1ClG4nAL49rIAaqyq+XrdGIi+mVAe9s5LM9DJyP5XsPIIKDISP2
 6bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rupxXiCa8GPBCiXdEWbxTHJu13pIXqweYXdISbW1qPc=;
 b=43EalIVNxqomOb8pXhQOTZ1GTuKErbiLKqdlogvKy8+foecWqc6ms9wyQWFG0aEZdx
 tNuZQ6NLLIoGv6linAqnx4IBg2fCxUAif/zG9r05ifwO3bVmsb8G/fFGwV6mLkD1rHsh
 BTBHhyeOw4HdpljUsVPjEZ1fWyQBTMbZ+pi4q1GMS5SZSQJNCXKlbw3T06/OcpYcZ5M+
 ABcQpp0BzFl1N9frKow/NoEjxfL+Lln2wB/my5wqkYArW6GVEyZ0IUBH6sWXv509t6hn
 ECgK8rwnfpTKX0Yg9vJv2PhdzUcYiMv+NgIn0piIOsPCK/oYRhBLF8IbajZkbuCLzGXe
 acvA==
X-Gm-Message-State: AOAM531Drt5MhEASfOuDGv8K2CXdnprsvpGWMUJ2ytN7PEfiPD+qSb4v
 sCU5Q1aFgM9PffzeCDxHgeHhhg==
X-Google-Smtp-Source: ABdhPJxHsyd/JQfgGdiLUZlv+OBVmVPZzYly5mLv693yX20rvwO3QKccJCLcl63srlp43XVQM/R1dg==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr41258942wrp.226.1638271978452; 
 Tue, 30 Nov 2021 03:32:58 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id u2sm19082128wrs.17.2021.11.30.03.32.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 03:32:57 -0800 (PST)
Subject: Re: [PATCH 3/3] target/m68k: Implement FTRAPcc
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211130103752.72099-1-richard.henderson@linaro.org>
 <20211130103752.72099-4-richard.henderson@linaro.org>
Message-ID: <6ab458d6-5de8-d667-3884-5fb433eedf83@linaro.org>
Date: Tue, 30 Nov 2021 12:32:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211130103752.72099-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.211,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 11:37 AM, Richard Henderson wrote:
> +    INSN(ftrapcc,   f278, ff80, FPU);

Whoops, mask should be fff8.


r~

