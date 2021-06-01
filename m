Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453A23975A0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:39:14 +0200 (CEST)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5Y1-0000f0-CV
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5XC-0008Kp-Sz
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:38:22 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5XB-0004Gp-CN
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:38:22 -0400
Received: by mail-io1-xd2b.google.com with SMTP id r4so15538637iol.6
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=8sK2q3GU+sLpzcX2Ea6M6fTMOzZzTdk+gZVXkzD3RLQ=;
 b=xuQQX2BvFLoIvlHX1sfbsRVm7uxLNk6XlTRn/8lx8Cl+qNzLzdtRLwezyma8yJZ7Qq
 wKVI+pZyX+WBW0GouE0sKbchjyYYOjPem0peztl/C4S7HSGZ75Wb4vtJF4R84H1FGYXL
 6TGReAdbzFRa5L6yTlgADUJDAfFcnBTW1Vvvva+BjXjuOazW4c8Qt+lH9cjm1tncfPfj
 uSwFMztnZgm3FDn6xQcjuedbLHy51iLXpU6bCO//tcEYBFO241FpkRvp2bEiVn9I/eGC
 A/PVwSJ39+ONrQsDOY3QDILf+vXSoyo4/OEonnQvttNTVjQSq//XFbQUPlSwg2pHVarG
 phug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8sK2q3GU+sLpzcX2Ea6M6fTMOzZzTdk+gZVXkzD3RLQ=;
 b=SCs2GRN9OY9f4QOOMrUAAFHENsOULyErSa4rZAze3BkKoZUSUJf9/LnncMGdibjGo/
 6MYFt5xUfo8MGkGCdaFVuCvMnCZNtw+Q+F9FQ6qxZ9wuP9EoHmDaXXhICJwEvVv1pdDJ
 bCRerOVar8UhN3gTOM4lPJ0QjL3W+9cpqhgVdujiAoLEtxJSplRvW6SY9bz9GBu7TaLG
 cSKuHVL7c5lWuweXGZZQLzwjtmNw+5rT0Y0qNiDHqe1CfB7MxGaPqJPw/t9KaxPUC1dv
 hX0sC9wh05WaLHNzvEW6QVVPaOzHAqYtMrPyZcMiPkKkM62L39MTnVzmdnQdp4nzV68p
 un3g==
X-Gm-Message-State: AOAM533efRgXsFIV2SwCb0MZ1fcVlXexb24iv3uYLNqGYnRMj4fgpmKM
 jvB0ig4ceNnVUF+vYAANR/ZXvW1QO7ObQw==
X-Google-Smtp-Source: ABdhPJz7xj05VipPQKz96r9R5RUuxBIW/bJPW/+G2VeuoZtVj/frgPaq8qQ3VHjFPSvyoZrLa0s9dg==
X-Received: by 2002:a05:6638:151:: with SMTP id
 y17mr6074410jao.128.1622558300131; 
 Tue, 01 Jun 2021 07:38:20 -0700 (PDT)
Received: from ?IPv6:2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f?
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id j10sm9727065ilk.87.2021.06.01.07.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 07:38:19 -0700 (PDT)
Subject: Re: [PATCH v6 11/26] tcg/tci: Use ffi for calls
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-12-richard.henderson@linaro.org>
 <2d6171f6-146c-3fe8-1078-fce144769bc7@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <95d4f1a9-6145-0618-c11d-3e50b9516729@linaro.org>
Date: Tue, 1 Jun 2021 07:38:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2d6171f6-146c-3fe8-1078-fce144769bc7@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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

On 5/31/21 10:18 PM, Philippe Mathieu-Daudé wrote:
>>   /* Used for function call generation. */
>>   #define TCG_TARGET_CALL_STACK_OFFSET    0
>> -#define TCG_TARGET_STACK_ALIGN          16
>> +#define TCG_TARGET_STACK_ALIGN          8
> 
> Is this FFI_SIZEOF_ARG?

No, just uint64_t.

>> +    call_slots[0] = NULL;
> 
> Maybe add a comment "Other slots initialization delayed (see below)"?

Sure.

r~

