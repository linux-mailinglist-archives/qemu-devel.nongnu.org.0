Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738476743E4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIc4x-0000tV-Qe; Thu, 19 Jan 2023 16:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc4v-0000tM-P0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:04:09 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc4p-0003z1-A3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:04:09 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 s13-20020a17090a6e4d00b0022900843652so7102031pjm.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YwV7oE72l+Z9Y9PoqXsAwjb7UIYiNaa23IqfiDQG0is=;
 b=DboooxiLtXIC4AW5yjYEU46intdWZw2IKEvl98v1/nzAgfArCN+iV5eRfIVQqeOTmT
 1Nz+3qEsewVo3kkSzWP/WVQi2yXu8OwDhRQ+76RcM4VESV+dPF20FLb6VMXmQoVFxlvO
 3qqrvsVPG2hDLuOA5pzF9PbBMqfhhS1Ux+Q8O633Q5IlS2nFz/T1SoygnZ5whL9NhAyn
 cXy/MunZloDVwORkgwIoOCNpRbqZ5f3zctohwhW1C9Bp2UL6+wWY+ZaUvlFjK3hlvcVw
 7N8swmV92/l8rAgky9SVHwpSL9r5rBZPjyWlQ1hPee1dCQYo+pdYbLKdTyjYLmsh5bMe
 OaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YwV7oE72l+Z9Y9PoqXsAwjb7UIYiNaa23IqfiDQG0is=;
 b=igvaMO5GIfBSOXaKrAfHAkd0EQ0BMTNCwFFfljOS3Dvk1JyGlOp82QGUqPSf1iy06Y
 75VeYC8c/32AYPS7ZgxPUXcCEtELgOrbgOBjc5Y92GOcpE0mAYDJ3xs/k2sQG7F0MaBs
 bgGDbvq+kznJCFCoTooT+KJNQFe0QXrygAzg5NX3n5Or88cpSUPpSDCeuEQuoK4Eu6Qa
 PAEywa45aSTmphPZGJr+tBF3DMiXh93zHx3+ksZC8FrkajgjN/W5HXRu57A9hoVrAy0U
 nWunP6PJm0dUr2NRKE1UV7ZC8JgcJcx2UDEKVmNNvhPM8+7w0Cefc2Dvd7e11h0EPDjs
 9yQA==
X-Gm-Message-State: AFqh2kr8bBxbS4noKGbUp+R8OeQ5iUK8rJeFGH6jzq3UmjqQ3/vA6sZo
 J9JVweJKBGt6mYGKuDrkvvQ19chGUiyZ+lss
X-Google-Smtp-Source: AMrXdXt/wTv5LZW17QhW6smskeFjsTt/nRQx8wUyS68PAintaRzWgqNQ+/W5Ua23QAtAqNtYk74fFA==
X-Received: by 2002:a17:90b:3553:b0:219:22da:1fee with SMTP id
 lt19-20020a17090b355300b0021922da1feemr12986771pjb.38.1674162242046; 
 Thu, 19 Jan 2023 13:04:02 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c32-20020a17090a492300b002265ddfc13esm79210pjh.29.2023.01.19.13.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:04:01 -0800 (PST)
Message-ID: <2090f9d9-5769-fdb9-1f6c-34fd88d5eec2@linaro.org>
Date: Thu, 19 Jan 2023 11:03:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

