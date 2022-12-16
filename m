Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D120B64F214
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:02:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Gtk-0004X9-2W; Fri, 16 Dec 2022 15:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Gti-0004Wy-FH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:01:34 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6Gtg-00029S-RG
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:01:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id n4so3385444plp.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F2OX6NniPT4BQlcC9IjwwIJcXSTsKzRVb5pgKJgabOQ=;
 b=boZWc6tFF67MwtYOK53vpzo/jZG8D7AwqDwjZWwHL+fPwAQW6tJ9NcQYFG+tkFhIjH
 6DRsnIIAtkIBHNgGjygtD99WAQi5rGLG67PitzZBN1X9rFtatxzpxLROQoY6K9MdAwzM
 JUZ+J+2Xnzdpk2ENhytjK1sI82fMlDyKajVOe0AgiTCF1bpRUskFmtPFWvlAJ4iP7XpX
 iJiZc/mtimGjXWU85kHwGz7pHMJp/tHdYRMuPq/tSNf/NsW+gyCHbOywRaCqzJVOJGmB
 LDZTYN1l0CLYQ9GLA08H+U6KKJo6MCPAdoGx/PvmCd3nUgpwUWGxasgwGlGl7gQF2rJ1
 kReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F2OX6NniPT4BQlcC9IjwwIJcXSTsKzRVb5pgKJgabOQ=;
 b=JXF2XCrPpomXjpauw7sm8lUn7/6TvEzZFvvUrVv4UR3aLXBLjzwRWjsDkDukDIb8l7
 A892vYJ5ecnzjbPbZk+u4i+BAg+qtl8/1otv8v8QQV2e6HLL1IgbCrk7OWjIriYWp3GU
 bv8o/yVY2hSJ97FYD2L1S0/4pVd4B4h7MDW8AtMhHMOPudrjjYm0NusYjNgahrOdkqTe
 7SK+hIg572NRVyB7v6qNv4yJB1luDNnG8cEEFfVTc+IOEvG4X/0gBBGYRt3lTpkGel1p
 kRYzk2JtCqwV9j6KkAMzUC/p1P0gvaubpExWVs497Ko7EsWANIC7FJCEKs15Y2hwMFsi
 wCOw==
X-Gm-Message-State: ANoB5pnbA0YPDyBvjfqRQX5vGmm/FtxS1EqxiQ2vcOHVJFzV2LME3ZPE
 u9sko4GnYtAtU5k9f1SQsMj+dQ==
X-Google-Smtp-Source: AA0mqf73QSW7JHMlWHI5pFQPE1OOShED1Sgp3JTXyVSYcGCOLau5Y+QuXmvOaVhFNhJUnEPPfgofKQ==
X-Received: by 2002:a05:6a20:8f23:b0:ad:c2f5:267c with SMTP id
 b35-20020a056a208f2300b000adc2f5267cmr27738372pzk.53.1671220890912; 
 Fri, 16 Dec 2022 12:01:30 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa79569000000b0056e8eb09d58sm1908714pfq.170.2022.12.16.12.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:01:30 -0800 (PST)
Message-ID: <b6dbb935-3b2a-ebb3-a8b6-7ad1f7ec0a74@linaro.org>
Date: Fri, 16 Dec 2022 12:01:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 06/10] includes: move tb_flush into its own header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216112206.3171578-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 03:22, Alex Bennée wrote:
> This aids subsystems (like gdbstub) that want to trigger a flush
> without pulling target specific headers.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> ---
> v2
>    - actually include the header and rename to tb-flush.h
> ---
>   include/exec/exec-all.h     |  1 -
>   include/exec/tb-flush.h     | 19 +++++++++++++++++++
>   linux-user/user-internals.h |  1 +
>   accel/stubs/tcg-stub.c      |  1 +
>   accel/tcg/tb-maint.c        |  1 +
>   accel/tcg/translate-all.c   |  1 +
>   cpu.c                       |  1 +
>   gdbstub/gdbstub.c           |  1 +
>   hw/ppc/spapr_hcall.c        |  1 +
>   plugins/core.c              |  1 +
>   plugins/loader.c            |  2 +-
>   target/alpha/sys_helper.c   |  1 +
>   target/riscv/csr.c          |  1 +
>   13 files changed, 30 insertions(+), 2 deletions(-)
>   create mode 100644 include/exec/tb-flush.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

