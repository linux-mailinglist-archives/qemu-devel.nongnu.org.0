Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15721442118
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:53:20 +0100 (CET)
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdMt-0007VQ-5M
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhc9Q-00044R-1e
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhc9N-000779-7s
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635791715;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=olBYV/lsknfDyIISkPIX+tWZ2QPBbMau6SIoMXTUz3U=;
 b=RxPNMz5e4MPT8FJWBVm3DwHLjqcElJ7yX35DetKfDJ7aFb/h7o+1iEng0xxlei4/PX38K0
 X+PCmeLhN2hNnzSMWSDnAblTnwwhrRpYGK5Kbzv/aLzLwgs7D4HjZmAVpqRTdEwkzj5y0q
 dmEbvDOeacxXh7ebR2H1sHy5p/QGjmg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-4lal31iWME2qmeBynEgmHA-1; Mon, 01 Nov 2021 14:35:14 -0400
X-MC-Unique: 4lal31iWME2qmeBynEgmHA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so3312082wmg.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=olBYV/lsknfDyIISkPIX+tWZ2QPBbMau6SIoMXTUz3U=;
 b=qTwCsg9/KsX9rL/0S2tlVGNlhuKP1Y8XUX2P/2/QTxGUfNIuomloxuPgagzM7ti/Q6
 1G8qcBFu5PbFPzsuzlACfUb7Z+4EJ4MZWvGjXFf6Jtr1wH7j+6h31hLOyMx3DfEh1pNp
 oQ2kojlqotll3Z+Rx6YO9uoFgIuGfNelGDaQ+w1OAJKpyGhp8WnriruuwZnc+9h1yV7i
 zjSkB2Rl8ryPH5e6lnpOqJJjz6+ez7tnwWdmDMJRXcBRJWso4PZJ4LDR5u2ZJTk9nSDG
 qJgigRhi/I1p2kFA5xoPIFDDzJD1b5O/qNj2Gzeu+28crW+un8UP4fUwEB9h+LP9lt6d
 wIeQ==
X-Gm-Message-State: AOAM5333whcjb1jpBYjuKZHjCbq+mM0Fd22TjNkh49IrSgG3gk0U5mGU
 gxjGKx3KE357CFT4WEhInK1crYVO4wvfkKyXJ0xXi01FrU90zvhGgSHfs5iQkEQ3Lc/vGmwYIjF
 OfnvvckgwuL3PSBY=
X-Received: by 2002:a1c:f705:: with SMTP id v5mr686271wmh.121.1635791712535;
 Mon, 01 Nov 2021 11:35:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXHAUh+AbKzBEL1srpNyeIoZvd2XDGx4qIKphCGVgO1PJ4shHuUp36o4uhX0hdhqxSGpXsag==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr686222wmh.121.1635791712269;
 Mon, 01 Nov 2021 11:35:12 -0700 (PDT)
Received: from localhost ([178.139.231.243])
 by smtp.gmail.com with ESMTPSA id m34sm293911wms.25.2021.11.01.11.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:35:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 9/9] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on background snapshots
In-Reply-To: <20211011175346.15499-10-david@redhat.com> (David Hildenbrand's
 message of "Mon, 11 Oct 2021 19:53:46 +0200")
References: <20211011175346.15499-1-david@redhat.com>
 <20211011175346.15499-10-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 01 Nov 2021 19:35:09 +0100
Message-ID: <87ee7zsp0i.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> We already don't ever migrate memory that corresponds to discarded ranges
> as managed by a RamDiscardManager responsible for the mapped memory region
> of the RAMBlock.
>
> virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
> Right now, we still populate zeropages for the whole usable part of the
> RAMBlock, which is undesired because:
>
> 1. Even populating the shared zeropage will result in memory getting
>    consumed for page tables.
> 2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
>    will populate an actual, fresh page, resulting in an unintended
>    memory consumption.
>
> Discarded ("logically unplugged") parts have to remain discarded. As
> these pages are never part of the migration stream, there is no need to
> track modifications via userfaultfd WP reliably for these parts.
>
> Further, any writes to these ranges by the VM are invalid and the
> behavior is undefined.
>
> Note that Linux only supports userfaultfd WP on private anonymous memory
> for now, which usually results in the shared zeropage getting populated.
> The issue will become more relevant once userfaultfd WP supports shmem
> and hugetlb.
>
> Acked-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


