Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED27319282
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:51:20 +0100 (CET)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAH3f-00068U-OP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAH0y-00051S-Ct
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:48:32 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:34167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAH0w-0000Op-SM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:48:32 -0500
Received: by mail-pl1-x632.google.com with SMTP id u15so3807924plf.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dVLgzYodrfM+BU/tve3jeANvPPwye9lA/tH/ZPfqP68=;
 b=gfG5L2Z2nDrs10wC8UNuioaOEGNvci496Vllawk+ubIOGmR54TtGdHXn5A2qKZjQ+k
 7V9A60kD6Xnf+pxLZ1VP+6lMneEn3Mjem7GMVnEs+6oU/g6Af7gBZGxhvZDVX0OxwZ9o
 YZvtLww7mK0Lz0G8MrC310EITZSHIjo9yVbKJ0GY1du+C987OfpXGkw0vLC4XqE9DSAi
 q8H7x9UOdOOLIE26CEJgtH6fFwnewEWY7hdastjbgJr4587YtSmzg/NafntQkWOAx8pF
 KYGAIzOuagMTWsbR48F488t3FBQNS7k5mIyeNLNFYCQfnkI6AOKBrZNbziEcG2z1DVvi
 Jn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dVLgzYodrfM+BU/tve3jeANvPPwye9lA/tH/ZPfqP68=;
 b=LlydfiD4TRYgHAKl1nUu+s8ZB3rMwonBrJdPS1YOz38wnM5kBymmWUUzOAQRytsrNd
 eh/1xlxNRMP7CKwlEF7DNaMndXR41qnRdPPDwEeMlOnKu9Wpq10RZ4gPG5UBTiEav5rP
 q/jvdLzlWps8mf0h/VMDbWFP0NswI9dDxODqno+8m6Q9I89IGRPqwDg7LqgHuIlQNO6z
 w1MlHNEhQ5n3y79+MF/1Al0g3RWGxHbY0lyDxVZiLkY+dOMmGjSW+i1lSERztpzGXwo4
 V0DRG5DgJN/T0vcRA4wMJgQCY2xtNZFNW+S1vzUINnX37h3MAADqczXQV7bSjutJVQbN
 zVaQ==
X-Gm-Message-State: AOAM531bBaKUOVTHyRGtgFBZ4c1gTySfCfYHVtjc5U6iveSVzMCpbrsQ
 Lh+PamEmTZfNrd95CSPHOT+49g==
X-Google-Smtp-Source: ABdhPJwz6itElfGF3+7wj2p53+Kcn/qrWVfrgOix4aQ4jDWGFB4ncrnHUfqg/iNKURoZn7UEJ9+Shw==
X-Received: by 2002:a17:902:e9c4:b029:e1:805d:7965 with SMTP id
 4-20020a170902e9c4b02900e1805d7965mr8802960plk.53.1613069308733; 
 Thu, 11 Feb 2021 10:48:28 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 me3sm5653270pjb.32.2021.02.11.10.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 10:48:27 -0800 (PST)
Subject: Re: [PATCH v2 16/21] accel/tcg: actually cache our partial icount TB
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-17-alex.bennee@linaro.org>
 <ef56fb67-4424-335f-45d2-a96dcefb1b2f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3b444f83-55cd-493a-d841-4bca87bac3e0@linaro.org>
Date: Thu, 11 Feb 2021 10:48:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ef56fb67-4424-335f-45d2-a96dcefb1b2f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 2:21 AM, Philippe Mathieu-Daudé wrote:
>> -    insns_left = MIN(0xffff, cpu->icount_budget);
>> +    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
> 
> Can you describe this change a bit please?

Replacing a magic number with its proper symbol.


r~

