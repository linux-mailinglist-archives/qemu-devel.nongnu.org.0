Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDC6740FA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:29:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZez-0006Kp-K1; Thu, 19 Jan 2023 13:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZey-0006Kf-4E
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:29:12 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIZew-00033m-L6
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:29:11 -0500
Received: by mail-pf1-x42f.google.com with SMTP id s3so2147272pfd.12
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O67uOd5dMlvVSi+EnXIQy2zJO1rB9otlwQjfzeUW8CY=;
 b=w+05QCoICc3zpv2py2N3v49/QJh3Dw49nH/oDhh7vKMJFsx6QrF19dt+FjM+V8ZFrn
 gwuvhY/3bZUyFqvzOp2sFaw6HSKI2Pc62EqZJUsxATnkN2x27c48+IcG4qrdRIfyyVA2
 uVv92wdfqxZFgASNocLmMjuRAiBfIAcl4jLLHEGuGQO1jbgnDSQuuMKeyRG1a5i0zxKf
 0j3SKZ9ufNUwN6YQnzEgwnHOG6x7wktjhMmQ1YwZ+7USawM70h0hKlzKVf6XL1vd+xyZ
 79lwTlmBK8oFs82Eh4FYf7c//kbWbqxS0XCegvVdg3ZIDDYfEjglNLTNaa/joR+fEUhZ
 A/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O67uOd5dMlvVSi+EnXIQy2zJO1rB9otlwQjfzeUW8CY=;
 b=ZyuvNYABEkHQNQEAgD0OGvR233LKu4OWa7LGhSa0HwbOzgMMAdMdnES2SeVDy+HsQN
 /l2AxtSG6d5nFOInI+zEwXFgc+vBaYDrUVVbVra42AA8OUuOu7GZdnaFi9dVSj94tRGH
 IOf1BIhG02XTz+W6Jwsosb2DhbrQQjy+TrHa86Htzo8CV9yWAxdoW805ikNL8b96szhk
 TzqFKRKdr21+oWHy2ITDyuskW3IAT+vNFprEcxK+vfQxkKVTHq5X+UJN7uJyQZEfS5nl
 gxTgOPCtAAcEVFtQxvTLq8gYv2/NWXP9v/n2IDJQ9+ne97nU3qWH+S8bVqjAWHpJS43a
 sO+w==
X-Gm-Message-State: AFqh2kqA4tEh96yE5GIDrf8wmDMDa46f4dpTJBrYaUH2FEBa6bvIJyLQ
 HpwslzD5UTRH9qo6QMMlKBxhKQ==
X-Google-Smtp-Source: AMrXdXvmsltd9MGpWiszO6T5sj8706irnoIhWpG38kPMt1mI2WQc/bJlsSydwP8z+FMeNaPueLyJHA==
X-Received: by 2002:a05:6a00:1d9c:b0:58d:90d2:8b12 with SMTP id
 z28-20020a056a001d9c00b0058d90d28b12mr12391540pfw.3.1674152949175; 
 Thu, 19 Jan 2023 10:29:09 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x15-20020aa7956f000000b0058bacd6c4e8sm8969820pfq.207.2023.01.19.10.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 10:29:08 -0800 (PST)
Message-ID: <8b7cc305-d189-3ef6-ef5c-b11d148054cd@linaro.org>
Date: Thu, 19 Jan 2023 08:29:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/5] target/avr: implement small RAM/large RAM feature
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, philmd@linaro.org
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
 <167412017399.3110454.14047770996929512612.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167412017399.3110454.14047770996929512612.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/18/23 23:22, Pavel Dovgalyuk wrote:
> translate.c functions use RAMPZ for RAM access. This register
> is also used for ROM reads. However, in MCUs with 64k RAM support
> RAMPZ is used for ROM only. Therefore when RAMPZ is set,
> addressing the RAM becomes incorrect in the emulator.
> This patch adds LARGE RAM feature which can be used in xmega controllers,
> that could be added later. For the currently supported MCUs this
> feature is disabled and RAMPZ is not used for RAM access.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/avr/cpu.h       |    2 ++
>   target/avr/translate.c |   63 ++++++++++++++++++++++++++++++------------------
>   2 files changed, 41 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

