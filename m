Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031F66D8D4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:55:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHhjK-000564-0C; Tue, 17 Jan 2023 03:54:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHhj9-000558-VA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:53:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHhj6-0000Ln-Js
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:53:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673945631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW/l7F9ARKMJa7ObBRY2n+JZ0Emlv6BAfYOk2jYebyw=;
 b=gkOG7HJXv8YP2XQihNxADPPsu+Lvw7kRJYgzCvWxqPQgoTNqyWG9e+Bg/ZNpcMeu/biksW
 9lJjZtFnueJtX7FqlRgT4f7X4XZp1UMGwjKrYEpcw98sQVSztC+BJvJjV8NJXuWdxKMsLl
 rijDjrS+SA9B0JUHIjr6tMQOMlO6k7I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-p83bO1PCO4Oxc2ucE-fXfg-1; Tue, 17 Jan 2023 03:53:50 -0500
X-MC-Unique: p83bO1PCO4Oxc2ucE-fXfg-1
Received: by mail-qk1-f199.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so22407096qkl.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CW/l7F9ARKMJa7ObBRY2n+JZ0Emlv6BAfYOk2jYebyw=;
 b=ZJ2gddu4YPtxFuGTXf9MoR6n0lTf1j3mYUxqCY014vp2z0dIWS4TvGbv/4lemiOEcz
 FIpBbG4PObFt4FGc1HjOuA+ENMGH7dZpirP2ZOhkhyaxEfTxWWxuQBGU7G027ev3goCQ
 l9KfJE7fdoR2FIdYc+LF17UgRyARmFUHGHaElImkbDVH8ycdvXrTpA/KXjSNZMhwpMDZ
 MZEkSuiKOhH2H9P/0POJzfakj1kLpxfewvX0tYqBaoC4biW2D8ktaRXHidZtwiEU4qbp
 SPkCabTJct5P/2bcPj6eea3/h1lltDsbfSGRYHhLHUu48XnKQzyJp4LjnoBQEAONwCFi
 plwQ==
X-Gm-Message-State: AFqh2kq7mJl31mdpUpNMYbBK6uAsYsB0gSDNXrTGiyYMy8riXhQ0r3/2
 OoAMVrfXKhrQaZ03FAw8w5uDTkfZBtfqwoZwt4WEIsjA7RlItsY2Ot30B0RbIeDFr7vqMJgS0F2
 3TqcPSaWXmJqT510=
X-Received: by 2002:a05:622a:1e1b:b0:3b4:a6af:a2f2 with SMTP id
 br27-20020a05622a1e1b00b003b4a6afa2f2mr2829183qtb.34.1673945629945; 
 Tue, 17 Jan 2023 00:53:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvnAIMsQi+OvbNhjpc2J6lcMXyd/fnATReN4qPmwX673KKxpGwOV1WpR6ad8ZQ2x4ix22xN4A==
X-Received: by 2002:a05:622a:1e1b:b0:3b4:a6af:a2f2 with SMTP id
 br27-20020a05622a1e1b00b003b4a6afa2f2mr2829167qtb.34.1673945629691; 
 Tue, 17 Jan 2023 00:53:49 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 cr26-20020a05622a429a00b003a68fe872a5sm15599280qtb.96.2023.01.17.00.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 00:53:49 -0800 (PST)
Message-ID: <1ef3d781-e823-feb9-ce7d-f2f0c1456d9d@redhat.com>
Date: Tue, 17 Jan 2023 09:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/2] s390x/pv: Add support for asynchronous teardown
 for reboot
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: david@redhat.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 pasic@linux.ibm.com, nrb@linux.ibm.com, nsg@linux.ibm.com,
 seiden@linux.ibm.com
References: <20230105155019.72200-1-imbrenda@linux.ibm.com>
 <20230105155019.72200-3-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230105155019.72200-3-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05/01/2023 16.50, Claudio Imbrenda wrote:
> This patch adds support for the asynchronous teardown for reboot for
> protected VMs.
> 
> When attempting to tear down a protected VM, try to use the new
> asynchronous interface first. If that fails, fall back to the classic
> synchronous one.
> 
> The asynchronous interface involves invoking the new
> KVM_PV_ASYNC_DISABLE_PREPARE command for the KVM_S390_PV_COMMAND ioctl.
> 
> This will prepare the current protected VM for asynchronous teardown.
> Once the protected VM is prepared for teardown, execution can continue
> immediately.
> 
> Once the protected VM has been prepared, a new thread is started to
> actually perform the teardown. The new thread uses the new
> KVM_PV_ASYNC_DISABLE command for the KVM_S390_PV_COMMAND ioctl. The
> previously prepared protected VM is torn down in the new thread.
> 
> Once KVM_PV_ASYNC_DISABLE is invoked, it is possible to use
> KVM_PV_ASYNC_DISABLE_PREPARE again. If a protected VM has already been
> prepared and its cleanup has not started, it will not be possible to
> prepare a new VM. In that case the classic synchronous teardown has to
> be performed.
> 
> The synchronous teardown will now also clean up any prepared VMs whose
> asynchronous teardown has not been initiated yet.
> 
> This considerably speeds up the reboot of a protected VM; for large VMs
> especially, it could take a long time to perform a reboot with the
> traditional synchronous teardown, while with this patch it is almost
> immediate.
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   hw/s390x/pv.c              | 25 +++++++++++++++++++++++++
>   hw/s390x/s390-virtio-ccw.c |  5 ++++-
>   include/hw/s390x/pv.h      |  2 ++
>   3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 8dfe92d8df..3d1c529eb5 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -16,6 +16,7 @@
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/cpus.h"
>   #include "qom/object_interfaces.h"
>   #include "exec/confidential-guest-support.h"
>   #include "hw/s390x/ipl.h"
> @@ -107,6 +108,30 @@ void s390_pv_vm_disable(void)
>        s390_pv_cmd_exit(KVM_PV_DISABLE, NULL);
>   }
>   
> +static void *s390_pv_do_unprot_async_fn(void *p)
> +{
> +     s390_pv_cmd_exit(KVM_PV_ASYNC_CLEANUP_PERFORM, NULL);
> +     return NULL;
> +}
> +
> +bool s390_pv_vm_try_disable_async(void)
> +{
> +    QemuThread *t;
> +
> +    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
> +        return false;
> +    }
> +    if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
> +        return false;
> +    }
> +
> +    t = g_malloc0(sizeof(QemuThread));

Sorry for not noticing it in v1 already ... but isn't this leaking memory? 
Who's supposed to free "t" again?

  Thomas


> +    qemu_thread_create(t, "async_cleanup", s390_pv_do_unprot_async_fn, NULL,
> +                       QEMU_THREAD_DETACHED);
> +
> +    return true;
> +}


