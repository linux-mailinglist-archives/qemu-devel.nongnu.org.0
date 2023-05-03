Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6431C6F5640
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:32:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9m7-0002kD-Al; Wed, 03 May 2023 06:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9m4-0002Xu-1d
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:31:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9m2-0006vd-5m
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:31:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so9237195e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109908; x=1685701908;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hvvkjFhvdbBTIrX82v+MDPirK8Awyu6KOcbhXG9kek8=;
 b=ZnlFHTKKo31Ir+f/nxnBMgto4COYLeD8weTwTpGUjSgivIOHO/RGuOD9drmpD71y/Y
 8tKvtKp8k1dzdL73RoHS7IFPdKdWwqTyhlh7DC0Taf3EI3UprM4/vN17y3xGoebq0tWt
 GeSFvr2KuDUHSXkgKp4N3kiKRwaAuQnJ1F5YoI4kWQZmKbyRQPpHQb8l/Gn8HhO8guXh
 Hy0UyG4/FIP01aUJLQZdzXjFxWLnidB8QdizS95TD/EJdk+r7ssQqNyWo4YgqDYTYIZs
 IrKZBX667QCF5Y9NuEF/IJepfYa0XecJ+RFq40dp9Hb5rlUOjNRN+ixnPlqUZ6q4jRUT
 wCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109908; x=1685701908;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvvkjFhvdbBTIrX82v+MDPirK8Awyu6KOcbhXG9kek8=;
 b=Mzc1092xfAJAQkhNkDphhV2J2aWcA3QHQtQBZBhgHrGdZ9sVitMPxW1xz5GnLK/Bdt
 B3HtwEd4KbhC2WSPB7F+OMQGPpsR09uR4NeEsOea+7qo7gNkqbKzG0T4l+PukfKi8RPF
 YAjMbDBvMGhoufqOxZjBehEFrzKZd6vzpPv1bcx7rjMgdi+YhRJuFvaEGIvEGDMNFbPI
 p9yI9xi+vqsYHjHDDuWKel6CgAWV4PSbGoVI8vcMcnJUuykCEQ9+gwoJ6RWEuWIJp3Yi
 zT2TXxV3Nkl4pmcBmWa0l/Q2EXqiprsIcRaG4iTlwl1ccC8AuJfR6Qarppwq58tkNl82
 sImA==
X-Gm-Message-State: AC+VfDzLVn0uJau6S21+EsAjE6xzkZrOVT0+npx41bwKkx6BNjoA8hWF
 0nslckyJqc6fd/oTWP4CpdvSlAgz5I1U8bvd+9InvQ==
X-Google-Smtp-Source: ACHHUZ6Pyexx04+23eJmwsOLU5HDPBk0iMDh7ksiuUqnw5rcXMxqRtUFWZhd8COvPH6ByI8Q0E5aIw==
X-Received: by 2002:a1c:7502:0:b0:3f2:5028:a558 with SMTP id
 o2-20020a1c7502000000b003f25028a558mr14225203wmc.0.1683109908608; 
 Wed, 03 May 2023 03:31:48 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b003f198dfbbfcsm1472900wmi.19.2023.05.03.03.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:31:48 -0700 (PDT)
Message-ID: <af03d68d-e175-1b22-319b-c4f357e69f0c@linaro.org>
Date: Wed, 3 May 2023 11:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 21/22] tests/avocado: use http for mipsdistros.mips.com
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:12, Alex Bennée wrote:
> As the cached assets have fallen out of our cache new attempts to
> fetch these binaries fail hard due to certificate expirty. It's hard
> to find a contact email for the domain as the root page of mipsdistros
> throws up some random XML. I suspect Amazon are merely the hosts.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/avocado/replay_kernel.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Might also mention that our saved hash prevents mucking about with non-secure download.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

