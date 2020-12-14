Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2C2DA2EC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:01:48 +0100 (CET)
Received: from localhost ([::1]:56212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kovud-0004XG-59
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kovss-0003xY-Ih
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:59:58 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kovsq-0002m3-RT
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:59:58 -0500
Received: by mail-wm1-x341.google.com with SMTP id k10so15136625wmi.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 13:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UY0iqVaqnsN1/bw4VH15zzzaE8l0UP9DH8vQNa2N96s=;
 b=eZrK1UtM+cqSpymZM7slpYMwWCSnO2xZvP3U/b5yxNn/TofAz4xFZWeEiWHw3r3WG5
 SgPyYPXFvYB+8Yl2F+fIkKtghqjmPNv6pb1ylXH+EsYd7BE2QtcVXm4YoYTt8aGtueLj
 mR4i/4sTpSaaQVzO0qVo/cAqgf4UAhhVWT8+5k4jIVVIPVvoHth98lkkLPuk1PMrdH0I
 +5uTOrEdrTtr0S+nCNcIJZWItjCF7eUAO25USiABslaIoIZqqVGT0oPW//CBB4BmXKtl
 5jyLKBGQJBouWoioVXScbIxoLoJKoNctxOz7btbeVcLjAqv+3dj1MTzOW+rpf4THPOzj
 0aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UY0iqVaqnsN1/bw4VH15zzzaE8l0UP9DH8vQNa2N96s=;
 b=dWwxacZNWGWK3rVdwa5Y7EvixbJML7tWePorxnKduPl+IWeaxIMxkLi4WgEK8m8H0h
 qO3omufib6UzhBTKZP3pPhTGDFN5Rwn/iu8sEyBqkrcW5wWeVHUZONQPFVNxi1rqXE//
 WjIU7GlICWt0Sv5qEQQfFigMOW66Ol3SROUNqGafhGDaUtEtp/KLdzKLwRRyngCkzTir
 FiDMuSoOUSQCy2pDvPOSi6/kaczPeNqJWSiJ+M++hoNqfB1rehy0w+qinvzPEvzbgv1A
 z+k/Cxg4Z9n//FvgDSNLoViHydg2qvK9BOEzRW0gTc6AC7uB39FmTJ0CIpkZkCb5QLtx
 gtgg==
X-Gm-Message-State: AOAM530oAFiFEIY7bpmCezjyUPZbMR53rkC301ZnOoelhyJzJwC197Kx
 ukqKHCIStMPfFc3rz4RqOfH1SUgw1tE=
X-Google-Smtp-Source: ABdhPJx0Tx1/Y95R899hG74s10uLqNx8a+E/hiU/xuO95fXNQeTSXuk1LFaecKMTOXBb19Yk5sdB5A==
X-Received: by 2002:a1c:a9cc:: with SMTP id s195mr30176926wme.97.1607983195079; 
 Mon, 14 Dec 2020 13:59:55 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n189sm32084528wmf.20.2020.12.14.13.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 13:59:54 -0800 (PST)
Subject: Re: [PATCH v4 02/43] util: Extract flush_icache_range to cacheflush.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c0d89953-ae7c-3801-5116-512eb367fe0e@amsat.org>
Date: Mon, 14 Dec 2020 22:59:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 3:02 PM, Richard Henderson wrote:
> This has been a tcg-specific function, but is also in use
> by hardware accelerators via physmem.c.  This can cause
> link errors when tcg is disabled.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/cacheflush.h | 24 +++++++++++++
>  tcg/aarch64/tcg-target.h  |  5 ---
>  tcg/arm/tcg-target.h      |  5 ---
>  tcg/i386/tcg-target.h     |  4 ---
>  tcg/mips/tcg-target.h     | 11 ------
>  tcg/ppc/tcg-target.h      |  1 -
>  tcg/riscv/tcg-target.h    |  5 ---
>  tcg/s390/tcg-target.h     |  4 ---
>  tcg/sparc/tcg-target.h    |  8 -----
>  tcg/tci/tcg-target.h      |  4 ---
>  softmmu/physmem.c         |  1 +
>  tcg/tcg.c                 |  1 +
>  util/cacheflush.c         | 71 +++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS               |  2 ++
>  tcg/ppc/tcg-target.c.inc  | 22 ------------
>  util/meson.build          |  2 +-
>  16 files changed, 100 insertions(+), 70 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

