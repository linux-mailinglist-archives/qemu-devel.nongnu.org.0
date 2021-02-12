Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA631A1EC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 16:42:24 +0100 (CET)
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAaaO-0007vh-0s
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 10:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAaYS-0006eH-D8
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:40:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAaYQ-0002ym-Kz
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 10:40:23 -0500
Received: by mail-wm1-x333.google.com with SMTP id 190so1441714wmz.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 07:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hiry7JrgYmy+C5tnocnVx+jM+OJofmJWTP9/xGIYIqw=;
 b=Mi51BPrFK7ADWLxDOBt69EI9uxyApHpfFmqMm6KtKCGC38QEbqO/09C2oDsbl5i9KD
 EU79zGpDV7Yn9b6SjIHeqMf8+oOURr6jVgBkDbrxoSqL/I/nrLtYTfP7P1K8xv8HZqNN
 yFmDtzYQNU13+Zgr01aVOyPUa3gpHKzWtczuAZxAEk5vNvbSKAlumbndq7driP3Ou2+k
 HL9j4vJ03EjCsTizlqjecBU/KnPhiEHaELVAHsFn2sSa099l5zvWxK3qSVcCXb50svLi
 ZzEDTD3JS2OWh2af0JvzQuOEeCQ6vvCBWguMtBRQM97+00Lr+8gZ+o0SZcRI/4LvylVd
 AY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hiry7JrgYmy+C5tnocnVx+jM+OJofmJWTP9/xGIYIqw=;
 b=JZZO3P2+NvE8RT8m3Ee7C7mBtpPBXI5FyCn9nXvdwr9TozT1AtddmWl5ysumbwE853
 hB0BpmhBxjY6KM2FaJuE8/kFIH4TgJMA1ZxdZ4MHxcCqBQvuGI6uRzsTSEXG0jEiHewd
 hNE5eBqefPZ7vDW4ErZtBELLnfEPbr5U6iKPxg6dw9QDZXoASups4LBBeL55M1KtafNp
 QUXdYZ5o5vKVntn5TqxeqauJg3j7PwPNMFGBPHGcMjE7QSUSRv7B4LCB2/5YNu9cXsjZ
 cvz+jG6/foLX2VPcFbjnx010u0brBa0dmDGO7LoYIVzl4958hKYoebn1WqnrSjvvt2YD
 H2jA==
X-Gm-Message-State: AOAM5324eDgAeeC1lzKU3NTUn6HxzGvjQXQNlRfeJ1pzK8Pxz7UrIGbX
 WaM0C06prJH0k15GjWCh3PU=
X-Google-Smtp-Source: ABdhPJwAnUp5Qfxkee7h+yOCBNwGI35tBKPpY37TQEtdDqKR6/KxctlsRQgX0k8TPYG9zRHXtPf6Og==
X-Received: by 2002:a1c:c6:: with SMTP id 189mr3317718wma.128.1613144420755;
 Fri, 12 Feb 2021 07:40:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z15sm9973152wrs.25.2021.02.12.07.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 07:40:20 -0800 (PST)
Subject: Re: [PATCH v2 16/21] accel/tcg: actually cache our partial icount TB
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-17-alex.bennee@linaro.org>
 <ef56fb67-4424-335f-45d2-a96dcefb1b2f@amsat.org>
 <3b444f83-55cd-493a-d841-4bca87bac3e0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b80367a8-9596-8e83-d013-8f4eea66e9a4@amsat.org>
Date: Fri, 12 Feb 2021 16:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3b444f83-55cd-493a-d841-4bca87bac3e0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 7:48 PM, Richard Henderson wrote:
> On 2/11/21 2:21 AM, Philippe Mathieu-Daudé wrote:
>>> -    insns_left = MIN(0xffff, cpu->icount_budget);
>>> +    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
>>
>> Can you describe this change a bit please?
> 
> Replacing a magic number with its proper symbol.

I am confuse because I see:

#define CF_COUNT_MASK  0x00007fff

