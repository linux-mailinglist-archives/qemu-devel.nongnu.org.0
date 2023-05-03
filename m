Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8C6F5542
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:50:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu979-0000z1-VF; Wed, 03 May 2023 05:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu977-0000yp-JX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:49:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu974-0005Kf-Qp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:49:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso48563475e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683107368; x=1685699368;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gnBZi0yOzaCGoVcFOTbQ83OdER+AQq5gRbm+Lb3BSDI=;
 b=U+x/8+YKIZTcK3wBvDPQZU+fM1QC6djwJvQQX31gBZ5EtTCxXlEZSlVsyfWAFFt069
 w6p9aBuOU3Xp5f8sdWzgz9q24KvGFB9hiO5KhYAxCpmfRKFxg2k826fqAbbfzKf6+V0U
 2WIhAh84jgnKjq60Qha/Ux/9pN6y0DdwAuoM71xj8GI8v/7cvrPts7bm0sQQ7dYSg7Vs
 faJjzfheRs4mc+KaS+W+i57cH8Tbfi05pzwSWTJyKL7bdhYZXXsyMZ6KH2UNK7jK+NwL
 diwhnyOL/J+NTbA5SY0QmFbNwRo6DAtWkM6jCLiE2I1crWSLOclKRtc9K8+mk5q8dch1
 /l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107368; x=1685699368;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gnBZi0yOzaCGoVcFOTbQ83OdER+AQq5gRbm+Lb3BSDI=;
 b=czr1xXGLOAjxVr8jpHHUeGIYrKfOJlbALBgNRn+K126doD2796AABTwd/Fg4p4izCn
 l6Yx2sM+9TTeRllC5wKe2e2JWH51FR/vyIqVtCLKxXzFGmefLgfPjveM/mPnkbp2qRN3
 woWGx9CFyLUWEIZ2N6wTeN8IqyJCpvUIIXhukEbc4yhC14nqJjKqfgoyNThj+9vLeYF6
 uUMCIhnYS4CWFIGGVmBH9NSggUvm/rdJebnzCa72OAnqeqvyKi6V9Cd3UbFkpohXOkd3
 U0/RgzCVgNK+Ep+l7QcN4q1R0T3NrwbH3aZdzIcwCj+p/bn4FjXhJIJwKcUJ/FsEKWg2
 F75A==
X-Gm-Message-State: AC+VfDyPbO3i1hq1f7laMJX5Cwwip8hA5F7WzxuElvCK6m4M8CiiMQWy
 KrB2JWEbPjs/ho0Zs4onM5D5GMKGqtGbEGHkAM2Klw==
X-Google-Smtp-Source: ACHHUZ51/WFMWwLUmA13ZyAP8AyM3P/o4KhfQw2XoYoi0iB3k8EDCGvrnUj4RbWLt4RJSwOMLILc/A==
X-Received: by 2002:a1c:7502:0:b0:3f2:5028:a558 with SMTP id
 o2-20020a1c7502000000b003f25028a558mr14116829wmc.0.1683107368326; 
 Wed, 03 May 2023 02:49:28 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1c7405000000b003f32c9ea20fsm1362302wmc.11.2023.05.03.02.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:49:28 -0700 (PDT)
Message-ID: <fad37f36-1057-6f86-53bc-5618f97a6bb7@linaro.org>
Date: Wed, 3 May 2023 10:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/10] *-user: remove the guest_user_syscall tracepoints
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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

On 5/3/23 10:17, Alex Bennée wrote:
> This is pure duplication now. Both bsd-user and linux-user have
> builtin strace support and we can also track syscalls via the plugins
> system.
> 
> Message-Id:<20230420150009.1675181-2-alex.bennee@linaro.org>
> Reviewed-by: Warner Losh<imp@bsdimp.com>
> Reviewed-by: Stefan Hajnoczi<stefanha@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/user/syscall-trace.h  |  4 ----
>   bsd-user/freebsd/os-syscall.c |  2 --
>   trace-events                  | 19 -------------------
>   3 files changed, 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

