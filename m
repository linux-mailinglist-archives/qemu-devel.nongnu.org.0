Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CE43DAD9B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 22:31:29 +0200 (CEST)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Cgh-0002Nl-0w
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 16:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9CeL-0000xJ-FW
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9CeH-0002yE-Tt
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627590536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hdFAFOb5LX/btSalADYe/57ChocyOS2sx514uY74p9Q=;
 b=E78YeqnfjAZHuPr9DkOudcZDk1eLRqGq+JlTJIgjtMBTz4hihdC94LWu7gVIQCgO2ZOBoZ
 NjJiwFH4ZB2vbRdABPyxzF8JGsZh83AG9Hd8WAQqO/VN1pXK+cGXclIYH+RBnzBmvaGuqI
 H7cICmaeSsvJeTPION9t7/FPSQKaMmk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-npY5tnqDNTyL0WTY5p0MWQ-1; Thu, 29 Jul 2021 16:28:55 -0400
X-MC-Unique: npY5tnqDNTyL0WTY5p0MWQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 b9-20020a05620a1269b02903b8bd5c7d95so4439463qkl.12
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 13:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hdFAFOb5LX/btSalADYe/57ChocyOS2sx514uY74p9Q=;
 b=twoEICcAeAnhBxEEL8dbke3LqZ3jSI5R70ZF7X0N/nJWMpTwOXjrN9xzQ/BNQAWpoo
 la/jqbFE/C25KTUxS8k5UkxoHfJpYQR31mF6m3xqVf32UT1eIEC8ouYnqe5JaClPaz+F
 +FvW2OH8zSeZ+7B0mM/T4fZZB/CCVxPAeyVZRbv9UNsHzw1z5RhG7fJvwWkGPl/JGMTB
 KdGFUC2J9KvGK0k0ligyyOp+aBoU4L8B0/FhM9CdtW6MK2AltIkNseQjsDNsY8QEzsIe
 /KffIg3maqomO6tFTGwsaaIGOW9NRarCb2+vCJ/niB+r9RcXinfDgetmbvBSgNfE/Ft+
 33gA==
X-Gm-Message-State: AOAM531ZeVpk4HE4JEyI2cOa9vEZDRh6iNxZYYbKk1bV9tsLESO8QoDk
 hUdIxHgmX7siiHI1IQuHS8N9TskoBUEWpDDClCBJU87pF73/kxWaEUPElp/RBagI4WV4j1qGdBE
 GwRxYJc7nG5jyQCo=
X-Received: by 2002:a37:858:: with SMTP id 85mr7222049qki.70.1627590534858;
 Thu, 29 Jul 2021 13:28:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5dRJS0SfuOMsOZoH3d0BQnYsyWFZyoXxqIE585mhuVqx+/+ZleTzX24A67nCm0g3Q/jUT/g==
X-Received: by 2002:a37:858:: with SMTP id 85mr7222017qki.70.1627590534519;
 Thu, 29 Jul 2021 13:28:54 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id q8sm1753062qtn.42.2021.07.29.13.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:28:54 -0700 (PDT)
Date: Thu, 29 Jul 2021 16:28:52 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YQMPhOYfRWjLMGkW@t490s>
References: <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com>
 <YQG74AsEBE0uaN4U@t490s>
 <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com>
 <YQLTUIvrVe+TM/lw@t490s>
 <df5c7623-9986-d282-2ee9-eb28908d2994@redhat.com>
 <YQMCUHWuviDcIc+I@t490s>
 <cebb804b-4b85-8619-0fd0-7aad5a261384@redhat.com>
 <YQMI4HLsgnfsU/Wh@t490s>
 <a5551871-61ce-0cef-dfb1-7738b38d2be8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a5551871-61ce-0cef-dfb1-7738b38d2be8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 10:06:16PM +0200, David Hildenbrand wrote:
> On 29.07.21 22:00, Peter Xu wrote:
> > On Thu, Jul 29, 2021 at 09:39:24PM +0200, David Hildenbrand wrote:
> > > 
> > > > > In the meantime I adjusted the code but it does the clearing under the
> > > > > iothread lock, which should not be what we want ... I'll have a look.
> > > > 
> > > > Thanks; if it takes more changes than expected we can still start from simple,
> > > > IMHO, by taking bql and timely yield it.
> > > > 
> > > > At the meantime, I found two things in ram_init_bitmaps() that I'm not sure we
> > > > need them of not:
> > > > 
> > > >     1. Do we need WITH_RCU_READ_LOCK_GUARD() if with both bql and ramlist lock?
> > > >        (small question)
> > > 
> > > Good question, I'm not sure if we need it.
> > > 
> > > > 
> > > >     2. Do we need migration_bitmap_sync_precopy() even if dirty bmap is all 1's?
> > > >        (bigger question)
> > > 
> > > IIRC, the bitmap sync will fetch the proper dirty bitmap from KVM and set
> > > the proper bits in the clear_bitmap. So once we call
> > > migration_clear_memory_region_dirty_bitmap_range() etc. later we will
> > > actually clear dirty bits.
> > 
> > Good point, however.. then I'm wondering whether we should just init clear_bmap
> > to all 1's too when init just like dirty bmap. :)
> 
> Yes, but ... I'm not sure if we have to get the dirty bits into
> KVMSlot->dirty_bmap as well in order to clear them.

Yes, so far it's closely bound to kvm's dirty_bmap, so sounds needed indeed (in
kvm_slot_init_dirty_bitmap).

> 
> It could work with "manual_dirty_log_protect". For !manual_dirty_log_protect
> we might have to keep it that way ... which means we might have to expose
> some ugly details up to migration/ram.c .
> Might require some thought :)

We should make sure clear_log() hooks always work, so the memory api should be
able to call the memory region clear log api without knowing whether it's
enabled underneath in either kvm or other future clear_log() hooks.  KVM
currently should be fine as kvm_physical_log_clear() checks manual protect at
the entry, and it returns directly otherwise.  Thanks,

-- 
Peter Xu


