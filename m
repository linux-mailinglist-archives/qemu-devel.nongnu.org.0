Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079F9687CBF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYB2-0001ie-Cf; Thu, 02 Feb 2023 06:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYB0-0001iW-Ly
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYAz-000473-5X
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338888;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yah13/2NRmcQIPjN8X4XJeykQGQNxraB7/H7WfcboM8=;
 b=CPUgKsdzIqcY04NyTTIksPgCz1ong9VtJox6tZ4GnbWFhs7G8kj48S61+pWmzzG40H1XhX
 K22YOeEmgibHs0DRXDAtu4xRhxxmGZ3LhCGxnMEMLH9JG0ZM2G+NiDamcRNAb6YIPfUwfC
 HOoH+egXS4NVMSldn1zmYvZxOR6yZJ4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-UPkJMF8qNV2WzTiy8zPcsA-1; Thu, 02 Feb 2023 06:54:47 -0500
X-MC-Unique: UPkJMF8qNV2WzTiy8zPcsA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso874086wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yah13/2NRmcQIPjN8X4XJeykQGQNxraB7/H7WfcboM8=;
 b=gzakzlNGQ0Igz7CezarN4UjpmKbLxDYGWcHYzeUxt9nk0uxZgUoyo5mBTQcfsXQ5KV
 WAvCbLu3a9NgwTgc/A0Z+OyLFMBc7ECB5vpW5E1fxU0nTDZo3bKXrUumsywXqmzOpBfg
 4BiTkLEITOo0nt2ljjoriUuGe7Z5IfYg61vImLz32DH2tT1kkiAn9GKAQOFgRUPZzVUi
 H7z4v/YDljB/vtYu5BRerdMBEo+F4+9Km6LjXUbJPQm4qkgMsnVTJa7hO6jTxA7Is8wC
 CIIf/InhfKOGVwO2I6Adc14sJDLME0ecDVu5kDz91Iputl1VAZj28kko8bqEs0/OBCLV
 Vv0g==
X-Gm-Message-State: AO0yUKX0B/D6Ugu6Uvj5j7XDXbolJvjwbmVBkOdzBV9YMNzg35Pgl1qN
 jV73/bWr1FfYI5yoZ9vb3idZLHdpLPwYjQmmvQIZIj2HaKX0UcqIhLck8mkh/al0sfyDtwtEY0t
 aBiPibk9cdXgk60U=
X-Received: by 2002:a5d:6501:0:b0:2c2:de2b:e7cd with SMTP id
 x1-20020a5d6501000000b002c2de2be7cdmr5916028wru.50.1675338886251; 
 Thu, 02 Feb 2023 03:54:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8kR9Ig7UGTf/Lf36M8X/vYGS3skr/eK+ajontY97AnCQm7IAXiljrL+O5RbPL9eQpkgCMWsw==
X-Received: by 2002:a5d:6501:0:b0:2c2:de2b:e7cd with SMTP id
 x1-20020a5d6501000000b002c2de2be7cdmr5916012wru.50.1675338886047; 
 Thu, 02 Feb 2023 03:54:46 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056000180300b002755e301eeasm19794148wrh.100.2023.02.02.03.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:54:44 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 7/8] virtio-mem: Migrate immutable properties early
In-Reply-To: <20230117112249.244096-8-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:48 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-8-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:54:43 +0100
Message-ID: <87h6w4nuyk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

David Hildenbrand <david@redhat.com> wrote:
> The bitmap and the size are immutable while migration is active: see
> virtio_mem_is_busy(). We can migrate this information early, before
> migrating any actual RAM content. Further, all information we need for
> sanity checks is immutable as well.
>
> Having this information in place early will, for example, allow for
> properly preallocating memory before touching these memory locations
> during RAM migration: this way, we can make sure that all memory was
> actually preallocated and that any user errors (e.g., insufficient
> hugetlb pages) can be handled gracefully.
>
> In contrast, usable_region_size and requested_size can theoretically
> still be modified on the source while the VM is running. Keep migrating
> these properties the usual, late, way.
>
> Use a new device property to keep behavior of compat machines
> unmodified.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 616f3a207c..29b57f6448 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -41,7 +41,9 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "qom/object_interfaces.h"
>  
> -GlobalProperty hw_compat_7_2[] = {};
> +GlobalProperty hw_compat_7_2[] = {
> +    { "virtio-mem", "x-early-migration", "false" },
> +};

We can stop prettending that we don't support this kind of properties O:-)


