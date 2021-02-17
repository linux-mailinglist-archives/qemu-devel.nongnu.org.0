Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE7131DFF4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:06:44 +0100 (CET)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCT5u-0001Uv-CE
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCSzd-0007f8-PV
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:00:13 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCSzc-0001BD-2F
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:00:13 -0500
Received: by mail-pl1-x62a.google.com with SMTP id s16so4090543plr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yux69vLQbyqMMA/L1aBNBQLYXPz3CDx8zby7nS6O4J4=;
 b=HZdThfsL+2NUyM6ZUUQLjXl4NY2j39Ies8ALpkb6tqibm1qar4lBOv2KVXQGZNVxw9
 wPOO7dYen3xtxfYXOTHXAU+qZKjcPPJI3ThlcSJzsJR07TyJo+84861lyH/VVVhgplbu
 70RFKmYXj6M7crWL2vavwJJi31zy0OnpfWvaWTFRjNOurLPsXIbrxATxvnIjAzKbckd4
 3mQNqoRiC58Ugy8/9JhBetksVNpMB8tH2s4QFWOPqlzCYMCr2g7bQThey9nI8wHGX6D+
 2+55LhvLVD4+HeTUGO5rjI1/6cB/tCwmnwl7feDNgxucVE3CkhFDlOycs3iVXz+swrBd
 uu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yux69vLQbyqMMA/L1aBNBQLYXPz3CDx8zby7nS6O4J4=;
 b=cAxIGBH8fRXuci17Q0GxwKIwIHpdLjTZLqSwA+SG/YzKzFZqFVNUn0UBfQ1/l65X82
 WhDsneaAiajAxyhh6E8atdyLQX4JZ81pSTIgSUCNU+ErwG6OLj96PH+YZoVoPZSjE6h7
 FN2vjkX/x5VNyJl1AbyYVw3XQDqUyQ2FREkKkWXSKuBvv+we+ktA17UQrBkv2GxkUpWf
 aeQuOH/qsEgGALJR0uOqNf+sktP6XXYavOnfkvvd4rupuEPoBHey082GpObT8kkY5UUt
 /XWgqhtBDui/RhXWb0N+oKNSmqsHbkmeI5IFIpi8cwi5/hi9709ShviohqaXg+QwqeC4
 iALA==
X-Gm-Message-State: AOAM530WlzZyoAPDRk8kRPNfMAlU7VyjaNatyd5IUDh9EIdebcBZbKLT
 IdqkWLGjnc2qrVwl0qwggr/dgg==
X-Google-Smtp-Source: ABdhPJxmKm8mf191jL4w5K/xyDw8QNuLUfVUieBWa0pZgoYz8++JUK3pPBRu7h33ebx0MzRYSMqZWg==
X-Received: by 2002:a17:90b:ec4:: with SMTP id gz4mr460882pjb.11.1613592010413; 
 Wed, 17 Feb 2021 12:00:10 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c22sm3185705pfc.12.2021.02.17.11.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 12:00:09 -0800 (PST)
Subject: Re: [PATCH v3 22/23] tests/plugin: allow memory plugin to do both
 inline and callbacks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210213130325.14781-1-alex.bennee@linaro.org>
 <20210213130325.14781-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb332037-de9f-f57a-47a4-2041ddabf2d7@linaro.org>
Date: Wed, 17 Feb 2021 11:59:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210213130325.14781-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 robhenry@microsoft.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 5:03 AM, Alex Bennée wrote:
> This is going to be useful for acceptance tests that check both types
> are being called the same number of times, especially when icount is
> enabled.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/plugin/mem.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

