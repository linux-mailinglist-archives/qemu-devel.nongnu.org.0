Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD695A1D5B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:49:46 +0200 (CEST)
Received: from localhost ([::1]:46250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMbZ-0006Gy-Ji
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMZO-0004Te-Ng
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:47:34 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMZN-0008WB-0n
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:47:30 -0400
Received: by mail-pl1-x630.google.com with SMTP id l3so151549plb.10
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 16:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=YlKW9swg+J0D9s0z3kNEQaNc5ma1DV8L1ssiRYzdnlQ=;
 b=EeczR37VvSBqiy2riZczfY8+VBb9boun2Tzg62BdfHcALEK/Ny/xRFEAIbN0uyRW3Y
 hmnUiLEIFEx/nvwSAvivnvWHFQRJD/wGMiQnq6NccJufRnGCvk1pj6AfV7OVBQsv83/o
 Rt6QMREj0iNpUwTH5CKhISa2pcAjpeufOGqm7W3r08VuTXltPWZEFN4cu7G8OlTVJvm7
 YcRJ4iPF076jpJZfSaJPUokzYlcZ6v+7fyuJ9g0T73xiSrQ2cfSfKed+AD4LcDPoOCwb
 hzMmHCX3brhc+eNqfFI9q2Bt7Zt3m8wgmfJ/b3pBcH0CC8WBlb7nct7p1QnluPzN1oNK
 jrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YlKW9swg+J0D9s0z3kNEQaNc5ma1DV8L1ssiRYzdnlQ=;
 b=fMVAzU6eTi+ij0veGg72osbmt3TeAFdAx/G27M+Hc1A9qgK9UheOVFvEA+6Gjcq1NE
 FEuwtUQiHm6MQMn5cRpteiFpwgVrOE5nbG3cS4AhsciNVShF9X0p5sIX4OYh3mv5gAzB
 p0TnEsf4u7J9GObLYR2ZfKx7XQzyxZ/thDK7xlQhl1xDxHQ7WkbhcWD8P6fJZTqGQYbU
 LqISMkbW7K7NYZzruI5jI4wk5fGayyFZjs4chDWKpY5D++esaRzZexxm0IXGYoMRysue
 yeSm262sfIQdjGjf0RaILqm9hy1TrJmhb+Tv7+TjPBF3M0VJ7oQn3eUb68khxz/aNDXI
 7+/Q==
X-Gm-Message-State: ACgBeo3Xv2iHvt8hvZXkbLGegrNiYiSu3fbCOwa26eOB8lSPcWXDYBoh
 /oq+qkOj8IKlGUQjS9AXpbiyiw==
X-Google-Smtp-Source: AA6agR54u/iTSABICs8a5AA8PIxlQZjQ8bEBIvPtW5/Y+DaAJcGUM4EVoVW/sk6OZyADT2FcIutBAA==
X-Received: by 2002:a17:90a:5b:b0:1fa:b78b:ad73 with SMTP id
 27-20020a17090a005b00b001fab78bad73mr1460604pjb.107.1661471247618; 
 Thu, 25 Aug 2022 16:47:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a6557c1000000b0042b5b036da4sm139737pgr.68.2022.08.25.16.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 16:47:27 -0700 (PDT)
Message-ID: <6b2ec8c3-0b7f-fcc6-4a00-26213c6cef59@linaro.org>
Date: Thu, 25 Aug 2022 16:47:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/18] i386: Move 3DNOW decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-5-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/22 15:13, Paolo Bonzini wrote:
> From: Paul Brook <paul@nowt.org>
> 
> Handle 3DNOW instructions early to avoid complicating the AVX logic.
> 
> Signed-off-by: Paul Brook <paul@nowt.org>
> Message-Id: <20220424220204.2493824-25-paul@nowt.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 30 +++++++++++++++++-------------

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

