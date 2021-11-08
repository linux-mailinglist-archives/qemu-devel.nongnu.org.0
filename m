Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87114497F1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:14:17 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6Lg-0000F7-G6
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:14:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6H2-0003le-Uk
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:09:28 -0500
Received: from [2a00:1450:4864:20::330] (port=39559
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mk6H1-0001RT-4r
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:09:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso15318082wmd.4
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UHLYQ4urNCfUcwcMBJvUhX70LI/amoP09NMr1Xc8QsE=;
 b=ZwXvSV+zCZiqsX83D6I37OJsy+IeqoeO9TEwIIDPo15RSWPiRTLox+5mzE/7f2YD+l
 x77p4V4zgZspsXnsYeJIGou7SmZVKmlXmFifBcpXOf1JIw054h1V2x6a20/9STwJTcMg
 hOEAZG/DmAVBmqZY055KVTphiI7T+I/4wc9CgTqcJOOMWgBjl/zYegcP71jDIxytC7UZ
 hQV1LNSHGrmK+fyAvU6nBbQbkYzhoPGXZ6qXOlalTk3bHbEBXUm8GwMZS8tNpVCY/iRb
 q20h3sHz21CMzocmh2NWkj/oE9m67QkuFdDe109JsTt89x4mDrgUIH4uvXeE0gKfVPyd
 SjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UHLYQ4urNCfUcwcMBJvUhX70LI/amoP09NMr1Xc8QsE=;
 b=5RMcCtCKJ4XvJlAalLyQ0c9hnRnk0CnffU85BAIISxbsRdVFVxE/XtVfdjOfGoAJBZ
 lR7e9RLrou9VRZCCqp7e/WRMPNzKRL1CK8th2dDd3F+He5Mqn30YDA18/DHGbaywcRp2
 +2R0fwWdJ2bg2UvGo/vB3KO3+6DHBhZAoBPkyLFpYYA8CYylebdB9lId9YGnDZhnxxhE
 I2wPn6cZLrcCp+1wT7EyH6OjG4/5fyv+XLt5bKlVNGyE38qTywo0/ZRHHvp+8dKQNTlZ
 MvElP2D28VcA7/XplvJMWWny2kacvoC91LuV6rodzFFKb6e/Yf7VwilIUz8Gc3fuYU1v
 hufQ==
X-Gm-Message-State: AOAM531a7oKS7ltZcbPoENIfoF3GLkP4EToLFN/+Hh9iBQFDcooZSx2r
 NHt/cR4SD00mTw7/Gu9jmJdhuUPQUeZmWmKthig=
X-Google-Smtp-Source: ABdhPJwCvjJzbegZBm7B2UXCAEyjEH+EIs7AcLAe/FLUTGGEa3xzcxDAbVYWW3uAI0f1a8xfWZJnXg==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr61733wmi.61.1636383799572;
 Mon, 08 Nov 2021 07:03:19 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id s13sm20250135wmc.47.2021.11.08.07.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:03:18 -0800 (PST)
Subject: Re: [RFC 1/4] linux-user: Add host_signal_set_pc to set pc in mcontext
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8d259be-bf1e-79da-e4d1-ae4a4039ac5e@linaro.org>
Date: Mon, 8 Nov 2021 16:03:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108023738.42125-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 3:37 AM, Warner Losh wrote:
> Add a new function host_signal_set_pc to set the next pc in an
> mcontext. The caller should ensure this is a valid PC for execution.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   linux-user/host/aarch64/host-signal.h | 5 +++++
>   linux-user/host/alpha/host-signal.h   | 5 +++++
>   linux-user/host/arm/host-signal.h     | 5 +++++
>   linux-user/host/i386/host-signal.h    | 5 +++++
>   linux-user/host/mips/host-signal.h    | 5 +++++
>   linux-user/host/ppc/host-signal.h     | 5 +++++
>   linux-user/host/riscv/host-signal.h   | 5 +++++
>   linux-user/host/s390/host-signal.h    | 5 +++++
>   linux-user/host/sparc/host-signal.h   | 9 +++++++++
>   linux-user/host/x86_64/host-signal.h  | 5 +++++
>   10 files changed, 54 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

