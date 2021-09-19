Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DD410C5A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 18:33:54 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRzlJ-00014Y-GL
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 12:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRzjo-0007zJ-TO
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 12:32:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRzjn-0007aZ-DP
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 12:32:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 5so9463907plo.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VyugTWabctRMZ2vsiFbFmgENwJB32PozHOFkVgUiM/I=;
 b=M6i0cCSPoiVCrrGBIWpebuaymFDqgQgtohB0u/wY67odpkoZVqNRnFDof4spQ90EM/
 hSd25eG5oUhEBNVWpL6nlQeLdLGPP7RmV6iLboQiPzxvEbvqkllwM2Etsd5o96lggoSo
 ZzLbI3CmLFQZfIc+We5I9A0NCFfgdVESF5lGcJCj681OLK3EA5WvDHB+L4Uozx/caHX/
 tsWS/rDIQZZTb/KId2BKOgwCdFLknb4YyU2rSDE6Q9n+WAirc+RmVrGxa2Zg6j+EiA+o
 Wlxd5tN++7tmaq4f+vPwwyv3gXYKRlRatPlATfocafxTpZivmCnDebDCDaBjVfwr7xk/
 fBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VyugTWabctRMZ2vsiFbFmgENwJB32PozHOFkVgUiM/I=;
 b=tQ2lNjNN9YxJeWAIUTcVnv9AAYqBjw2xbW+aJkvLG7O34qsAPcXEZGTnfbKz0NLvIW
 hzsph3fbERGjhAqmrabEtcp/cIlkuFpu2TZA3kheZ/9Ogf589nsxM+XL/4QpUemSRe1x
 CnIk/WXJ28LYR+sYjWEYuvKMsACR+HO9wCMcoWoMx8O9Fn6hUKuVDq+XTx3rifRwg4rg
 +Il/BnyNPzKWB5OUzuM8ZXXxsnzk+7RZxPreLqk9//ORy5M285rsjBtYVYm1RVw/eUrD
 q3hYY6FIbNhfpGCqSV58e1t+NXbHIbez/Qt+VnkkORVQ0IZ1ia47EbPeTHuuRjEUG63x
 X6Qg==
X-Gm-Message-State: AOAM533xPDw2UezoO+dXkc9XDblRv2VLLPtmgYzBIAy7BqhDF9XSxJjS
 6D+MTBtG3TxP2Ix5aDCDMxuNDQ==
X-Google-Smtp-Source: ABdhPJzMWzCto7wASHLsP/RzW5I4BrjGqH5zGTHg6t5rojCcragtm9egsR1B0wSLQw42IpyExc/rMQ==
X-Received: by 2002:a17:90b:2344:: with SMTP id
 ms4mr33469770pjb.3.1632069137607; 
 Sun, 19 Sep 2021 09:32:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t6sm15805007pjr.36.2021.09.19.09.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 09:32:17 -0700 (PDT)
Subject: Re: [PATCH RESEND v2] target/riscv: Set mstatus_hs.[SD|FS] bits if
 Clean and V=1 in mark_fs_dirty()
To: Frank Chang <frank.chang@sifive.com>
References: <20210917093153.4067812-1-frank.chang@sifive.com>
 <93e9a615-94fb-3958-9560-111910668768@linaro.org>
 <CAE_xrPh+CzNK-nnsO6NSk+FKowXW2Tbva9abhpgAD13xfPak4A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b642e26-aff5-912e-721b-1d808f0f6eea@linaro.org>
Date: Sun, 19 Sep 2021 09:32:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPh+CzNK-nnsO6NSk+FKowXW2Tbva9abhpgAD13xfPak4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 7:54 PM, Frank Chang wrote:
> Do you mean it's better to change to code sequence to something like:
> 
> static void mark_fs_dirty(DisasContext *ctx)
> {
>      .....
> 
>      if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
>          /* Remember the stage change for the rest of the TB. */
>          ctx->mstatus_hs_fs = MSTATUS_FS;
>          .....
>      }
> 
>      if (ctx->mstatus_fs != MSTATUS_FS) {
>           /* Remember the state change for the rest of the TB.  */
>          ctx->mstatus_fs = MSTATUS_FS;
>          .....
>       }
> }
> 
> If so, I can update and send out the v3 patch.

Yes, something like that.

r~

