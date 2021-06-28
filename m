Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC43B6760
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:13:16 +0200 (CEST)
Received: from localhost ([::1]:55720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuot-0001so-92
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxujC-0005Te-Np
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:07:22 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuj9-0005Vu-Rk
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 13:07:22 -0400
Received: by mail-pg1-x52e.google.com with SMTP id h4so15971494pgp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 10:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WNRb/HWX20aNjmPPLKY60jUJ6PU04+pJkw3m1FM7R38=;
 b=cAgdECPB+DYaHScR1KZve5e7T/Bso8pERijglQTvuco6fEZFXzafiff2+bhca5gC71
 W5vwFGPx3lJ8Hd4OXXe3TXC4bR+gT9TY4IGeQTRcCKUmQylFAJthyMU1/4tHyMSOy172
 8iAS5hp1FAZZkHrlrzF5XArfMPG+KNaM31HJlEip62JixCZbwXw6ibddHdYj9Evpc//V
 X0EUHXgF4oKsfbVQEDtx+wsaHtQS+96mWHxSK6D3c82+x2x0DU8JHrzmFF8E3UOlTIrP
 j/fE3WtQh53bpu8+nDndkaRQ/bAwgTUc1Y809BNVo8vbDgG5LaV6eL7Qh2TfvUC+d+wY
 gTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WNRb/HWX20aNjmPPLKY60jUJ6PU04+pJkw3m1FM7R38=;
 b=fHO89y67iuLkHf4SY1qoz663wen7AnETBwHCA6AoSDjV7LjS0GkW74Z1mFDpppE+Ld
 Up15w1ADL12zBtxD3eF5EvfR4IT2oNXlCPsG5EMCYF7az8BACOoSl6RXe5oALFQdklDA
 izaN9qYxp7DrMQ1SmW04x2byUivL9fN48Ko30Q45qtm3ppZ5lvfxn6X7wxDJyzl84Ap3
 enIKhpti51ZJ1iNIV6d/JfBzbNeqwXM7UMACinc27ef6MJfwlUiaF5E7YZjJmm8UYnpj
 hXLlaCYmT0U6k9tYGT5XMdDSdl6ME1QWR6pb/7wwojMgDRf7qfYB69ZNEbQLkGGx2bkY
 maNw==
X-Gm-Message-State: AOAM533hL4EcwmVQo3sckWwHv5ntlIs/X0dfzIYsVYSIBlo+XDbiNS5F
 SpWKNotJdttRqir/RiMX8j01RfEHyHUZkw==
X-Google-Smtp-Source: ABdhPJxyD45xmXhh3FKfgjyenqSlFaGaHqinFTNx80/VDd5GOVVqX96tmJjg84ZxOtxl6+Ld/wvsrg==
X-Received: by 2002:aa7:8489:0:b029:2fb:4ce0:339c with SMTP id
 u9-20020aa784890000b02902fb4ce0339cmr25765933pfn.16.1624900038287; 
 Mon, 28 Jun 2021 10:07:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t14sm15690492pfe.45.2021.06.28.10.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 10:07:18 -0700 (PDT)
Subject: Re: [PATCH 16/18] target/arm: Implement MVE long shifts by register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69b2a232-ebc8-f6f1-9d7f-1e93df6c543d@linaro.org>
Date: Mon, 28 Jun 2021 10:07:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 6/28/21 6:58 AM, Peter Maydell wrote:
> +  LSLL_rr        1110101 0010 1 ... 0 ....  ... 1 0000 1101   @mve_shl_rr
> +  ASRL_rr        1110101 0010 1 ... 0 ....  ... 1 0010 1101   @mve_shl_rr
> +  UQRSHLL64_rr   1110101 0010 1 ... 1 ....  ... 1 0000 1101   @mve_shl_rr
> +  SQRSHRL64_rr   1110101 0010 1 ... 1 ....  ... 1 0010 1101   @mve_shl_rr
> +  UQRSHLL48_rr   1110101 0010 1 ... 1 ....  ... 1 1000 1101   @mve_shl_rr
> +  SQRSHRL48_rr   1110101 0010 1 ... 1 ....  ... 1 1010 1101   @mve_shl_rr

Looks like these 6 could be inside [].

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

