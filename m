Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54AB2FC45A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 00:02:06 +0100 (CET)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l200j-0008EM-EK
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1zyW-0007hh-8K
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:59:48 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1zyU-0002IS-IJ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:59:47 -0500
Received: by mail-pj1-x1034.google.com with SMTP id m5so889298pjv.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 14:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CtiojHrE2phHh4XsGvooVHbBMWraJixreLJRnfVdpOM=;
 b=kdud1/sz6V7q4OHMEKV4+N9iwlIUtD90ohGWwo5M/SHkHqdS/qNY8y6mJPOizS3d+o
 WtoNHfk0cDdwGL2ie0mXvrjol0w4ZiHm/oVjFw77WhbjU88xPBnAdr+/8YDXCUPmZ9iU
 8dC5YQ6YW2kjnlb2CLkuCeyOEI7RD+nbiRHxrYgDnIj2QzFCsu5FoGiQYM1BYQwPgyQX
 TMZun37j8vr3ZHQxJToy9WYeT0dCwep+13aY3EvTtMysi5gQiLwC2wgAvCqq90syi+Ml
 Ed9YUJiXCo4S0JAp/GhkS1SeqKOsqBWzWTmqVlcfpt2hYJ8XlUi+IyOcNiLWXiF9mR3e
 kZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CtiojHrE2phHh4XsGvooVHbBMWraJixreLJRnfVdpOM=;
 b=cQ3McHWqS4v+PfPb5qm7pL/wtJ1wtHa+Bx9kLzGr/Baost0dozEcRr+lHNVcrm1QHD
 w0LLxPMbFRh23CzT0HjL0rNTQcZ0pZOz7T0G7pjozDXzIdleieEPgtjT/TkyOXMXJd0+
 pYdbHzDoNuBsyl7U2HJCBpP9c3G6/2dcCSjySWGp18id8FPDL1v6L6KqLWv/IO/E1ZJe
 E+MLRzeOZ6k8cN6WswEmhi+pZJOMUMoW1n5FdK5jv13+wWyI9xqpC4zX+TVk7hngYKAc
 Oayjdf+8oYfV9I/QyB8sFxn2J+StM9aSttqIVTq/P+/D5b8ZyNRYrZ8EyYMF76r/K+wx
 wFhg==
X-Gm-Message-State: AOAM531Eb5YFGv0C5njZB31AKvt4h2kTWg4htGpPUypEj8Y/Nrj46F7F
 2QGq8uD9ntmsI3ucsCYf8gukiPQ3WywyEg==
X-Google-Smtp-Source: ABdhPJxPAWSoCw3IR0Gi6Q4jBW4xNMHiM3QYzgXViwvtx2LtCYJ3ZB4Tp23GDloz9SzJTS0vUKKkKw==
X-Received: by 2002:a17:903:22cc:b029:de:191c:1bdb with SMTP id
 y12-20020a17090322ccb02900de191c1bdbmr7187570plg.14.1611097184914; 
 Tue, 19 Jan 2021 14:59:44 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id t2sm50265pju.19.2021.01.19.14.59.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 14:59:44 -0800 (PST)
Subject: Re: [PATCH v2 09/22] tcg/riscv: Split out target constraints to
 tcg-target-con-str.h
To: Alistair Francis <alistair23@gmail.com>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-10-richard.henderson@linaro.org>
 <CAKmqyKN5CXyHTE22rB+TA57UxZbT1pD7f9QJLyWXyZ11crg1fA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f1a3db1a-d0e0-f304-55fc-e95f3ec66096@linaro.org>
Date: Tue, 19 Jan 2021 12:59:40 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN5CXyHTE22rB+TA57UxZbT1pD7f9QJLyWXyZ11crg1fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 12:13 PM, Alistair Francis wrote:
>> +#define ALL_GENERAL_REGS  0xffffffffu
>> +#ifdef CONFIG_SOFTMMU
>> +#define ALL_QLDST_REGS \
>> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_A0) | (1 << TCG_REG_A1) | \
>> +                          (1 << TCG_REG_A2) | (1 << TCG_REG_A3) | \
>> +                          (1 << TCG_REG_A5)))
> 
> Why is this not TCG_REG_A4?

I've changed this to

#define ALL_GENERAL_REGS      MAKE_64BIT_MASK(0, 32)
/*
 * For softmmu, we need to avoid conflicts with the first 5
 * argument registers to call the helper.  Some of these are
 * also used for the tlb lookup.
 */
#ifdef CONFIG_SOFTMMU
#define SOFTMMU_RESERVE_REGS  MAKE_64BIT_MASK(TCG_REG_A0, 5)
#else
#define SOFTMMU_RESERVE_REGS  0
#endif


r~

