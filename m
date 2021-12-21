Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B847C7DE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:59:06 +0100 (CET)
Received: from localhost ([::1]:58658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzlHt-0001J9-Kr
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlG8-0007s3-Oq
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:57:16 -0500
Received: from [2607:f8b0:4864:20::629] (port=41574
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzlG7-00079L-1F
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:57:16 -0500
Received: by mail-pl1-x629.google.com with SMTP id z3so80695plg.8
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 11:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7bZRLDI4VA/S5SQp9rpGXYUGXP4X2IMM/BOJWINjACM=;
 b=Myo4vzTixLyV7gopks5M9kImTd5xyqXqskBJOHeIPYW6DiEeuT6M4OJI8A0OUpCypr
 WZ8xIeiuX1F/eMWoCfgR5viL3KyyhFbfjue2Od09PMks/rG3pOWVYHxcP6ANCxPfvteW
 b6DWgX8e8bfd/Zae9yTqVKWiMhSBvRKBwVPg8ronzjngp8ccyIvVY5kBrRh8zLfJ5vj0
 FMDOEtAj1bHAFDb+FMRX8yD6sY1dQeBC/UDsQm2c+9mImoPiHgb3iMmzV/95V4EjycR2
 1cDPW8Ab8ZChkx9XLKvm/RUHyX50jrKoFxrCmGSl/Dfla689MroDvmiLUCnIS9kCK3se
 V67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7bZRLDI4VA/S5SQp9rpGXYUGXP4X2IMM/BOJWINjACM=;
 b=FESjdLLvlKNJrEGgiVJDFKgVGHKZ4ZwAtBJMV7sX5Jm+4QKynupsQblKuHKnjtLCti
 afF6DMZpDjPIWkaInGBRfZA0wYXEkYGluCM3zWhmbTzOEZdf27TrSzibDeVzNCITK0Ad
 kO6AkmE0WTTcqym5dMU/ybYr2Ao+Uq+bXWejMJS6/xU+GPBOWUqIhir9wZ2h7aypEq1E
 tDJJUUgZ/STGJcYo1hmYfN/JQrNh1EQ/SHKmpeZPddEVt0CNHEqPLFOLl6v3QAVfkKWa
 KjM2286LX6KO0q8fC3W7C1Aj5e2FClYtqDzYeGxfk1pjyQwXI5jdwa/5U5oJi+ZE7b6L
 Qd6Q==
X-Gm-Message-State: AOAM5321TkHSQgcP3deFjbu2xuR6d/T+7SiYrJwzpXHTL0q5vDDhwqO6
 zJWQI64HzX9iQkx8VN2WFfFlW2XzUbn9Qg==
X-Google-Smtp-Source: ABdhPJyuDtvJLKv37ov69qa/kMd8ywh5hPTOGQI7Udmo3x0239vbkrlqOrH+Y1YiWEqwx8dQ/p38oQ==
X-Received: by 2002:a17:902:8e87:b0:148:a2e8:2c5f with SMTP id
 bg7-20020a1709028e8700b00148a2e82c5fmr4920262plb.174.1640116631674; 
 Tue, 21 Dec 2021 11:57:11 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id r10sm21597726pff.120.2021.12.21.11.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 11:57:11 -0800 (PST)
Subject: Re: [PATCH 2/3] user: move common-user includes to a subdirectory of
 {bsd,linux}-user/
From: Richard Henderson <richard.henderson@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221163300.453146-1-pbonzini@redhat.com>
 <20211221163300.453146-3-pbonzini@redhat.com>
 <654b03f1-6765-9b5c-9869-8e666f33ab89@linaro.org>
Message-ID: <46c3c4b2-7c88-4e8a-4807-6ead0b742c5e@linaro.org>
Date: Tue, 21 Dec 2021 11:57:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <654b03f1-6765-9b5c-9869-8e666f33ab89@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 11:56 AM, Richard Henderson wrote:
> On 12/21/21 8:32 AM, Paolo Bonzini wrote:
>> Avoid polluting the compilation of common-user/ with local include files;
>> making an include file available to common-user/ should be a deliberate
>> decision in order to keep a clear interface that can be used by both
>> bsd-user/ and linux-user/.
> 
> The reason that I did not do this before is that very shortly we're going to have 
> bsd-user/host/arch/host-signal.h too.
> 
> If we combine them into a top-level include like this, then we have to add host-specific 
> ifdefs.  IMO it is cleaner to leave them separate.
> 
> If you really really want to move them out of <os>-user/include/host, then the only other 
> thing I can suggest is include/host/<os>/<arch>/.

Bah. Nevermind, I now see it's not top-level.


r~


