Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84810242E2C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 19:41:38 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5ukr-0008E2-JX
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 13:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5ujT-0007Ia-9I
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 13:40:11 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5ujQ-0003f2-JA
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 13:40:10 -0400
Received: by mail-pf1-x42c.google.com with SMTP id u20so1390352pfn.0
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oc3Sy7KuN/OqrKwLcMkqYl4zsJ3yDMvzJtk8d9tcSgo=;
 b=SwNMCD6OA37o0pG1OTE8hIfty6IG3PqkpQbjMNLfFL1DKlAsomb+1b+mh8iHE8at+V
 NY8DWYdEQWtDcCeIU9g+2MCvZNLa50An9JWNRLnsol7E34bBde1VivlVhv/tjsJp5z73
 jI2+w2r3i2graHhN71P8XN9JE3MQXA09uzx/bfasDZh4BGP0X+SIuWPxz2dAJHiUyP/8
 Q38WFXS9XY23BlJtCOlaA48jlXQ+zkuvN1kAEoFraGk4AUl/wXIX2nN4Mh1WgLs9T911
 vWNQ8SnnvjsDKCJAxVL2buNCwB+CmvogAI5FQV9PZjkXSo8YpQ3APeNnZp59PmFKskNy
 EgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oc3Sy7KuN/OqrKwLcMkqYl4zsJ3yDMvzJtk8d9tcSgo=;
 b=P90Pb99V8KewOW0F2cgJ/W2bLRQhEzgfVkLakYtTqCpXoC5l5wCwSKsMWJM/PbGl71
 QvWpEVEAkM8a+OcBhA3EpTx/pd5GpNC0tfBEMvdzJ8evXOJLcka25IZ+BhCLLC4+zZal
 xQrVvpBZS56yO8Z1jK034YCAcGynTk5S/R93ri4fP4IIscDnBSY/9o/kZzspBc+iBPkB
 WTi9VPdKxlTk3QOJz+9Paj16e35CpS8CBcwH8hpiDn7btHNLejQy1HMJWLPATXGMMUqU
 3Lme5fRaWpxSSY3g62BTMC/T5VgIe76/o/RT6DJPaxwCb73YEmMpHQgvO98EhPo73sxi
 LpQA==
X-Gm-Message-State: AOAM531IIVAk1QKR4FukduEkBcy90PkPCfIRW6mh2Pvv8ohIn1HUWQcj
 Ks9NEaZvyhjHWiwGCFYGpr9P1RREpa4=
X-Google-Smtp-Source: ABdhPJxS5gowug8UGL1p8wLCT4DA9OQJPUzL2VyconsQl2d1if1RbRFcUBJbrByx2p3ofzL57ce9lw==
X-Received: by 2002:a63:4f1b:: with SMTP id d27mr187425pgb.389.1597254007127; 
 Wed, 12 Aug 2020 10:40:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id mp1sm2888574pjb.27.2020.08.12.10.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 10:40:06 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 2/3] hw/clock: Let clock_set() return boolean value
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200806123858.30058-1-f4bug@amsat.org>
 <20200806123858.30058-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66ee8542-578b-9cac-5e48-2fe868e9927f@linaro.org>
Date: Wed, 12 Aug 2020 10:40:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806123858.30058-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/20 5:38 AM, Philippe Mathieu-Daudé wrote:
> Let clock_set() return a boolean value whether the clock
> has been updated or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/clock.h | 12 +++++++-----
>  hw/core/clock.c    |  7 ++++++-
>  2 files changed, 13 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

