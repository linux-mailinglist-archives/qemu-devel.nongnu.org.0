Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1D3CA21B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 18:17:07 +0200 (CEST)
Received: from localhost ([::1]:42662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m442s-0006Vn-0k
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 12:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4419-0005XV-FL
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:15:19 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4416-0001a4-DQ
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:15:19 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p22so5900952pfh.8
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SPwtlGI5qoEXvXGdhfVcsvqgdXqh3H6e2job1n4NMqE=;
 b=rKQRCSltJcMJ7OZbC6h7RUj0kL0fVXWsw2kvO5Xjl86QE1vdqqzq6ub+fO81vJilAC
 FIJxsLIhXkaN8aPtZ+ebhX24RnDLqBGnhqvVaJRDajIGSc1sEDcrUEVauCNPY/i/4tRT
 XanQzzUXRgo9fl3prKLlhdl3Ct8TXeYp0T1w5+nvPeUF2qxc6iaiyvRO9/3DpQARs8mO
 s4DUFzwMzrfzyFx2eX+9iSbRoNBunp38USUKnUP6PD3ujPBZxofWoiy7BgbsojNXJWty
 Wx+VivYyz7LLRT4CpNkOJlLYyP7SEBZPAN82sLhgU8Y1aDRS4949Re1C4iahJjFoLQvO
 DI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SPwtlGI5qoEXvXGdhfVcsvqgdXqh3H6e2job1n4NMqE=;
 b=jxoNU180zsBRpLjPtRUMzDv4OYG9elDbq07RaqOELVyt04e5CTa86F9HCBTNJOdO1N
 knXBQKyH37hURbs9AJwDLTSOjvCLf7pYLgcBNAfHjn6p/C+6L4P78wUp2qA9u35khghy
 qEPxjjoQRPKNHhhJfJy9v+XkFDacThp7H6B9LKxLAmNAPxyLW7tOY+gJ6otvDXzzy28c
 xCVGKK9GI6V53taaa2D+F+FNKRKiPFjS96AweaR5RliRkDiK+x7nPLSiGEaLrqLnbQaT
 Cm8sgNj9VgXN6dQtWA9X1u5L0QSOC4exX6pODtTw51FWHMw+p4ro7Q3jDUOC1laeZjN2
 44SA==
X-Gm-Message-State: AOAM532O4pCOaqyFQa+M3wo9bLUTHDyQV0S1J3i9s9UG93grEpkeUYy2
 WGiwBrdjEzYJG37Eml93qsjgWg==
X-Google-Smtp-Source: ABdhPJyyRf2ZtTv+6fclonfpexJi1syigGwksUEaGbFEa0ufD2z75kESs87WF2J3jxRWzxaGPsddqw==
X-Received: by 2002:a63:e316:: with SMTP id f22mr5381536pgh.100.1626365712442; 
 Thu, 15 Jul 2021 09:15:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b19sm5946096pjh.29.2021.07.15.09.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 09:15:11 -0700 (PDT)
Subject: Re: [PATCH 00/17] target/riscv: Use tcg_constant_*
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <2a5cfe45-3fdf-9a2f-c0f3-682d30d521a3@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b70aaf7-b337-3b73-cdbf-c5693a826204@linaro.org>
Date: Thu, 15 Jul 2021 09:15:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a5cfe45-3fdf-9a2f-c0f3-682d30d521a3@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/21 4:21 AM, LIU Zhiwei wrote:
> Also on a side note, could you give me some advice for the following question?
> 
> I have been supporting  running 32bit application on qemu-riscv64. After this patch set,
> it is hard to define a  method,  such as gpr_dst_s or gpr_dst_u, to extend the destination
> register. I can only extend the destination register(ext32s or ext32u) in each instruction
> with scattered code.
> 
> Can we just omit the extension of the destination register?

It's hard to give advice on code that I haven't seen.

In general I would think that the destination register need not be extended for 32-bit 
mode, unless the architecture says otherwise.  (What does the architecture say about the 
contents of the registers when transitioning from a 32-bit mode user program to a 64-bit 
mode kernel?)


r~

