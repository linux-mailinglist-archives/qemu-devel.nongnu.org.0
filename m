Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8D69A906
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:23:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSxsf-0003oq-5u; Fri, 17 Feb 2023 05:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSxsc-0003mO-HL
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:22:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pSxsZ-00084z-Hz
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676629330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7t228B0XFy4g5DkD34jmGMNYqK2o3g0dyGL7RpwsuJA=;
 b=LqhcFcndQM8Wip60TRdqNZMdGgpiaQFgRuEPm5pUvhqODVnEI2HXNqbsYFiej1hs3Ds9ND
 1rGEym/WlSEGReM8IZ1Z6k9UZoBF35VX9OOAIhKOtp0MB68HIMD/L5CrquXMROVR4Zn1Km
 hSHt4MQBGAflyEZHKOcr6kzs0d5dzeM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-ZTzOm4sKMDuCglEsKwk7kA-1; Fri, 17 Feb 2023 05:22:05 -0500
X-MC-Unique: ZTzOm4sKMDuCglEsKwk7kA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14F45885620;
 Fri, 17 Feb 2023 10:22:05 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E29D492C14;
 Fri, 17 Feb 2023 10:22:03 +0000 (UTC)
Date: Fri, 17 Feb 2023 11:22:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH v2 3/3] virtio-scsi: reset SCSI devices from main loop
 thread
Message-ID: <Y+9VShQtrC1KeEWU@redhat.com>
References: <20230210143238.524357-1-stefanha@redhat.com>
 <20230210143238.524357-4-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210143238.524357-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Am 10.02.2023 um 15:32 hat Stefan Hajnoczi geschrieben:
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

It's not entirely obvious what is the call path that leads to
blk_drain(). Do we somehow call into virtio_scsi_dataplane_stop()?

> Introduce s->tmf_bh_list for tracking TMF requests that have been
> deferred to the BH. When the BH runs it will grab the entire list and
> process all requests. Care must be taken to clear the list when the
> virtio-scsi device is reset or unrealized. Otherwise deferred TMF
> requests could execute later and lead to use-after-free or other
> undefined behavior.

Why don't we already need the same for other asynchronously processed
requests? Certainly having a read request write to guest memory after
the device has been reset or unplugged isn't what we want either.

I see that we assert(!s->dataplane_started) in virtio_scsi_reset(),
which may be part of the reason. If we're not processing any requests,
then we're safe. virtio_scsi_dataplane_stop() calls blk_drain_all()
(which is really a too big hammer) in order to make sure that in-flight
requests are completed before dataplane_started becomes false.

I was wondering if we couldn't just blk_inc_in_flight() while a TMF
request is in flight and then use the same draining logic to be covered.
You could use oneshot BHs then and do away with the list because you
don't need to cancel anything any more, you just wait until the BHs have
completed.

The practical problem may be that we don't have a blk here (which is
probably also why blk_drain_all() is used). We could have our own
AIO_WAIT_WHILE() instead. I feel waiting instead of cancelling BHs would
simplify the code.

In fact, I think technically, you may not need any of that because
blk_drain_all() also executes all BHs in the main loop before it
returns, but that might be a bit subtle...

> The s->resetting counter that's used by TMFs that reset SCSI devices is
> accessed from multiple threads. This patch makes that explicit by using
> atomic accessor functions. With this patch applied the counter is only
> modified by the main loop thread under the BQL but can be read by any
> thread.
> 
> Reported-by: Qing Wang <qinwang@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Kevin


