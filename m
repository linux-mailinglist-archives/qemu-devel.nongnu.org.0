Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C602474BF7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 20:32:49 +0100 (CET)
Received: from localhost ([::1]:35584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxDXb-0000k3-2L
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 14:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxDUq-00084w-QO
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 14:29:56 -0500
Received: from [2607:f8b0:4864:20::62b] (port=47046
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxDUp-0006Ew-6h
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 14:29:56 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p18so14325226plf.13
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 11:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=22+VdyIeWkXP+B2fvWT6C86+1TDcdqr2ef0HetsOKeo=;
 b=eA0FvwoBTYi8XPZnlEG/pIvgPhESWpKOFALQB/kPb8oBVJer4/Q5mPhqr3LOyR5bW/
 FX6IYj1MUZ/Q5I7DSxoEFx04M9KvZsEKwvYwqUD7ppYAs5KqfZgbd54nRIs4NLrUGDJr
 VT/Y6B0uhRTtr/G58JSIcvOGFVVfiJPfokw749ITWgl4BjbVp/H31Nq8Tu8sekP9lNOf
 eBxRbYLpN8CTvrrlMkhoUdCzgtry23vqn6dTVuQEieS9JTdOl9XYvP1OkVQrYcIyWzBL
 5T16p4+QSv6aIZU1fgO4BUgSlQT7Bz4LXyumznS/9uO0lbJQDuLkSSWxUnlbPmUb+RzQ
 9bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22+VdyIeWkXP+B2fvWT6C86+1TDcdqr2ef0HetsOKeo=;
 b=pXorSQubhhhOHhj5UFFsUiM8gCD//uW0J4OIyqb5LfD1KAU3QQP2DhYtsLy45xic9N
 HJOWlaeK66A+j7ysSHQ7yaX5yvp1ZnFfabrAqEgqLQSmK689PPc0pjX+j3tRxlAdbEG5
 plqTV1KRnvKSKvk6c310OU1rqaI6kRDgu/TO/3d/oTY5tKk6+p48odUb0GbZXIDLMKhZ
 w9c46CfFwl3Mpdpo53ZRkp0JO8rvl1bu4ZqfdDp9bVmx3Q7rbQpQhGvRJO8NflxRj3ml
 tkmHT8ZHEsOw2LRIRCeeNg1xyCISwG+xnHnJljQl1JU+Vy1CbgE5LmzP9QO2sUX44w+n
 fjLQ==
X-Gm-Message-State: AOAM532D9+r29jyitJ3ciome4O3H3sQ1HOTvZpbVjPnbZOfJFpoOYKgL
 ZXDA3taHgf+lx7CFTCWEyuXVPA==
X-Google-Smtp-Source: ABdhPJybboKEVN9E5SbqVGS2T72fH3T18OIsxsE4W7vlOow268T09XINvSnkeENhI+VL0K4K/DOIvA==
X-Received: by 2002:a17:90b:3a85:: with SMTP id
 om5mr8035245pjb.28.1639510193504; 
 Tue, 14 Dec 2021 11:29:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id a13sm592312pfv.66.2021.12.14.11.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:29:53 -0800 (PST)
Subject: Re: [PATCH v9 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-29-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fce709e8-f122-f410-0c62-4d14f46ed999@linaro.org>
Date: Tue, 14 Dec 2021 11:29:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214080154.196350-29-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 12:01 AM, WANG Xuerui wrote:
> +        move    $t0, $a0        /* signal_pending pointer */
...
> +safe_syscall_start:
> +        /* If signal_pending is non-zero, don't do the call */
> +        ld.w    $t1, $t0, 0
> +        bnez    $t1, 2f
> +        syscall 0

We need a non-syscall clobbered register for signal_pending, per the bug fixed in 
5d9f3ea0817215ad4baac5aa30414e9ebbaaf0d6.

In the case of riscv, because of the way exceptions are delivered, there are no 
syscall-clobbered registers (by the time syscall is distinguished from interrupt, all 
registers have been saved).

In the case of mips, there are no non-syscall-clobbered registers that are not also 
call-saved or syscall arguments, so I had to allocate a stack frame and save/restore s0.

For loongarch64, according to glibc,

#define __SYSCALL_CLOBBERS \
   "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7", "$t8", "memory"

which does suggest that a6 is unused, saved across the syscall, and also call-clobbered 
(so we don't have to allocate a stack frame).

I've had a browse through the loongarch kernel code and that seems to be all true. 
(Curiously, loongarch restores more registers than it saves on the way out of 
handle_syscall.  There may be a subtle reason for that, or room for improvement.)


r~

