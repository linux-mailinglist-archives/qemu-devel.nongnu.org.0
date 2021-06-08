Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E10E3A01D1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:18:22 +0200 (CEST)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhEz-00062d-3v
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhDi-00058A-JT
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:17:02 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhDg-0002SJ-UD
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:17:02 -0400
Received: by mail-pf1-x42b.google.com with SMTP id u18so16458532pfk.11
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=s61b0xob7SMtQFbf1aTYSYTElZLUm+GoFQSDghoU9Ak=;
 b=XfBVS5sKxnlQ82hN/sF9Zd+zenoq+wpzYCCjbRTby3iBt/bF4L5vFONYMztw03SpX5
 inCekedP/CJqUPo5x5BM6gyo7kEQS/HFE1xd+afPpfprZ+tuDX7DUlJXskN/csdXNXYd
 ACQ8ezYp5c6rFkAWFzfIwvgSC+r6JatDMVkp/7qsYRLJsZbXVbTJWxjYDZdoe3FOffHI
 Li//tog5s5Sr3yvQ9+2cxoUBjZ90CEcQmKxDIkZq/zIo0r/rC2FlC/mt/vpnHpfR+oOB
 bytTYTEITdwPEGcP1pA3VC+xGv7l7jpsodC3DXjs9HH7JQ5ay0rfrLHGZJ4+qnhqm5c/
 ljMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s61b0xob7SMtQFbf1aTYSYTElZLUm+GoFQSDghoU9Ak=;
 b=Jrz+Q+7+9sK2Fka48MyejcgBylaXAsEUkXFN1YjqgAksjTdRxAT+K4rSLzLoqhqPlf
 ItImCQ4V9+kizJ/iEY40hY0HpTy1BCbeFWpQ50b7u6FuSTX+G3pdw+7uUvyNtZzfpJgx
 i3I9ONUYlfPMTPGJnR5RjC4rBvzQuVZgmVf/lWrPfA0oft9jsTTy7tUnFyNKYdv1/DfE
 F1sGNjZJesW5amopuj8rVruYJ7k7Su9sV+wr2UkobQCXJFr67bmHE44EeEcNzHdKx0h8
 ax2wNxqFVwxfEHGOkrm43bWh634lSdewePihKzAdCLwn/YHFi91ZFKVJyH8C8GPx64yn
 PI5g==
X-Gm-Message-State: AOAM532cM3HpVT4nxaP8mpN3ZpKZiGBWd6aKDP4HLoQ9Cm5JDfJGiSDm
 98E+DQ2horn8sKLdS/sqB0C179tCcoMVeA==
X-Google-Smtp-Source: ABdhPJzYxXoR6drAB3z3GaMWe7ubp/ohnNebaJ76Glr2AQj2GudLvOm/UQXuDunm2bi6Q0hds3A7Bg==
X-Received: by 2002:a63:4c08:: with SMTP id z8mr23767112pga.130.1623179819184; 
 Tue, 08 Jun 2021 12:16:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h6sm11464897pfk.40.2021.06.08.12.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:16:58 -0700 (PDT)
Subject: Re: [PATCH 03/26] configure, meson: convert crypto detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5aac91bc-2ce3-1a28-fab4-cbb04bbc2014@linaro.org>
Date: Tue, 8 Jun 2021 12:16:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 6/8/21 4:22 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure              | 188 +++--------------------------------------
>   crypto/meson.build     |  41 +++------
>   meson.build            |  81 +++++++++++++-----
>   meson_options.txt      |   6 ++
>   tests/unit/meson.build |   6 +-
>   5 files changed, 90 insertions(+), 232 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

