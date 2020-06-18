Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7671FFD10
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 23:03:10 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jm1gj-0000UG-Pg
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 17:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm1fC-0007mF-BZ
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 17:01:34 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jm1fA-0001Pl-Lm
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 17:01:33 -0400
Received: by mail-pl1-x641.google.com with SMTP id n2so2961152pld.13
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hwgPUtRzG+9mqL5mf5xuEp2lhRog1U5rMYXCwlYMQ+8=;
 b=tjULQryVm/zRhUVWCUC95ECmkJvB4Ti6gyRbset2JMqmBl3FMuyoKuUvmcSWIBbpcL
 Xdm8qYvB596ebcWK+IG9LtT8/43WSRM15/5n8Afy9pky7nSBBvNcF0lEE4w/k9EDFN0W
 ZpR3x4DltzbAwTA7JjUI6tx2G7W9ttA6mbU1SfUIQns/HTHtH5A9OTPl42zbq08p3JB/
 V1Rxbc+vd0piaMjJej/B8TouYVkiNpPI3OXXRyxxjG1j2v+rLkIe0QPN5FKN/8AJjNa9
 EvmU5RstClYEQI9WW+on0/I52svaqT83Y1t9eSinaFyMhS1tl81RghimFdbx2BA1VxJ4
 pv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hwgPUtRzG+9mqL5mf5xuEp2lhRog1U5rMYXCwlYMQ+8=;
 b=Zr3UFxCoRV9bqsJ25Gp7qDvYrwn2e9DvG37rUt2kCRgLpM4l1FntEkUdVMXbY8kWeb
 3by32wvqHbWHmIurGFWnI2d8NwF/W61gar0RWMlolVZBKg67xJ+EVjnJn3E5K6mxe9++
 iJCDz5rLSdn9yFVpG/rBUbCMfXmwsJfys1m4h6hQmjCOH09VPcILWEUWox1dlMcmA+xG
 Ce9hP2optebgOCHkp+4al+lfZIcJG3mJNnoJJ2JG1xD365Tx60/ydwOuvTBVzP73Rwe0
 mBfEPE4XGCSYdMGK/PCRoUbXPbCetpTl5RXpxleGhhNtkcSUrRxFDBrB28a9xtM8TkcV
 jmxA==
X-Gm-Message-State: AOAM5332mskUP47IyRPbXESJLHjbxvmJN8iVHj0ipDALBNmIJJ2bu1zW
 zeWuEz+fKVr+TzwLia9+iQbKmg==
X-Google-Smtp-Source: ABdhPJwxvlzLNTNIqwi54/AZx8SXFPK1r9mplhumGdbBE4TezcDAadMI22osgMLp4vvwvlkdMnLOpQ==
X-Received: by 2002:a17:90a:32d1:: with SMTP id
 l75mr201003pjb.85.1592514090455; 
 Thu, 18 Jun 2020 14:01:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i19sm3443227pjz.4.2020.06.18.14.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 14:01:29 -0700 (PDT)
Subject: Re: [PATCH v7 13/42] target/arm: Define arm_cpu_do_unaligned_access
 for user-only
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-14-richard.henderson@linaro.org>
 <CAFEAcA86dH_utZzXdbvwhB_67OgVGc249tO6TOBtfw+nWi2-7g@mail.gmail.com>
 <bc120bc8-a08a-3b8e-cc31-e7c09e06a3a0@linaro.org>
Message-ID: <fdcc5868-e8fd-5288-9a42-73fe09ea6d94@linaro.org>
Date: Thu, 18 Jun 2020 14:01:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bc120bc8-a08a-3b8e-cc31-e7c09e06a3a0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/20 10:03 AM, Richard Henderson wrote:
> First, this could definitely be delayed to the follow-on linux-user patch set.

Bah, no, I need the function to be defined at least,
even if it isn't reachable yet.


r~

