Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93CF47E92E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:46:33 +0100 (CET)
Received: from localhost ([::1]:57102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vuy-0006Ds-IZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VsX-0003zm-81
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:44:01 -0500
Received: from [2607:f8b0:4864:20::62e] (port=34622
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0VsV-000525-NI
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 16:44:00 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x15so5307485plg.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 13:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NHrPi9zC5XhFy2Ze95xy0RNc1xaAkMbEbJgkv7ZaG44=;
 b=mObXAH8VSSQCIrjolXXtUOLNYrvIGQU/8iVGNHkOIetXMCgaYDZPwSsOfs4Unwm2dB
 WVoz6VWQQO6JRKxMw0eD0CrfehTXPApafyKt79t/qUCvdqho0K9FXaVXDsFOKxjlEW4W
 p3BDRLTtJs3giXYhkWQ/ambMluX4UxWJfzZwUDTtAlODxjA9zLQX0ZPO8+LxfJhni2kL
 dc7C7RkTyHGknxJ4NgyAZyUoY01U9v7YUtq/N6rSU0RYaUFVxJmgBGvXAQvTNnQwDTBK
 olcn9Bym5W1NGMotXjyQGb4smykZeuZiRwjuhPovbgwVD/j0CWxpJ38iyPGJVXSMuhMy
 dn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NHrPi9zC5XhFy2Ze95xy0RNc1xaAkMbEbJgkv7ZaG44=;
 b=uafuZNLv6r8jsQnok9BV4xY/mN6qdCUGGqkgtx4DWomjkX/oNXPbtCSEjzVLExI9dE
 hwZCeHRdgD3GzLZ7nOJgLLgw9VXle+QpAu0afYwxaWym/EU4SreHxO19N4jDdEuMt5Pr
 9RkMM3QdkQ5HPKY3PMj3LM9rYPDboA5zCYXm2dryc8YYtIMmQ3Flt9S79LDUcapJrBwY
 USEfMfDz2tci9qsZ7hCF3HLvNXsSCoTbSWpN0B46gYnHZOrM4bZnaJSiRaQRNnGlNyhJ
 nfqf7l/s0ebkiE2smf9iSuEJKFipbJUIV8PxXRVgiebCdP6EoO+iMgCYu838LvAioP8O
 J6vA==
X-Gm-Message-State: AOAM5328U33JByClnNV4ACMtD4qQnLdu59CuXLmWyGlmNJSKgcWfjC0c
 gt7eU/zfxue2XgX2gr9YCOlgzA==
X-Google-Smtp-Source: ABdhPJyKjlX86ldVHERs0L+AiRjVYa2Qhv3/MUfj9DNwtpyMnRrCj69cgGHRtLl3YxPQ1SIIWtoOUA==
X-Received: by 2002:a17:902:760e:b0:149:202b:4a9 with SMTP id
 k14-20020a170902760e00b00149202b04a9mr4058777pll.16.1640295836000; 
 Thu, 23 Dec 2021 13:43:56 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm7467885pfk.153.2021.12.23.13.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 13:43:55 -0800 (PST)
Subject: Re: [PATCH 6/8] ppc/ppc405: Fix timer initialization
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222064025.1541490-1-clg@kaod.org>
 <20211222064025.1541490-7-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a6072e2e-7e70-ce4d-b366-22d9fc754943@linaro.org>
Date: Thu, 23 Dec 2021 13:43:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222064025.1541490-7-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 10:40 PM, Cédric Le Goater wrote:
> Timers are already initialized in ppc4xx_init(). No need to do it a
> second time with a wrong set.
> 
> Fixes: d715ea961254 ("PPC: 405: Fix ppc405ep initialization")
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   hw/ppc/ppc405_uc.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

