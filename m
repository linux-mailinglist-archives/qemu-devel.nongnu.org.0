Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892363F5016
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:06:37 +0200 (CEST)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIELD-0004CI-Ty
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIEJb-0003D0-C8
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:04:55 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIEJY-0003Qt-OM
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:04:55 -0400
Received: by mail-pl1-x635.google.com with SMTP id w6so10627398plg.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DIaN21ysGXASYoaysgHyHmiWT2YqU3g3JDLJhljI6G8=;
 b=MNXPfXj/o98osrJJzqJ0a9FSpnrHFd+J9AhYXy2oEzbk8FoL/JtV7Ug8j2yDVaF72k
 AhyO7KMmanHjxCTHk6f2LzMoqtP8RIUan5fPWeMwbt1cZMR3Ze8NEYM+r2B9G/hArtlp
 Uidgvw+KfkwT9MAW5fFkB0ckhkAKx0K5CRcSGoBkdUD8LMZI/3U3Z23NBMM7YDFfAsim
 OBzAjdE4mk3tgkbHETulkLLDlIeWh1As53aZlI8AR4Aqu5fBFxXLHLNC0bsjUlJyB+jz
 0NnFS3Z0LqphIGQAgzHa4EFP9NIjt8f69FNnLDxAcFj3bS/QDxo8KiX6K2aCbtQSLTx4
 svog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DIaN21ysGXASYoaysgHyHmiWT2YqU3g3JDLJhljI6G8=;
 b=cDl5LoMnHao9fdP8Jdlx2H6fMp8YQbIZOwHly04goonBjFVCp+znrKnIK+aM5SUKWY
 n1LYz2Q3H7elCQQMtvFZ8wJDbkEgxPCN72s3NVc74i6qhp9HzFH1lsdzUHa9L+XYoqaX
 cjce9RN42zO1oQCqfugCGiqgwPHRNRuh/NSnrDrdncxQrdQVkSz/aZ+qmgcPNwjYOrwG
 BzijT1lBoLBvdFeno/yd4gDKs+JqbtwRV6FACBQBV0mYw2/Hayc8EtWL2lz10N8L0Lex
 lcDgpKf1S8W1r5RgZPcFSb358kRD2vdktctfepepXLLvusRzQiOr1OUDmRuN83W0aEzW
 qEqQ==
X-Gm-Message-State: AOAM531508ctvG8ORsy+jxzTHIWZZDDNhf7USgkxf1eyDXM76I1zvg4n
 DI6GtyBpJwchNxSrpVe1Ent17Q==
X-Google-Smtp-Source: ABdhPJw3EZEJGZeH0XiEjpsIGYSmOhZYMlwlDNJRrfMRnfegQpXiwqhGrIjYVE/ksZutzq9CWZg4RA==
X-Received: by 2002:a17:90a:f8e:: with SMTP id 14mr9911084pjz.85.1629741891091; 
 Mon, 23 Aug 2021 11:04:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u12sm19613117pgi.21.2021.08.23.11.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 11:04:50 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-5-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31e867ec-d122-d45f-3e17-ba12d7d840ae@linaro.org>
Date: Mon, 23 Aug 2021 11:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823160647.34028-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:06 AM, Andrew Jones wrote:
> Future CPU types may specify which vector lengths are supported.
> We can apply nearly the same logic to validate those lengths
> as we do for KVM's supported vector lengths. We merge the code
> where we can, but unfortunately can't completely merge it because
> KVM requires all vector lengths, power-of-two or not, smaller than
> the maximum enabled length to also be enabled. The architecture
> only requires all the power-of-two lengths, though, so TCG will
> only enforce that.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>   target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
>   1 file changed, 45 insertions(+), 56 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        } else {
> +            if (kvm_enabled()) {

Nit: better as

     } else if (...) {

if I'm reading all of the diff context correctly.


r~

