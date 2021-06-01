Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A8397B84
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:04:37 +0200 (CEST)
Received: from localhost ([::1]:59616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loBYy-0006bB-8K
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBXP-0005OM-Bd
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:02:59 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loBXN-0000hM-Mv
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:02:59 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v13so7543121ple.9
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bSGIXUJwkVn6fmc03vXD+qKTd8XQU8YaqCrG8qGT8tM=;
 b=EH4FGxj4Nb3AvAGY7mejhRzdvkkFQcdWhQXtt3wxSR/Yheiq1owDcz2m1acZwT079r
 vNOsq4abScPC65ukizFf8uTboY0po9QZv1XbN113POXRg8VnrGnZUdAHRkx01SvKquW6
 9HcRyGZttQBt0L9GR0PXpI+r0G8fxeLueu/FjgQEggJPr2OjPqSoZZ9Dxt+V4RSQqcoi
 e5asaVFKnmgOKiRi6ap5uyYFLn4RjKBnszXt6almBM/1PqAFl4B5Kr/DnTtyUJrPmwmM
 At+4TWM6V14CxLqdUMCIVJPL+y+DV7XQanj1zwnKlQD0+ogbmsqlzMYN0HiVskk+uSa4
 wwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bSGIXUJwkVn6fmc03vXD+qKTd8XQU8YaqCrG8qGT8tM=;
 b=WGX2dg1hEQ3Zkl7cwFH9IcNSQoKwDGoB9UW3BYygMA0zVBT0fjY6ceGMDuphAJ5cAL
 ZPQusLWnPGIe7uYhRrp3j6sJ/NrjM1S9Acqc/DgPYoVho9cMqUjoFKbm09fpMgobB7hI
 CRSmMhHC8LwzJRWomPBmvO963urSY3LdfSrB7YzMEVioLjZ7Utrhx443GJNT1n8u/i7D
 9NYLgiRqMKX+s/azvKUgKubTf6ZqO0/NwA3HLa17pFuRePOP62qGFahgJ2TDQvrN04CK
 ts8i1sy47tGECd4iLDYmoLiejPOOqgV421yhu5RYbB87dnh+qKkpf+egkdF/IqY76s1X
 kBzQ==
X-Gm-Message-State: AOAM530kv1GTDmxh7iyCX1m02oMZywOu5g0DKxgAtBqcPt/tr73kqJnn
 H2/MEfZRNSeHSCgfvI6VwwoTAg==
X-Google-Smtp-Source: ABdhPJyx3YKw1TbHkSj7rfxxsrquXukI4kQdBEL3tFOfxlr8Cz8bd1P1m7iJqpIeN9thy8JJvJQuyw==
X-Received: by 2002:a17:902:d2d1:b029:ef:8d29:3a64 with SMTP id
 n17-20020a170902d2d1b02900ef8d293a64mr27771858plc.38.1622581376242; 
 Tue, 01 Jun 2021 14:02:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k12sm10044374pga.13.2021.06.01.14.02.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 14:02:55 -0700 (PDT)
Subject: Re: [PATCH v6 11/14] target/ppc: Implement cfuged instruction
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
 <20210601193528.2533031-12-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f69a318-210f-e1f5-1bc4-c0f913d6e8a3@linaro.org>
Date: Tue, 1 Jun 2021 14:02:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601193528.2533031-12-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: groug@kaod.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 12:35 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                        |  1 +
>   target/ppc/insn32.decode                   |  4 ++
>   target/ppc/int_helper.c                    | 62 ++++++++++++++++++++++
>   target/ppc/translate/fixedpoint-impl.c.inc | 12 +++++
>   4 files changed, 79 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

