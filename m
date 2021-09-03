Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A54005DE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:34:02 +0200 (CEST)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEwr-0006QN-Kn
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMElm-00049C-ID
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:22:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMElk-00048c-BV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:22:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so245238wmq.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E4UXhdq3hkKEQ9D6WbxulkmpfuJNtC3mJNqv0YbKE+g=;
 b=bZiItHa4s2PjcTqNPWO5gH8SotcLr1BX3q9aK2DxbY6Q7Pjk5Siv9CYxf1Vyeh70eR
 g5OIuB0pMjYC3b2tOz6S8YJCvXm+tq9icIKU64zZm7yqPK96xIhK/rUqetQilmjPqbo+
 kzATIFf4jclHJ76ETrceN4mLlkdS1lGD5NxhAWl/M276UuuBhoaYoPTxg3B8zbDutteU
 28gz2D822Mcpn1tHmoT3vSyQubF9ara4TqoR0FAnLMEPFSOPlEuDyZU0FjNNCHNR9GL1
 cKb8SKR51DW8U2OmQUUJFPbJ8ihtu8rsd5YueAlk5pbdiNsDcoHGN2eAkDOdMG88Q2ut
 HtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E4UXhdq3hkKEQ9D6WbxulkmpfuJNtC3mJNqv0YbKE+g=;
 b=aI6M41WgU8OWCtCfg+zBSErdGSpscSquyzrf6JMCfCJilMEp11RJsqgKXp2bVwLGcP
 RRXT6bDxBR4lxJU/weTPaUGo0b49JYCd63w/+2NCFO39L0iDCU3DxgfXiACwGUT3oURj
 agIQSxNPYPng24jqvNbcXuXOL1nfYCRccVsr0QLmGBABmWOn2r9X+n+hJjg+LqeT3fG3
 KvPiKJhPRaaVddkypnZqJg9nohviVK888zp0CtRUuI2LpL+RoLeykSBNdsn/Mvx2tYf9
 T/OkLpblEuC2r5qdnrQHa0y5qq6C4W2zGiQ/1rgUEsu/z1wShg3G0ebVzyb2lrLg+9qJ
 RJPg==
X-Gm-Message-State: AOAM530abBQJEHdJeJMfWwfkmC2dSz9WnBZbRVCIc1uDRvKUIrtv4OHR
 NWOulen5daPSdoY5S1LIM1ZYUQ==
X-Google-Smtp-Source: ABdhPJxbhoNWzTYqqN6Oztg1fBsrO2KSgfXWeEuqFct8n+NWc2Qa64R92W4dpp6EgSWxVKS//9cjHw==
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr306364wmq.107.1630696950988; 
 Fri, 03 Sep 2021 12:22:30 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s205sm236363wme.4.2021.09.03.12.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:22:30 -0700 (PDT)
Subject: Re: [PATCH 19/24] target/sh4: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-20-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c2fb2f5-e616-356a-a6d1-368b0eb58daf@linaro.org>
Date: Fri, 3 Sep 2021 21:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-20-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/sh4/cpu.h    | 4 ++--
>   target/sh4/cpu.c    | 2 +-
>   target/sh4/helper.c | 9 ++-------
>   3 files changed, 5 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

