Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335F300E77
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:05:42 +0100 (CET)
Received: from localhost ([::1]:56832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l33cj-0006NJ-Fr
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33Rv-0006lQ-LG
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:54:31 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l33Rq-0006Hx-EE
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:54:30 -0500
Received: by mail-pl1-x62b.google.com with SMTP id b8so3958329plh.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jslLqjwSeG9yXmnEKw3kCvPXWrGgsb5zZoMIW4qpHb8=;
 b=J+0o/VZKlEGmI4XoshBT1Si9dLTOt47aqbCiwrLC48zagUgDGXEM1PICf5DIF6zfJ1
 mZLy/2howe7S18jYn7B6CaJM8VIrNpYh8EGdmtS3cAkHQ0zQ4vMpTGSCw6bLjm2eg2WQ
 FS+K5citBOOMtWd0NFMoJpLwr+jGBDM9XYViR9sSB5a/uvdtKgQQwqQskvHdqguwmQMH
 GBpWBkwI1vLQpFUsO3kX4mF+7z42LixvyP/34naJJAhEvPJXXpJn4+rEgOAeFRGTBiqg
 zn7PZY7oe+ZNoZIIC3WWWxdCUqK3XVJvm0bh/+GtzmpErkwFfWAJce+Nys+OQgBHW8vn
 mx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jslLqjwSeG9yXmnEKw3kCvPXWrGgsb5zZoMIW4qpHb8=;
 b=B2Jr8CrvMj+3FeYgUW0S6QiKdFNojLP6+1eHyYMuX8IN3FsOZimi5TE0jvnYh2WnSD
 3AeQ04yCsPhKoIJyn2BPKTQmksxY/lBh69u3pfznfUFpsPcJzlcHJs4goB1QKzAOEo/m
 CsY1MD8jqNcZBdnTPXTtLhGE+6DaXW1n9F8EV+MSqRHjfoB4xPY22KpOqsJTlr7miy2n
 tudRh5OVRabA3uq3+kxtu4npTGXNmXUckLh8Rnkb9i36apqLZiBI1E4Dn6ev40N3qVlr
 U9AlBTc/3yhMGprjG2vtRapiKncnVQHShoRlI6Jq7RGaNNjyMcP8kUIG5VzzrjW6gM2v
 HHeQ==
X-Gm-Message-State: AOAM533Db1bvCFtzosSbAIrSeYYav5wdeQgrLXGEft8vFAuXlFjYPL4v
 z1vNFZZrqd3eB+6+aw+lplF+6g==
X-Google-Smtp-Source: ABdhPJyMcSbvknE8Q7wkJwOpY30HCqPcYcO4vHKJNYIuJ2vJzMUoqYuS49tFE/fA0EHP6qiAqokRWw==
X-Received: by 2002:a17:90a:cb90:: with SMTP id
 a16mr1950370pju.89.1611348862193; 
 Fri, 22 Jan 2021 12:54:22 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id y16sm8998187pgg.20.2021.01.22.12.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:54:21 -0800 (PST)
Subject: Re: [PATCH v1 2/3] target/microblaze: use MMUAccessType instead of
 int in mmu_translate
To: Joe Komlodi <joe.komlodi@xilinx.com>, qemu-devel@nongnu.org
References: <1611274735-303873-1-git-send-email-komlodi@xilinx.com>
 <1611274735-303873-3-git-send-email-komlodi@xilinx.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4dd78c7a-2ac9-94bf-eea1-3f945966584d@linaro.org>
Date: Fri, 22 Jan 2021 10:54:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611274735-303873-3-git-send-email-komlodi@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.221,
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
Cc: edgari@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 2:18 PM, Joe Komlodi wrote:
> Using MMUAccessType makes it more clear what the variable's use is.
> No functional change.
> 
> Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
> ---
>  target/microblaze/mmu.c | 2 +-
>  target/microblaze/mmu.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

