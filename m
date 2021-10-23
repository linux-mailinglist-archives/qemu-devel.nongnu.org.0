Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C1B438111
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 02:41:38 +0200 (CEST)
Received: from localhost ([::1]:49214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1me56P-0008Fq-Da
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 20:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me53c-0007Ov-Ve
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:38:45 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:37484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1me53Z-0005L6-SX
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 20:38:44 -0400
Received: by mail-pf1-x431.google.com with SMTP id q19so5067665pfl.4
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 17:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ih0XlVmKlCVvbOg93OCx23mZaO3nnjpL3p2tpVBBUd0=;
 b=w31YhU/ucNRmVgrUJ8qlKERzGEXd3yzudN9jZQYSNWsMWhMKvFFW6eU5yhghv42Blp
 1p3AHEPSxQaH9MZ1qIvnBdo+P0WuHGPPDg8HDb4g9kRsRfMJ0fDofQdWIWf4fc2gsAB+
 NeazSkG+AzZjjo3xVv4BC39zMz6WV8OYnuLB+RIad1RubmQrX8yzCNm+oeGQSoQ/gkv9
 AEHHyozg4x0QAJhbbd0lfz+opVtiVzJmm0oyK/Nley01eijHrN3SbfXkxLAwYWA2klPx
 HijmZ+MSbPrruE18m0PUbb3ad9VZpXOAB90oAb2CHO0ds8EecFob2KyAIeDvoFQMVECi
 e/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ih0XlVmKlCVvbOg93OCx23mZaO3nnjpL3p2tpVBBUd0=;
 b=QXaNzJPDg90Qka0Xoec3LcI8jNwVeFDSSwERlGirrduBPnz1ketQaj6uutRx8paVRL
 lwuxcHeHpLLj6bUMbbqbKlsp9w01+hw8QpdJGvp5/ZZqaiOwFa7LRuTGjDYIJ/U0G4Vs
 mlNXFia+wn+tGvCcVsapb/vZO2UE6THE3XifRPdeIxPnV13gfziVtZIwqWOUrKrH7/cW
 O4yGTY4HNB2vTlTMr8K2Ey3fqxyjxO6mmjvw8BPGX7g+I8Mfu4gJGQ55rjogAKRTPKyd
 AvFMGdcAgUrr0cQD5/zWeJ8yv9B9fFw/YrdxN1cjXjN6j6Q77m4H3YCOkZOWL9yq6M7e
 U6kg==
X-Gm-Message-State: AOAM532eAP3OYZbPR1ZNVoH0zhRLkMqxkSD21fcVg5y2F0+ktQ4+cYBf
 DNny/hCA8Yu1az8qv9SWwmj27w==
X-Google-Smtp-Source: ABdhPJw1ICIPBtUHNDzSpNAL0FPmwd9TNUGjgkbM6mQFHJPZrh+Pow+pcrURaPpRnEX2YeUw8Sn0UQ==
X-Received: by 2002:aa7:9f8f:0:b0:44c:cf63:ec7c with SMTP id
 z15-20020aa79f8f000000b0044ccf63ec7cmr3331997pfr.77.1634949519881; 
 Fri, 22 Oct 2021 17:38:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k22sm10826546pfi.149.2021.10.22.17.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 17:38:39 -0700 (PDT)
Subject: Re: [PATCH 13/33] target/ppc: Implement vpdepd/vpextd instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-14-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ea94d0b-5bfc-fbe8-9ae9-5653bc2ac58c@linaro.org>
Date: Fri, 22 Oct 2021 17:38:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-14-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/translate/vmx-impl.c.inc | 36 +++++++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)

No vecop_list.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

