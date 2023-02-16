Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515F698B67
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 05:21:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSVku-0008Js-9H; Wed, 15 Feb 2023 23:20:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSVks-0008JK-3m
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:20:22 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSVkq-0006VF-CR
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 23:20:21 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 kk7-20020a17090b4a0700b00234463de251so4565434pjb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 20:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ysnWouBQhWdhKYLL3gMgf/szWZYqKA1lLECM5vmPbE0=;
 b=iOLEL4vJvGdgKGZdol30q36V6kWUvXzAUImlNLiS4lco4fzy/704nwqTpVgN+N1P6K
 EYisciam+sb3ZHRL3ORcYoBtc8nvQJdPcdd52TXlR1o5REaPqA1qHiFXCu9m3SHv5xLu
 aJpLo5tztr6cAEKqU+oqMjTXkZeTHwoPCJesIXVRzZ2EH6jc+VMnq3Ew2GrzUz9atyDA
 zNfuv/Axjt9dmocT5D6FA7Ow86XdWn0TTWZc2Ih0NucWcuOaLQyxLzPZJQ1cfsu33X4L
 rFY+S6W1xIwAXHyQsardpiw6iIIQueJdZjpmARgB5rcZOwLXe4hh/CT2SzVfT/vhK/v/
 qvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ysnWouBQhWdhKYLL3gMgf/szWZYqKA1lLECM5vmPbE0=;
 b=Y6mbEarsb85h6to2mwUHMIM+yZS426++IEOTBG52wzhdCEFnTu9CI3aDLpGbLNr7o2
 KLEiNkux2xY/RI/PUgSzCvtnwEddpkFv6+qK3yRCMK4ki3VgkYRhEfwXTw6zWIRoVoL8
 88f9Q7+Zfe9cYDMfwYAqst4dSh+GsaChIbXPzX9jZu+xxIL5aKay/ME7dFd16+HMCu/e
 ryWjZaFtGC4LvqHALdVZmy9yYTVftNPHi/a1+QxAtRQHzqPPUh/02qzBfp8ctSpLrJBb
 tVY4PpEp+mcyjZrVLvapWB8STRz2F6uPIZ4U6pJOJK7egvkESEYzRVnUNg4/X0kdTzhe
 lFjw==
X-Gm-Message-State: AO0yUKVyc7XvoYLRC9CELWn0/Fn+CdOLgiCdZ01qDkjmaw1VPrqdu5OP
 H5DBxem8IT7ctINVoXKyxiIW/Q==
X-Google-Smtp-Source: AK7set82KdVF5fSd1wOECpIWOHqvr/yD5ropTQ7GYugtMU40aZRkBmmqm3C5SX1tKgGubplnyDgGbA==
X-Received: by 2002:a17:903:11cf:b0:19a:b32e:cbb with SMTP id
 q15-20020a17090311cf00b0019ab32e0cbbmr5890281plh.11.1676521216495; 
 Wed, 15 Feb 2023 20:20:16 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jj13-20020a170903048d00b0019927ca0f8fsm165308plb.62.2023.02.15.20.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 20:20:15 -0800 (PST)
Message-ID: <f6fc9831-5cb1-1cfd-3133-e79fd5a478b9@linaro.org>
Date: Wed, 15 Feb 2023 18:20:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Deepak Gupta <debug@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-2-debug@rivosinc.com>
 <64a76da4-62d3-61f3-e8a8-347e3aa7eaca@linux.alibaba.com>
 <CAKC1njQEcuEO=TSkK8qzywADYGh6cFLLUKLJ4fTfULHvKPOa=w@mail.gmail.com>
 <21dedcd4-3483-c080-7a00-6bfeacbfb314@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <21dedcd4-3483-c080-7a00-6bfeacbfb314@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 15:46, LIU Zhiwei wrote:
> We can rearrange the patch set as follows:
> 
> 1. Implement the zimop extension.
> 
> 2. Implement the forward cfi only for system mode.
> 
> 3. Implement the backward cfi only for system mode.
> 
> 4. Carefully make the forward cfi can work on user mode.
> 
> 5. Carefully make the backward cfi work for user mode.
> 
> I don't think we can easily make cfi  work on user mode. So we can also ignore the 4 or 5, 
> or both.

This is a good ordering.  Similar to how we implemented CFI for AArch64.

I strongly suspect that you will need to defer 5 until the Linux uabi is defined.  It will 
require some mmap bit (MAP_* or PROT_*) which libc will use to define shadow stacks for 
new threads.

But having the system support in means that you can work on the corresponding kernel bits.


r~

