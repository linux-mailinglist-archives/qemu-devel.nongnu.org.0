Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E33D7581
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:03:58 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MkX-0000BY-O9
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8Mhs-0006mQ-Hl
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8Mhj-0007vn-D5
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 09:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627390862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lA4gtcBLcxsLEIOjG9L6Yuek76+IFtuBB4zW12Wd18M=;
 b=Ta+dCDykM/RWTRhZKwS/m8p4rKHWOVIOd613x9Dl1nGJLkFUBgL8Pn+bOuaMBkeGyAtstA
 rliVe8QxxAaiUa4fgfzzSECjFIr5UYehjQGPcAR1E/WoTMTFc9gBJs7u/PRIeT25Wq8ptB
 2TSsUptW1oyNnRMylqLduyh8laBl++k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-UL9zn9dXNmidDjMW_CPbWQ-1; Tue, 27 Jul 2021 09:01:01 -0400
X-MC-Unique: UL9zn9dXNmidDjMW_CPbWQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 132-20020a1c018a0000b029025005348905so1332291wmb.7
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 06:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lA4gtcBLcxsLEIOjG9L6Yuek76+IFtuBB4zW12Wd18M=;
 b=olJ2PUBQrveHwdaNuqkfj6TX+sN8op1FInDtYrWUTWKKu8psd4qSUJ8WMrY/VYuBxf
 2GK3BteS5KgGtvhvuaT0sVKBIJb5Jp9Tq38MWbHLWqMfCUUKkLikPSfYFfMFco+3qYa6
 4pHJWIBlHOjG1DheOyOR/FOIeP4p2Pinj4TXlMcRTYyjmpp3j1a7SkdVlSmst9Ryd7DS
 J1ndJRuT7q5qXSkJYcFhdwBCFdJi452EtqRN2h7poUlYPEUMKs3NMU/HXB6R2uyEGXrH
 /ledR1l0sGuEvf03fLfZ/C3W5jr9PINAW29Oi+iUuC60zbu2Ll9JNxdUQtL4El6oawt9
 142A==
X-Gm-Message-State: AOAM530TxVj42uvLy3xUWhaDhwwfZM0h8G+0mC7OT5ws8DYx8/KxvwGL
 0lI5cT1FKFuE6J3d8PXkIuu4Drw5tab7XLmI4DtwrmYaHwHRbOLcqgBf+0l0zCI1KtV3ZAz4Qu7
 0+McQcuTAubdsx/A=
X-Received: by 2002:a5d:6304:: with SMTP id i4mr24955872wru.406.1627390859768; 
 Tue, 27 Jul 2021 06:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBo37zNkH602yluWo+25bEtx4AUMTM5Cdah99a8j2Gi2B8XCKVK9beTaOsPzP87rT6gm6dzw==
X-Received: by 2002:a5d:6304:: with SMTP id i4mr24955848wru.406.1627390859547; 
 Tue, 27 Jul 2021 06:00:59 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c36.dip0.t-ipconnect.de. [79.242.60.54])
 by smtp.gmail.com with ESMTPSA id
 l41sm3386007wmp.23.2021.07.27.06.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 06:00:59 -0700 (PDT)
Subject: Re: [PATCH v2 8/9] memory: Assert on no ongoing memory transaction
 before release BQL
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-9-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <fe9732a2-8e04-d09a-e5f4-c8080e129b8f@redhat.com>
Date: Tue, 27 Jul 2021 15:00:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-9-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 21:34, Peter Xu wrote:
> Make sure we don't have any more ongoing memory transaction when releasing the
> BQL.  This will trigger an abort if we misuse the QEMU memory model, e.g., when
> calling run_on_cpu() during a memory commit.

... or pause_all_vcpus() during a memory transaction :)

> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   include/exec/memory-internal.h | 1 +
>   softmmu/cpus.c                 | 2 ++
>   softmmu/memory.c               | 6 ++++++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
> index 9fcc2af25c..3124b91c4b 100644
> --- a/include/exec/memory-internal.h
> +++ b/include/exec/memory-internal.h
> @@ -35,6 +35,7 @@ static inline AddressSpaceDispatch *address_space_to_dispatch(AddressSpace *as)
>   
>   FlatView *address_space_get_flatview(AddressSpace *as);
>   void flatview_unref(FlatView *view);
> +bool memory_region_has_pending_transaction(void);
>   
>   extern const MemoryRegionOps unassigned_mem_ops;
>   
> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> index 6085f8edbe..14a50289f8 100644
> --- a/softmmu/cpus.c
> +++ b/softmmu/cpus.c
> @@ -31,6 +31,7 @@
>   #include "qapi/qapi-events-run-state.h"
>   #include "qapi/qmp/qerror.h"
>   #include "exec/gdbstub.h"
> +#include "exec/memory-internal.h"
>   #include "sysemu/hw_accel.h"
>   #include "exec/exec-all.h"
>   #include "qemu/thread.h"
> @@ -68,6 +69,7 @@ static QemuMutex qemu_global_mutex;
>   
>   static void qemu_mutex_unlock_iothread_prepare(void)
>   {
> +    assert(!memory_region_has_pending_transaction());
>   }
>   
>   bool cpu_is_stopped(CPUState *cpu)
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index dfce4a2bda..08327c22e2 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -176,6 +176,12 @@ static bool memory_region_has_pending_update(void)
>       return memory_region_update_pending || ioeventfd_update_pending;
>   }
>   
> +bool memory_region_has_pending_transaction(void)
> +{
> +    return memory_region_transaction_depth ||
> +        memory_region_has_pending_update();
> +}
> +
>   static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
>                                              MemoryRegionIoeventfd *b)
>   {
> 

LGTM

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


