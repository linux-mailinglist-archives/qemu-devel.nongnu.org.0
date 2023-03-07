Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EE56AE678
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaBR-0000Cm-30; Tue, 07 Mar 2023 11:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZaBP-0000Bz-7M
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:28:59 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZaBN-0000ZN-LK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:28:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id p26so8165276wmc.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678206536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9c1V4+0o5r2ERinfx7zaiYf2zkwH9gc8avwejn5G3Kk=;
 b=anPThEybW184rq3Jg27ukk99rcqOm0Nu2PR3QA5u0x31z6GtjBHtTARxT24+zWwbxY
 tEfXaOAjgIF92aKUG7QI+Hhs0nmnweRdqayQW4FWPp6p5OEJrawdNXXoa3G9wBfoqCaT
 ZEWiOXiL/DhfkLWmDdbKMJhDy5CBIJjsw9oRXV/Ej6ao7XV4gfBmCnyjHk9TCSj2+6Vm
 uYsjcgIRjpXAxOoDnvJ1zp7zzQMemQPERpRExeP2HCezKFTYc+PwrRobf5i+sK3kWMNa
 s74SPqQ4gWkjb6JBmwJvrGB5vMhvEr77liZSWZyKGAo0NsOp6ybK45SLH9u4BTR0h4iu
 yLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9c1V4+0o5r2ERinfx7zaiYf2zkwH9gc8avwejn5G3Kk=;
 b=Hv3QRrjChPlLITdNje1lLA8Aa3cczTEFwIxJ8EuXiXxRrB6ARjd96VIeRMNOC5CUwG
 eNBVUddG2vdLdeIhFcwb+GnE6BZdhA0wdBKrLP3joCpum+O6idgaDKqeqiQmgWvegkD9
 ap1yyfglKAMfbvV992R2d5Espu4CbSGpcvX+90HcQ5EYsNqvUnj6rU5W1Omtcyj6FYDY
 VW5kecEV87u1w0L+GIIRcTdvu+FB6Nw+jA9qSSq4Dzfics1RbNApdspQnO2ltKwCSt8w
 Llm0G3OWAnG7Vl/zRhfLk3tczK/VAujfBXxVK40jW+xDx9p1ig0Uypv7mhQUcs1qifDs
 IMQA==
X-Gm-Message-State: AO0yUKXzl9G9SSQtUVCnJXsIzphE0cWvx7vzDcYpuaLcMhtSHV4Zg2oL
 d8zOH5R5L04vO/h4IPNLSMy6kA==
X-Google-Smtp-Source: AK7set9sPQiI2YIl8wWYVQlDxkZoqbLAgEEdTpZzuJER7k/aNW1B3hTTeXpce8pKzH1MStk8DETCnQ==
X-Received: by 2002:a05:600c:600a:b0:3eb:29fe:f912 with SMTP id
 az10-20020a05600c600a00b003eb29fef912mr13004641wmb.36.1678206536065; 
 Tue, 07 Mar 2023 08:28:56 -0800 (PST)
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net.
 [95.127.34.131]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm13294796wrw.116.2023.03.07.08.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:28:55 -0800 (PST)
Message-ID: <513691ce-175e-32d9-3a20-4ffe4eacf737@linaro.org>
Date: Tue, 7 Mar 2023 17:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] linux-user: fix sockaddr_in6 endianness
Content-Language: en-US
To: Mathis Marion <Mathis.Marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230307154256.101528-1-Mathis.Marion@silabs.com>
 <20230307154256.101528-2-Mathis.Marion@silabs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307154256.101528-2-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 7/3/23 16:42, Mathis Marion wrote:
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> The sin6_scope_id field uses the host byte order, so there is a
> conversion to be made when host and target endianness differ.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/syscall.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



