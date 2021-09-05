Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC322400F05
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:16:43 +0200 (CEST)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMpCc-0006H4-Vr
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpA1-0004qh-76
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:14:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp9y-0004Pk-9J
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:14:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id i6so5206368wrv.2
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hwfopsmdUa57RjfoUIPx42Hz6rN3n6Grgn4cUy7ySzA=;
 b=PnbRMCldCVlztokoAZx2jmrL1d0DrD3EupJQtK2BwBFvoMSoo9tYcvcV5O3RMRHgJK
 QKgcUUoVSjt1c4+DzNkY4QxE58I+bHncMrZ2l/OBzOVPfmJ8JCPOw6YjjqzFlHvRO45w
 UQkqSYq3EPxIWvn5g3zN3CFmOmppUj4TdKdL9Vn8v7+qW0u6C+7ZV3TXUcy9hLGRdPvT
 wD8lJs6zDcy7DVU8xNReXDNaUI6bIqT1WjUaOYMXe3qdvpX3/jLzTRGba2QLOe9OUsMz
 gX2YMQhC62+HKBLB+DQDI/eLkgr/n6wxaQso7bH9NKirW8p83ZDdehtNHQ3UcpDkuqT/
 eMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hwfopsmdUa57RjfoUIPx42Hz6rN3n6Grgn4cUy7ySzA=;
 b=CVfsjC64Yox++/Pj05UHybabtpKQYzgHGRqQqiY7qzCbmTo5RHoOazIfAoxrE/3Kg/
 7YIEKA9ykSjHWlt7s4FzXSmH2YWra/pL3xUOSFGSPiL9c67HNTFL3xIL20F3JsZErvPR
 SB7jnl4AisJDWDTlChMr3W8bYgdA7/cjVuzev0E4naze2YsmywGKy7kszlKXay2QBCWf
 1NkKuAPvOmxRENNfqBKF4YxT8GHo57Zak6LaVs7avFkPr21cRRnYsqsAgK/gUy6I5aaN
 gbWraZAzspGo2aZuMd87v8aPefVT0HpU9br6L18FtFmlLJQGV1he3/ll+cgpB8Q5qegc
 Wrhg==
X-Gm-Message-State: AOAM532l7cSVIxzGxjjXkOC1nTUDUPNZxhGhWBcn+mhxdi3WPTX7AIw/
 lBdSTzSliPKR05P1thdwMC5d0w==
X-Google-Smtp-Source: ABdhPJyEVdubv+UM3qIs8werFc+1K7SFnFwX1wqOB+wbak6Yp3w2Pw7RkVa5MDlgE4BkdeoJCfO+cg==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr7508097wrv.205.1630836834427; 
 Sun, 05 Sep 2021 03:13:54 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id s14sm4066469wmc.25.2021.09.05.03.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:13:54 -0700 (PDT)
Subject: Re: [PATCH v3 20/43] bsd-user: Move per-cpu code into
 target_arch_cpu.h
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-21-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0771e914-1793-2bed-3a74-66d502b93026@linaro.org>
Date: Sun, 5 Sep 2021 12:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902234729.76141-21-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:47 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Move cpu_loop() into target_cpu_loop(), and put that in
> target_arch_cpu.h for each architecture.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_cpu.c   |   1 +
>   bsd-user/i386/target_arch_cpu.h   | 209 ++++++++++++++++++++
>   bsd-user/main.c                   | 317 ++----------------------------
>   bsd-user/qemu.h                   |   1 +
>   bsd-user/x86_64/target_arch_cpu.c |   1 +
>   bsd-user/x86_64/target_arch_cpu.h | 247 +++++++++++++++++++++++
>   6 files changed, 473 insertions(+), 303 deletions(-)
>   create mode 100644 bsd-user/i386/target_arch_cpu.h
>   create mode 100644 bsd-user/x86_64/target_arch_cpu.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

