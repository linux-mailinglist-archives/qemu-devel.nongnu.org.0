Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8843D7ED
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 02:05:58 +0200 (CEST)
Received: from localhost ([::1]:58184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfsvc-0000ay-Oi
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 20:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfstE-0008K4-Jr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:03:28 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfstC-00052J-Tr
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 20:03:28 -0400
Received: by mail-pg1-x532.google.com with SMTP id c4so4553386pgv.11
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 17:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y76q68sz9AzZMEPeI8Ic8VZn0cQPJMBxDvZ9jgU6fN4=;
 b=GapTNxtRcxsmZXEfa8bUd/hQvolnR+35EtbN6yPxuiGPpga/Vh2dRsEMaQf9Bt2Xpo
 bcjXTtbtAPlTjS6FBEjLMjjQUu5wHDbHJzlmX7bZsPgqoO75ZIuqWSsR6dFIll0OHKIX
 0cKixvHU87Uk6eadR/RVb/vZKuT3fQJQBgSu4X1rf1N6bYWKEuLlyWIgn8oIZ6VlXHBV
 q5sldmgXv9GhwMtG40DSQncWGYTh9wFaKEvn2DNb1xm3x3UfK8ft7cffzrqWYyZzPbaX
 YCFyY/eDOhnrpY04T3R+sTEIqkI2ojJJ5kvptFO0OuNHk9dWR8iYl8lDfHnN/jlIkfoX
 VxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y76q68sz9AzZMEPeI8Ic8VZn0cQPJMBxDvZ9jgU6fN4=;
 b=N1IPuFGpnnpMf6XpgzQdFmO9HeJ+7FupM7gpF/LXoT+C67SqJlc4hd0bxBcuJyJSD1
 bOzky1wVwjEHOGO0xiDSFQmpyB3Z6qVaVEY0cFeZQ/fh05XisJ7hiVdectcrae+qdBIr
 Y4cQMEWt/Tpndz6s4BVYhqeVwqOatvDV4BhmKsLXmUED7/zxzOAQgGOuizTEsRmUMiuX
 fibw7cKrVUQ29ud2JIifen+YtrO/da9/Ks+9AebVh/AI3ca0xFedgazML5Rtct/uqbzs
 EHtD5s3XTjsSeY+4gAZ07jtX7RRFtztbciy9nVnqSPD34QnBebvUMqCFH4BQdZkJZ9P6
 QQKw==
X-Gm-Message-State: AOAM533LlXKLr/Ig0L2D7huhnAsMcZX+0AY3KPdQd5EJJFm6BT+IiCs1
 chJ9y1jBzcb4yJc1MfOUl0SkVQ==
X-Google-Smtp-Source: ABdhPJzVYwazk1nlscLJPJ0WpSXzwwvrH0Cdd7PRgFYBUsbAqH43NX3KDfkur3oFt+9wHJyed5CzkQ==
X-Received: by 2002:a63:8748:: with SMTP id i69mr712692pge.24.1635379404851;
 Wed, 27 Oct 2021 17:03:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f203sm1042296pfa.112.2021.10.27.17.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 17:03:24 -0700 (PDT)
Subject: Re: [PATCH v4 41/51] tcg/optimize: Sink commutative operand swapping
 into fold functions
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-42-richard.henderson@linaro.org>
 <CPXPR80MB5224A60FE8542531211B3D2ADA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0d6ef51-383d-17ba-d4e5-f31c6d320930@linaro.org>
Date: Wed, 27 Oct 2021 17:03:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB5224A60FE8542531211B3D2ADA859@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 1:32 PM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
>>   static bool fold_add2(OptContext *ctx, TCGOp *op)  {
>> +    swap_commutative(op->args[0], &op->args[2], &op->args[4]);
>> +    swap_commutative(op->args[1], &op->args[3], &op->args[5]);
> 
> This was existing code, but I would've understood it easier if it had a comment noting that, even though it would be possible for this code to swap args[2] <-> args[4] and not args[3] <-> arg5 (and vice-versa), this would be okay for an add. :)

Certainly.  Added.


r~

