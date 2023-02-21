Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6269E635
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWik-0001lt-T8; Tue, 21 Feb 2023 12:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUWij-0001l4-00
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:46:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUWih-0004ap-D1
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677001586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTnVUzugBbqur6BqfZt1CtTDSK+k3vWZTQvUGOxv7wM=;
 b=XvdRjDs3fKcrmzz5olAfUYVgzcp8vFjzww41es4QBWa8nZTUTkCJeufKnS3Awdks0NFuDG
 fCH0Oeb8F6Oozb8rP8vwHvX7yKSultWnr5YN4aUQzUEj3l42g9pFZnJBIFQTJ6bpaYPofD
 WHQuPje8hVkUQYC1L2GAfKErZxTHymI=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-duE-f1Z6O9KV38l3E4JOmQ-1; Tue, 21 Feb 2023 12:46:25 -0500
X-MC-Unique: duE-f1Z6O9KV38l3E4JOmQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 f26-20020a056102151a00b004177ba1e3c6so1387678vsv.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677001584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTnVUzugBbqur6BqfZt1CtTDSK+k3vWZTQvUGOxv7wM=;
 b=UhcX5Bxw7+mbcbh4Dm1ZzP0MZu0oepeaxZZBIrp+1Gj2g4J/1byLPo/U04iZJm/l2M
 pvuH68hzg+gOj7VYW5UKdwNZG4FHpHJow3Xhflk9RnJWjwQ2HjaLtz0Zxf8V+gpZn/1n
 G+o/MlIDUnA1QbrZxtGBRwvH22+Aiud891+943h72BtE37D5gYjXwrmAs68zuKN41mQb
 ou+gsDA6NafIri6CGuxdrkZLQHUHShsYIYTTwHKrj9fUNDWBJ0pq8UBBoEMFM9eRwowz
 EPMnYgaEDSdrxnIbdPxEAuPi/kkOgmTTSkNQag9ZvEXCo6R2q8GkCZyD5+Ax9zaFGQ11
 3CQA==
X-Gm-Message-State: AO0yUKUaY2AYWwD/NjrsjI5Oi6MLHbuMR5aPAaWVAQt+57tJzpbYs8dN
 GwBAB6HuWwnGRnds5usfw/kmFy8hMBlo1ChhqqxqsiyRb9kEP9uIjTlM1Ig59XROB4hRw0u62l5
 AR1pW8t8STGB/t6Y=
X-Received: by 2002:a67:6102:0:b0:41e:b377:e18c with SMTP id
 v2-20020a676102000000b0041eb377e18cmr429064vsb.3.1677001584688; 
 Tue, 21 Feb 2023 09:46:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+U1n42pNbANb0O1B5Fcelavt+ifGRolTsrAnDKV30KiK4HVQGXCPVyeWt61sQLO93xJcvK4g==
X-Received: by 2002:a67:6102:0:b0:41e:b377:e18c with SMTP id
 v2-20020a676102000000b0041eb377e18cmr429035vsb.3.1677001584278; 
 Tue, 21 Feb 2023 09:46:24 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 21-20020a370415000000b0073b732803c4sm2553557qke.5.2023.02.21.09.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 09:46:23 -0800 (PST)
Date: Tue, 21 Feb 2023 12:46:22 -0500
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org,
 mst@redhat.com, cohuck@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, maz@kernel.org, zhenyzha@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH v1 3/6] kvm: Synchronize the backup bitmap in the last
 stage
Message-ID: <Y/UDbqyB2N/OWWi5@x1n>
References: <20230213003925.40158-1-gshan@redhat.com>
 <20230213003925.40158-4-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213003925.40158-4-gshan@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Feb 13, 2023 at 08:39:22AM +0800, Gavin Shan wrote:
> In the last stage of live migration or memory slot removal, the
> backup bitmap needs to be synchronized when it has been enabled.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  accel/kvm/kvm-all.c      | 11 +++++++++++
>  include/sysemu/kvm_int.h |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 01a6a026af..b5e12de522 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1352,6 +1352,10 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
>                   */
>                  if (kvm_state->kvm_dirty_ring_size) {
>                      kvm_dirty_ring_reap_locked(kvm_state, NULL);
> +                    if (kvm_state->kvm_dirty_ring_with_bitmap) {
> +                        kvm_slot_sync_dirty_pages(mem);
> +                        kvm_slot_get_dirty_log(kvm_state, mem);
> +                    }
>                  } else {
>                      kvm_slot_get_dirty_log(kvm_state, mem);
>                  }

IIUC after the memory atomic update changes lands QEMU, we may not need
this sync at all.

My understanding is that we sync dirty log here only because of non-atomic
updates happening in the past and we may lose dirty bits unexpectedly.
Maybe Paolo knows.

But that needs some more justification and history digging, so definitely
more suitable to leave it for later and separate discussion.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

> @@ -1573,6 +1577,12 @@ static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
>          mem = &kml->slots[i];
>          if (mem->memory_size && mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
>              kvm_slot_sync_dirty_pages(mem);
> +
> +            if (s->kvm_dirty_ring_with_bitmap && last_stage &&
> +                kvm_slot_get_dirty_log(s, mem)) {
> +                kvm_slot_sync_dirty_pages(mem);
> +            }
> +
>              /*
>               * This is not needed by KVM_GET_DIRTY_LOG because the
>               * ioctl will unconditionally overwrite the whole region.
> @@ -3701,6 +3711,7 @@ static void kvm_accel_instance_init(Object *obj)
>      s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
>      /* KVM dirty ring is by default off */
>      s->kvm_dirty_ring_size = 0;
> +    s->kvm_dirty_ring_with_bitmap = false;
>      s->notify_vmexit = NOTIFY_VMEXIT_OPTION_RUN;
>      s->notify_window = 0;
>  }
> diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
> index 60b520a13e..fdd5b1bde0 100644
> --- a/include/sysemu/kvm_int.h
> +++ b/include/sysemu/kvm_int.h
> @@ -115,6 +115,7 @@ struct KVMState
>      } *as;
>      uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
>      uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
> +    bool kvm_dirty_ring_with_bitmap;
>      struct KVMDirtyRingReaper reaper;
>      NotifyVmexitOption notify_vmexit;
>      uint32_t notify_window;
> -- 
> 2.23.0
> 

-- 
Peter Xu


