Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1EA615C06
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 06:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq6hK-0007mF-3V; Wed, 02 Nov 2022 01:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6h6-0007k4-9K
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:53:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oq6h2-0008Fl-OE
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 01:53:43 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so1158816pji.1
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 22:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3C+FY8KEkMU+6svcJfEN0domSmItLfrSsQpWTQkAzkI=;
 b=meSEhm38fyngnBsqj36dRtLSWeu9QLJ/M38BtTNk6aqts+w8rDHt88S1BTG+a9XvrJ
 pUhFjlQkIN0987TmK8Vg53S47lvhApoy6gxMSd3ZGphhr6wgS+nwP/DYfLW9RrjFQ0v/
 jjbUBk3mpKGK0+Qe6wBwtikFNarvnkLeej41mALorh1JbsUUYKbGJNgmEAEt7gQrJMSo
 UqWzodGvyk+GwLHYyj2hqAde8k5xnKYLt0GDEQ2KcGEz9btmK5Tm8YM8ARB4pbBjfxn2
 /nT2zBNS4A7YdpefS3Ba1q2c4phUBiohDM7lAedofSBuWeXpo/p0ASaihZO7F6+ae8CA
 Ljng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3C+FY8KEkMU+6svcJfEN0domSmItLfrSsQpWTQkAzkI=;
 b=TuOTxBdiH4Y9DuhbvXoBpmjW22tLTKW/vPO3+2H9L/9tkoyVHavVGbEPKaFQlo+XhX
 dcD1FKA2EMMmOO9A5FXrPqw3XCT/36ed+3cQlTxrBgRALOib0EC353AiPj6JFg5eceBo
 OFkuR5dE5m6BBCR2q+rrMl23maudDD75UTSy/3Lm5LuwNjrPWg/wyA+42DDH6d679Vql
 oZinGTzH1w9srdZDIZjlubNxf1qfFRmjkLb4VM9E0ZP7X/2DdAWWVAGPtnJXd/DqecBv
 Im1qODAVbrO5exFLzCaPsG2tb9cbZ0AOLI6YZMiM+zXWcb5vsivJoi/J8CVmk6KHIBJO
 vDjQ==
X-Gm-Message-State: ACrzQf1OJZWMuK+V9FlMm27U29luPGWfieu3Y9EzzsMg7lKY12PlnjbM
 VrWi/XWoGhpt3KF5F+18q3+kEA==
X-Google-Smtp-Source: AMsMyM5/RT+dvdofpJAMEvGf1zDyVTwjEdD1yI4nW9UTc7212pVEgfi5b1k95Yd3hh+gT3kf/v4lWQ==
X-Received: by 2002:a17:902:d4ce:b0:186:c8b9:c301 with SMTP id
 o14-20020a170902d4ce00b00186c8b9c301mr23219148plg.27.1667368419063; 
 Tue, 01 Nov 2022 22:53:39 -0700 (PDT)
Received: from [10.0.0.242] (mur1374950.lnk.telstra.net. [139.130.176.43])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a7a8100b0020d67a726easm557608pjf.10.2022.11.01.22.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 22:53:38 -0700 (PDT)
Message-ID: <4933fd27-5ce7-5e52-4026-69f7ad8dce26@linaro.org>
Date: Wed, 2 Nov 2022 16:53:31 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] target/loongarch: Fix raise_mmu_exception() set wrong
 exception_index
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, yangxiaojuan@loongson.cn,
 maobibo@loongson.cn, xen0n@gentoo.org
References: <20221101073210.3934280-1-gaosong@loongson.cn>
 <20221101073210.3934280-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221101073210.3934280-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/1/22 18:32, Song Gao wrote:
> When the address is invalid address, We should set exception_index
> according to MMUAccessType, and EXCCODE_ADEF need't update badinstr.
> Otherwise, The system enters an infinite loop. e.g:
> run test.c on system mode
> test.c:
>      #include<stdio.h>
> 
>      void (*func)(int *);
> 
>      int main()
>      {
>          int i = 8;
>          void *ptr = (void *)0x4000000000000000;
>          func = ptr;
>          func(&i);
>          return 0;
>      }
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c        | 1 +
>   target/loongarch/tlb_helper.c | 5 +++--
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

