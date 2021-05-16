Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B2381BEB
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 03:09:53 +0200 (CEST)
Received: from localhost ([::1]:35462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li5I0-0000sS-1W
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 21:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1li5Gr-0000Ax-19
 for qemu-devel@nongnu.org; Sat, 15 May 2021 21:08:41 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:35627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1li5Gp-0007un-7G
 for qemu-devel@nongnu.org; Sat, 15 May 2021 21:08:40 -0400
Received: by mail-qv1-xf29.google.com with SMTP id q6so1527722qvb.2
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 18:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yMKwxQrPnMjS1TnvtKdh6PZozJfeuifNvRtAshn6Aqo=;
 b=DGt0Z9XWC8u01t4CII5T5xxkM4j65ptA8bCZipx2YvJVreV0OA/1EovjOUJhpX/HO2
 FfaiszySsKhwN8mOZmTaSaZnSIqIY1VWt5fP6/hFYUJEPWkw/ya5NVh5G79W+p2DH9SB
 Ahf7ut/s3voMGObJFjMMrUnqSPsklHQ3YCDVLAKOY0+fPT0OWy+j3wQiWgvAlxjKpz0H
 qmqlfwcxMYO63lSsVKQD/wdZTzr1poqzoTby5ouN2PEg+vc0d/zQYGCjKU38y5rLaA6N
 1DHhzfbDA9LIcodDnTnYFEdttOgHuEUl1H/woCX8Csnsib+rliHQOlEEaxWqonlhZ9w3
 Meaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yMKwxQrPnMjS1TnvtKdh6PZozJfeuifNvRtAshn6Aqo=;
 b=R7Aa+kx2mVfsq8cxzW+pEF8rmYhdKE12Cq2Wryd1V/Xcai/qGBC3qXore+xXCQsn4S
 pWr0k/q89NWcMoWtRICTrErr/GQQBZ1IUjAOMMofB55lPsVdDrQTKc9apb6ug+HoLsIE
 sF56MIKfVgKwpqNiGBAv8Xpa+nu6y/uFAPvHIvgGQSmfjqPq6SOemlNNhbhTAw1PWg4C
 GnNVVEYCV/mobN55jrTlfJflfed4OvRL0Y/4UhO1mv6g570tj1A3k9oLQZ77qnP1bMSG
 UMvtOt7+9frVp6D7w1QTB9JqQUGVxRgO8N5SRevFeOnLpU+pBd1woDc5YUB7BYopsOXW
 zkGw==
X-Gm-Message-State: AOAM532rJc5qUrwAVVhVKDoIeRbdlBMMj98jOgVvqwDIRlTfDeAZYvuu
 PFMU56q4OuvFWQUjIxYQ+8uwAw==
X-Google-Smtp-Source: ABdhPJwaL08qmidxkRP7TnrxoOEApq7lYXaBraFa0X8Iq4X5tkXjONvXdNJ+0Et4IOioEn9X7DB8OQ==
X-Received: by 2002:a05:6214:2467:: with SMTP id
 im7mr52974366qvb.59.1621127318051; 
 Sat, 15 May 2021 18:08:38 -0700 (PDT)
Received: from [192.168.182.172] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id t187sm7688976qkc.56.2021.05.15.18.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 18:08:37 -0700 (PDT)
Subject: Re: [PULL 21/38] tcg/tci: Implement the disassembler properly
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210317153444.310566-1-richard.henderson@linaro.org>
 <20210317153444.310566-22-richard.henderson@linaro.org>
 <3831f59a-e81e-b05d-891c-ab6e2dd8552e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f0c5ba4-b8aa-bce3-de2a-e6f563be3eda@linaro.org>
Date: Sat, 15 May 2021 20:08:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3831f59a-e81e-b05d-891c-ab6e2dd8552e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/21 5:57 AM, Philippe Mathieu-Daudé wrote:
>> +    switch (op) {
>> +    case INDEX_op_br:
>> +    case INDEX_op_call:
>> +    case INDEX_op_exit_tb:
>> +    case INDEX_op_goto_tb:
>> +        tci_args_l(&tb_ptr, &ptr);
>> +        info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
>> +        break;
> 
> I just realized ptr can be NULL:
> 
>    "tcg/tci: Implement goto_ptr"
> 
>    The check in tcg_prologue_init is disabled because TCI does
>    want to use NULL to indicate exit, as opposed to branching to
>    a real epilogue.

That's INDEX_op_goto_ptr, which is none of these.

But INDEX_op_exit_tb can have a null operand.
What's wrong with the rendering done by %p?


r~

