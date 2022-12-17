Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD564F670
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6LKR-0003zQ-DX; Fri, 16 Dec 2022 19:45:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LKO-0003yY-Bm
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:45:24 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LKM-0006xS-Mo
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:45:24 -0500
Received: by mail-pf1-x42d.google.com with SMTP id w26so2850381pfj.6
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1IBh7BmFA3CV/eBymFPzjIoyO79Q6Nh9L0Cnfld66wk=;
 b=hEEmezNmRNc4SabkGrLc3aC2XOGB755fy8FB9onIi6Ygbq/sdL7sUh2WUbe377bsI4
 xY31FWXFSo7qjRuUUMma0mLdKutBz1FtSDwyRGon2DQr0OYmwA6SD8Whz8AWGaAwX7IS
 a1V1PtqcccsBV6HBVXQD29gVoPchIemTQdAvjC9zPpmL4dbs6gttDHfj6xDVOfWWoRij
 b5FeZQbI5MvWbEnvLfDzmG7CNFPvcMqvGMDSj7eLPyi7syJLPjUcdwkCLdZqrzO/m0TX
 e2dlMX3difmLVtTcQrfrhYrKQq7luOaayIQeZajIOUFafoxCrsRmSa10+jvO0gysG935
 opxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1IBh7BmFA3CV/eBymFPzjIoyO79Q6Nh9L0Cnfld66wk=;
 b=nzQKqdyxZ3jw5+RqXjVwDmM9MvBVPWcSRtdEG3tQaAfYDdG0zZbZTXyoLif0QjVUWg
 q+YZqDLqd7bmkxJsGjUyGqjWqbdQl5bkxgvDK10SCAod//J8ZZ5j8p3tsgN8Dv4BAOzn
 XJgyniCAGw4QEI992aCO5udUBwfO55SYQ9bX4GvFPnsK2hKcvfqOD/3siH1cP0Ljh4k1
 z7v38q8Y6lDebzPKzRO3HyjgkY80d7vdDvmwIA7CqLwGQJqUcicU9Ln2Y+r3IaAv1vDR
 juMBhurc51+VxAc4dA5W9y8CQDPScXkCqzOMhbu6kfoyALpOwW6c+5yrca3MXHw4ymro
 JUfA==
X-Gm-Message-State: AFqh2krqFpeJI99IdFDmDOW/gjKKJzatgpSJkI3/RAWZtyi181NHB9Br
 rcD6GY0TcKCPT11TSFs1SoLFhQ==
X-Google-Smtp-Source: AMrXdXtp7MvoAK1P3tcv7e/AIT2F7b3z59tLRcG0mIF8VoYZ+GKln7iXgUakIW0sxkmMSiiXSNhXGA==
X-Received: by 2002:a62:e303:0:b0:57e:827a:52af with SMTP id
 g3-20020a62e303000000b0057e827a52afmr6724056pfh.16.1671237921318; 
 Fri, 16 Dec 2022 16:45:21 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa796f6000000b0057630286100sm1800810pfq.164.2022.12.16.16.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:45:20 -0800 (PST)
Message-ID: <e20a4f2e-2e97-87b8-495f-cc3ca95cfe0d@linaro.org>
Date: Fri, 16 Dec 2022 16:45:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/5] target/s390x/tcg/excp_helper: Restrict system headers
 to sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <20221216220411.6779-1-philmd@linaro.org>
 <20221216220411.6779-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220411.6779-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 12/16/22 14:04, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/tcg/excp_helper.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
> index fe02d82201..e9eb7c455e 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -21,15 +21,15 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "cpu.h"
> -#include "s390x-internal.h"
>   #include "exec/helper-proto.h"
> -#include "qemu/timer.h"
>   #include "exec/exec-all.h"
> -#include "exec/cpu_ldst.h"
> -#include "hw/s390x/ioinst.h"
> -#include "exec/address-spaces.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #ifndef CONFIG_USER_ONLY
> +#include "qemu/timer.h"
> +#include "exec/cpu_ldst.h"

cpu_ldst.h is not a system header.  The others look plausible.


r~

> +#include "exec/address-spaces.h"
> +#include "hw/s390x/ioinst.h"
>   #include "hw/s390x/s390_flic.h"
>   #include "hw/boards.h"
>   #endif


