Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74CB66DA57
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:53:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHiee-000628-Cn; Tue, 17 Jan 2023 04:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHieR-0005um-JC
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:53:10 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHieP-00085H-0o
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:53:06 -0500
Received: by mail-wr1-x42b.google.com with SMTP id k8so15473932wrc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YDxj8tP1pln8E7iR7HRQdKtoCWdxckFfnG5Tx2uAyhE=;
 b=HPTPh4S5voBK4wHMdsrs1iFglPl/ygnaayH7aMgM9pwyIZQslrXaYUBhL313LUUIgD
 efzz4luitpM8ZfoMHTMDL2P81mQJ2yNaGl3kKpbJMi2+a3ad2g7dxglm8ohPyfek2mc2
 636uV+7tayFfNMJXOqY4y+zG7UvFlBf81csP/2N5Tnbna476h8SA2U9wiBB/LsYdyknN
 uB8dtRzdpz4aaE8xXMDa/QSriG+7+Y/CoDWvmWzF9+z3ae4IxrEEUM/tD2iPns983p+q
 Je4ApJcMEQ3zH+I/kXVRCIpLhmkxI5gIK7UcUkZ6SMwPmmYW0QvxWMO+YT9yvA0qr3eF
 R3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YDxj8tP1pln8E7iR7HRQdKtoCWdxckFfnG5Tx2uAyhE=;
 b=SBlRYr1isAxUS7Fv2F3huZXk5hg6OjuCpWbExpgQcys/QZLrpAOXmGXsgJFM/ePpqy
 qjX5s/QElI2Rw5ZCFQE4oTYCOazl9rhWhaupShs2MHMKxJ0YR+QDlmeBoYGw+AaGbsRt
 ioZ6wZ8FC7KD7H1bkfmjp0Hbg15rSA9Thtn2umbK0Sm+NqmZFYdNtHEPHv6DByY5lg7g
 iLmK/a8npXksxhvxtrLYjnVo9Af8M2VQ/Tb3ZaMuMZUxRVKvSYBSacTEk3l04O6/WUzT
 2N6K9NCaZ8M4r1PCxLM0iOrcRdOHahRGeFJk97kesHsoZpMw2Hh+YV2WIkVdnK0/bWA2
 toSw==
X-Gm-Message-State: AFqh2kq7sQfqXlkuUTb9YnSbpjP/WZz/4eWxx2O5eLhdu4lJMwA0+ZR2
 pYcJ+cj+n53Wshs8sFiwJwU=
X-Google-Smtp-Source: AMrXdXu/LEtY8qtNhpqA5ed8lze4WLlzFy2RTlarYB4+0SnvxsfCcu8WjmkjiPP8LUGnClnF/mvDbQ==
X-Received: by 2002:a5d:5b0e:0:b0:250:22e4:b89e with SMTP id
 bx14-20020a5d5b0e000000b0025022e4b89emr2559078wrb.65.1673949182915; 
 Tue, 17 Jan 2023 01:53:02 -0800 (PST)
Received: from [192.168.8.108] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 bu9-20020a056000078900b002be1dcb6efbsm1601341wrb.9.2023.01.17.01.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 01:53:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <768b351e-8e24-b0f1-9bc7-7467a671feae@xen.org>
Date: Tue, 17 Jan 2023 09:53:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 23/51] i386/xen: implement HYPERVISOR_event_channel_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116215805.1123514-24-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230116215805.1123514-24-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/01/2023 21:57, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> Additionally set XEN_INTERFACE_VERSION to most recent in order to
> exercise the "new" event_channel_op.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Ditch event_channel_op_compat which was never available to HVM guests]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/xen-emu.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Reviewed-by: Paul Durrant <paul@xen.org>

... with one observation...

> 
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index b0ff03dbeb..686e5dfd38 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -27,6 +27,7 @@
>   #include "standard-headers/xen/memory.h"
>   #include "standard-headers/xen/hvm/hvm_op.h"
>   #include "standard-headers/xen/vcpu.h"
> +#include "standard-headers/xen/event_channel.h"
>   
>   #include "xen-compat.h"
>   
> @@ -585,6 +586,27 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>       return true;
>   }
>   
> +static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
> +                                    int cmd, uint64_t arg)
> +{
> +    int err = -ENOSYS;
> +
> +    switch (cmd) {
> +    case EVTCHNOP_init_control:
> +	case EVTCHNOP_expand_array:
> +	case EVTCHNOP_set_priority:

Indentation looks wrong here.

> +        /* We do not support FIFO channels at this point */
> +        err = -ENOSYS;
> +        break;
> +
> +    default:
> +        return false;
> +    }
> +
> +    exit->u.hcall.result = err;
> +    return true;
> +}


