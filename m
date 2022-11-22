Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBCF634374
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 19:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxXoO-0007V4-MQ; Tue, 22 Nov 2022 13:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxXoM-0007UO-4s
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:15:58 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxXoJ-0002Zf-5k
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 13:15:57 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so18022779pjc.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 10:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yo/pjmL/dKwNSXW9Sk/cL3DLZksyOvIFo/ZUu518R7A=;
 b=Vh06OE7O0G+dfuRuVAqyeoxprfvn2rS69KVn3Ab/zj/f8vSk/QtqtRmLNW/f70lwNz
 vmHd51um+ezJTvjE32XffTkm/+czL3VFrZNyRBXfv36P1PSIMrr+N3RXcxBpbFAVv9G+
 hzwKRe4XBTf/gWAe/tJs3xVzN+XhMAJkM8PwyrWkzd7PTK89PgaFUf/nigklOqzLoFja
 K09GeTB20yHtCxk41qxwNEFQ6IJ63hHLLtfqoXsdCc+Cg8hTCi7+PPIRBVdOiaN1ZBt3
 4SGxqcEmmyawxrqb9hoz444anViHY2pWwkyyXjWzxq/X3FfI17FPL0tJolLUOzxCBh3K
 4cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yo/pjmL/dKwNSXW9Sk/cL3DLZksyOvIFo/ZUu518R7A=;
 b=rsg/v08EgexVM+PFBTY/uztI97cjAmpCq058LZ6Wrwx+o8qKBIk1DnMRHfgSWjwY36
 kdb9vKcG/UlXSzyAnlWdwRc1ER+qgvoCxzELi8kge3v/xcmqeEZ5hHWIgXFWHgzVXgGq
 tlfeKFZo0yt79BBKOh/wfQrxhuhnRUc4JUsGco3dBnQEGRqHOsWMej7nBz96DLpFV3tw
 gYB4Jdw1hmVosSBRBpfPK896XhduCsg8KpUrwGCclsrR+ATA+Jji0qFOn9HoCUAem3sZ
 SdkM/Kme2t+oZ8DkMYtPx2AFHRXWGCG63BLgscSoOUsA0nNKkSIRk5ht1/J4lY7nt+ek
 TZGA==
X-Gm-Message-State: ANoB5pl+cUDHg+OBsSLIrChWKTKsB6+6byeQGEeMjvmipPjXpUG77kby
 O2Hhr9HwSfj3UdIqjRc7x5ZErg==
X-Google-Smtp-Source: AA0mqf7FwPCF7OYoMEoDI5/02XDA5mKZcPTSFb2qHnlc/9ed5Cj6JkIHyI0adkxu4rJT+Un6U1xV+g==
X-Received: by 2002:a17:902:d711:b0:17f:cdd1:7ab1 with SMTP id
 w17-20020a170902d71100b0017fcdd17ab1mr5568111ply.86.1669140953751; 
 Tue, 22 Nov 2022 10:15:53 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90f5:6f8b:e78a:4a0?
 ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a170902e1c500b00188f3970d4asm12265453pla.163.2022.11.22.10.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 10:15:53 -0800 (PST)
Message-ID: <57c19b37-734e-4ee0-a2e5-d1513c04fb03@linaro.org>
Date: Tue, 22 Nov 2022 10:15:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 v3 14/45] tcg: Introduce tcg_type_size
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-15-richard.henderson@linaro.org>
 <6e038f52-6736-ec37-5f67-bbc41e83a228@linaro.org>
 <ad677647-423e-0ce9-8cc9-68cb0849c320@linaro.org>
 <d831dea2-92de-68d2-8c21-e66fb95011ae@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d831dea2-92de-68d2-8c21-e66fb95011ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/22/22 10:14, Philippe Mathieu-Daudé wrote:
>>> I'd feel safer if we assign TCG_TYPE_I32 .. TCG_TYPE_V256 in TCGType,
>>> just in case.
>>
>> What do you mean?
> 
> -- >8 --
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> @@ -289,8 +289,8 @@ typedef struct TCGPool {
>   typedef enum TCGType {
> -    TCG_TYPE_I32,
> -    TCG_TYPE_I64,
> +    TCG_TYPE_I32  = 0,
> +    TCG_TYPE_I64  = 1,
> 
> -    TCG_TYPE_V64,
> -    TCG_TYPE_V128,
> -    TCG_TYPE_V256,
> +    TCG_TYPE_V64  = 2,
> +    TCG_TYPE_V128 = 3,
> +    TCG_TYPE_V256 = 4,

But that's what C does.  I don't see the point.


r~

