Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700336DFE0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:47:32 +0200 (CEST)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq9j-0001JZ-6u
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbq2g-0003IP-Nc
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:40:19 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbq2d-0007bh-41
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:40:14 -0400
Received: by mail-pg1-x536.google.com with SMTP id m12so4754257pgr.9
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X0s1IdWhRCezC/0wJ7HAxW3aCajYx//leWPBHECgsC8=;
 b=yWInUALLxW1wIlZo37o/X+RjwnnrzF+frC3kXAuZZiZ6q9TFkrZlMiFGSMTFc8hmLQ
 i5lALEOmirZMe7WWAadLPc+R2tAgQoJXkN+HTNv1Mb62v3gNU00DGd/drRiwIOTX/rZn
 hUVMwVSiHBOPe6RY4MT2xt6ZuJqkYyPN08/AVXrAo8S6FKxvdiqZiFUgOGs35OYnGm5F
 oW6bTsBqmZEGi4LLX3OIiu94vYewKHvYhILt5S0g5nKqj+hNTemiwndt3koA6bL7+ovQ
 +14XqY40yLCGWKRDUudrzsPg5e/ocoT80bBPCAFfS4+iw4Iwh0Kz8LHe5AeP6Tc4vd1z
 NADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X0s1IdWhRCezC/0wJ7HAxW3aCajYx//leWPBHECgsC8=;
 b=A8yf+U2K6j8qPavrQ7PQ2LIBIXwGsb68pRW+LNBHlAasRSua84xI/hkgrR9/aqMDQX
 wjIxkjpn5PbgNmwNnRqY/a04KkO1dWQv/Y5iD9Fp9Zwh7qn32bj0O4wWGYi9+2vs/Cd/
 OTphpEQ2UTAGH2z2yf0Q1UiwSJ11GnHKn2jvOzmhI+yY8FldGDVlc9EncpB/Ze+9YIh6
 h5Y4kiAebvyZHIxgxCYIa6KotRf30yxvzasINy/VTlz0/giXnEzVZ8E589Q4SBCEPxSD
 W/7I5gFq/f8KjDkQ4OvcqFUikOe96YXU3ySUl1szd9F35dpZFh7h7u73pF7y5YhnxuvF
 qt3w==
X-Gm-Message-State: AOAM533ezNvntqyak1Du/lIpyx/PEEpZiTzRGZsYU+2GpAu8EpOFNOBe
 QM5SnK21CwqQFMCkKovjGhZIwA==
X-Google-Smtp-Source: ABdhPJxwXXClpO8wiHhFbTerU6dGwEPox9SFPcweIWmb+V9NIvvBsGtf0geJp+jf3FQehcjNAZ3k5A==
X-Received: by 2002:a63:ef4e:: with SMTP id c14mr28292095pgk.166.1619638809292; 
 Wed, 28 Apr 2021 12:40:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u20sm471975pgl.27.2021.04.28.12.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:40:09 -0700 (PDT)
Subject: Re: [PATCH v2 00/15] linux-user/s390x: some signal fixes
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210428193408.233706-1-richard.henderson@linaro.org>
Message-ID: <93c9a9e7-ffdb-7ed8-522a-0f6c32b448f5@linaro.org>
Date: Wed, 28 Apr 2021 12:40:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 12:33 PM, Richard Henderson wrote:
> Version 2 splits lazy do-it-all patch.
> Patch 1 has an additional fix, so I dropped the r-b.

... and I realized as I hit send that this depends on the 
target_restore_altstack cleanup that's part of

https://patchew.org/QEMU/20210426025334.1168495-1-richard.henderson@linaro.org/

For avoidance of doubt:
https://gitlab.com/rth7680/qemu/-/tree/fix-signals


r~

