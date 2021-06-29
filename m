Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF13B73B8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:02:57 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEKG-0001ZR-2f
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEI3-0008VD-EJ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:00:39 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEI0-00083P-NE
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:00:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id n11so7325601pjo.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CzSB9KClHWe8rbShMLbwd6rst2rm3nsnJ2r9agmhsUs=;
 b=tw6ByVwduLJ89XZ75gST3jxean8dBcQCCsa4e1DxtWNuHsG6ASQasNusR8iRaj52np
 Ribluz2NKF8D9va3ZsoTgBR9tEfoHkQKS8NqEW577ytc2ueXd4m46nrQ2uASQ1zvVUpN
 /wIwdPDphZkB/dle+ijrbp0U4GkQpmO40rZLzOB4T2U36eZQrFVzYIo7mESQ8jucR5lm
 8x4q87GLILNOZPJIdd/KvbwkGaNPkFiwW5OXuNMurBXPVXeYkxX77PzX4a14RNCEnETL
 ygxevc/iU7JXBHXC2uo7AQftSejcELxfLkUaJZDkL4w4uWbfaOgT2O2ncN5ny4e+KryB
 mGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CzSB9KClHWe8rbShMLbwd6rst2rm3nsnJ2r9agmhsUs=;
 b=RF6Otj+oY0iP723vW3b/3qQz2xkgn+AA8me1zTzihwoPXbhb6Uo8jlYrAlekWlENtT
 RXr/Bluz8hC7gXPx5pfc27LB6BfKuyOG9nTNbANlSi8+GCE/P8sRZUJyQJ2q5BbRoESg
 tYML4jVRreNFwyHvlcMxQDHbvyqW8pzwYISjQdgowRhft5CHG/Otxy4p7PqV3qC9iSOq
 mzXVZ/qYZIXByFtSdJOUmrWBo9LaRF9GPjSocEA16F3edXh/38GOGZAvw9xqpqDYHNuu
 DRyyrgH/eASDKxR3Th8lIBAvtd3JGWhnxXnBuiyHl3zgVegGuEZ6bmPPT5EsUsNIs2fK
 M8IA==
X-Gm-Message-State: AOAM532+qVDkBl3S4GNw8eMW1/HJhpJ7gpLeyinl2bMElh8rRHzU76Tv
 iLAeZwvro08vB60Um0fhqNTjocLQgI0DSw==
X-Google-Smtp-Source: ABdhPJwcj3h7g1Rr+l4BfDX9w5H/OA/zGag3EZDEibU1iQ+ZczOpiF+X22kAlCWTxY3qHyiJYuec0g==
X-Received: by 2002:a17:90b:384f:: with SMTP id
 nl15mr22741434pjb.88.1624975234687; 
 Tue, 29 Jun 2021 07:00:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j3sm18319591pfe.98.2021.06.29.07.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 07:00:34 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: Nick Hudson <hnick@vmware.com>
References: <20210629081551.14133-1-hnick@vmware.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90c71c55-4298-52c3-1ce2-0b60d52fac6d@linaro.org>
Date: Tue, 29 Jun 2021 07:00:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629081551.14133-1-hnick@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 1:15 AM, Nick Hudson wrote:
>       { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

