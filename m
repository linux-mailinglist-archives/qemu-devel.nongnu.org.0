Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A14361592
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 00:38:05 +0200 (CEST)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXAce-0007XA-9T
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 18:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAXk-0002R6-AP
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:33:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAXi-0001ix-NT
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:33:00 -0400
Received: by mail-pg1-x536.google.com with SMTP id b17so17896682pgh.7
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 15:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yYiF4R3iHKhzlGi5ZDg+mDGfKHFiiW/gBPVPPtE2IUA=;
 b=to8RMSLYNlYH/2WNi6Y7PxDgiiv1MA2cd3xUCcug4YU6jL5HMRKDutVwy1U7ToG36y
 QIJ90os/xKBCfhIsZrEa1HiC9lOMwLBOFMf3NnpSjju0ixvz2pMfZI3XYawIN00+vxBe
 LIQnsph5LzvSUECj9Y7xL3ErdGXGw2/V2n7p+CLU8wbMqe1cBem09AIl9IIasj0NFycv
 e6al53dNYLwuYLmQBjOJtqgDsWH/myT+GrFOjC61TyzL+64RPGdUa7ErHHttEPesuxbN
 BoXBdqmtUmXPlEQleDsvjrynF7OEbL+dE/NzCdTm0L0CdpmTproVeviuN86SaUGFxgl+
 RSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yYiF4R3iHKhzlGi5ZDg+mDGfKHFiiW/gBPVPPtE2IUA=;
 b=RT8HYPyuOPhbb1faotCeuWak5pjQJc9q+fBbf3WG1tHf/dICCGwSOnO3gQ7HB5ltMW
 Le056DJT6EP5y5+Ptafp5I2NujMPVbyxZvePP/e1KCIBH9k/qhWh+cljEcCMzkOLVYs4
 ZGGbFgf05qlSctxzaxknmZRY/vXaihgHPmENf2yZcArM86a9su9n9eiRHg1O3H7yE22E
 mh7bRDirev9hvjpl2h0C2FuYrDe6JuGoYOK2lgkCXh/7j0P+jyzZK47LP447Ng8NT5MT
 YAyC5+MaXHN+n//NBSWQY4AWlkrjs7bMEW4ILuudLtf291/gdFw4UAOpFbxl0eCYqURp
 y/ew==
X-Gm-Message-State: AOAM533/r2zcXCCC7iiQ277K+tHqoQLFeAfyslELY3ZQVUOqWTy7uq4Y
 dVQUIJFjk+x8lnT8dHhDoFBJrQ==
X-Google-Smtp-Source: ABdhPJwZYPnflerAUWIsxBEIRl0OpOpzPsIbEAemEzWjuX+fkMk+7aFDfV7NE2v8GqQKe7bQS/10+A==
X-Received: by 2002:a63:5301:: with SMTP id h1mr5291222pgb.109.1618525977145; 
 Thu, 15 Apr 2021 15:32:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j10sm1200850pga.5.2021.04.15.15.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 15:32:56 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] exec/memory: Extract address_space_set() from
 dma_memory_set()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier
 <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df6c086e-8269-c786-fc9e-3046d11cf34c@linaro.org>
Date: Thu, 15 Apr 2021 15:32:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415100409.3977971-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 3:04 AM, Philippe Mathieu-Daudé wrote:
> dma_memory_set() does a DMA barrier, set the address space with
> a constant value. The constant value filling code is not specific
> to DMA and can be used for AddressSpace. Extract it as a new
> helper: address_space_set().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/exec/memory.h | 16 ++++++++++++++++
>   softmmu/dma-helpers.c | 16 +---------------
>   softmmu/physmem.c     | 19 +++++++++++++++++++
>   3 files changed, 36 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

