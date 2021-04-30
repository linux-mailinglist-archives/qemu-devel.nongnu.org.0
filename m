Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF036F492
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 05:35:18 +0200 (CEST)
Received: from localhost ([::1]:58970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcJvx-0003ag-5Q
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 23:35:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcJui-00035y-PM
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:34:00 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcJue-000324-Pp
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:34:00 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p12so48537022pgj.10
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z2NXfUQ9RsFoNK4NfRQ1bHUJXQp+U6YG1Jjp79iXyHk=;
 b=FspoSd0UBN/vCgmuBQ/uWgARVxcoW1bmgPs8doh+Vak5mC2KANDTTEURov5MqTqNf1
 cSSrDNOCKk+nZAfDzQEPxn2XaN72gRieHUXo4zLI/t6tMwcYj5iM7zu7P5F1VWfiY4+E
 E2lI2yXRo9eNq3PNmpWTkUkQHarS/g8nv65st7tknJ/JnTJRYBXjI8yLMwEsvOdXODlZ
 bZRO3WS7gnAtvxPRuNUi9rfLMDUrScn4tB1u7nrvDBeOa1Ai/4yavbkhMmxf67p/SIlz
 IF4r/r4Vm9GJ0SSGObkjNOqkmb8lf748xxuU5TnaXE73wYHWz1N+aIkAFmuO0uZ5UyLr
 UpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z2NXfUQ9RsFoNK4NfRQ1bHUJXQp+U6YG1Jjp79iXyHk=;
 b=L/NY15wxrsiQ9nV0T4XemtH7JFdcAFGqQKhGyKW5FlBtS3gbOI1YS8mieJqdKl4975
 oiZuxSdUkNGtb6a3+AAgwB9k1M5L+IwBzbuCv/K4SOpnldYyb9McT9Kgo7lAmp9wNbVK
 6Y5sb3pyHoACGHpwo3p2YUOsNZPRzrADc3BRA2asQaLEZ9+qnPG05+GMMuY4u4Jm3E1q
 PjhgzjYQ3xd3RVlRMHombWJ1FznP2xeFtZQ4HQxedaEGwCfjaVcls45WTqsXhT9LQVfd
 45GZOJ0udmMt/gjkQ7Urapz2LaAcLWjiUGrNa3pA+tHKGT5DZdkTceVDrmsmEqsbi8Q+
 NVzw==
X-Gm-Message-State: AOAM530j1MUPOYGc6SjfOh2vKGJWGMSF4bm/7MYnn1DEOU2C9xGRaSD2
 KRAvyIUJ68sMPheCaA+gDNMO8Q==
X-Google-Smtp-Source: ABdhPJxKA8jCfulBHLaf7basTQf6YgudUveY/MHw7EyrN+EJkXxCS9MbFu7lk85MwYu3Y+UVzAILcw==
X-Received: by 2002:a63:7f41:: with SMTP id p1mr2824058pgn.208.1619753635268; 
 Thu, 29 Apr 2021 20:33:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id x12sm469763pfn.138.2021.04.29.20.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 20:33:54 -0700 (PDT)
Subject: Re: [PATCH v2 3/7] target/ppc: Isolated SPR read/write callbacks
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-4-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <01a05b79-3be8-0f62-65b9-c0ce0d28487f@linaro.org>
Date: Thu, 29 Apr 2021 20:33:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429162130.2412-4-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
> diff --git a/target/ppc/spr_tcg.c.inc b/target/ppc/spr_tcg.c.inc
> new file mode 100644
> index 0000000000..48274dd52b
> --- /dev/null
> +++ b/target/ppc/spr_tcg.c.inc
> @@ -0,0 +1,1033 @@
> +#include "exec/translator.h"

All new files must have copyright header.

> +/* I really see no reason to keep these gen_*_xer */
> +/* instead of just leaving the code in the spr_*_xer */

Then just do that, as a separate patch, before or after.

> @@ -8515,3 +8471,4 @@ void restore_state_to_opc(CPUPPCState *env, TranslationBlock *tb,
>   {
>       env->nip = data[0];
>   }
> +

Watch the extra whitespace at end of file.


r~

