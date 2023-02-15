Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FE69834D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMVf-0002Vq-5a; Wed, 15 Feb 2023 13:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pSMVc-0002VM-W9
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:28:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pSMVa-0001Zt-B3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676485676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KpRUkJBqeMdptGMqenj7ncP3Q+Hj+F/RYAH9sRQ2AQw=;
 b=Itmv4CApHI/oKhlD28DCmL/m+QI38/QZwsYKUYfHkVodaBbzk5zNUunhvTLR8YBni6m4mt
 hnoksShGG11HoITvK6KEVpayNQXuQ2hoAYY3x0WSLixm0L0EISdYub/i5Dmfb/DRPP6kU4
 RAOA4bq5u6a6+4g0ESUxvg2npXlBN0k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-qvQSc9uaPt-6cI4GN1q4qQ-1; Wed, 15 Feb 2023 13:27:55 -0500
X-MC-Unique: qvQSc9uaPt-6cI4GN1q4qQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05DEA85CBE0;
 Wed, 15 Feb 2023 18:27:55 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14FF32026D4B;
 Wed, 15 Feb 2023 18:27:53 +0000 (UTC)
Date: Wed, 15 Feb 2023 12:27:52 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH v2 3/3] virtio-scsi: reset SCSI devices from main loop
 thread
Message-ID: <20230215182752.4s4pgs3gcor6try3@redhat.com>
References: <20230210143238.524357-1-stefanha@redhat.com>
 <20230210143238.524357-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210143238.524357-4-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Fri, Feb 10, 2023 at 09:32:38AM -0500, Stefan Hajnoczi wrote:
> When an IOThread is configured, the ctrl virtqueue is processed in the
> IOThread. TMFs that reset SCSI devices are currently called directly
> from the IOThread and trigger an assertion failure in blk_drain():
> 
>   ../block/block-backend.c:1780: void blk_drain(BlockBackend *): Assertion `qemu_in_main_thread()' failed.
> 
> The blk_drain() function is not designed to be called from an IOThread
> because it needs the Big QEMU Lock (BQL).
> 
> This patch defers TMFs that reset SCSI devices to a Bottom Half (BH)
> that runs in the main loop thread under the BQL. This way it's safe to
> call blk_drain() and the assertion failure is avoided.
> 
> Introduce s->tmf_bh_list for tracking TMF requests that have been
> deferred to the BH. When the BH runs it will grab the entire list and
> process all requests. Care must be taken to clear the list when the
> virtio-scsi device is reset or unrealized. Otherwise deferred TMF
> requests could execute later and lead to use-after-free or other
> undefined behavior.
> 
> The s->resetting counter that's used by TMFs that reset SCSI devices is
> accessed from multiple threads. This patch makes that explicit by using
> atomic accessor functions. With this patch applied the counter is only
> modified by the main loop thread under the BQL but can be read by any
> thread.
> 
> Reported-by: Qing Wang <qinwang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/virtio/virtio-scsi.h |  11 ++-
>  hw/scsi/virtio-scsi.c           | 169 +++++++++++++++++++++++++-------
>  2 files changed, 143 insertions(+), 37 deletions(-)

This one is trickier than the first two, so if you want a second
reviewer, I understand.  That said, although the number of lines of
code grows, the code motion into separate handlers was fairly easy to
follow, and the logic for why they must be in a separate BH context is
correct.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


