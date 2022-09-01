Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE985A930F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:25:13 +0200 (CEST)
Received: from localhost ([::1]:43252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgRk-0004qI-Ah
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfHv-0004DG-BS
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:10:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfHt-0006gz-HN
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:10:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id h1so8576044wmd.3
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 01:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UpAK274A54QeJkDJ/+tg1xVRP08TVrUKkf6K+rlMpIk=;
 b=kVZwVq2V7EAnhKlLHqKcFW0sd0ki5dw7vya5VpG7vRBEIkTXtZb8Q183vWkGa3KulI
 u2nbQNEVq9irW10iSQJYzC4iM9RDPf8sQ966lWnOJr3SeHB9a01Q7jfTc7GvTg5yHbR+
 itsmQgBBZrmFB4+z9rTtEMnLpHMda0Vhp2Vt2VFoK4d6ao0kKu55F9s+ZX5zBudJeIGe
 U0NBMU6UrgORp7tzFeZtM2FA3fzv9c6CRct+oAy+y4IM76QrGGzPbhJDTrXr0aPgeLgN
 B9uKCfTzMLzOsQ+SjkkckVcYsxMer5V/cJzFDuGVDyEsQRnk71L+i5gx270cixFSyLRz
 TwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UpAK274A54QeJkDJ/+tg1xVRP08TVrUKkf6K+rlMpIk=;
 b=B3PHzpuZ1UrLtQEGidMXz1XQai/G/sHvcoUnZ3ZRu9ZyzPZ+kjbGJ3VDAyo13pkae3
 t6zAuEJs6RMzX935J4PEUH2wS3JF26PCtSNgpbSviS6SoONxMdmITVAcePikbu9zMzb1
 Salswc1jnD1DcOK1OASM5dnMedv62hvOiOxyIoigX25h2yA4oIZw0OLP52ibhyIXZpaF
 Q/PlZ34yYRKw/JN4U6bzWhhAdT95XhAtOCFDdFkhPYLju//8BilPfLe5GAUatywinN2x
 dAlHWwRbjtbWFbKN+BLCrRKDSICcns8oiSJEGN5RpPXCt2/jkRihbHdo5mBXu3rfC7Rg
 MGmw==
X-Gm-Message-State: ACgBeo2qUGwyFi16or+a2dFRWS3PdbK/Ne8naUC5IWan8w09iy0sbjv2
 3LFpIpN3R/G1bRJmpCldWAw/Aw==
X-Google-Smtp-Source: AA6agR4DzBlZdXd19kkjp7ZRs3nbscOayvSuJuGS9bC8mrQOaoXNHDJPw3jf5kd9VX8+03zbp2DHaA==
X-Received: by 2002:a05:600c:1f1b:b0:3a5:f4f4:f599 with SMTP id
 bd27-20020a05600c1f1b00b003a5f4f4f599mr4398975wmb.39.1662019855743; 
 Thu, 01 Sep 2022 01:10:55 -0700 (PDT)
Received: from [192.168.45.227] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003a54f49c1c8sm6019777wmq.12.2022.09.01.01.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:10:55 -0700 (PDT)
Message-ID: <6484ef6a-c31e-091b-158e-217728b253ed@linaro.org>
Date: Thu, 1 Sep 2022 09:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 10/23] i386: do not cast gen_helper_* function pointers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220901074842.57424-1-pbonzini@redhat.com>
 <20220901074842.57424-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901074842.57424-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/22 08:48, Paolo Bonzini wrote:
>   #define OP(op, flags, a, b, c, d)       \
> -    {flags, {a, b, c, d} }
> +    {flags, {{.op = a}, {.op = b}, {.op = c}, {.op = d} } }

It would have been handy to have uppercase macro args here, because .op looks like...

>   struct SSEOpHelper_table1 {
>       int flags;
> -    SSEFunc_0_epp op[4];
> +    SSEFuncs fn[4];
>   };

... a forgotten change to .fn at first glance.


>   #define OP(name, op, flags, ext, mmx_name) \
> -    {{mmx_name, gen_helper_ ## name ## _xmm}, CPUID_EXT_ ## ext, flags}
> +    {{{.op = mmx_name}, {.op = gen_helper_ ## name ## _xmm} }, \
> +        CPUID_EXT_ ## ext, flags}

Likewise.

But either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

