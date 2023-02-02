Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C70687CC2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYCW-0002V3-6n; Thu, 02 Feb 2023 06:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYCT-0002UT-3G
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:56:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNYCR-0004a3-FO
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338978;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bhYMe15eLnJADdvaDkNfF2jo70DqMyi2FGxTcxqrdTo=;
 b=Pcv4dFdKag+MCFHtB7GO4wcorLYeInYyMU3bD2aTYrs2GkxUQFExJm2YTUBx8Hf/4JbJBT
 2xDiS0vWPnKI5O0W/04H7imr/KrJ0p7PDrApTxL69qeVuV3SEhHOXlxLMylFJ6mmgP1C40
 QzqVu6CIEkAL1GMZz4MpcxwaQHgBUhk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-TLIZo3vbMo6ODb_DIgNZHA-1; Thu, 02 Feb 2023 06:56:17 -0500
X-MC-Unique: TLIZo3vbMo6ODb_DIgNZHA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so2710705wms.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bhYMe15eLnJADdvaDkNfF2jo70DqMyi2FGxTcxqrdTo=;
 b=VoYrazmUtNBIaFBl0+IYGU8sX9rddIHBY7ZixS/f5opRO+t934b2sNsyvs91Cvlh7f
 o1dYn716F0g1GQCSZqigkkwt82dOIx/lHyBCFE+1QxCL86FK9HJuoXsZhwNYg2W24PSW
 b+kyYerbg5MsKnv6VOR7RtZlEm/n5X1VPO5ScaQufyZIqYyzEfS0SDIkXx8oifQMBF1z
 SWnYlCq5o8tuDpam3NLcHVv7JdUTVdTKx7AeakxtLffeDKQLz14xXcT+4sKcu8BUjR4z
 8D3p2KpUmfUym/YokneHTQ2nnmmIee+wYRR+RnkGPxTvduv0AyWoS9YjRbOJnyFSe8PC
 ET6A==
X-Gm-Message-State: AO0yUKUVon/Qck5Z6/mW0LEKa63tjw+yIpLu/ra1PERDij2E+N8bNpuU
 fvtVYpF8Zu6bn3rHJUCDhT+QRXBOAFyuPMKJWw+pJBoSUOdDAhJd7Ydf6GV+Sg+tW3TXt3laG8W
 OVzpsNdclDjRVeSU=
X-Received: by 2002:a05:600c:3486:b0:3df:9858:c03d with SMTP id
 a6-20020a05600c348600b003df9858c03dmr1671824wmq.18.1675338972090; 
 Thu, 02 Feb 2023 03:56:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9z8vK/gBypM8bPe8XMltB3u+Xv44AKGW2gJtnZvH3v3v6eQn84YcN1yzlPZgxpO5pQAQAlnA==
X-Received: by 2002:a05:600c:3486:b0:3df:9858:c03d with SMTP id
 a6-20020a05600c348600b003df9858c03dmr1671813wmq.18.1675338971906; 
 Thu, 02 Feb 2023 03:56:11 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003d9aa76dc6asm5084648wms.0.2023.02.02.03.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:56:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,  Jing Qi <jinqi@redhat.com>
Subject: Re: [PATCH v5 8/8] virtio-mem: Proper support for preallocation
 with migration
In-Reply-To: <20230117112249.244096-9-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:49 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-9-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:56:10 +0100
Message-ID: <87cz6snuw5.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
> Ordinary memory preallocation runs when QEMU starts up and creates the
> memory backends, before processing the incoming migration stream. With
> virtio-mem, we don't know which memory blocks to preallocate before
> migration started. Now that we migrate the virtio-mem bitmap early, before
> migrating any RAM content, we can safely preallocate memory for all plugged
> memory blocks before migrating any RAM content.
>
> This is especially relevant for the following cases:
>
> (1) User errors
>
> With hugetlb/files, if we don't have sufficient backend memory available on
> the migration destination, we'll crash QEMU (SIGBUS) during RAM migration
> when running out of backend memory. Preallocating memory before actual
> RAM migration allows for failing gracefully and informing the user about
> the setup problem.
>
> (2) Excluded memory ranges during migration
>
> For example, virtio-balloon free page hinting will exclude some pages
> from getting migrated. In that case, we won't crash during RAM
> migration, but later, when running the VM on the destination, which is
> bad.
>
> To fix this for new QEMU machines that migrate the bitmap early,
> preallocate the memory early, before any RAM migration. Warn with old
> QEMU machines.
>
> Getting postcopy right is a bit tricky, but we essentially now implement
> the same (problematic) preallocation logic as ordinary preallocation:
> preallocate memory early and discard it again before precopy starts. During
> ordinary preallocation, discarding of RAM happens when postcopy is advised.
> As the state (bitmap) is loaded after postcopy was advised but before
> postcopy starts listening, we have to discard memory we preallocated
> immediately again ourselves.
>
> Note that nothing (not even hugetlb reservations) guarantees for postcopy
> that backend memory (especially, hugetlb pages) are still free after they
> were freed ones while discarding RAM. Still, allocating that memory at
> least once helps catching some basic setup problems.
>
> Before this change, trying to restore a VM when insufficient hugetlb
> pages are around results in the process crashing to to a "Bus error"
> (SIGBUS). With this change, QEMU fails gracefully:
>
>   qemu-system-x86_64: qemu_prealloc_mem: preallocating memory failed: Bad address
>   qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-mem-device-early'
>   qemu-system-x86_64: load of migration failed: Cannot allocate memory
>
> And we can even introspect the early migration data, including the
> bitmap:
>   $ ./scripts/analyze-migration.py -f STATEFILE
>   {
>   "ram (2)": {
>       "section sizes": {
>           "0000:00:03.0/mem0": "0x0000000780000000",
>           "0000:00:04.0/mem1": "0x0000000780000000",
>           "pc.ram": "0x0000000100000000",
>           "/rom@etc/acpi/tables": "0x0000000000020000",
>           "pc.bios": "0x0000000000040000",
>           "0000:00:02.0/e1000.rom": "0x0000000000040000",
>           "pc.rom": "0x0000000000020000",
>           "/rom@etc/table-loader": "0x0000000000001000",
>           "/rom@etc/acpi/rsdp": "0x0000000000001000"
>       }
>   },
>   "0000:00:03.0/virtio-mem-device-early (51)": {
>       "tmp": "00 00 00 01 40 00 00 00 00 00 00 07 80 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
>       "size": "0x0000000040000000",
>       "bitmap": "ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff [...]
>   },
>   "0000:00:04.0/virtio-mem-device-early (53)": {
>       "tmp": "00 00 00 08 c0 00 00 00 00 00 00 07 80 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00",
>       "size": "0x00000001fa400000",
>       "bitmap": "ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff [...]
>   },
>   [...]
>
> Reported-by: Jing Qi <jinqi@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


