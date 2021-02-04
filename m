Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611230EA93
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:01:28 +0100 (CET)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Utb-0001mJ-6p
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UYW-00005M-Hx
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:39:42 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UYQ-000331-IF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:39:40 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y205so1152071pfc.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=teeCn5UMh5nAi7Xt3Wla0C6KIGjTmGYQ32rhSZEF7po=;
 b=Zec/1kc8PckkIDHuvu9WwyCfwDx+x7Qd3Dz5VjHqWMUb9EswNQivMUz5/jFfdGH3ei
 f6CyV6yJ9V5CRWx0wc/GcxPighZwWP+yfPs1YxTUMTsKbC13Zt1nd/E6YvIkeccpb0CU
 pDBQfz6uEL4zWNQ6h15EN3yiyr8/XT4OrgwRrsYthpG0n0t0zHFi3Bc1f8VNMiCbii4w
 Ywqm1SRdsERlZu1jYAnaiBwDQ52KbnrpfhCpITXVBnhQc5pA1OH07Rnw2nApEIpQtsyd
 8L5NecDamxmL9SaA+6N3lTjdj03ilsYP1NaFk8znVl7xZkQuRzgCgX4t/PjBMy1zehLK
 ajNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=teeCn5UMh5nAi7Xt3Wla0C6KIGjTmGYQ32rhSZEF7po=;
 b=Lmo6hBlxfz3vHF/M2ZJfKf5Mbt8DdinN86cqpQN8/9CnpHhazz6hnM0bFL7VaAnlrE
 i2JULiiX4ezSHzH0TytRnBX7Oa3BSsFZt/vU6bmsWD1fq7tuEkwtsCAwEusxEcoRDYZb
 PGZo662ThA4XinG9LBXalnjXSrsaC/jGCE0nGuJ4I+2LCw8Oq3AQ1LpKyEiRfY4zk5wB
 sdDc5ciEbOUx7VdS+/+1m3XA8l1Vy/RTVvguw12MlmyYXbNneKgXvHQuMfXpe20hY+ur
 JTXiLuVTdyolSzWIZ5u6XVuKt0+XjTisRo9v7wU47pvkk4v2SMgJP0j6bzk05EYfHPDB
 Dw7Q==
X-Gm-Message-State: AOAM533pTZeWL2RiNwnQRj1+yKwt+gs/jhN2GyalnbffrsAoO1i6Azv7
 9mZsm6Z4PcYhX8p7KC3mez+pnQ==
X-Google-Smtp-Source: ABdhPJyK2rClMc2GzauG6lZgshZet913ECOzPsTiFLlNv+7tWY8dE0tCtNKT6at/7GU/nx//vWSiWw==
X-Received: by 2002:a62:cf44:0:b029:1cb:7756:8730 with SMTP id
 b65-20020a62cf440000b02901cb77568730mr5838926pfg.59.1612406373058; 
 Wed, 03 Feb 2021 18:39:33 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x21sm3115976pfn.100.2021.02.03.18.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:39:32 -0800 (PST)
Subject: Re: [PATCH 00/13] target/mips: Replace integer by MMUAccessType enum
 when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128144125.3696119-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f546307-ac44-fb1e-c0c4-6b66a4026163@linaro.org>
Date: Wed, 3 Feb 2021 16:39:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 4:41 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (13):
>   target/mips: Remove access_type argument from map_address() handler
>   target/mips: Remove access_type argument from get_seg_physical_address
>   target/mips: Remove access_type arg from get_segctl_physical_address()
>   target/mips: Remove access_type argument from get_physical_address()
>   target/mips: Remove unused MMU definitions
>   target/mips: Replace magic value by MMU_DATA_LOAD definition
>   target/mips: Let page_table_walk_refill() take MMUAccessType argument
>   target/mips: Let do_translate_address() take MMUAccessType argument
>   target/mips: Let cpu_mips_translate_address() take MMUAccessType arg
>   target/mips: Let raise_mmu_exception() take MMUAccessType argument
>   target/mips: Let get_physical_address() take MMUAccessType argument
>   target/mips: Let get_seg*_physical_address() take MMUAccessType arg
>   target/mips: Let CPUMIPSTLBContext::map_address() take MMUAccessType

Modulo the comment vs patch 7,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

