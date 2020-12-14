Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF182DA353
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:24:08 +0100 (CET)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kowGF-0001L0-9T
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kowAU-0005Ai-B5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:18:10 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kowAS-0005BN-HX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:18:09 -0500
Received: by mail-wm1-x342.google.com with SMTP id x22so15157829wmc.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3prp3xPq2rJoun8lg8xXixY9jh7Wl+EKt+k+DyQENmo=;
 b=KiqpPlCPppuiEIHVlUJsmcoLHo1LIcE/f0cfsF5KtGWeInmmvU4list4RdDocQy1pf
 OxpBUoXUr71/wZsRRG+1BdFTwWflue1R6aPQQxNwfEhuQYiYHO+BvT3vcrJeB4I7DQrS
 Xlrbd4Aq1V6aH7uTDepqIpVfoWCsQoA4yTxrKImETfPtTMc3BzWXf88PkpzPEcK96Q9q
 dhFN193yptmP7JO/kHZSJtRLVyk/zI1qX/L9D2PIIinx4T5vJQc4gsc0/HoFjEiV2TBn
 zCybGiE7M/jz/m1+ExA0+mEKv/+Ys9T/yYK/HwV+4nmEG0Iz7lEmyq9iNPujAKcP8lkF
 xg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3prp3xPq2rJoun8lg8xXixY9jh7Wl+EKt+k+DyQENmo=;
 b=hqQqRsoImf6A50SJZChNPSgE58njZ+bZ12sd6+2wRAkKMpwzLeBZpB1DM4bzdTMfCt
 7bpuLMevVGEfHh4EDvb8T+I3Utsx2kOKlcEFapahOEJdWP8isZJK8TNCxrH+VUdBQFtH
 Ed1k9XSapMWrvQE6PaOuCaJgisAoPybvkXmzbFk/K3Ar+O6t3s3722pLbbXaL0DXUusY
 XjTLGpXbQN80QxFoPTiY3o+ug28HxvvPoQydpi4MHY4G0N7Qu/auf7QA/f8deuGFMmR8
 a0kwNE6enQD1kVVgG+9d1Pry2Rt/EmEheyj0MXSsW3ea8fzH+N211L4aecrnZQuqa7Ns
 Z1fQ==
X-Gm-Message-State: AOAM532bYa9jj+uDXhCBbT7TMK3EWMh1SGh5V72wVZ9/7Je5knhaDF3a
 fJrKhPRdfceMWXMcKcHNSGuIIvYXTpk=
X-Google-Smtp-Source: ABdhPJyQ+jCYC6Nl+dm1rwyBu00nJWe8hPchsdK5t73jvqrd2OEpuUDZpP2ZuLwDatLHxvi6K4KJKQ==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr9563479wmj.19.1607984286257;
 Mon, 14 Dec 2020 14:18:06 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id j13sm32356826wmi.36.2020.12.14.14.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 14:18:05 -0800 (PST)
Subject: Re: [PATCH v4 11/43] tcg: Adjust tcg_out_label for const
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e5c4907-d11c-bff0-6ac3-c67f02afae09@amsat.org>
Date: Mon, 14 Dec 2020 23:18:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214140314.18544-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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
> Simplify the arguments to always use s->code_ptr instead of
> take it as an argument.  That makes it easy to ensure that
> the value_ptr is always the rx version.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                 |  6 +++---
>  tcg/i386/tcg-target.c.inc | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

