Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D52EE66E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:59:29 +0100 (CET)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbRQ-0000or-9k
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbQO-0008Pn-GV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:58:24 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbQM-0003bj-U2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:58:24 -0500
Received: by mail-pf1-x435.google.com with SMTP id c12so4520756pfo.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MsJKpkvAdQay/uAZyKckKdRqHA4VcbTbkpGrIBkZSVs=;
 b=xNT1vJO9LVtuC9+dsfsrSMTR4BVBklQDk+JY43KfAWu9eUU/gmSALPh00M/iNhyQm5
 NVbiLwSHuzlhqQ/ZJzzkGWMLuHEI/sG3WbWi3ph9N3UOnWvdWoyvOEo5im0qYqwBU4GA
 EarOsI0y8xEBxn0KB3EGTruiHP1bU93WMDnmgnIp16H07IkeaTB8ZFXZXI0Nab4NsgWw
 tDkYPiXIJGpx1sLCugUI5tbLZoi9/2Sg1Ourkz9WHfDkzQB9uvAuuSJCd3Nl8qdSTgn6
 ZMzL4gsuZ9yH6hpJr/MjrU+aB/BNDusRTURllT4eh9tXI7/nl8KVHivbO0ikRisuqMEY
 vygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsJKpkvAdQay/uAZyKckKdRqHA4VcbTbkpGrIBkZSVs=;
 b=jdqflyPaJ9BSNP8iYOx6ZKtDk+Gw67/3FObx8wOxVkf9XXskYWpmhbVJr7f6FO/PTH
 NYhtrvkoJz9gbFDfLoPeRScjbFFPxU2gIf+T7g8wI2tNkQzi7hsE5kZ1YNFNZzKznORl
 OJhVf1aGJFw6h2ZSdgTma0LS8iEAXQTcUZ0Xg+r16b48LDmXhexUr3pKwrMDYZTkBSOt
 kX9PNs+ByQVKcKPrkLRNzEkjBteCDMMdT1Y0yQVkJ7kFjY/4GyyKLubjbb0Bd2kLhxHs
 6/ILgyYpQCBCgCxHXnpWE4e5NVHBrIdlOIZHF661r7WMl/KZGicSS/JBoDiMo34qF+u+
 yGbA==
X-Gm-Message-State: AOAM531CXM2SwInfTcpD76B6NAF6IDQJLPbR+lUtcervOdNARm81/f3p
 4D/OZdqhHNKiGyaMsIK+RCrqDw==
X-Google-Smtp-Source: ABdhPJyzrj7LPGBjKV3ESOMyOex+wxBHaAb6JVW3/6XoUENWGrLaWhg21gbPmv/J/hcvF4Oi5OkKgA==
X-Received: by 2002:aa7:80d5:0:b029:1a3:832a:1fd0 with SMTP id
 a21-20020aa780d50000b02901a3832a1fd0mr310351pfn.6.1610049501390; 
 Thu, 07 Jan 2021 11:58:21 -0800 (PST)
Received: from [10.25.18.38] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i2sm2991449pjd.21.2021.01.07.11.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:58:20 -0800 (PST)
Subject: Re: [PATCH v2 02/24] target/arm: Add ALIGN_MEM to TBFLAG_ANY
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-3-richard.henderson@linaro.org>
 <CAFEAcA8C5hmyTWq1VYfLueaVbw99=D-AgW746eOuQAOMc_tk4A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ea987c7-af0f-1428-5cda-0a53393a3838@linaro.org>
Date: Thu, 7 Jan 2021 09:58:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8C5hmyTWq1VYfLueaVbw99=D-AgW746eOuQAOMc_tk4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.267,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 5:42 AM, Peter Maydell wrote:
>> +/* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
>> +FIELD(TBFLAG_ANY, ALIGN_MEM, 19, 1)
> 
> This is trying to use the same bit as TBFLAG_A64 MTE0_ACTIVE...
> We might have to finally start in on using bits in cs_base.

Oops.  Didn't notice this as I extended from a32 to a64.  And then of course
didn't enable mte while testing alignment...

I'll use cs_base in the next version, moving all of the target-specific bits
there, leaving only TBFLAG_ANY_* in tb->flags.


r~

