Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004425534EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:51:12 +0200 (CEST)
Received: from localhost ([::1]:34496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fDk-0001he-2n
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fBO-0000ED-V9
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:48:47 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3fBN-0007hl-Fs
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:48:46 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 h34-20020a17090a29a500b001eb01527d9eso12783698pjd.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=IZfNAPKIr7X318WBXQpNaogy4UgSPXgzIRd3gAus38k=;
 b=vSvGBE8jE+FZ4FN7N04TCGSQX7sx0aITniOrXc9nqtFz6tJ+G6+Mn7nedXYsLEBV06
 EYZZsnr4CEnriChoUGMvoBzJEgOrOKQptV4tPpatsxwHgPb68NPdA492XC7MPnzyWoWD
 IZJuYjfOCe2mGHfu6aabLd5HYhu5R7FgOYYmZlhY0QBG3Fmx0/FSVnP06UQhtCNe/jx4
 /mGRKv6ijjkThepniHXSqm7YdHxLzETNtqWH6GylPaqhgcfipeimUr3kZ9XHDL/XItyx
 D+VUx5UJbaM1LOr/ikm7u9/aBOXs1OplD8odnsxAc7CdhI3dTZBwBOGtSc5PTdo2nvY+
 2tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IZfNAPKIr7X318WBXQpNaogy4UgSPXgzIRd3gAus38k=;
 b=Z2roy6MnFJJYTWLMvMv19BkNSaD8W446IgSh3Du/V19LFbxgSV2neYvNgIKKnfdkp8
 H43q/JEDzsBS30FL21EDoKdEGJjPwdAAI1BNSKPQB2CLL4WqmfeOdQSWdyxGdxd7+Zjj
 lVVDQzFOF1rhFSJsNKjFbQpsd59nrbIBguSCFn0/AmIjrTRa7u2isCIAkRhaJ9Uashu8
 f+vGdnn8yJwcH8ywMqccyj1X7OamW2msNe8ujZGCrEX+K5zIvU4pNvzWZ+3bKAMOmIqr
 dswR+NK621yH/SeFXczFFN/fajVo8h5Gcfmg/2ePa0ANu2h5r2wZ/aDVsoHYJiAlPOzh
 C41A==
X-Gm-Message-State: AJIora8+KJTziI+FqJMhvxOZXJ3gQ6TQOcRWOq4ZB+tafkkLTfzXTuhY
 c/yTSEzHlOMK37r//RiyHaMIcw==
X-Google-Smtp-Source: AGRyM1s+yxvGB+ITzsAudt7vkNZFjocA975seDihsmcpHoq09Z7R+yP3+w5VQveA9ZzBCdCdXVraNg==
X-Received: by 2002:a17:90b:3b44:b0:1ec:d7a8:7528 with SMTP id
 ot4-20020a17090b3b4400b001ecd7a87528mr1142554pjb.231.1655822923537; 
 Tue, 21 Jun 2022 07:48:43 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a624d02000000b0051e7b6ec81dsm11444921pfb.108.2022.06.21.07.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 07:48:43 -0700 (PDT)
Message-ID: <8c391d14-5743-1a6a-f34e-a209ffb0ba46@linaro.org>
Date: Tue, 21 Jun 2022 07:48:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] pc-bios/optionrom: use -m16 unconditionally
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220621075147.36297-1-pbonzini@redhat.com>
 <20220621075147.36297-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220621075147.36297-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 6/21/22 00:51, Paolo Bonzini wrote:
> Remove support for .code16gcc, all supported platforms have -m16.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   pc-bios/optionrom/Makefile    | 15 +--------------
>   pc-bios/optionrom/code16gcc.h |  3 ---
>   2 files changed, 1 insertion(+), 17 deletions(-)
>   delete mode 100644 pc-bios/optionrom/code16gcc.h

It was a bit dicey using .code16gcc behind the compiler's back anyway.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

