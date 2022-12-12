Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCE664A3BF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:52:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4k9p-0000Gi-Su; Mon, 12 Dec 2022 09:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4k9S-0000D5-2Q
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:51:34 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4k9Q-0007PV-BV
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:51:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id f18so12337944wrj.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=8yOTtkRwl+wD8vpBHyGDJq0RPnN6dQImsaGBHI8tWwM=;
 b=U79g/o3iP6fBOUQkiC5NvPvHWzKT7U/2/f81iKdQbHhn7cihhnfSeVebHiu4rbETO7
 CZUAgTdtzPjq4phOzVPnAKT6A2g+Y2E/7Fsun0kClzvKIvGqn5Lya5DyBKVg6VgAOrtE
 92WltoGfAyESqW4zkJ0jOr8hynnCb86ValMsFB1Bytoa7T9urTBXm2i33MakZKM3MJQZ
 UV7+0721wWM8hQ3l5yWdONkpyvL8h1x9D1fLqjGaK0hekNyR+Yn3ucAhAebQ6XyEmKW7
 4QjUV56jzKx2z0ZZ7UlKSDQj6aw8UJbw5gp99z8a85LMyIoJEunWTcALVKap7sAq373W
 nS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8yOTtkRwl+wD8vpBHyGDJq0RPnN6dQImsaGBHI8tWwM=;
 b=EETW8kNS/fbtUa3QYpqLkb+0PAENw24HBhMs9IzP7Zo/4kg1uRzXPLP5F/ktP9l9+N
 +sXZmWPfGB3stIzX7FnlWqLv3kmg5xfI+ci+aUoy1G4wYqXjD38GKuJ9fqTTdV+kp+l1
 hCC+gkmoJX6ATQz7ni6j073JgIWGhgJrPmaFUrMmfiozrdsF3czW0zx12YPsfkawcPh6
 Yci1AF3UsQT2qtPcYnaXb/5pa6TnOa4wm34LZ/BN1Gkt/ZH9Z6unYz/bjTljbakZmeKj
 lGL68hGQUti1bXxP+m2+MbA8KYPD3NXTpk6srDkBUSH/Id8dvCGMDcckmqKKE9NBaow3
 sVxw==
X-Gm-Message-State: ANoB5pmP5r+aYyrCg4zO7PObxcinQoZ1FoBYS8DWZLE8UWDUbhom8U1F
 47UBQgd9A+OA3TMjYH27Nh0=
X-Google-Smtp-Source: AA0mqf4+XW07FWGSEmTJtkHgqnnYvWzKGHKm5WkBu6q6Pic+ERSv4+svuOdPxTqcKTgTzwkoxroTjQ==
X-Received: by 2002:adf:e64c:0:b0:242:2445:4a42 with SMTP id
 b12-20020adfe64c000000b0024224454a42mr10552173wrn.9.1670856686108; 
 Mon, 12 Dec 2022 06:51:26 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 z5-20020adff1c5000000b002258235bda3sm9100397wro.61.2022.12.12.06.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:51:25 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <171b6a41-b35f-2c33-2887-46327cf62887@xen.org>
Date: Mon, 12 Dec 2022 14:51:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 15/22] i386/xen: implement HYPERVISOR_vcpu_op
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
 <20221209095612.689243-16-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-16-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42f.google.com
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
> This is simply when guest tries to register a vcpu_info
> and since vcpu_info placement is optional in the minimum ABI
> therefore we can just fail with -ENOSYS
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/xen.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index 2847b4f864..9d1daadee1 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -19,6 +19,7 @@
>   #include "standard-headers/xen/version.h"
>   #include "standard-headers/xen/memory.h"
>   #include "standard-headers/xen/hvm/hvm_op.h"
> +#include "standard-headers/xen/vcpu.h"
>   
>   static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
>                         bool is_write)
> @@ -194,6 +195,25 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit,
>       }
>   }
>   
> +static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
> +                                  int cmd, int vcpu_id, uint64_t arg)
> +{
> +    int err;
> +
> +    switch (cmd) {
> +    case VCPUOP_register_vcpu_info:
> +        /* no vcpu info placement for now */
> +        err = -ENOSYS;

Again, should this patch be deferred until we actually implement 
something useful here? I.e. folding it into the subsequent patch? It's 
not like the boilerplate is massive.

   Paul


