Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447743D624
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 23:59:12 +0200 (CEST)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfqwx-0006IF-H4
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 17:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqrf-00025Y-8K
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:53:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfqrc-0003Hb-V1
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 17:53:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id b4so788795plg.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I2oJTJWh8OiJe7SUS4UTZtaAN7fai+TLMIUXnG0qFGk=;
 b=nBfv8es7J4c6/CfEapSete8l7s+8xfWp9h2K+SIiwZIYVxNeTCIKlhO3RnOJDzi2DI
 py4zg99d2YQLWs5O8qv4co/qv0Z4gC4Um1p+ZeSO+Eo8yL5cek3oR79YiTNhLUof4x7X
 H1kNeJmwES9uDGEAAD2wZMm4YVSslMTLT+zQXo0DDGtt3CjTgOBHJ+J2TbnQ9YpOFpod
 koK4FhM0Yk4iEV9jPMHcGSoPlPOINoDezPXEZgyUBV+/nTZVO+QFQk/NwDEdHM1vol6c
 n3SVgcYVGx7psL637mIRG8iUUyHvSZMZjfKxde2sbcXW5YIrfHRqn99ArDWgT/3v+jVa
 bJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I2oJTJWh8OiJe7SUS4UTZtaAN7fai+TLMIUXnG0qFGk=;
 b=cJazrwEnzweKNMMqfDxsZrnqYYc5AzNdNQYU6bczhTPur5IfXoS2SSBhbVkaKmgg+n
 TWEPLkN9SGafyjqaNr79zDb7fa1xdPtrtfnBuO8tlDhkswkUiLATJYi+EhtdpElbW/Q8
 Ch6/yG5W3B9U43w1cGTM3nOv9YsCvcp/XIg/FtfJYKS4saCq3KGVkOOImxAAbtlWZ+o6
 qNk8j8n8KJkGQmYVyNbOUovcorhFP7oHm9ezctpvqRGG04DL6ON5mEW96hPW1/DV+kys
 hu9EykIzIi9V96valj/d/il232GHy8/RkWhVE0uCX1ipH5q4mBWua9SMMYvdrLOuOtR0
 BvEA==
X-Gm-Message-State: AOAM530jCy7wJwtNaK7fkYQ/JvYRN442QZpwxrnSjUeQAEVDLH+zBrD7
 hFCnPcJp8cxxfWxOJ6a4vfnWEw==
X-Google-Smtp-Source: ABdhPJyLIAOYw4J1+Le3sPHOKldQJFExd07sfQ8rx5h/B/wn4YybcaX3O7siq5b24hz6vK/6TxuQGg==
X-Received: by 2002:a17:90a:2904:: with SMTP id
 g4mr316033pjd.122.1635371619594; 
 Wed, 27 Oct 2021 14:53:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z124sm904000pfb.108.2021.10.27.14.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 14:53:39 -0700 (PDT)
Subject: Re: [PATCH v2 18/32] target/mips: Convert MSA 3RF instruction format
 to decodetree (DF_HALF)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cea57b8-fabe-65ff-ad2b-c26cc305714b@linaro.org>
Date: Wed, 27 Oct 2021 14:53:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> +@3rf                ...... .... df:1 wt:5ws:5  wd:5 ......  &msa_r

Add DF_HALF to df during decode?


r~

