Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CD687BC6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXV6-0004Yb-Jv; Thu, 02 Feb 2023 06:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNXV0-0004RR-4r
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:11:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pNXUu-00022A-OK
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jgXOPo4A9Htaj/+foy0ZD+KO6C8dRYaIw4VwkQT2EWA=;
 b=VXRtATTSomCpbArAUbvRWvfDWjAJ03MbHss5xXZScDEaXy4Ouzfo7ea4Rd21UF6APXnekn
 s+m8Swefkd4MA4Oi/NfpwkZwyizdk+QhzyI3E3/zfa6SLE+N6Yt1ZaeXySLHxoYV9UqPMV
 hYeMSUaE5s1PBDh2O1tyKHzXIqHH6KU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-FwUkpZqcP3KiN_6OKMhuAA-1; Thu, 02 Feb 2023 06:11:17 -0500
X-MC-Unique: FwUkpZqcP3KiN_6OKMhuAA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o31-20020a05600c511f00b003dc53da325dso2641454wms.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgXOPo4A9Htaj/+foy0ZD+KO6C8dRYaIw4VwkQT2EWA=;
 b=fOzEc+s3+dxKNuO2XMoJJJb1tyubu1F2FqTNpg9t+UopzPs4mb630raZmcWLVXb+/m
 AgZstv8qSNahnIQxTWhAySYeE6X6/dSascaPZKmVybZk6TLu2FDNwvxtEQmM5QXmzhaq
 jJamJeBBj8qaWl3D/5d7pm9Lt/SQbFcWPNm7xvznM0jXgnDOcDUgD6YL/CnXGAJXU6nO
 0yXFvhxrekNmeyQB6RkBzRJ14RjRraRZnAOt13CmIdQdjNHOzDZqR1XYoucSd8cglOvJ
 J4gkpRGHpJaGb4ioMEnNc199LVrOVs+tSz1zmDrFHjv4tf3vfqZ8vRHcc6XM4EgTk3wp
 hQfg==
X-Gm-Message-State: AO0yUKUIX7d7hjcKKJVu3MPxF86EzB0oAi29tdQqcYBC8LvFoYUz5Ugt
 ChETH9QfuXu4KueM/SGBswJVJ6qV4HX2jsEf1VxcpTYpQE7OKcbf7Wsr0DFyiX6IiIPh8mgY/vR
 yzv4G4HCGqQD0uXg=
X-Received: by 2002:a05:600c:600c:b0:3db:1afd:ac36 with SMTP id
 az12-20020a05600c600c00b003db1afdac36mr5909929wmb.32.1675336276682; 
 Thu, 02 Feb 2023 03:11:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+pKVCF/PNM3eaK1SxkiNKutvOd4oL9LaqSLHrRLyGnx651t8oDLGI4h4NU+9barDa2sVSYZw==
X-Received: by 2002:a05:600c:600c:b0:3db:1afd:ac36 with SMTP id
 az12-20020a05600c600c00b003db1afdac36mr5909910wmb.32.1675336276471; 
 Thu, 02 Feb 2023 03:11:16 -0800 (PST)
Received: from redhat.com ([2a02:14f:1fc:826d:55d8:70a4:3d30:fc2f])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c158900b003dc4ecfc4d7sm4181629wmf.29.2023.02.02.03.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:11:15 -0800 (PST)
Date: Thu, 2 Feb 2023 06:11:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 0/8] virtio-mem: Handle preallocation with migration
Message-ID: <20230202061102-mutt-send-email-mst@kernel.org>
References: <20230117112249.244096-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117112249.244096-1-david@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Tue, Jan 17, 2023 at 12:22:41PM +0100, David Hildenbrand wrote:
> While playing with migration of virtio-mem with an ordinary file backing,
> I realized that migration and prealloc doesn't currently work as expected
> for virtio-mem. Further, Jing Qi reported that setup issues (insufficient
> huge pages on the destination) result in QEMU getting killed with SIGBUS
> instead of failing gracefully.
> 
> In contrast to ordinary memory backend preallocation, virtio-mem
> preallocates memory before plugging blocks to the guest. Consequently,
> when migrating we are not actually preallocating on the destination but
> "only" migrate pages. Fix that be migrating the bitmap early, before any
> RAM content, and use that information to preallocate memory early, before
> migrating any RAM.
> 
> Postcopy needs some extra care, and I realized that prealloc+postcopy is
> shaky in general. Let's at least try to mimic what ordinary
> prealloc+postcopy does: temporarily allocate the memory, discard it, and
> cross fingers that we'll still have sufficient memory when postcopy
> actually tries placing pages.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> v4 -> v5:
> - "migration/savevm: Move more savevm handling into vmstate_save()"
> -- Extended patch description regarding tracing
> - "migration/savevm: Prepare vmdesc json writer in
>    qemu_savevm_state_setup()"
> -- Move freeing to migrate_fd_cleanup()
> - "migration/savevm: Allow immutable device state to be migrated early (i.e.,
>     before RAM)"
> -- "immutable" -> "early_setup"
> -- Extend comment
> - Added some RBs (thanks!)
> 
> v3 -> v4:
> - First 3 patches:
> -- Minimze code changes and simplify
> -- Save immutable device state during qemu_savevm_state_setup()
> -- Don't use vmsd priorities, use a new flag
> -- Split it logically up
> - "migration/ram: Factor out check for advised postcopy"
> -- Don't factor out postcopy_is_running()
> - "virtio-mem: Migrate immutable properties early"
> -- Adjust to changed vmsd interface
> - "virtio-mem: Proper support for preallocation with migration"
> -- Drop sanity check in virtio_mem_post_load_early()
> 
> v2 -> v3:
> - New approach/rewrite, drop RB and TB of last patch
> 
> v1 -> v2:
> - Added RBs and Tested-bys
> - "virtio-mem: Fail if a memory backend with "prealloc=on" is specified"
> -- Fail instead of warn
> -- Adjust subject/description
> 
> 
> David Hildenbrand (8):
>   migration/savevm: Move more savevm handling into vmstate_save()
>   migration/savevm: Prepare vmdesc json writer in
>     qemu_savevm_state_setup()
>   migration/savevm: Allow immutable device state to be migrated early
>     (i.e., before RAM)
>   migration/vmstate: Introduce VMSTATE_WITH_TMP_TEST() and
>     VMSTATE_BITMAP_TEST()
>   migration/ram: Factor out check for advised postcopy
>   virtio-mem: Fail if a memory backend with "prealloc=on" is specified
>   virtio-mem: Migrate immutable properties early
>   virtio-mem: Proper support for preallocation with migration
> 
>  hw/core/machine.c              |   4 +-
>  hw/virtio/virtio-mem.c         | 144 ++++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-mem.h |   8 ++
>  include/migration/misc.h       |   4 +-
>  include/migration/vmstate.h    |  28 ++++++-
>  migration/migration.c          |   9 +++
>  migration/migration.h          |   4 +
>  migration/ram.c                |   8 +-
>  migration/savevm.c             | 105 +++++++++++++-----------
>  9 files changed, 255 insertions(+), 59 deletions(-)
> 
> -- 
> 2.39.0


