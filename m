Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3563E355
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:21:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VSL-0007fi-2z; Wed, 30 Nov 2022 17:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VS2-0007bW-7e
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:21:15 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VRt-0004Qj-W3
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:21:06 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so114058pjo.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qdNev2fGzYvu5o6GwdoJoRPZdxM0681B5Jh6nPiFQB4=;
 b=B4QMElWWjzQkB/26PKc5HAIOG+g/tHaUQyu/Czb5ggBK0l5Oqewi4qYF8Qiq3g8KYv
 3bRnxGyKZuh3MXGEp2rrjWciSvbAS89GaDjgYv9CZpQqq+ERh3X7MYBuUkvLp+DOKP3q
 GBTSdYQxuF4ZgsXc3cTP9EssWnA+1AbZ3ikeFYVg8WqqrmDBYEWYZ9KdIXY5HCQKQSY7
 ChnqJM/mk4KSrraBYPl3HVevrbOtuiknxliefx+PbCyplCC7kUIGzSEfQhz5AHJE+0be
 I1uQt0OCQCjAZkFh3szAS6DUPAMqDBMQpEwEvS6FyhHxAreaNX3BfRd7hotzLPE0uVJG
 mDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qdNev2fGzYvu5o6GwdoJoRPZdxM0681B5Jh6nPiFQB4=;
 b=7OKRKFycC68ZjkptpsGYeP2BMwvP9dZ5ETlrHPE0G+NzEpgJvjVFw6F8eti2rKcD3E
 pnjsImRpSCHfgN1JxF5A6gI/n2YwwewTKJ1gpmYCLUyfPYEZyuchEUe5vwjZb3W/Y6zT
 8VdoBJLDK4hGnBPsGF8f8aCWaL63lTvCIfFQHuGa9sSiKOE4svdR18xl3smOc/Y6+0m8
 1KRLh5MjykY2PAKX2Hcp04UsCN9j6WGcnE7SCxDjEVK+QbiVF9D19OAyEGZAuzxnMBd9
 rpYgdbSoKfIaWw4b9Cbu1tpQFSEorgD/+Wabgjaxe/J1dHL4QVum+PNn27JpqUUsnTt3
 gsgA==
X-Gm-Message-State: ANoB5pmvwPBfFbKQYZs2OcO1Pu6J1A92MPXqJhKUZFZ2VgBsUr6R1COd
 P1ZVjEXKbxQgTszjfMHYAUW2jVoSD+Ynqg==
X-Google-Smtp-Source: AA0mqf5XEHOa3r8qLUHbyEQRIVu28ktgbx/SDh9RdiU758IQLI+GiR246VktsEZDlhxOLJ+7KU5LCQ==
X-Received: by 2002:a17:902:6bc6:b0:186:fb90:5758 with SMTP id
 m6-20020a1709026bc600b00186fb905758mr45246939plt.115.1669846859393; 
 Wed, 30 Nov 2022 14:20:59 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 u126-20020a627984000000b00575caf80d08sm1875658pfc.31.2022.11.30.14.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:20:58 -0800 (PST)
Message-ID: <e1c724e1-4b2e-00e1-dd7c-8b51a7aa6897@linaro.org>
Date: Wed, 30 Nov 2022 14:20:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 5/5] cpu: Remove unused includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20221130135241.85060-1-philmd@linaro.org>
 <20221130135241.85060-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130135241.85060-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 05:52, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/cpu.c b/cpu.c
> index d6936a536b..d512b24c0a 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -31,10 +31,7 @@
>   #endif
>   #include "sysemu/tcg.h"
>   #include "sysemu/kvm.h"
> -#include "exec/cpu-common.h"
> -#include "exec/exec-all.h"
>   #include "exec/translate-all.h"
> -#include "hw/core/accel-cpu.h"
>   #include "trace/trace-root.h"
>   #include "qemu/accel.h"
>   

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

