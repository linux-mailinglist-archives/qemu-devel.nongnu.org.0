Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220C339EE7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 16:22:31 +0100 (CET)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL662-0000VF-0B
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 10:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL659-0008Vw-DB
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 10:21:35 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL657-0008Rb-Q5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 10:21:35 -0500
Received: by mail-qt1-x835.google.com with SMTP id c6so6169542qtc.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2BC34bxSnSz0LAUSYoEmlmJ9tb/PQAXZsQoHALMxcgI=;
 b=s9neSGpovHdoYCNMhxrSzTb2VOhvvYZm/gCrnyVZ6Mvrs+9gBFIeFTt+f1Th+aGBeQ
 BmPibuyG9Umli8Zeo74iGF8qAfLyCKR2gqKSVtl8wZ5Zr8mJHlzHsm1JWQW3ZxYw5TjS
 s+xZpZYj88gFH8fDZk9XIpyRcYY34PwLZpslwoWi8YXRAEge4qdFF7NYfaYBqd8pvg1K
 jRrVgZW5HxkI91xO+k2DS4FWFtEcKDcLw3EZpalkzWzIQbdPuOsB+WCq1UfftfnUf2yd
 KBpyZh5uSurcIjE5fqsL7G/a/UXHaPxaC5SWyB8sq5CcGqRfMablIpuNtAx9eUyQJq7P
 T03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2BC34bxSnSz0LAUSYoEmlmJ9tb/PQAXZsQoHALMxcgI=;
 b=M6AtyLXB+4dumySa5+sL+pMkG+6+twEUqaMRTQFrAQ47Jo8aVdyU20ZvMarFXNLjKQ
 vALgLrRJrK21kS9fY35jlnCcwgKxIwcWbZem0VGrU8w9R8zRHh8aLjQSCQdU6QSgeGAQ
 jNfW2My3XdMcG1F/q380kmKY2Lu36UQT9HZj7QGc/vDrIUwSA9gp4aI2qdDpfBmbM1eN
 Wy/E66jthz5fW5pKy9J/sZzejvU7+45VUuK3mTX4CX/uQzIpUBegzzm0EHNKUu0oTPqv
 9Fdg/one14yv8u6XEe9fxzRJQigOImBoN0V5kBKZn/5zphCDvUX2NDCpoT4Qt2wPeaaS
 r2Cg==
X-Gm-Message-State: AOAM533rcvE5tIzJRNUh9oYZ/Dm4BWDugmjcXyNFkyL2dUMUyENBtCvu
 oVXN45ndUNH7VKJ3/Krx5oWRXA==
X-Google-Smtp-Source: ABdhPJzUhn6Y2NhCxjwQX5abKbnCIFC8DAwukod+HwMUWc9AiZdsZwfRyGfIyAbm5/M+I42wefTv0Q==
X-Received: by 2002:ac8:6f02:: with SMTP id g2mr16265741qtv.385.1615648892653; 
 Sat, 13 Mar 2021 07:21:32 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y1sm6659858qkf.55.2021.03.13.07.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 07:21:32 -0800 (PST)
Subject: Re: [RFC PATCH v2 21/22] target/mips/tx79: Move RDHWR usermode kludge
 to trans_SQ()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70fdf385-388b-d415-fdd6-ab985d484a3e@linaro.org>
Date: Sat, 13 Mar 2021 09:21:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> Now than SQ is properly implemented, we can move the RDHWR
> kludge required to have usermode working with recent glibc.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2: { RDHWR_user } (rth)
> ---
>   target/mips/tx79.decode      |  5 +++-
>   target/mips/translate.c      | 56 ------------------------------------
>   target/mips/tx79_translate.c | 31 ++++++++++++++++++++
>   3 files changed, 35 insertions(+), 57 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


