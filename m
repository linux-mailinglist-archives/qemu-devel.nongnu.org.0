Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EBA3BE0A4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:45:40 +0200 (CEST)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wd8-00016t-Gk
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wc1-0000Fn-Br
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:44:29 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wbz-0006lD-KX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:44:29 -0400
Received: by mail-pl1-x632.google.com with SMTP id a6so167312plh.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=otMeSGlxMHfLy3W/dm1iSvgG2PjK7SFTq8L1RAqsuaM=;
 b=wtIGE8CA86lGLlk0r7ZPM+PNKce64bnURZvwwuV/3EvHoKPoAWsE6oYi+drBBeeBBL
 F/TrGJSUYLD48zBL3P2pr0ORnbs4VPuUJGDvQ2UBaR8oKdzvBIpKJCvnuO78KFWdS28Z
 mDFq+EYep1tgnln9cz1HV1h8gGfS9Ibq7311za7ciNe6hgzFH6RiFMc0Le0+Hxm0MYGO
 6od8iRDjpRRIhxMbxAgjxg76cmy2fb6TL0JA9uCVOtMMVmZm0KTkD2n87j86Bqx254P/
 KobKEkpeD9TfeItAgvHJUU5IVyobvq0Toy9wzPfzMHf53Q/Y+LJ2nLUjCpoxNlm4+QDO
 Z8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=otMeSGlxMHfLy3W/dm1iSvgG2PjK7SFTq8L1RAqsuaM=;
 b=Gyf/yAnUAJZHQzMWU/e4j/9mFdm2chkmg8OY+99eHTdoAloLs9fYSyKCu0xea/Qtp1
 ghwEgzTL9xS6UBv/urEACi6Hf+dqyrotHAkanYXBz9R2chyXcBrG5u/+t/KUVjoCvhny
 JRaLcGSwGCvdD5GcmwKyXJkyXAEaCrL54ceRO15fFKhVjmCmfUV/1tWeGk/BFKukApsK
 Tf7MewGZM+w1HZGCboDNAK7xmV7uy8SLY2WEEkTQnt3gma5GzKMK8Y6pWMy+clXoCb6y
 sDI2k7sRx29OahVX3RfGCuWcf8X4QGZ/DCLvCB2Au25kbb2rdGDhE7v/4/v4rB5GjxbY
 AK2Q==
X-Gm-Message-State: AOAM530kjrmg2jforU7x/cL3JtPc/W/lEs6AVnjHaADLXnRICjqcmCWo
 pKfpW3jfLYMmee9RSUgmdnMGpA==
X-Google-Smtp-Source: ABdhPJzYQ3+OI27hQtGUi6hfEE/DH+PmQqIm1EeEY7Z8pRTdw6Plj3zl7g7bkA0TnfaI6OsMymtzZQ==
X-Received: by 2002:a17:90b:1297:: with SMTP id
 fw23mr3314433pjb.37.1625622265904; 
 Tue, 06 Jul 2021 18:44:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id cs1sm4081347pjb.56.2021.07.06.18.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:44:25 -0700 (PDT)
Subject: Re: [PATCH 01/12] linux-user/alpha: Handle TARGET_EWOULDBLOCK as
 TARGET_EAGAIN
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704183755.655002-1-f4bug@amsat.org>
 <20210704183755.655002-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27d778ed-5c1e-ae7c-bd73-a1f2595d958e@linaro.org>
Date: Tue, 6 Jul 2021 18:44:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704183755.655002-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/21 11:37 AM, Philippe Mathieu-Daudé wrote:
> Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/alpha/target_syscall.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

