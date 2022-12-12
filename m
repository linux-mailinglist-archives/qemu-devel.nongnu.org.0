Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274D64A39D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4k0G-0006eu-2X; Mon, 12 Dec 2022 09:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4k07-0006cD-UN
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:41:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4k05-0004dB-5e
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:41:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id o15so5579475wmr.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=7AueZj6MGagex8glWlbKacB2txDdxv9s1WzCRCHzUFY=;
 b=PYwVqTVrRtekp5afTt6Ezbqa45GQ8/KDxwuazUuBalih955L/Af03Lya2HcGuoZZbN
 UChcxQ1BbfwQQ8XTtAlux9njZV/A1jBIjv8/EbIi69ojYKUTIvBLLZgDDjHjJA0XoH6l
 RCSzbRQN6mBY1y4mEISqI9zNUQO2nHg8Irhsd1YSamGleXtDW3w0+kpUI3SiTWQmDLFG
 xxuaXFHTzP62sGb768S+5M6z44Ka00scC6ZzlU+okJXPVS4SOLNk1HXdOzBXXgXgBubN
 aSEQ/nKhW1M1kRyQUlbomtI7tBAl9qxUGloEQlBigOb2NBhnmywtqUrW0SI8xHxpFfrs
 fI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AueZj6MGagex8glWlbKacB2txDdxv9s1WzCRCHzUFY=;
 b=vbmtxF+0c5puM0fYRmfGuH1g+N+FIV+/lKuVhcNJpchpkGqTdSUBrKz12j+cZZ/2ni
 A80Y+Ml9CCCcBqklg1Ou9NOFbFKHbLpknX3Ub762khoasWV6NvSzA9hM2UvXPylaB2ef
 DJ2UeaQrsleXWM39xNxwwgxy0RBCxvaXtvUtrQQeqigGIHKgcRK7zt9HV7MZN6uTqoFy
 kwYx5QIMSxsdzMnAq916FbPIAeZzrVQqKO+newrn7eN35OQ4C0wwR7VMEoRsKnF4tta+
 qz/J6DDkmUxEVjB0S3Njyk7YEzg4Rq3+a6tWAZwPENBkjRjh2sDDuQDRjJQDLeqEI+zN
 ulkA==
X-Gm-Message-State: ANoB5pkG+llTwn13Guyj9WkPQQmzIlXd9DV5/eQ7P1k+HHEqYpQrABzQ
 9/wYKmaudGnvVrHNbm3faAs=
X-Google-Smtp-Source: AA0mqf4hiI53aCU78WP3jrmihspuyRmH2ISFFDSurCgPpjtBngU0fmS72dJ9UrVZpFp7xNzBFu+0kw==
X-Received: by 2002:a05:600c:358f:b0:3d0:2815:77a1 with SMTP id
 p15-20020a05600c358f00b003d0281577a1mr12938881wmq.21.1670856107721; 
 Mon, 12 Dec 2022 06:41:47 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 iw3-20020a05600c54c300b003d220ef3232sm6210583wmb.34.2022.12.12.06.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:41:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e5c4364b-6084-d655-7253-6b92449b951e@xen.org>
Date: Mon, 12 Dec 2022 14:41:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 14/22] i386/xen: implement HYPERVISOR_hvm_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-15-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is when guest queries for support for HVMOP_pagetable_dying.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/xen.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index ddd144039a..2847b4f864 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -18,6 +18,7 @@
>   #include "hw/i386/kvm/xen_overlay.h"
>   #include "standard-headers/xen/version.h"
>   #include "standard-headers/xen/memory.h"
> +#include "standard-headers/xen/hvm/hvm_op.h"
>   
>   static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
>                         bool is_write)
> @@ -180,6 +181,19 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
>       return true;
>   }
>   
> +static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
> +                                 int cmd, uint64_t arg)
> +{
> +    switch (cmd) {
> +    case HVMOP_pagetable_dying:
> +            exit->u.hcall.result = -ENOSYS;
> +            return true;
> +
> +    default:
> +            return false;
> +    }
> +}
> +
>   static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>   {
>       uint16_t code = exit->u.hcall.input;
> @@ -190,6 +204,9 @@ static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
>       }
>   
>       switch (code) {
> +    case __HYPERVISOR_hvm_op:
> +        return kvm_xen_hcall_hvm_op(exit, exit->u.hcall.params[0],
> +                                    exit->u.hcall.params[1]);
>       case __HYPERVISOR_memory_op:
>           return kvm_xen_hcall_memory_op(exit, exit->u.hcall.params[0],
>                                          exit->u.hcall.params[1], cpu);

This all seems rather pointless since the only sub-op caught results in 
-ENOSYS. AFAICT the only real change to avoid the emission of a log 
message... which I suggested might become a trace anyway.

   Paul


