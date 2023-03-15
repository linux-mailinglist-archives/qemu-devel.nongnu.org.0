Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F346BBA5D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 18:01:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcUTT-0005ao-IW; Wed, 15 Mar 2023 12:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUTQ-0005aN-Tm
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:59:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUTP-0001mZ-Dy
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:59:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 m18-20020a05600c3b1200b003ed2a3d635eso1728614wms.4
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678899573;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4NyrEP8E8Bqqs0C3aUrE1SRsgtoAWkeUzwuFFUFExHA=;
 b=fQf6iMQN+4ZHyI70NEGpIYVEJ6lkaj2Bch8xIvzm0GAuwf6FvyGKOctOZA9tAmdQtF
 2cH+069ybB/1MI+5scMFYKRCQtoRwzTYsY94OMlJSnnf5YgcRM3Hc2m+lvYxz5O81Cuo
 W6vlaLQ2Adzfkn9fzuB/GK7PKL+J1ObiqdW7oG1uwyLeRQPM+Uj9h1Lav3ad54wkdpm5
 y6JQlEryLNsV12sw1JuiWbXIm/4zzM35pvzf5Wls11nFKmBIKwYKNz1RSmNL5Udynnhr
 qCxIk5wb+yoSwOr499KfUN1DXwSDFh/I82TF7pny4OedHwj8cDrR8YV9UM5VgxaMpBLC
 +SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678899573;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4NyrEP8E8Bqqs0C3aUrE1SRsgtoAWkeUzwuFFUFExHA=;
 b=5Pq/te8iyF2EccLFvQixDwvv8odtXPShBtVc9SvNRuZZDvPg5dEXXIOI5Tk+lbFj1n
 yNJqpgfcHJjGcE3kJ/tUJEHXQ3ShtRxUkxnRldzNXdVm5MC9frzMjRU8SqhPQNED02cZ
 vaxTk4ZPB1Gqe/aygrrPX5JZMafZbvFfWfMYEJ96bWW5kolRkTG/7TsLRU4Udi0L89jS
 /raeAYpAwRgFVt+5+Bn0denE3ijwV67hRXu7axKSaTKqYgbiwgVYgfczAcHE2I3gQggX
 uV1lQOZeJoJoV49pW6OwkvqQPDWujS73IyqJjO/+FFvYKBZtX6YlrF85A1LbSvUVv1xM
 e/Bg==
X-Gm-Message-State: AO0yUKUCJuWSaIwUAi11MQnZt0c9ZCgwinv81fv4k40+7zohba67N579
 eJ5gFIGDA6SfV27LMaJe6h/5vw==
X-Google-Smtp-Source: AK7set8lUAyl9aeTt8w73qFsUL82ujSKum8EDTMEgPIyujS3+HYF5GpSVH5JSKz2wLi7OmrvBnvCMw==
X-Received: by 2002:a05:600c:b8c:b0:3ed:2f1a:883c with SMTP id
 fl12-20020a05600c0b8c00b003ed2f1a883cmr6062550wmb.14.1678899573187; 
 Wed, 15 Mar 2023 09:59:33 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003ed2eb5c2dcsm2630372wmq.43.2023.03.15.09.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 09:59:32 -0700 (PDT)
Message-ID: <d680ac3e-fd83-09e0-351f-08ad5f73802c@linaro.org>
Date: Wed, 15 Mar 2023 17:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 18/30] tcg/aarch64: Detect have_lse, have_lse2 for
 darwin
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216025739.1211680-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/2/23 03:57, Richard Henderson wrote:
> These features are present for Apple M1.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

