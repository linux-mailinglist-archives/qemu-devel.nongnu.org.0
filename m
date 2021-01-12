Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC952F2342
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:13:58 +0100 (CET)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7Jt-0001au-Tf
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7E3-000721-HB
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:07:57 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7E0-0004Zn-7C
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:07:55 -0500
Received: by mail-pg1-x532.google.com with SMTP id n7so246670pgg.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B4R9c4QGGtVFWzG5gQIOM9OZ64Swp1/U+9Tebu3m9Rg=;
 b=lj25ddbbf1k3byjAibmah1THDxMzi+F4XrQB6wgzMc2y7jT2j3vsO5ktjpL8btfMKg
 M7hfz2Fz0X98aYBwhd4/zC7Z8er2fto5Wm4bwLkmWRS1OTc/Y5WhR7DynLpBrlzWnDqH
 BJZpQKjzc4/GkTISLEPtNGQp1UyXSdrsKjYomEkgQvi9CyW9r+v+qF2El+//pQ3hzfc9
 1D48QYa6dslhcv7NwcO1zY4eKdFaCaY+oCGlZnC7HsODRY/zrjETQest4pO8tpSshEwr
 1Ps4gKqJZpogergUPRtlesJ9ex6xj3NeWNEECfqfz0u27wMKbhHtyDUbSLe9t+1ubxmK
 n2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B4R9c4QGGtVFWzG5gQIOM9OZ64Swp1/U+9Tebu3m9Rg=;
 b=QX/Kxqn+OkdlfOmVy5vh2vWbDOIiZFAW9H3uug1dIOUVITpyKNkmNehiq473Pry+RW
 LSn+/lxx7NA1fl64si+VuXwWKlIXErmnF/lKOTKlRIOCMXSvP4m5b9t8DqoywDjC/80m
 4MceIgQ0GE6qTRQNi7nj2AEjCJjTZ1r5DqPRuzjN0eimGU1qgjapKiQlS8i4+KJb8tU4
 ZPRQIPPC99ai44AR0s6TP0OjKYVCGpAyqIVfNndx0o2gCEa7isjbRUZavVQtGZyz+qhQ
 kP7IhHcqhifJuHvJMEQ0r3YiqS0HcmO35Wi06MaIT4YlIqL4zL8a9XEOhMYCTYwOuXGA
 yokA==
X-Gm-Message-State: AOAM531ttKfPcwIShi0V5E9W76cTZa1vj/LeWRnBr9LWrYLSUrBMpTkS
 3xRraDUzdIl1IEe9a8H8dIqrPf4ntCAAYA==
X-Google-Smtp-Source: ABdhPJzMuu2hE5MYH43BlTdw5laD+vz23jzLkLF9MJ+Bzq5Q3XCWusvWQe9TCSW+Qaw5bf9pMyUpog==
X-Received: by 2002:a62:e314:0:b029:19e:4cc:dc6f with SMTP id
 g20-20020a62e3140000b029019e04ccdc6fmr1785969pfh.33.1610410070704; 
 Mon, 11 Jan 2021 16:07:50 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b17sm581477pjz.44.2021.01.11.16.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:07:49 -0800 (PST)
Subject: Re: [PATCH 13/18] target/arm: generalize 2-stage page-walk condition
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-13-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7cf803a-44b7-6b92-dfb4-227c9178d932@linaro.org>
Date: Mon, 11 Jan 2021 14:07:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-13-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> The stage_1_mmu_idx() already effectively keeps track of which
> translation regimes have two stages. Don't hard-code another test.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

