Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715EA2F8800
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:56:55 +0100 (CET)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0X5S-0003K9-GC
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0X2b-0001vt-4s
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:53:57 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0X2Z-00044q-AO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:53:56 -0500
Received: by mail-pg1-x532.google.com with SMTP id c132so6882023pga.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+HSO1qHsUTuXT/LQbM9nbpBuogn7b/Ulne2GCwHCTqY=;
 b=R7058WbcIMbaus2QwEL+nzg9CDeiuQWk8BpUHTNzQ/9NsrT00t0lNEIEwNOPguVAK8
 wccFHxMtI45/CuMW34d3kgw+FUZ6Fbq1TqIHEKha484L3dgs48vYE12uB9mzk0i3z52G
 gBGxhrlcPI84vsSc3Nh+xwVDu9FYmIb/P4KMolnilx39m/AqZie2zeOlNUllyx/x/Gkg
 taqre60eygvtQ9LX0pHiCyAKWNZ2Z93RAn87JTzJSC+8H5GCMe8cF529l1e8wc0ph+vQ
 oYntU9nBedtgK2GnrLe6SFm5/8OxyQRJWffFQFTU557KR05sbUac/u/TRRl5HQCluJr7
 gojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+HSO1qHsUTuXT/LQbM9nbpBuogn7b/Ulne2GCwHCTqY=;
 b=bm807hXF6HOWTxMH3mNy5Bf2DHyfnXMXzyM0RkP5sRdAZJtYazWf90j6jvcnaBwIl7
 VJSd/AQXZPFap0VH5202Dp1Cv69+WR9vUv183G4sG6I/PtY2wYn7ZS9PpjModpyuWwMK
 jrJmgb76lLMMTaR5dqzQj7eqono2uMQAP/5UlRrGfDBGGY9/rStsWLoLMagJyrDoVAan
 7cfxehcL7sOjgStCmVwOrPy82/wKKW4jWL8pDEiBNzU7kLtGHDQBgSejVmytH7L7sduv
 KVOOrj/Lvsi1iMZkyYK0uw5mlV5nKf1yvSNQTyyr5rpPz1JFvWypiIEx2A6VXnHGPfhb
 vdQQ==
X-Gm-Message-State: AOAM532yqRu5Sj19kKU+Oo0zAeHfBERd9FKwCy9KQBixrnNx1Sp2dmtI
 g/nG0/RHDAXznk97jGnALzURpg==
X-Google-Smtp-Source: ABdhPJwpC0r8fJgz1O5ypDyGcWPhF3fx/oC7CFOEhXTzFYqEi9s7tXuOZxow02K0qOAiPxCCE7hMNw==
X-Received: by 2002:aa7:8104:0:b029:1ae:684f:d140 with SMTP id
 b4-20020aa781040000b02901ae684fd140mr14770951pfi.62.1610747633735; 
 Fri, 15 Jan 2021 13:53:53 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b129sm9745933pgc.52.2021.01.15.13.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 13:53:53 -0800 (PST)
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
 <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
 <826051d0-623c-9e29-e62d-8c3818c3e0af@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83e57a69-5d2f-0c6d-4f65-44ef0669d71e@linaro.org>
Date: Fri, 15 Jan 2021 11:53:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <826051d0-623c-9e29-e62d-8c3818c3e0af@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 11:48 AM, Cupertino Miranda wrote:
>> In the case of enter or leave, this is one load/store plus one addition,
>> followed by a branch.  All of which is encoded as fields in the instruction.
>> Extremely simple.
> 
> So your recommendation is leave the conditional exception triggering of 
> enter and leave in a helper and move the loads/stores to tcg ?

What?  No.


r~

