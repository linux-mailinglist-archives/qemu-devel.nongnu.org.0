Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4306FD760
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:48:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdbb-00045D-B2; Wed, 10 May 2023 02:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdbX-000453-Sf
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:47:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdbW-0005Dv-8L
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683701233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Z1BxCEcXOqOqoliN67+YT+MzIXu2ogDwLXOyepDbYQ=;
 b=cFqAHgfIYeKRikOGuRRsTAcGGCx/I8S1E7Ayv5z5fFxvPn1t5/EOZ54F1LWoe/5EFH7i71
 BpsbataXQ7KFHRLI1VJMVNsmk5O77G7/8d2ODQjoSSmD86jtLYoPrgC5uIhxoc3IPG/p8t
 KdpOZkZMPnZkqFJuxCRkxj3oOIi+lz4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-Rta-zvTvMTuFI2hM3LHc6A-1; Wed, 10 May 2023 02:47:11 -0400
X-MC-Unique: Rta-zvTvMTuFI2hM3LHc6A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30633990a69so2303304f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683701230; x=1686293230;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Z1BxCEcXOqOqoliN67+YT+MzIXu2ogDwLXOyepDbYQ=;
 b=cRJhRKOSRvrx54tNOCziSV9OA7lkbP+U/pEn3my9+Ka+Cc3Bi8PSN2fo+XcWYd3rnl
 r4Dko3jC15Kk/CNz+VrWeJ+DzcoioLPMfs6bzOPdn+uZ6/8SDDi35Eis0W15vpXtu38u
 JkcEdm56BfINTlYCGc4ieQov2fQhtQx0qqU5QCozjiYBEyhGq7ukFe9Z7rtQOxm75tBX
 U0R2ZvaUzrpR/LPOTs/XdzT17sFAwWBFtFS59p7i6P6Tsd6gta3yPn2tMU4UdQx8E/ZH
 Px8hd1RAYU3iviga5IjacnmvRlodAuIMxZP6x/09hJD57hUsxGplCCzk7ncGI7SDJEKG
 HUmQ==
X-Gm-Message-State: AC+VfDw42Nk8PvyBIBUVqEaS0eTrJ7J/jZE77M1JGI4mxfTJkbQN1gNK
 QsjM1ahgNViluxmvG4PsbdVJfMKg+xnSLUQOE2NdIslzK3yVTbixEhjsfTev7aSKdioweZxraRc
 Lkv9L6kNSytgdMt0=
X-Received: by 2002:a05:6000:1284:b0:306:34d6:6dfc with SMTP id
 f4-20020a056000128400b0030634d66dfcmr12076298wrx.37.1683701230174; 
 Tue, 09 May 2023 23:47:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5JdKmvVAcGKnEkOT4O0gCoiBOtLqGaUDvmX/SLYHq2CRaGnJQq2la2DAXhVEKmW3gJjMF/mA==
X-Received: by 2002:a05:6000:1284:b0:306:34d6:6dfc with SMTP id
 f4-20020a056000128400b0030634d66dfcmr12076282wrx.37.1683701229841; 
 Tue, 09 May 2023 23:47:09 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b002cea9d931e6sm16329255wrp.78.2023.05.09.23.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 23:47:09 -0700 (PDT)
Message-ID: <e2f59e7e-e5d5-0bc3-e889-e84460ca99d6@redhat.com>
Date: Wed, 10 May 2023 08:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, nsg@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 mhartmay@linux.ibm.com
References: <20230509162740.58081-1-imbrenda@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230509162740.58081-1-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 09/05/2023 18.27, Claudio Imbrenda wrote:
> When rebooting a small VM using asynchronous teardown, a spurious
> warning is emitted when the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl fails.

Why does the _PREPARE fail in that case? Why 4GiB and not more or less? This 
sounds racy... what if you have a faster or slower machine?

> Avoid using asynchronous teardown altogether when the VM is small
> enough; the cutoff is set at 4GiB. This will avoid triggering the
> warning and also avoid pointless overhead; normal teardown is fast
> enough for small VMs.
> 
> Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> Fixes: c3a073c610 ("s390x/pv: Add support for asynchronous teardown for reboot")
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>   hw/s390x/pv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 49ea38236c..17c5556319 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -13,6 +13,7 @@
>   
>   #include <linux/kvm.h>
>   
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "sysemu/kvm.h"
> @@ -117,13 +118,16 @@ static void *s390_pv_do_unprot_async_fn(void *p)
>   
>   bool s390_pv_vm_try_disable_async(void)
>   {
> +    MachineState *machine = MACHINE(qdev_get_machine());

The calling function (s390_machine_unprotect()) already has a 
S390CcwMachineState as parameter ... so you could pass along that value to 
avoid the qdev_get_machine() here.

>       /*
>        * t is only needed to create the thread; once qemu_thread_create
>        * returns, it can safely be discarded.
>        */
>       QemuThread t;
>   
> -    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
> +    /* Avoid the overhead of asynchronous teardown for small machines */
> +    if ((machine->maxram_size < 4 * GiB) ||
> +        !kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
>           return false;
>       }
>       if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {

  Thomas


