Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FED44207B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:06:05 +0100 (CET)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcdA-0006Rd-6S
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhbp7-000316-Ot
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhbp1-0004KY-MB
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635790454;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=7R/kR14X8PsFo0l9pBTljKkTXvjKsWSfMcXjFKYkg4Q=;
 b=NWF0s9bZOoECvt7VTsJQWvCau5PK6otLe/RT9uIIfa73cfLlTGM0em0/0oDltevI8OvrxG
 +zpFjRiQMfMSM9mkXJAcYdrV1xCQth1kkta2WUE+g7dO3XZbxc0UuZK7aDO4MVWR+vtGDd
 il4ohujWeGDfijcbK5TBL6AxF5dMyhk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-Or_Fo9rLPBmEQrFF4dBERg-1; Mon, 01 Nov 2021 14:14:13 -0400
X-MC-Unique: Or_Fo9rLPBmEQrFF4dBERg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso3675031wrj.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=7R/kR14X8PsFo0l9pBTljKkTXvjKsWSfMcXjFKYkg4Q=;
 b=mV4t3OXwAZOKAObnu9yvwDTsZSHfGg0j6Ig3vFnJEHKi1A7FKf6KP24m8vzwySgBts
 xNcIG5lEyiQzy6g5Vx5RkN7z7eNFIJqMtWI09UmHI8+V0vK9jSyKndeGnr+1zNzmBUDK
 XNMzQkIn6X60X+IuQzltqjmlXq/RkUch3h9VSL/XarkP3F9PqAsqCw7+3jOMYQqPTEfB
 z1ANImUGSVh8bXKIVCNxoF3Ry42+JPRZnd+1wCWjn9MiU3znwpUqKNybonX+pFp1QlBW
 1QwZ7SNfymFPnNPFBVPSTY1ue23Cvfur0BklsOdreFxU/1OvrVR5rItiIystWHJPmPJn
 0vcg==
X-Gm-Message-State: AOAM532/hLRbYaoE9n9lYFuErBInKxvMvCbO68KrYa3vEQQFby1qj4ez
 LKpUw+2p7HmxdxDV56jbAEQORk1IBQ9fPykmmxQh10tLvsvlgkfC6GKDSvt8lUt1z0FVy1tAvYb
 fzRPEV5fE+dcwJwo=
X-Received: by 2002:a05:600c:5101:: with SMTP id
 o1mr565352wms.81.1635790451915; 
 Mon, 01 Nov 2021 11:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRG9BpatwRwL3zAYC6yTQkZivcVZV1SOXvg2CuwDixQb8jqPEkL6+gJXeQCS55FqDha7GidQ==
X-Received: by 2002:a05:600c:5101:: with SMTP id
 o1mr565328wms.81.1635790451648; 
 Mon, 01 Nov 2021 11:14:11 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id n32sm242579wms.1.2021.11.01.11.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:14:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/9] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on the migration source
In-Reply-To: <20211011175346.15499-5-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:41 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-5-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 19:14:09 +0100
Message-ID: <8735ofu4jy.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> wrote:
> We don't want to migrate memory that corresponds to discarded ranges as
> managed by a RamDiscardManager responsible for the mapped memory region of
> the RAMBlock. The content of these pages is essentially stale and
> without any guarantees for the VM ("logically unplugged").
>
> Depending on the underlying memory type, even reading memory might populate
> memory on the source, resulting in an undesired memory consumption. Of
> course, on the destination, even writing a zeropage consumes memory,
> which we also want to avoid (similar to free page hinting).
>
> Currently, virtio-mem tries achieving that goal (not migrating "unplugged"
> memory that was discarded) by going via qemu_guest_free_page_hint() - but
> it's hackish and incomplete.
>
> For example, background snapshots still end up reading all memory, as
> they don't do bitmap syncs. Postcopy recovery code will re-add
> previously cleared bits to the dirty bitmap and migrate them.
>
> Let's consult the RamDiscardManager after setting up our dirty bitmap
> initially and when postcopy recovery code reinitializes it: clear
> corresponding bits in the dirty bitmaps (e.g., of the RAMBlock and inside
> KVM). It's important to fixup the dirty bitmap *after* our initial bitmap
> sync, such that the corresponding dirty bits in KVM are actually cleared.
>
> As colo is incompatible with discarding of RAM and inhibits it, we don't
> have to bother.
>
> Note: if a misbehaving guest would use discarded ranges after migration
> started we would still migrate that memory: however, then we already
> populated that memory on the migration source.
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


