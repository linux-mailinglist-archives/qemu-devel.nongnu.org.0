Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E932CA7D5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:12:46 +0100 (CET)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8Gh-0008LE-Pv
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Fp-0007lW-Pu
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:11:49 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8Fn-0005N6-A7
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:11:49 -0500
Received: by mail-ot1-x342.google.com with SMTP id z23so2122696oti.13
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 08:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=r8ucL2pA34zxj00xR00xsf4UcakWKKM5JP1tJndqbMQ=;
 b=qLMTQRezIEPiDTwoD9O4V2Khx48UXXIRoh3rxap4bfplb6AaZX3de4B/iinj6qAzko
 FXJtg8plPUgBCmcR78lIc7kbZDy9zm6GAoeYlzWi+LFQte3tfLYfTN550W5SXm++/mgK
 +s/G3ZVCqBZyzQPmliZPtDTIDIJp3R4Bidju8j5sHhURbDaHSBgywFCbai4npv/QwLGn
 rTm9Fkic42ywqAQIa9iB6afQAgEbMeZ7wiuhCkI/u4WttSSy9EiyW/Ml+p4MnJSktJRR
 h7PxGXIk3aRe2rjjA8WHskOo16Qkjf6tmFHlcfe2IEZqH1P3OhKKbKEvgx6KYQxqYDV0
 nR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r8ucL2pA34zxj00xR00xsf4UcakWKKM5JP1tJndqbMQ=;
 b=UiLs2bsSteOLRA9CpfPkinElLzI9U8mKYhcizyIwKdRDiK70a76XTLDPu1paW9bU1F
 gJstH3vJGDOG3PcPGmKE8Y8K5Y2P7J8BhzMsozyl8ea61PXfKE/Gr/43ojK2l6rYILUQ
 N5Wk5Wx84z/QFX9MBowEfrlx2mYF1NF50qWBxlCUdt5xL9Mk0iF8vDRSjdus5aACmD6g
 Zb66r5IdlobJZhh8Z9QrkDTdo50TRAMDDk4A48AN8wk1d81jZ9aoiaIm8We5748gLNOD
 S2h+OfDVcFgacfee5RvOj3+uhZpB/1M/lxv8jaZG319XrrLAH3WP6mH+IWr5EnqT+VXr
 PCng==
X-Gm-Message-State: AOAM530k4gaf1Ie9MXVFqfIwUDV1EKAJq8BxtL96IelP+loi0xl/hL63
 LwPvwcvruI1dSFxKE22Myvc5gGt5G7Be75kV
X-Google-Smtp-Source: ABdhPJzaAW4MSuJ3R5pkH3R9CO0239/shc76K1/gF/YtaNA/KTBTyvDvkL9KAyt75IPoSZNFqvAt+g==
X-Received: by 2002:a9d:68cf:: with SMTP id i15mr2428556oto.255.1606839105887; 
 Tue, 01 Dec 2020 08:11:45 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g6sm36393oov.19.2020.12.01.08.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:11:45 -0800 (PST)
Subject: Re: [PATCH v2 26/28] hw/intc/armv7m_nvic: Implement read/write for
 RAS register block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e3d8da6-0e0b-a064-85b3-895de539fc08@linaro.org>
Date: Tue, 1 Dec 2020 10:11:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> The RAS feature has a block of memory-mapped registers at offset
> 0x5000 within the PPB.  For a "minimal RAS" implementation we provide
> no error records and so the only registers that exist in the block
> are ERRIIDR and ERRDEVID.
> 
> The "RAZ/WI for privileged, BusFault for nonprivileged" behaviour
> of the "nvic-default" region is actually valid for minimal-RAS,
> so the main benefit of providing an explicit implementation of
> the register block is more accurate LOG_UNIMP messages, and a
> framework for where we could add a real RAS implementation later
> if necessary.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/intc/armv7m_nvic.h |  1 +
>  hw/intc/armv7m_nvic.c         | 56 +++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

