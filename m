Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D06667FB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:41:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlaC-0007Rk-VO; Wed, 11 Jan 2023 19:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaB-0007R1-1S
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:39 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFla9-0001fE-IT
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:36:38 -0500
Received: by mail-pl1-x634.google.com with SMTP id b17so11065995pld.7
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PT8CyXGPNEkjg77kFPkUizyGOQAoIUUs/Kep0RL7xMU=;
 b=m4rZ8YwKU2NtY103tuPKWk3jqfPFkHfh6JWMY+eDKSI4QpQL82IqVOK99NPMXV4WI0
 necK07ounx9LSfSGb+ZEcL+s1LAlKht6N+WATEzm6x7jYS4up89ZqgXktJemfze4levh
 GcrnYvxLDxOm0SDKvdjcI2fj6d4PZi6VSGhNUPQcfHzVzdmXyRjMhKwt0CBW/4qiZItQ
 NxVrIxUD6vRYQCe86pVUaAfbNlmO4ZoP9mv2zulxV3qdb+fgSLQyT8Vcedcsly2tyhoP
 0/WTKfKMs2L5Mil2qP0FPMVrUWo9uI3Bb9vESMJPtUuDT9vJ/YDOtxcm5BRDFfHPcUA8
 GG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PT8CyXGPNEkjg77kFPkUizyGOQAoIUUs/Kep0RL7xMU=;
 b=ONss3ETJk7KJwMoEvw3mH4qSqsb/23xrD2aax9ZM+fNXNdoZ44cZCEIAXE86WeRja5
 FlIiWI3yU9t7kVzxOX2kNu7+8kjt27XmS6oNwV7zbIUNMdyohaRIO0/Tlqh9fgNg3gMD
 mVBpqu/tvW/gA/sBZDwuS78Wd+UTIgPzJmVzR3ej6DDHcCkGPf73nYwShfDP+9nuneCG
 EYX/Uj67Bpmx0QIBQNNkC0F2W98Nk/QxOj+jq5k2Oni5MPzYIkElL38+hhbSdnbWDVML
 j5iQTUNtOp4pNtWWfGJPyBAECkQ6j9xGyhGl8myuGeYOW5HYZy7ncz9lKzl9KnVwt+mF
 G9Lg==
X-Gm-Message-State: AFqh2ko1iIoJTLwq53VtvfVKqDgfz2+4loop3DDR4R6K1f+4+JzSd+xi
 bKw48fo1vpm/acNgMCxeInW8dQ==
X-Google-Smtp-Source: AMrXdXs2paxZi318AWcDDvkuI0jm1ClqO9GIlntFkLMNB8LoqY0yQ2CPhVXT6EIgW9hIIR7ii5DkmQ==
X-Received: by 2002:a05:6a20:2a94:b0:9d:efc0:76 with SMTP id
 v20-20020a056a202a9400b0009defc00076mr111397340pzh.30.1673483796323; 
 Wed, 11 Jan 2023 16:36:36 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j15-20020a170903028f00b00190c6518e30sm10735426plr.243.2023.01.11.16.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:35 -0800 (PST)
Message-ID: <0e28d896-7e03-64bd-6f52-bafd21f6241c@linaro.org>
Date: Wed, 11 Jan 2023 09:09:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 20/26] thread: de-const qemu_spin_destroy
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-21-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110173922.265055-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/10/23 09:39, Alex Bennée wrote:
> From: Emilio Cota<cota@braap.org>
> 
> Signed-off-by: Emilio Cota<cota@braap.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230109224954.161672-4-cota@braap.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/qemu/thread.h | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

