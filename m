Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9443C318815
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:27:41 +0100 (CET)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9CG-0006o9-J0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8xb-00021l-Ap
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:12:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8xa-0005i8-1k
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:12:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i9so5138018wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S+IhlyjSDy4WuiECBBmlAghY1cJGyJzda4PBQPYRlj0=;
 b=ol5DSdPUSwnzGyhIvZ5hAp/vASXLTA9yT604DV2ws5odLGdzePfb9q9Q1usSCaAwjq
 j/bT0jDy4Yhlfv2xtani0bYKJ8tQmdNQOzMNSLI/a4NnIQ8FuGacjzTV/jJ2B4ewqaMU
 b/fdPe/n8DhpnDMh7tghNJGGMftyMQPrJV+aH8AP1H2f4XqNM8YJt3C4Ly91lgLYaemZ
 VtMy00843e0qLxiq/4O4RTnF38RfOyimGup9j+C8CTMpIvf6kS/6wY9L4iN3ynYZgoRZ
 8Dbf+djPjol/lf/lIWKddTdMlTKR9608orNpdnlHr8h49wDY84U4c/VuT3EI9LDnR/lw
 K9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S+IhlyjSDy4WuiECBBmlAghY1cJGyJzda4PBQPYRlj0=;
 b=fjvlfo8vt/Iz7eWptNkA9JPHpgubl2ztYVNOKWrU6CHerlYnqYaKYMu21owdnmsbzn
 ZOouGun+UYcXHbWkIKms1oypg8GfqiPHUmWbf+MsKguJ2VJsgT41tIdIqWYH1xrlW8+b
 y2wkuHLd8bH3MJMgeHxb7m6laQXYhC+8FAIiCtzGSetMxkLEnUn5EIJZ0u4zaO8yVWPv
 6ervDkAl0Pw+nK/5C2YfxBmZpkLTBW40mwI7WKFBX9ccjTPRd/HpOVV1bW0aBg6zOwN2
 CpOBooOey+jLC4UsmXVwyfHmcLtCxjgNrSHLdpJpNbxhnB1alUVkpXM2X37sRAYb3jCw
 BwwA==
X-Gm-Message-State: AOAM532teRMxVRoKdDBePU4c5WaPaJXb8vyG2WEL54mOlR67ABgQemD/
 HjPHZmLNIikXp+AamJrgaXY=
X-Google-Smtp-Source: ABdhPJzLoyoe0Jx9R3fonu1nk2kAX/Vp+dKFBXPRH/e0sqUrz4+JFvwOyE1RkjzJn3KonErZwTnshA==
X-Received: by 2002:a1c:e255:: with SMTP id z82mr4392956wmg.93.1613038348055; 
 Thu, 11 Feb 2021 02:12:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r11sm8952076wmh.9.2021.02.11.02.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:12:27 -0800 (PST)
Subject: Re: [PATCH v2 11/21] accel/tcg: Create io_recompile_replay_branch hook
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bbd01e8e-cc1b-8b85-0fef-aec4067149ff@amsat.org>
Date: Thu, 11 Feb 2021 11:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 11:10 PM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Create a hook in which to split out the mips and
> sh4 ifdefs from cpu_io_recompile.
> 
> [AJB: s/stoped/stopped/]
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210208233906.479571-3-richard.henderson@linaro.org>
> Message-Id: <20210209182749.31323-3-alex.bennee@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 10 ++++++++++
>  accel/tcg/translate-all.c     | 17 +++++++++++++----
>  2 files changed, 23 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

