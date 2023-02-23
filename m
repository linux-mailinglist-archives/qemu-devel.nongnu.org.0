Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C22886A13ED
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLFw-0001Qf-95; Thu, 23 Feb 2023 18:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLFu-0001Ni-0O
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:44:06 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLFs-00014G-6o
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:44:05 -0500
Received: by mail-pf1-x42d.google.com with SMTP id a26so6924387pfo.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/2qzomI2E23QTtIWsj0Iev5E1HVuFH4hns6sqnccok4=;
 b=zo3p29n/rrF6tYAeZxvAs4douWjZh8rtao7/B/GdhNtXLj1jstrA4vxqkGiRtvTmtC
 iKFZUZIa9Ta8NicRdlqVoWdEUN/u8BQMmB5eU7hfovYcqzPpXkNPSbYELi6yY1Fxx/kn
 KoweMkVy51bl7pq4YVbZThLTwgVxEfPK4F5ZhRY36YTa8aHsbscQ8l5h/+XNB5+omsHU
 zMG5wF7Rx+IWMYaPVy0+MfMgL9aBjoIB2N0jZUDlUbHOj6z1FCWA+djDc122OgeP4w4u
 QM5ixlAfTVuHTJZYQdY5gSYQat+qXLGvJGW/AteSnKGgswgAUxXfcjsKOABh+QcF9qht
 5NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2qzomI2E23QTtIWsj0Iev5E1HVuFH4hns6sqnccok4=;
 b=HZwRVjmOYlV76lHcCTWmWHcncu+Od0Zq7H02C16TKHrRagoCgOCuV9npkEnWz5Xqg0
 IffamYCKdflwk5tgpZtwCNtv4M/21t9vk/t/FedVw4/5mCf8DXqVwETtMsz/7gs/mbPD
 IOaHvwTyndvyCE5oqUf82FQzxFytwxQagRyZeyYwwnSHGzOzkfdvxRkwTokBmv3xKpcc
 Z6G0HtOQNurvLKhZ98plct0XwCnbiwv2CZ0lBc6Jje80pY5j9uuuUJLbRciUrc31PXmM
 Z48Mpq+3aMkxWl2idK8P6oy39DktU+I9tW4ZHaoGPy4lbtnYWKZM6vd/cu7iwfSKBW05
 6TIg==
X-Gm-Message-State: AO0yUKWcKaXKah6KAGsnukq7y1RG2pkDdOlUOjT4bPHZF5yqINAguXKS
 gVEsHcRVoANjYZ1BOcseAUVaUA==
X-Google-Smtp-Source: AK7set9iVi3NRuJ5rt1V8Q4QwYlAoOEPHTZXz0K+G4LDdCiIkG4WqaOMwJkoG739+O2EN2GilFSFfQ==
X-Received: by 2002:aa7:8f1a:0:b0:5a8:a82a:bd8b with SMTP id
 x26-20020aa78f1a000000b005a8a82abd8bmr10207917pfr.20.1677195842838; 
 Thu, 23 Feb 2023 15:44:02 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 t3-20020aa79383000000b0058bb79beefcsm4811849pfe.123.2023.02.23.15.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:44:02 -0800 (PST)
Message-ID: <31b8312b-73d8-f67d-2d56-24c5652b06e7@linaro.org>
Date: Thu, 23 Feb 2023 13:43:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 5/7] dump: Introduce create_win_dump()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231755.81633-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
> Remove another TARGET_X86_64 #ifdef'ry by introducing
> a create_win_dump() stub. We'll extract it to a stub
> file for non-x86 targets in the next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   dump/dump.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

