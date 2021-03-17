Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA233E7BE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:39:49 +0100 (CET)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMN2C-00079e-Hk
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMN14-0006Np-9e
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:38:38 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:40564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMN11-0002e1-EN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:38:38 -0400
Received: by mail-qk1-x733.google.com with SMTP id l132so37600541qke.7
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 20:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ELykj3fCVp8X1zz69UPHGjlBP84IimhTK44u1fScMYs=;
 b=k3gyfktYTyCqKbBnze40dBgqd1AkHAZuQqyydS5sQCE+il+H8yuIN9/3UutBNWCFAC
 +UQu3Q7WouFZHEai3V7BXTISOvXybisrbFk8h5O4Qo3hHm7jvkOZweyAbLtOIl9ExOLO
 imkGiDz/LY4j/X+idRL0h1lFnSItKhIvKRvplfvytBaN+qbes3LdZJ3YiNSPXkIIv0GO
 qWHZ1nuIRRkywjd/xFgWF+wmm0OoLzZ7LwUopYNn3quFIlZSzP6O7pV5MvzcY39pbHpe
 tOfVdfUvo0qEHxqUY30KRi/Rqj5Ihs5maI+hmP/WUKbXby3hC15G1Flwl7Cj4tZjoCb0
 Qr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ELykj3fCVp8X1zz69UPHGjlBP84IimhTK44u1fScMYs=;
 b=AODPm3XZZjvJdxgxqBlLMn5ZBHqmXQrDGikk56BNictjK9H8cLnq5unRD7JbP2cVPT
 KF/9LNGK5rrS4o3Awret6dzzl/psJh7uh4ipPizaKF2UAjhJbLhPLJ4VL2d2TQ2lHPUP
 RMsmVU2LZQMLq7NdtnzbnfN3ab6VTHqfQxHPGwRW0cuCdK7O5C3m64AGj8wSYvIMGNqj
 dmLux3p9a0n85djKe7nwfvbH/F9H0DeEGrRkKa0H3sLOBvLs4MB85IbshJgAcjxrBuMI
 u2sSfgvXj2nieSXyjc1S86YVRH9PwG8tnM+qpc85FPVNbVR+EBlZfd6YgWClvCTF1fE/
 kgnA==
X-Gm-Message-State: AOAM531SUXibzS/RiaCrLaSL3cXfcjnhYSWx+8j8yPSUwh7xrTPoblKR
 nlU5/TF9YPKLX8GwMftbPsxo7b8rjldGqoMc
X-Google-Smtp-Source: ABdhPJxT9pLkvpcrN6i+kZ5y43mnOWpHclOlWbQj5xmMQKeyKOJsOPzTB5qz7JtdxQ3saYomRtom+w==
X-Received: by 2002:a37:5943:: with SMTP id n64mr2576509qkb.127.1615952314365; 
 Tue, 16 Mar 2021 20:38:34 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j3sm15574104qki.84.2021.03.16.20.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 20:38:34 -0700 (PDT)
Subject: Re: [PATCH v5 05/57] tcg/tci: Split out tci_args_rrr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-6-richard.henderson@linaro.org>
 <977a40d4-b874-0fef-be5b-3e0b86cbd843@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11b59502-4f44-e90a-bede-36ac0f71a650@linaro.org>
Date: Tue, 16 Mar 2021 21:38:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <977a40d4-b874-0fef-be5b-3e0b86cbd843@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 4:53 PM, Philippe Mathieu-Daudé wrote:
> On 3/11/21 3:39 PM, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tci.c | 154 ++++++++++++++++++++----------------------------------
>>   1 file changed, 57 insertions(+), 97 deletions(-)
> 
> Out of curiosity, did you do that manually or coccinelle?

Manually.  I'm not so fast with spatch that I use it for such small things.


r~

