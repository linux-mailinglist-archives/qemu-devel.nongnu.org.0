Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD189471C56
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 19:50:19 +0100 (CET)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwTvO-000676-FS
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 13:50:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTtj-0004V2-Q5
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:48:37 -0500
Received: from [2607:f8b0:4864:20::102b] (port=41541
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTth-0006Qe-Ru
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:48:35 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso11677466pjb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 10:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=868gtSq+z5opgWOFdZHCTfBALctYxqDxSS/1rU9Jbr0=;
 b=fK/mE6UOObPuYjRNFW6X24SBHIH7jch5aotcUUJQVBqD90asjgJ3RdnAwtBoRPWs9x
 QAb1in5UG4zGoRevwQ2kScjuy61sSdSMsIZ1IVGqwVW0eKprp6P8ZYknBDsYmSwSynQe
 gwxdvZwOrheHW8DzPp0/z3572GwITVyuYrg4kS0TCluphzGcjTNbBCHJfISpJ01IHZ7b
 a8Y/W4fuxgRWe1uyHABybZdHNMVJKSxAypktoz0knWq3NYDubALigohtiI3WB6K/LleW
 5Tup5xnjrzXKrl84YzL93CgNpoAmMA3RgExWk1b9LuvZriMVpBOPi0+Egs3Vo40y9Hq8
 IuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=868gtSq+z5opgWOFdZHCTfBALctYxqDxSS/1rU9Jbr0=;
 b=WHj42Ol2jVD43j1eqfadmvhip3cRf9dKjrD0zY6j2XLIUJR6/xDZvgB4CGvQpbQ/Np
 +kYkze4f5m01veRIghQbVcxyL5RS99/tpCZWM7kMGneBHWjEOfCIWijPH5ODjjbctXxy
 8z6o+IldaNFGF2ByRGPjefe/7qgdARTraSV/5RniKH5c3RVdAveXDds1S7fu2xjNVAPK
 kSmzEIyQnmLte1wZonzP+1Me4LOuSxn9lTuJibsQxQdyHJMxLTL/W5HvRE1O+ffgkXFE
 Ti8cx6zzEuimjdXiWa5fsy8FTpuONctN35mJryg4M4qpSZgO1cf4sLoCXZzQNf/7HFwr
 FnfQ==
X-Gm-Message-State: AOAM531P92kpKNFxFqmCM8/0Gf8t5jBZfOLJJHCwzgJL5exizY6DqCpT
 MC5bubragmYZjmn3WyUAzIZWgw==
X-Google-Smtp-Source: ABdhPJzoE1zL7jEnwlROegqt02F3y7Ouj8oNBEnnAVu14QLIpOOdvSby2tfdJpG5WyZ2yqcSSj32YA==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr38664562pjb.49.1639334912216; 
 Sun, 12 Dec 2021 10:48:32 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k5sm3847551pgm.94.2021.12.12.10.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 10:48:31 -0800 (PST)
Subject: Re: [PATCH 09/26] hw/intc/arm_gicv3_its: Correct handling of MAPI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <61dceef8-42e8-22f0-fcfc-b7290d56d540@linaro.org>
Date: Sun, 12 Dec 2021 10:48:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The MAPI command takes arguments DeviceID, EventID, ICID, and is
> defined to be equivalent to MAPTI DeviceID, EventID, EventID, ICID.
> (That is, where MAPTI takes an explicit pINTID, MAPI uses the EventID
> as the pINTID.)
> 
> We didn't quite get this right.  In particular the error checks for
> MAPI include "EventID does not specify a valid LPI identifier", which
> is the same as MAPTI's error check for the pINTID field.  QEMU's code
> skips the pINTID error check entirely in the MAPI case.
> 
> We can fix this bug and in the process simplify the code by switching
> to the obvious implementation of setting pIntid = eventid early
> if ignore_pInt is true.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

