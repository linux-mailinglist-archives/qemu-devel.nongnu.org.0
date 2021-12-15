Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B855B4760DA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:37:12 +0100 (CET)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZ9L-0006lV-S1
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:37:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxY6n-0007GX-Cm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:30:29 -0500
Received: from [2607:f8b0:4864:20::62c] (port=36405
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxY6l-0006bG-9l
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:30:28 -0500
Received: by mail-pl1-x62c.google.com with SMTP id u11so17055055plf.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/h2fCV0qfU3jC9fnurgdmh4o/iEy+FrJu6qPs+rZL7Q=;
 b=WmucdU9BuZ8Q9Zuu7iKBNlUE9WShTCGv8peqEJiGG80hoqZwprOD3oqXPkqw97zrB2
 Wkygh7RzUIcl/2Wj3ieYLwhP9MYtWGtoN99GngnSIHa30MFi+RB7433C0YcnuQuxMj2t
 mnqR4kuboUno4j7a4TPREEHX+3L4ccVmfnGf74JaJXD2fHHz19tWJfuyreE2Smr1UXKE
 0zB5rxWMth7R4ZhsyZczkYLYmfa5pk28ydVoCMAQR4TL/Y7Mso2PWDUsWsh61GTeEBbI
 xLQrMYxl6xklAjbowd7/V76JrW5txM+kW+ChJIbYNF19iw8ZvS10S7Vb8aqbC9+XhkKW
 rrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/h2fCV0qfU3jC9fnurgdmh4o/iEy+FrJu6qPs+rZL7Q=;
 b=IbHKRg8dRLA6h9HHR6D6bB/YlSIHyFc3eYofBPHEucdTx4qDsRBf7XnqjnOJJL7Ugz
 Zz4dg5NPLYDdRBeKuTkK9Ccl9aag7YeiDCkz1PCfnqcoZ9kM5ruQtBC58aKGQq+tEJn6
 aCzZrWgcFc1lNkszJGEpyzdrFDhnX0AF1p4XMe/XKuvwexAbT4Nk47PaLxbXo+o0HHCI
 Xq46YsCSQ4qCnsxU8RGij58AsABJJao5CiImNW77kzNwM7UMzACTQ14iIQygkJe+od9D
 2JJ9bDak8QQl+Eb1XMgI10LFWG/qUTyPgxA5DhWrtTNdI53YDoCkdIPepwJe7C4HkWez
 b4bA==
X-Gm-Message-State: AOAM5314UKg1VdKcOO/Jsr8Ad+d0wOkWd4KZnHV2d6mKBInXISct2BpV
 WkFwUGMkzbpxIx4qxUb1mJkPnw==
X-Google-Smtp-Source: ABdhPJyn8t1xdMpX6nHDALy6aaf+zy5Mz7ftLk5jp/z65XdoYYbiLPD9Ud0aJDXRWJHzv1HEGptwzw==
X-Received: by 2002:a17:903:1c7:b0:141:e630:130c with SMTP id
 e7-20020a17090301c700b00141e630130cmr11834751plh.80.1639589425769; 
 Wed, 15 Dec 2021 09:30:25 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id b35sm2877010pgb.83.2021.12.15.09.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:30:25 -0800 (PST)
Subject: Re: [PATCH v10 28/31] common-user: Add safe syscall handling for
 loongarch64 hosts
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211215125136.3449717-1-git@xen0n.name>
 <20211215125136.3449717-29-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6520f587-2c12-49c6-7f78-461cc2c87fb7@linaro.org>
Date: Wed, 15 Dec 2021 09:30:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215125136.3449717-29-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 4:51 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   .../host/loongarch64/safe-syscall.inc.S       | 90 +++++++++++++++++++
>   1 file changed, 90 insertions(+)
>   create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

