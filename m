Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DC69B7F9
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 05:08:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTEUU-00043I-JH; Fri, 17 Feb 2023 23:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEUS-00042i-Ts
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 23:06:24 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEUR-0003qk-0j
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 23:06:24 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l5so1524128plk.3
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 20:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sMDE//UU3GUzbWwdbUFu3wTvWpuScNkiJjr6FYi3mj4=;
 b=G+mQCgBS8uX9FDEOS45fhqMBid7PwLAXllFrlx+RhWWZ2eNf6P8iq0eBA60slk8pEu
 rLkwiQfHBX0mz+YRwhpCIVQp1ubK4O9+n3t7FdYBN4fijaxbnZpBrE2XqlHB2EZOA3G3
 jSqxKjG0wJirGKJSqJYiPoTGfr+MAQfC2DpEbfWQ/R8Xf10Qf5jZv2pg0G7ZhLsCDC/D
 AKXDhIdmPdHgY+ggx/eCl97TczSTENrf9f+k+dR6O0vBr8lfyInNbtil+yrzbiiPGrzR
 vetLqsSwii5TzEDolvF1xmITG+EFhFKgGcIuqE+pqyYxZQKjsyp1i6+gh2xqNHfW24J3
 f8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sMDE//UU3GUzbWwdbUFu3wTvWpuScNkiJjr6FYi3mj4=;
 b=hhB7+iGu6GXm0GVAm2ryyIDeJzKsuNoo0kYRNsJNcqWNWiVch/wFejwrnL1FnboM/8
 7aM7q1GFjyGM3VPpgNwx44F465QHOhHNaNS2p4z6bP2KF4E3cTVXsiDGsXrLB2Ppq94c
 kpd5TzHxoKTTW5xJatafgt2VXl/iro0bowzXEx5qnOgpDURhqTgHi4CKOO+P4bovPu+/
 XstnGRGQDPKsFX8o5Us/bKmo7ufjIQPZPL6bVZyFn8PKrJYJmEZwI/y60carVHyjU3SF
 hof07p9arWwNuB1wVIk+/8AzPx8TALdY0DOBVW9tsGA0n+/cyE98crL4Iu7tVr9msIgk
 OY1A==
X-Gm-Message-State: AO0yUKUgK/Smc58liBdFpaMTwiS3jwNXNFcdE3dYphmZ5POjg5PMtDyQ
 znAr6vqRSIIpP/lxIo008UHDHw==
X-Google-Smtp-Source: AK7set/4qFkXywfm5vXzeee39z6n5SuYYjEm2278nm70gPueyy/1RgEosvF5m/5aBGBradECABHCmA==
X-Received: by 2002:a17:90b:388a:b0:234:116a:e172 with SMTP id
 mu10-20020a17090b388a00b00234116ae172mr2883414pjb.27.1676693181395; 
 Fri, 17 Feb 2023 20:06:21 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 fh4-20020a17090b034400b0023440af7aafsm3600893pjb.9.2023.02.17.20.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 20:06:20 -0800 (PST)
Message-ID: <cacbd830-a6e7-627c-f31c-6d4b13f64b25@linaro.org>
Date: Fri, 17 Feb 2023 18:06:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 06/29] target/arm: Wrap breakpoint/watchpoint updates
 with tcg_enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-7-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217201150.22032-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/17/23 10:11, Fabiano Rosas wrote:
> This is in preparation for restricting compilation of some parts of
> debug_helper.c to TCG only.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Dropped r-bs because I added a few more ifs in debug_helper.c
> ---
>   target/arm/cpu.c          |  6 ++++--
>   target/arm/debug_helper.c | 16 ++++++++++++----
>   target/arm/machine.c      |  7 +++++--
>   3 files changed, 21 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

