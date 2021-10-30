Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BD4440C56
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 01:28:19 +0200 (CEST)
Received: from localhost ([::1]:34114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgxlq-00041E-9t
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 19:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgxkx-0003Be-VU
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:27:23 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgxkv-0004qQ-TX
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:27:23 -0400
Received: by mail-pg1-x534.google.com with SMTP id m21so13521180pgu.13
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 16:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VHRgKjy6BjaxoI/tufj7hntwvK8TzDJIrBcGbB5cwcg=;
 b=n5A5+TCLJuSM5Oz7LQifhSB6OCtMKg6uV6nsnbd6l9aEjmxjEjIjrS7yZ7FnZUhGcL
 4yXehrMM+VXs4Tv7j2Osv88sMKUl0u4ac73NsjiIJTs3JJWH3RprwgoPH9CgLhhdfRDJ
 oZGLy1xlqlupFGMlT5xhLIBHtEXo1cVc8LuBnPMzjplfnrL14g4BQjFqkKF7ORiC7/aj
 d5wzeq/bA5TR16gcqrKNYkL55NIa+3h77RtUMdJj0dGdTtNnIKydd9q6skoiKaXGo3ER
 +WDfsgQ0v+JzdkzWYw5l+ds5ECN5h+y+Zw+VXn3OZ8pj7GPQDpfniBuu8z6MsSGiWl0n
 xyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VHRgKjy6BjaxoI/tufj7hntwvK8TzDJIrBcGbB5cwcg=;
 b=hft/2PCs8Rt3m/doFJbHxagJkzusoqDGReuHoM6UUdAHXU7ay28LWWRP9jzeMCU68X
 HhXGwqyeqqhkF2++2LdimvJq5QO4dyhhtyO0emycQ3aheTCuyzmrHA7zRNgyi16NjIcL
 3WxToCfOyvCYMxQwgZjHUsMrV+grgwg4zehS2EKQ8BMnLP6ML7fn3MMMMA3mUSDe2x5h
 Eymlt3ZjWtI0YwsSlPVYeabQg8sf16fiShiphIRiRXB2i93oVeu8i+Le0sSZ19cUv3Qy
 3Vt7vsJEqyLRVRMwggYjW5JLXw1VoH9SzACAJwH+N06uLYjrry1+mSZqh7FrRlAjGSXM
 M2Lg==
X-Gm-Message-State: AOAM533k5nGHmgCfi1Ay2MCBERrmlY/ddp0aT+qvw8bTyYYTEOsm0u0s
 TYX8DKLTCkB2rwMVhjUGXbh3Ug==
X-Google-Smtp-Source: ABdhPJw1QJfTM4gHTLVL93Aeny+frpbkV64Kpj/MfHcfJ1q55xaZFYoH6mJYO5S6Xzspot8S0iQMtQ==
X-Received: by 2002:a05:6a00:2171:b0:47f:d231:25f6 with SMTP id
 r17-20020a056a00217100b0047fd23125f6mr8310630pff.4.1635636440095; 
 Sat, 30 Oct 2021 16:27:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9165205pga.65.2021.10.30.16.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:27:19 -0700 (PDT)
Subject: Re: [PATCH v2 30/34] target/ppc: implemented XXSPLTI32DX
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-31-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ac0f24d-bfbd-1b88-bf3a-12afe0037a62@linaro.org>
Date: Sat, 30 Oct 2021 16:27:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-31-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: lucas.castro@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 luis.pires@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Bruno Larsen (billionai)"<bruno.larsen@eldorado.org.br>
> 
> Implemented XXSPLTI32DX emulation using decodetree
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - 8RR_D si field is now unsigned
> - Implemented with two tcg_gen_st_i32
> ---
>   target/ppc/insn64.decode            | 11 +++++++++++
>   target/ppc/translate/vsx-impl.c.inc | 17 +++++++++++++++++
>   2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

