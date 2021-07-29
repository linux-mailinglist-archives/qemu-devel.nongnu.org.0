Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47473DAC58
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 22:02:24 +0200 (CEST)
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9CEZ-0008WU-7s
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 16:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9CCy-0007IP-Fa
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m9CCu-0000P7-Oq
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 16:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627588838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8t5O3nECuBPMNCvPwHFzPGVaRPKnW6FRtg3Tyf2SzvI=;
 b=KGTcZDW2LdHuxoOw2015xQyMukmpQMw1GF2jzbrEFCAF/37Iw+lKJjVp+cA7TeViYbeme0
 oXJsPXvDFBbrMo6X+1RjE1DRNpOwiEGUwrv/weXgjrr2oQSHbGROnQnJGfPZFOTYuZ81kV
 zQ0vPXUdJv5pB28FGLtNdbAottKWfdA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-AbQuufbyNYyOVMMz0IkXPQ-1; Thu, 29 Jul 2021 16:00:35 -0400
X-MC-Unique: AbQuufbyNYyOVMMz0IkXPQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 f19-20020ac846530000b02902682e86c382so3256897qto.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 13:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8t5O3nECuBPMNCvPwHFzPGVaRPKnW6FRtg3Tyf2SzvI=;
 b=TBzVMsGxQZoEbKjHclXBM9WkypK2QdiLMGWPAPCZUjVMMARk7rVpIq+WQfaVtirQty
 VOQbYq0izpqFm0UjLhYE3MIZRqi5h5ydVfLVowOdnIX7cWhsOylJ2ok7ZIKnFnkXNYhx
 mY7tWQwa3Z8BbqklYH9BMvv0JigKefNXpxyTosOsIzYhIn930RR4BrcGOxmndwczLC7Y
 /9zmLgsuW1xly0TQXTLciFDrTU0wvtDX+/2Fp+FudYRiH7T/swJYUBS0LAr9LfI2+/Q/
 qzAjM6ygMe5rWP3Chbtzhf46Fa20ThmcLi/VAzJ38/kJ4NC+T8v/0+TrZ5HE4EiAjoO/
 c8Nw==
X-Gm-Message-State: AOAM531pQfl3iDtnrYKR8unv1RN4JM/5iMTkkSXhESo+fjfgycuO7Hm0
 OOlCxHS9dUIolpE1sUWtld+viP54NAP4wVNpgAdo3s5MT3g1x9Ams89zJIBdkpJW1NdLxuuGNm1
 Lm9PUpdYc0zvLFVk=
X-Received: by 2002:a05:620a:15f6:: with SMTP id
 p22mr7026731qkm.469.1627588834693; 
 Thu, 29 Jul 2021 13:00:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/OInRGT/mZpd1QbaGu1tmkv5EJ7/yNWonw6uqLKVfJXc1B0pUGh2woDjRnDLFMiePVlDUyQ==
X-Received: by 2002:a05:620a:15f6:: with SMTP id
 p22mr7026693qkm.469.1627588834394; 
 Thu, 29 Jul 2021 13:00:34 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i24sm2318546qki.61.2021.07.29.13.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:00:33 -0700 (PDT)
Date: Thu, 29 Jul 2021 16:00:32 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YQMI4HLsgnfsU/Wh@t490s>
References: <YQA+CUCWV4YDdu9C@t490s>
 <74271964-c481-7168-2a70-ea9eb5067450@redhat.com>
 <YQGzLl9IHod5rJRb@t490s>
 <b54cab91-87a6-298c-e527-0f75f8c38c74@redhat.com>
 <YQG74AsEBE0uaN4U@t490s>
 <a1c80a40-2828-3373-c906-870f0dbb6db8@redhat.com>
 <YQLTUIvrVe+TM/lw@t490s>
 <df5c7623-9986-d282-2ee9-eb28908d2994@redhat.com>
 <YQMCUHWuviDcIc+I@t490s>
 <cebb804b-4b85-8619-0fd0-7aad5a261384@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cebb804b-4b85-8619-0fd0-7aad5a261384@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Jul 29, 2021 at 09:39:24PM +0200, David Hildenbrand wrote:
> 
> > > In the meantime I adjusted the code but it does the clearing under the
> > > iothread lock, which should not be what we want ... I'll have a look.
> > 
> > Thanks; if it takes more changes than expected we can still start from simple,
> > IMHO, by taking bql and timely yield it.
> > 
> > At the meantime, I found two things in ram_init_bitmaps() that I'm not sure we
> > need them of not:
> > 
> >    1. Do we need WITH_RCU_READ_LOCK_GUARD() if with both bql and ramlist lock?
> >       (small question)
> 
> Good question, I'm not sure if we need it.
> 
> > 
> >    2. Do we need migration_bitmap_sync_precopy() even if dirty bmap is all 1's?
> >       (bigger question)
> 
> IIRC, the bitmap sync will fetch the proper dirty bitmap from KVM and set
> the proper bits in the clear_bitmap. So once we call
> migration_clear_memory_region_dirty_bitmap_range() etc. later we will
> actually clear dirty bits.

Good point, however.. then I'm wondering whether we should just init clear_bmap
to all 1's too when init just like dirty bmap. :)

Besides: let's not be affected with these details as they should be more
suitable to be handled separately; maybe I'll follow this up.  It could be a
place to discuss things, but shouldn't be a burden to block this series.

Thanks,

-- 
Peter Xu


