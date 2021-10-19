Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB81433C7F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:38:28 +0200 (CEST)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcs8B-0003XU-HI
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrWJ-0004bT-Hd
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:59:19 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:50927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcrWG-0006Es-8Y
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:59:17 -0400
Received: by mail-pj1-x1031.google.com with SMTP id gn3so330716pjb.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i7g83swMwlIJcybpWzjAyRgdWCoQveIDtfcJ3IkaO5c=;
 b=Ub3psTfzgWhh4P4gqzfSwuB/1P5CclX53TMNff7fU/iIi+x9+iwQteN9m5ploWU3hK
 v3trALF0fkQypRoH69RSNl8JQExyY9FVFPZX6krIqA8HEJKoDzp3knwtDl0300jNWDDS
 9abGyhs7VMoT3Rt0Aa03lH++Ng0eTwyGediDGkmun1akynvMmpKR+rsfo+8b6LiO5exI
 umGMkTxs3cNl+ANuDQ5Plb1J1xm8uX5tlQw3Y9C5YDpgnn4yuMQx8Pj0+aRJC2IXpwcu
 mtQsELNdJDMGPPNWVA+OvLwa3Crsmx5TjOaHvkN+zg24kVunYAg9NUd7y1QPZzsFgUZv
 jRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i7g83swMwlIJcybpWzjAyRgdWCoQveIDtfcJ3IkaO5c=;
 b=feWhr5SNcXlxNF/Tai36Lnv7Nmogg9n94Q5hxgh7GYn+7vzWUJIhcX+0ONOHa2/5sA
 ssPePZ1xYJr176FTQTAxrHO/LLfrGQpWRStBhqIy0NVzPXwn5PeoWN1VS3/UmKnlJsfd
 fhRowGO5k61G4nz2cgP9sV3mCb1gP7FE/S1pOSS5yvCnfHA+p7tM5mYkibkqRLQZRNyy
 htnVb4G9yufRqZ5EPn6FURlv81GxxE8bko50MeyXJrA9dsfQRLI3RpkHTvVsMdq9w4xm
 xPOy44YKc47w22641crS7Igv8MN8o7Wob8/yU0emlus6Rz9tb38gwd1ZbIiGUj3EOoUo
 iTZw==
X-Gm-Message-State: AOAM532lhQvbK5Z0WOQ3B6eF4K7ByhdJCsAvN+yE6bs1+/or7Mbvmsbm
 8cNfLR+txuH/IsXcWDL27qKxiLq31HsB9w==
X-Google-Smtp-Source: ABdhPJyeEJtpaRWnRHU+jtfbMmbtnlM5fOuZYJhBGP3QhRb614cHOqFwFmS9XhhyrloLEXT8ZeZROQ==
X-Received: by 2002:a17:902:db0a:b0:13e:e968:e144 with SMTP id
 m10-20020a170902db0a00b0013ee968e144mr34081341plx.43.1634659154488; 
 Tue, 19 Oct 2021 08:59:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g25sm7964749pge.12.2021.10.19.08.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 08:59:14 -0700 (PDT)
Subject: Re: [PATCH v2 05/48] tcg/optimize: Move prev_mb into OptContext
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-6-richard.henderson@linaro.org>
 <87a6j5xblh.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14382149-648e-7b95-efec-a63178904a82@linaro.org>
Date: Tue, 19 Oct 2021 08:59:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87a6j5xblh.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 8:44 AM, Alex Bennée wrote:
>> @@ -609,7 +610,7 @@ static bool swap_commutative2(TCGArg *p1, TCGArg *p2)
>>   void tcg_optimize(TCGContext *s)
>>   {
>>       int nb_temps, nb_globals, i;
>> -    TCGOp *op, *op_next, *prev_mb = NULL;
>> +    TCGOp *op, *op_next;
>>       OptContext ctx = { .tcg = s };
> 
> Do we need to add .prev_mb = NULL to ensure the ctx doesn't start
> corrupted or does the partial initialisation ensure the rest is zeroed
> out?

All members not explicitly initialized are zeroed.

> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

r~

