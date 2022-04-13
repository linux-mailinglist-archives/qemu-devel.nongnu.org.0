Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F284E4FFFD3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 22:12:49 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nejM8-0005jX-KI
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 16:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejLG-00050v-7O
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:11:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejLE-0004aJ-1f
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:11:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso4712162wml.1
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ytjWz+ns5HcKCFXi4O08T5hk7runitNKImZqB6yrNU=;
 b=aNKCE4CrNS2J2SutevTLXa+NcqPZ67h09TuxytkmGdVGSu4wFPiJCutvdrMb/2NcnX
 PH6KGpzYSq+l/HISqDxcloG1pWOHIMuHyGQL6xqj7z+5iAR8WtHguUbA5EjzC3dsaRXP
 NI4XWTYOrpaVXT0nBqTkuBGtZ88kNC3xPxQA2H193lagbbbSdEKukzhm+EgWvd/F+qHM
 +tAb9Be5FaCrs/8srCsetqRV6dDyaqWqyN5fSpnJ8Jb6TN+teo8Ea7SgixBdTWqmhlfk
 E7QgskCfyYkDxpJOY+Y1n/Qz5lrLXPjJn+yh9BNR3tKa1PU+FYgEVZS4xXkakuEXSO8N
 Kf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ytjWz+ns5HcKCFXi4O08T5hk7runitNKImZqB6yrNU=;
 b=7ggFDVGNq7sMVggKKp7MhFIAqJo2+69fJIY27UqqW/hVwW+C19CHpUEDbc0mvn123t
 7qUelBOnPGfCyfA7t4xqillJWN3fE5VV3ihZOM0Zwa/cVBfR/CqedWIVbETWgjAkP9w4
 y5uaWlQ1HWxxO5yznhzDna9VMd2fe7S7/URnFvQBGVrNMvO4IUqDQ5lvNWrnR7X/JlyI
 96vdekRq+1b7Rqa7Q9s+agxHLHGbs6n/nhM+dYtbN7prDss2IVTmZAyGLiEiUpavDoXs
 sPsxvoB+KYrly6mUIkYP/TotW6wBxGw0SrROCFulqsHxjDEqJ6eOWGe6BaQkaLwurjZD
 5XLw==
X-Gm-Message-State: AOAM531eNCgfgBZH/IdxVSIcBLJTVclERuMVJNxiC8OWfe98WcYPLMwR
 V0t9tF5tAKzNFZr32ssqWFIQjbKM8qkBRA==
X-Google-Smtp-Source: ABdhPJw8CZi3IoExkeJdO1dAZKnKIeXlKUPbQOQ+YlolQqmBY8mYDkqcElJWIruI1mjByWRRm/2zYw==
X-Received: by 2002:a05:600c:4fce:b0:38d:a58:6d16 with SMTP id
 o14-20020a05600c4fce00b0038d0a586d16mr336756wmq.11.1649880710287; 
 Wed, 13 Apr 2022 13:11:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 g1-20020a5d64e1000000b002079b871795sm12309wri.50.2022.04.13.13.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 13:11:49 -0700 (PDT)
Message-ID: <dc203e14-5c4e-3427-a446-40d3ddb78af0@redhat.com>
Date: Wed, 13 Apr 2022 22:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/i386: do not access beyond the low 128 bits of SSE
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220413160945.544176-1-pbonzini@redhat.com>
 <875yncygac.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <875yncygac.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/22 20:44, Alex Bennée wrote:
> And:
> 
> Fixes: b7711471f5 ("target-i386: make xmm_regs 512-bit wide")
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/420

It's not really a bug, beyond the possibility of uninitialized data in 
the migration stream.  The reporter was probably using a fork of QEMU.

Paolo

