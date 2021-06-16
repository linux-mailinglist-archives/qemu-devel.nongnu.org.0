Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1C03AA06C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:52:07 +0200 (CEST)
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXpm-0000h7-Ax
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltXoQ-0007n3-Op
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:50:42 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltXoI-0007kl-6S
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:50:42 -0400
Received: by mail-pg1-x52b.google.com with SMTP id t13so2299900pgu.11
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QDf1Mva/qJx/8fUB8ZWKeF1crLI5Pd7qzcbCACHnG7Y=;
 b=b0CRda4G1pmXYMlmlVtBOQ6ynxjY8G+H0QoDqssGUYZnw+yD7lqnfJtPiQiT4UQiW9
 biuWyoRMtE9MedVkQavdeJ34OtSVZUu0YpVoNtwY2SrJnK80pc+Zm30dw6/rlr1CVFjH
 lUwTupEhO7u7hOnpQhM6bl1Do8SA1qqK3PpmnCEm6pKNxNOO39fE+wxB4QEbd585o6on
 9WCb4EAy/LiLASzKzCr/sCLZEzP8F134cynSRXKC0Kf3Arnf8/QgMyZPbV1KMOltXx20
 +wNBH/L7gdUcnqwCFLQpLkOhEuT+997gny3m6jKCfZcLX00odPQwC9tz7cL2LlqpKE1J
 RPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QDf1Mva/qJx/8fUB8ZWKeF1crLI5Pd7qzcbCACHnG7Y=;
 b=Bx2ySEzhIW3XcCYfXp/NuUrBy8UVWPkIkZoGQ3fbRIIDYFenDjCFa4/CpZ4Ta0qAzA
 D2Plg7oYlhpfYKKcCCoE7PeB8LdNHZuOhvCYNZNDqrzTcIXRwZyUTdNLHgkpl4Anu6vH
 m0LFq109yIJinAATOD3giFDa4IZkiJNrLUP6HqSG4ygAEwpUJis4ciw4/6JuwY/6GNfd
 gFT6V4f4JFEZ30BWSS40rfb5KxdD6FlOp1M1S3gXNeaEsqKNc88WK9mUs9L+Hm+TaV/b
 M5Oh3ZnO55xUPJE/2i7GHzb2bam2j4SoufSDw0XWydta1zM/jJuoRH53pqFxTuvvduux
 fo9Q==
X-Gm-Message-State: AOAM531bt9V3kkWVoEHA6TSRQX/3eAPnc+3toS4l0zdkaMrjgZZc1aFu
 BsG4HOi2SEqNrCn//JF8o5j5vQ==
X-Google-Smtp-Source: ABdhPJz9mhFPl63ObelirwN1uErBbZXSyKWN1unTrCCfv1IWDPMA3xrnAzFkkRVteDuuiavp3HtiNA==
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id
 b130-20020a621b880000b02901fbd3d0343amr361469pfb.76.1623858632069; 
 Wed, 16 Jun 2021 08:50:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a15sm2692387pfl.100.2021.06.16.08.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 08:50:31 -0700 (PDT)
Subject: Re: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
From: Richard Henderson <richard.henderson@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-8-richard.henderson@linaro.org>
 <BYAPR02MB488698AB4CECA0A05F1B3AB7DE0F9@BYAPR02MB4886.namprd02.prod.outlook.com>
 <43f61832-1d76-31dc-4ba4-e35007b16fe7@linaro.org>
Message-ID: <94c4e258-e1c3-9d58-f53e-72c4249ea93a@linaro.org>
Date: Wed, 16 Jun 2021 08:50:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <43f61832-1d76-31dc-4ba4-e35007b16fe7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 8:05 AM, Richard Henderson wrote:
> On 6/16/21 1:07 AM, Taylor Simpson wrote:
>>> +    /*
>>> +     * The on-stack signal trampoline is no longer executed;
>>> +     * however, the libgcc signal frame unwinding code checks
>>> +     * for the presence of these two numeric magic values.
>>> +     */
>>
>> Hexagon uses musl, not libgcc.  So, I'm not sure if this is needed.  The signals.c test 
>> passes for me without this change.  Are you seeing it fail?
> 
> I copied the comment from the kernel source.

Also, I think you're confusing libc and libgcc.


r~

