Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82C515F84
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:24:02 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkqp7-0000tm-7e
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqnX-00006i-RD
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:22:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqnW-0003w8-Bd
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:22:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so8211400pjh.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wEAshnzvidulUDDn+2FBmwP+VVxCuNDXAnEVv5P6ifw=;
 b=SlTJ0PxB+WO4DTpf9Nz4QbTESkloqVMcN9q5+J1HoxIQZubGTAfk7aYVU44WBaE4UZ
 0UOVLklHwbl/xNqPmV21Rnez1hJ3xmI9xfK9gFCVZm3NdWi/V2zX0zAYH04pjSOOnl8l
 BNs545N2AKdeCPBE0L90RpHpC6cpvyIkfgHmYFruAzQdRyXzSIv+YMYZaNk9jKMwm/9+
 dUMtg2qJcxABoScmWdlqQUSaqRUOgYXSl5lEwA0uwZlhR6BqlZUW3wdDHAZTZ7BstN8z
 MjTAOI3FaRdMSd4HjroUe5LR9cFg+AziZ0OSIYyejIFkKdHCvA6Fjtw/OtLyFNcJMAZq
 U5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wEAshnzvidulUDDn+2FBmwP+VVxCuNDXAnEVv5P6ifw=;
 b=l74NHPPmR3TkCUkanhN8gcm9BKUvqEzQcfRdamX25EJVill00m8hcBAQZQSoUyE0L+
 unI6gTNyuE9N7xD3qhV/7vVlFwnMgmXgEb8VeYhL1DNLWWXWxnAjRC5wVOC/PEokIx63
 i0biHkcqwUaxtSlo87dclDSrUwOPQ+V1HMQ3BrMRkvkqrfv9NviCuCXqI4mUf3fbtbHz
 3ohsD3nP8K//Uxg5FPWb8c/XaHNB5xZ+o2ralWl8XmKppfU7cV6IcNZKhlCw528wHbj9
 dhMsQbrdmzHaqfwKwcuyeAvs9DzBFFNALlEkNv1i9n5mohXvfliQmHaLlROPpPdzetyS
 d32g==
X-Gm-Message-State: AOAM533ocellFxlvvsfJKnMEgX8CkJB5qtE+ZMOoy0Caf3J5jW9yyjhS
 4br7LY2QnMZ3lizieAddZSIIwA==
X-Google-Smtp-Source: ABdhPJzfTtlzPeaYSUdigutyeVyLC/muIBT4e2xD6tqdbgsuhBI9niptXHobSznMByrA3y6R+Qt0hA==
X-Received: by 2002:a17:902:b906:b0:14f:76a0:ad48 with SMTP id
 bf6-20020a170902b90600b0014f76a0ad48mr4432328plb.79.1651339340636; 
 Sat, 30 Apr 2022 10:22:20 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709026b8c00b0015e8d4eb2e8sm1709826plk.306.2022.04.30.10.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 10:22:20 -0700 (PDT)
Message-ID: <22c74d5e-f0b6-dc6e-c7e8-7c28774f80e4@linaro.org>
Date: Sat, 30 Apr 2022 10:22:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 25/43] target/loongarch: Add LoongArch CSR instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-26-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429100729.1572481-26-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 03:07, Xiaojuan Yang wrote:
> +    [LOONGARCH_CSR_CPUID] = {
> +        .offset = -1,
> +        .flags = CSRFL_READONLY,
> +        .readfn = gen_helper_csrrd_cpuid,
> +        .writefn = NULL
> +    },

The offset should be

     (int)offsetof(CPUState, cpu_index) - (int)offsetof(LoongArchCPU, env)

at which point you don't need the readfn.

> +target_ulong helper_csrrd_tval(CPULoongArchState *env)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));

cpu = env_archcpu(env).

Several other instances in the file.

Otherwise it looks good.


r~

