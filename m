Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13113441A0F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:41:10 +0100 (CET)
Received: from localhost ([::1]:35880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUkX-0002DM-7L
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUfO-0003eK-QK
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:35:50 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:43764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUfM-0003mO-96
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:35:50 -0400
Received: by mail-qt1-x831.google.com with SMTP id v29so14021367qtc.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NIOEmJMXFSVvT6/HSMYdC+jxaCT+NWrSKzzLgEdMcWk=;
 b=FNZWXDScSsvzOsdJr9bdzI2Uh5bQJ+GeV6Ww7UAo5j/jZOtJVVlI+oWE4FBLbID3bw
 IgKHHQB6RtI4iRHO6J5b+SF3j8Xhr9NMUH/XouD+5uQ6skjVlSZ36BSUFolERMuzo0fb
 8iCSwOxVRky2tFK3gniDHwY8r/KVVfiSnoyLy+QlMUK1GOU0q76AZZMKlp/bM4Kzza1h
 O8NCpqdO8BCyGVpJ+Mm0Ys1mJqAgUxJEWOKJiWOMeXI+i3rQp5LY1icIVw2D1IPkRgAX
 Hs8qiSmu5l4R9h6rrYdBkjW16jtsm8PGoU61lYt2FNLhv54xJrBh3xlltwSayBTWyp+i
 Mc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIOEmJMXFSVvT6/HSMYdC+jxaCT+NWrSKzzLgEdMcWk=;
 b=tC3mHDSW69J4WYKKOWMj2zPjKrqOpaKLqig4SHhd3KsHu3PQ4cMCwPV91tj8MDxggy
 OuMve/MH56KCmyvt8+QOdjPOM6DF1XoUAai8lnx8bfj4rHhXa55NN2P9wAwj+3gty/1p
 EbPxhzUZkZdNgwgx85/Xs+s8/mJ40dFZs6rlpCJAgI3HxjgYYZweSULFTRzROcmOtAZV
 oHCCG1TXf0zaOouyjSYDXf4GjFTR7hoXNW7iMTcVYTNhshIxYcdzB6ANovew7o4hU7DV
 XuU8TRV7NSndpCUKYUOCpmR31/lFJ3XKT8oPNsKRchLV8xGD+Nwi/GZ22rzwIwg9MSoE
 F/DA==
X-Gm-Message-State: AOAM531CDwNyuvVu9h/Fc5uqdAj4Dx2b7zODY/tUc0O3WPtSnXSOsXQ6
 P2NRlm1ngK9vaXzvvFTWaXxDCA==
X-Google-Smtp-Source: ABdhPJyO46ADAFw1DWGnaDMhvUaJ4DeW2ARvc9Dt8dzU1amUi+H9bRTXZfoGVLBZ0e9rJpddsWnk5w==
X-Received: by 2002:ac8:4e8d:: with SMTP id 13mr8186714qtp.414.1635762947273; 
 Mon, 01 Nov 2021 03:35:47 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h68sm9912364qkf.126.2021.11.01.03.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:35:47 -0700 (PDT)
Subject: Re: [PATCH 03/13] target/riscv: Ignore the pc bits above XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c98ffca-202d-2c16-fcae-201003c05849@linaro.org>
Date: Mon, 1 Nov 2021 06:35:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> The read from PC for translation is in cpu_get_tb_cpu_state, before translation.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Could perhaps be sorted to patch 2, then riscv_cpu_synchronize_from_tb and 
restore_state_to_opc could assert that the pc is properly extended.


r~

