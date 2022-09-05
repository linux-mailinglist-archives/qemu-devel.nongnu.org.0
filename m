Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26195AD233
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:14:19 +0200 (CEST)
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAza-00011Q-2z
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAfR-0007zS-3S
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:53:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAfO-0005Uh-1U
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:53:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id bp20so10557708wrb.9
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=aW3YXFiLp2mwwNDvHuIuZ5vz+8TgYS76U1fT1pDOfJ4=;
 b=osCjIVsFvlLmCIHGEEYaKOypqRRYz1Ff3yBrJX/gK0z07ufFG3Gj2VPRugrUExkHzG
 EmHhUU6f8ODnOrGlaSwseJljtJjkjkwsslUBFKu9RsPXODfCGPhB9Du/6tXkWT5KjRGP
 atC706737S/WKAozBA2vvyzFIgrGP85+w74ksbNIJS5mZWtL45njx4h36NsyDxpto+0c
 dgdlfyhQpyB96XqdVaiaJPb1gfnwxzuWj0u66KyvjWFvJnW6HDqm37SOOpfxnRqUFitC
 Az6TG/nlm9e1xm3o33KVCMrzPW+Hae9qbWordAo21hyQS40ggie0l7Xe1ftE9GEs2e1A
 pbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=aW3YXFiLp2mwwNDvHuIuZ5vz+8TgYS76U1fT1pDOfJ4=;
 b=1Sh2Rz/9xnPuWDFLxFBN9ZRZNq3wqdjXOpL2iRbuPr64FApnjhuF6O6sjGGmLQ7HAP
 ea+NjMEJgZgo+mjB6J8oOoCYSmhxsLqGJYHWnz3a9cO+CFxh2Mo+xMTBbooSyXDe7tg2
 gaXjQ9k9pSBRjxMgV1UMJjSYycwzUs5bEmg9K3R5t+PxaH/CnmDImDT6MXbBH8f9pNaT
 CahkkThgROTzDJs0+UF67zxYz2AMs59PLu0A14VV6n32cNqN0key7w1QI4hqecVdjHdT
 ow2QR4Asii7pq7DvzopFXXIuF0fMLeFh2+9hvoClxKHAHjf8K8WvrFNiIjRi0bPGQ50X
 SLGA==
X-Gm-Message-State: ACgBeo0x82AkGKlvYchmcmUySiwuZhbHmgZCN5+eJ8pDaDhg2dZksBs5
 bct6u/5qvnisoeG3qYC7vY/ZWw==
X-Google-Smtp-Source: AA6agR6Q8knrJwc0cHuq2nDe91aDmdooTIp98MZImEVamv4gcFwToV3Jgq6xoK3VqgruTU7BfSe36A==
X-Received: by 2002:adf:edc9:0:b0:228:60de:1d4b with SMTP id
 v9-20020adfedc9000000b0022860de1d4bmr5544584wro.306.1662378804196; 
 Mon, 05 Sep 2022 04:53:24 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b00225307f43fbsm9056966wrz.44.2022.09.05.04.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:53:23 -0700 (PDT)
Message-ID: <30c39bfe-b021-0af2-06a4-cca1427932fe@linaro.org>
Date: Mon, 5 Sep 2022 12:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/20] disas/nanomips: Delete NMD class fields
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-4-milica.lazarevic@syrmia.com>
 <31be828d-4237-909f-3ae1-a2fa18817ed6@linaro.org>
In-Reply-To: <31be828d-4237-909f-3ae1-a2fa18817ed6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 12:04, Richard Henderson wrote:
> On 9/5/22 10:55, Milica Lazarevic wrote:
>> Two class fields have been deleted.
>>
>> Since the m_requested_instruction_categories field always has the same
>> value, which is ALL_ATTRIBUTES, the only use of that field has been
>> replaced with the concrete ALL_ATTRIBUTES value.
> 
> Since these ALL_ATTRIBUTES tests are always true, you could just remove them.
> 
> 
>> The second class field m_pc is added as a parameter where needed.
>> Therefore, prototypes of the following functions have been changed:
>> - public NMD::Disassemble method
>> - private NMD::Disassemble method
>> - NMD::ADDRESS method
>> - all of the disassembly_function methods
>>
>> Accordingly, the disassembly_function typedef has been changed.


Actually, you might as well introduce

struct Dis_info {
     uint64_t m_pc;
};

now, so that you don't have to replace all of this parameter again in patch 15.


r~

