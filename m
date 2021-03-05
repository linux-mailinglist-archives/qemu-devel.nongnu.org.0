Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0B732F2A3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:34:47 +0100 (CET)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFHi-00072t-IG
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIEJS-0000OL-23
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:32:30 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIEJQ-0004V1-Ii
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:32:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id e23so2145509wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IW4DfdnPg/R1pUyEN7vXJqqtRUiyRKdnBUIYu0+siKw=;
 b=tqJzjENM3uXORFyWK/vzEHtGErRv+T2u0IFFdILksbfhZ1UBAYby4ECnFhb05aTYIX
 w6e2gkyxE2CNRMBU3EvtF4z/f+LusiC2hK0Jj9kVFv3zlisIO/e3L6SP9hZ5oclO7DcE
 F9lrL9X1ElXibivqZVHxnfhmfvd7TbWhVWcZzssplydZAZKwNey29pikUmelKNFvUpXp
 z1ERKqPtQFzGzYiEl1DLIE04yZlWvNqvHFZQv+QGi+ru7nSU2xltisSv/kVwUeSMBsKM
 Y97AePuhGnVWYjL2YXZylsZHx1m1jB9FbaM2z8I+O2AVllIEGyGrLsHbFuzAfVLcU1PK
 n7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IW4DfdnPg/R1pUyEN7vXJqqtRUiyRKdnBUIYu0+siKw=;
 b=TFNFkRTZlAiMOnTNKO3qA7Btrf87q251hooKBGJxF9ATD5iMDs69uMdGENfu8JlELm
 LiQ9bXYTZgkTQakIQsJ7k48m6tpMn94jvjJfbQTNGVmxeGBsSQpxi9v4G1RFzV2HVBJu
 POH6c94kmwc1ObXd75X0JVPisEtyZjWggwqOQ6aKMA9RTSEeEoE48W+485UN54TwBlm4
 M90JsILXVjvsPO+eiNtLdGtaNFG3wLyZ6sZXTCYRXAj0/Yv7MrIn/WuTM5038b9kacmr
 3suYo0v6Z9ciE9cC/ZujKVXKLyJfEs0qm8AmaR1Nesn9zWY6o/fCKr9IZgDB2u0cnc8+
 b15Q==
X-Gm-Message-State: AOAM533L6cz9WW7pODuNad24VAOrix0m90d1GGkdjrgarycmVC61reCK
 vbcbSL0Df3aKgIqUtuM27Ho=
X-Google-Smtp-Source: ABdhPJwejS/CPGbFIgmK5J/puzvRId/OJL6mLvjBkxKrCNjqXDKEi5NvRewiZzwCTmDb9sHEbnFcug==
X-Received: by 2002:a1c:7901:: with SMTP id l1mr10107905wme.114.1614965547002; 
 Fri, 05 Mar 2021 09:32:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r26sm5248928wmn.28.2021.03.05.09.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 09:32:26 -0800 (PST)
Subject: Re: [PATCH 04/27] tcg/tci: Use exec/cpu_ldst.h interfaces
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eba80ed7-bd80-2fc2-f2aa-32fc4f9a5487@amsat.org>
Date: Fri, 5 Mar 2021 18:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302175741.1079851-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:57 PM, Richard Henderson wrote:
> Use the provided cpu_ldst.h interfaces.  This fixes the build vs
> the unconverted uses of g2h(), adds missed memory trace events,
> and correctly recognizes when a SIGSEGV belongs to the guest via
> set_helper_retaddr().
> 
> Fixes: 3e8f1628e864
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 73 +++++++++++++++++++++----------------------------------
>  1 file changed, 28 insertions(+), 45 deletions(-)

Look great to me, so I dare:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
But another review still welcomed ;)

