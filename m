Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1241421C92
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 04:24:21 +0200 (CEST)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXa7w-0006Qu-9b
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 22:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXa6G-0005jt-8h
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 22:22:36 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXa6E-00082e-SA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 22:22:36 -0400
Received: by mail-pg1-x532.google.com with SMTP id 75so18382740pga.3
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 19:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3ljAsaztdMi/FR7eNEe8vyC5L8tZvCYj44eQEZxtytU=;
 b=OAmJbEHN8qRv3z6gVzQaiGf2JrAJy+td0ole8EbPj6ZdmSx3gIDNJ0yfXF4l8JpM+P
 Ipj85DLzpgKIDjFbEtvDewzB9Em6Zft2Bvb9eqBG3Ev5CgPKO/uixF/2SpOw2sxKsZtT
 /lEppGqThHh/fCKZqFa7m4wAiXolN27V2laaEgDwC4rJRsPkkCulmcJss6EOQ/I7kimu
 R7d6kGCsiqBJmtK5kKxxGsmqak37JKhuNQwzG+fgKHCiMtinF3H0xRDn43GTDAqQ+xBP
 hEFIZCQu7KWy5FMlUbs4oO1IqcwsuP2W1Jjd7wOi3XvX1fh1AujyOE1MpYRyl5WuCKUh
 CApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3ljAsaztdMi/FR7eNEe8vyC5L8tZvCYj44eQEZxtytU=;
 b=EVpFhLuw2xzL0CVI8U28iQAFONcriv0LqUhj/sKVGPbaKwcwT/EDr9frSEta7Fd406
 Nvu+wtoPM8lrsbGH9TR7KPdsAct2UbLAQiM3fv0kBVMnxrGCBq6miznmElHTHV5ZWg59
 2ifylgVmKmywwcpmfQgKjegU5EMiDrJ1HpYt7rx2yJJA7livmm+qh1q6jGdB+z5CDrz7
 U2Wc6cWnMf2g0kWZW9Juw/Hc/zecJOiEHRjRuDCLz0gGNRwNGw2/onBw8vDEMHVL7jhi
 zEADrl7icoBM6+ZcQwQ81eq1jNXCo4GAef3BgUqJJTw9HBevS8pe+LEUOFoR5SiKc7DJ
 d/ow==
X-Gm-Message-State: AOAM531vYLo87siMn80KIZWfVUsHNx+o0eq2+3fIGEHjkTn0QrGn3/hi
 ITI3i0fb1wqO1dH3oBNTLxwTMA==
X-Google-Smtp-Source: ABdhPJyZsOY9d3OEgegrYMx5WHLqRyf9G8DrvLNLJPUJ/QLSJqJhoQbxAHFKiDV4OmC+NmNwo1W4MQ==
X-Received: by 2002:aa7:8d52:0:b0:44c:2268:8153 with SMTP id
 s18-20020aa78d52000000b0044c22688153mr19112796pfe.69.1633400552947; 
 Mon, 04 Oct 2021 19:22:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d14sm15473700pfq.61.2021.10.04.19.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 19:22:32 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] tcg: add dup_const_tl wrapper
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae1a0274-fe91-5736-0938-25e931c88548@linaro.org>
Date: Mon, 4 Oct 2021 19:22:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 2:42 PM, Philipp Tomsich wrote:
> dup_const always generates a uint64_t, which may exceed the size of a
> target_long (generating warnings with recent-enough compilers).
> 
> To ensure that we can use dup_const both for 64bit and 32bit targets,
> this adds dup_const_tl, which either maps back to dup_const (for 64bit
> targets) or provides a similar implementation using 32bit constants.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> 
> ---
> 
> Changes in v2:
> - Changed dup_const_tl to enforce the sanity check with
>    qemu_build_not_reached as requested in the review.

Queueing this one patch through tcg-next.
I'll let Alistair take the other through riscv.

r~

