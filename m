Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138665F654
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYGI-000111-IS; Thu, 05 Jan 2023 16:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYGG-00010a-Dy
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:58:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYGE-00037k-QM
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:58:56 -0500
Received: by mail-wm1-x334.google.com with SMTP id g10so15230282wmo.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=419+ibOkyY2isjwTDRB6f2lFKoms2erYnrvhlOjCY0w=;
 b=ZB7SX14qUL6MOzWV2whkLMFVmRoq889bwvCUuJvy5ZnjZg6LAye+uaPRGG9NF/OIoO
 PEQJJ6qcrlWtSzAFJ9gZfXRRExZDZHRtlOJCdyQ5jK2UL2ciRAFHqcSi7+G6lKASAbbJ
 jSvFvjK5LJ07ac4gBf6ihvau6k8C8O6iMsjnZutEbmLwZAbtx0lto30cB/03SixhArkZ
 /pPzuLVYd5Yxj/NBl/07rBdlDYheSwyYCsjK3TYFs8PX1JKJ+M5V2ZfnPhtwR+PlgGD/
 0Sb2Q5dzkGtRkAmrxvP5PTvPmaiZOyjiN5E5ZugfrESMQP8h/qBPGnlstOWs91v5TA24
 rjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=419+ibOkyY2isjwTDRB6f2lFKoms2erYnrvhlOjCY0w=;
 b=OdDo92nNI7X5BuehLSzE25lEqMSitJSnnGsKsFbb9wFdqwIJ6vREk2bluhtsryhOLU
 17ACgQJUfh4Fq2VOEG+uP2rbGVVRkiJdvgaX+8yCDqWRxh6zoI1DcBFcxLpF0IvQBgyg
 Djq3E5hEIRvJ++mDf9vJovxp2MOVr4/xBLulOjE17fcVR8hhvCVKq7gxvWK0557zSoOG
 VS6vdAb6bZm6TqH7Lxi3EX3mwpGzMmQK5joQ+PQ8K2gPuy7hDLHBWK9wkAo3va+Clb1n
 4Udrndmxdi+NkVSEXHapRiCCdQnRzaK98yRtt3oj2h5Pqn3cYjFpfWZ7jD9NFFAw1pF+
 0ATw==
X-Gm-Message-State: AFqh2kp9ZKSAE7lUX0FRpMATsrBHqbvfU1ai4NG/Itl9G64rIGWRKUTK
 UJPDzK2ZnRe6We2nfLk2BCpowQ==
X-Google-Smtp-Source: AMrXdXvzvLsq/tD+cocnlaI2f6wwrGg9dojdTzoZiXFRle60psKq+/o2UjsiHVM93ihsLk5XMQCxNA==
X-Received: by 2002:a05:600c:4e04:b0:3d2:381f:2db5 with SMTP id
 b4-20020a05600c4e0400b003d2381f2db5mr36673060wmq.22.1672955933079; 
 Thu, 05 Jan 2023 13:58:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003d23928b654sm4262242wms.11.2023.01.05.13.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:58:52 -0800 (PST)
Message-ID: <9a989779-025a-6f06-5c47-e12a2f56510c@linaro.org>
Date: Thu, 5 Jan 2023 22:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 07/40] target/arm: Create TYPE_ARM_V7M_CPU
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/1/23 19:16, Richard Henderson wrote:
> Create a new intermediate abstract class for v7m, like we do for
> aarch64. The initialization of ARMCPUClass.info follows the
> concrete class, so remove that init from arm_v7m_class_init.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-qom.h |  6 ++++++
>   target/arm/cpu_tcg.c | 36 ++++++++++++++++++++++--------------
>   2 files changed, 28 insertions(+), 14 deletions(-)

Nice again.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


