Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4D32499F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 04:58:55 +0100 (CET)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF7ni-00036y-4N
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 22:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7mE-0002PG-U8
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:57:22 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF7mD-0003RS-2i
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 22:57:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d16so2486648plg.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 19:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Ti+dfOQMm1aHOxeAa+cjQMiwy168r6lRwsrTuIIwlU=;
 b=XLPfpjDgNO5afWmpgHWzY0/459Ymc/WuJBz3CVxURwLv9RdPFfw4NzOGm3lLYzEpu5
 paElRuX3AvqxPKmjj/qiOevACe0k6pBYfo1OT5g+FOO0XM9Zm3L5hR9aMZ/ebGfEYS/c
 VYdlUm8if7Cbtpp6ezePXiWQIyV3UsNQbOPSrXb14Qlqp0ID8u9L5kKF2dSpoqiyAmzk
 9bC4AuyTx0uQDNRaOu9viW1KiQxu9XE+01ZLCVGD1QsY0gUmuRW6JfcJ9EdqzCI49kU/
 uvr6BpWnidMpwiKL6+9fGySGaaN2rrEmjyNj+/Km9g6v3TPWH02ceXF3Aw7Gz0+Xd+6P
 vthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Ti+dfOQMm1aHOxeAa+cjQMiwy168r6lRwsrTuIIwlU=;
 b=D72M5vRvy0QVjn1pqb1vxeKbF5bJEmdEO30w1fg4/AU5eTZlcYf3K7ENeogPm3EKck
 XgK1w1rtSztGYmft0vJQSaLhzRfJu9U8OzxmFhWpfe4PI4GV7x/B9aBD2hiea2JCwtRT
 6f23OKDi1qM821r1odhWMekHE0ORNXZmovh+pCYjbnWR+UyVQX72EQetpFcBpdut9loI
 N4Ct+h2VAdjPpOOKMKnT8Fk9bV09osB/a5odg0pEmRvsHFBdFyA7S9t29VnJcMpYQf16
 /dcc6Gh0L4bjVJ9zTDPNo0JuV2+l9XI9hdnSZEAgSJBlsqfOo0OmEE2X4auZq38nB2gj
 RKdA==
X-Gm-Message-State: AOAM530RY70Nj1mgdecmgbFUs7s3IN4pRDBptCQg8ge9uJTq63Z6IpQ9
 +gzI4VV3cC4Vt9r8R/t8drRGiiG33Gwk9A==
X-Google-Smtp-Source: ABdhPJzzy/CknIhD492qP1ipwcAaYgU9dIP9QZgkI8dFRdyB0FQNEB+nSIXpUjM54S2/I8ohgdPTqA==
X-Received: by 2002:a17:902:6ac1:b029:e3:dbc0:bc44 with SMTP id
 i1-20020a1709026ac1b02900e3dbc0bc44mr1334443plt.15.1614225439219; 
 Wed, 24 Feb 2021 19:57:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b187sm3844522pgc.23.2021.02.24.19.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 19:57:18 -0800 (PST)
Subject: Re: [PATCH v22 14/17] i386: split seg_helper into user-only and
 sysemu parts
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-15-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <270c65bc-54a4-01b2-6fde-d59784cb455f@linaro.org>
Date: Wed, 24 Feb 2021 19:57:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-15-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/i386/tcg/helper-tcg.h        |   5 +
>  target/i386/tcg/seg_helper.h        |  66 ++++++++
>  target/i386/tcg/seg_helper.c        | 233 +---------------------------
>  target/i386/tcg/sysemu/seg_helper.c | 125 +++++++++++++++
>  target/i386/tcg/user/seg_helper.c   | 109 +++++++++++++
>  target/i386/tcg/sysemu/meson.build  |   1 +
>  target/i386/tcg/user/meson.build    |   1 +
>  7 files changed, 311 insertions(+), 229 deletions(-)
>  create mode 100644 target/i386/tcg/seg_helper.h
>  create mode 100644 target/i386/tcg/sysemu/seg_helper.c
>  create mode 100644 target/i386/tcg/user/seg_helper.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Not your bug, but for the record:

> +void cpu_x86_load_seg(CPUX86State *env, X86Seg seg_reg, int selector)
> +{
> +    if (!(env->cr[0] & CR0_PE_MASK) || (env->eflags & VM_MASK)) {

This first test is always false for user-only.  The second can be true via the
vm86(2) syscall.

> +        int dpl = (env->eflags & VM_MASK) ? 3 : 0;

so this second test becomes redundant.

> +        selector &= 0xffff;
> +        cpu_x86_load_seg_cache(env, seg_reg, selector,
> +                               (selector << 4), 0xffff,
> +                               DESC_P_MASK | DESC_S_MASK | DESC_W_MASK |
> +                               DESC_A_MASK | (dpl << DESC_DPL_SHIFT));
> +    } else {
> +        helper_load_seg(env, seg_reg, selector);
> +    }

And helper_load_seg calls GETPC(), so suffers from the same problem as the fpu
helpers.


r~

