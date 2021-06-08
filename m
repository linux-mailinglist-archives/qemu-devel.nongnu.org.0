Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D439FAF7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:37:02 +0200 (CEST)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdmn-0002HX-4T
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdl1-0000bD-3o
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:35:11 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdkx-00006H-Fu
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:35:10 -0400
Received: by mail-pf1-x435.google.com with SMTP id u18so15955929pfk.11
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kzRrtTt2slZtTKaJhSuB2XTtyBZmlMrCOy4zBiuNpaQ=;
 b=xMubTCyIhNHhJ0fxeGaZ9eAuWxT15Md3c1KGsdJAallIbkFCQKKWa9wrUOBSvyKjtz
 bbR4eBlkueTo4cZwM6pXIeV1tzoMAVbcQYHkKsHMCbRuaQK1tEVfYYiKiShKMXRycr1X
 +2cWS9w4v3C3QAIfkpYx+m79mhqYkt69Nc/U8/+pXmpbB79NhC9b23iR+42dzdWggWwi
 odEIglmq6xwBsV4DHw6TxZjP6LSve0JFGF11/PWzeLXAMzgATEFQJUCE+F9pSv21mxqc
 GusJsh0RR4APyGV7f2N1Uvh59l7fa21HlBCCQikyp2z0u7Q7F3pQPVHsYzSUfVS9k5LT
 nceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kzRrtTt2slZtTKaJhSuB2XTtyBZmlMrCOy4zBiuNpaQ=;
 b=eDCFeOUaLMnIRX0Kb1t1yUV1ydzeZr7KQSTKYS75iX7DLAAMAnNdXkk56TdT6k7qxz
 S/TR1uaDON9cZ2HfMTxEUvCpmQaCndcrLh2mFXrDOAvQYKns1Lq3L8KS/55eQwnk78wT
 0CNgr6sazIItNEHe+pTx2Y4qRy0dBeHXQ3txDolbiNHWh23nvPpBvamgLnBbLA0Mvqcj
 XJVZQHrIlJPFcBB+JYDeZLdUH9kENcE7qVNCeag694/xS9bPTzJWrkrhNpFVN01swrnp
 MP6jtzEL3bcrlIF/AAiblBtBpMjD6EN4XG2R9bRq5AN8SY9WRRf9mO6fn4O5auS4vCyf
 /TYw==
X-Gm-Message-State: AOAM530JuKgkmwdsVDdUHhB4bVpjxYnIO8GuoUZsufl+FP4t++BqnIAJ
 HMjNiX1qedhD1PB2XWRQKsNk1g==
X-Google-Smtp-Source: ABdhPJy5NlDr+pqGXErWNCP0YooX3VBX1B9jK7uLc4gbjmo2dDHRKROxO09B6UtmK0m0DxTcqhdVUA==
X-Received: by 2002:a63:be44:: with SMTP id g4mr23441275pgo.425.1623166505805; 
 Tue, 08 Jun 2021 08:35:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o1sm1992127pjf.56.2021.06.08.08.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:35:05 -0700 (PDT)
Subject: Re: [RFC PATCH] target/ppc: fix address translation bug for hash
 table mmus
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, qemu-devel@nongnu.org
References: <20210602191822.90182-1-bruno.larsen@eldorado.org.br>
 <d7139129-428a-f6c9-c6e2-e540208d62aa@linaro.org>
 <39c92ce9-46b8-4847-974c-647c7a5ca2ae@eldorado.org.br>
 <b689bdd0-4d75-7c4e-189e-922738208dc0@linaro.org>
 <c79e73b0-f989-575b-0982-672fc9b289eb@eldorado.org.br>
 <7198ccf1-f2db-2e39-3778-4083b5d7fa45@linaro.org>
 <b5834a1f-afaa-a36a-11d6-35a197ad74bc@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd077bef-c6a5-8041-e0e4-2ac554b96735@linaro.org>
Date: Tue, 8 Jun 2021 08:35:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b5834a1f-afaa-a36a-11d6-35a197ad74bc@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 7:39 AM, Bruno Piazera Larsen wrote:
>> That's odd.  We already have more arguments than the number of argument 
>> registers...  A 5x slowdown is distinctly odd.
> I did some more digging and the problem is not with ppc_radix64_check_prot, the 
> problem is ppc_radix64_xlate, which currently has 7 arguments and we're 
> increasing to 8. 7 feels like the correct number, but I couldn't find docs 
> supporting it, so I could be wrong.

According to tcg/ppc/tcg-target.c.inc, there are 8 argument registers for ppc 
hosts.  But now I see you didn't actually say on which host you observed the 
problem...  It's 6 argument registers for x86_64 host.

> That means we'd have to define radix_ctx_t (or however we call it) in 
> radix64.h, setup the struct on ppc_xlate, then pass it to ppc_radix64_xlate.

Well, if you're going to change the xlate interface, you want to do that across 
all of them.  So, not call it radix_ctx_t.

>  From looking at the code, it seems the most useful bits to put in the struct 
> are: eaddr, g_addr, h_addr, {h,g}_prot, {g,h}_page_size, mmu_idx and 
> guest_visible. They all seem reasonable to me, but I might be missing something 
> again.

I don't think h/g should be in this struct.  I think h/g should use different 
struct instances, because they are different accesses.


r~

