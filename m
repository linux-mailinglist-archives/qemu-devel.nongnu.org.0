Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4B16E8182
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 20:53:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppCuS-0008Kk-F5; Wed, 19 Apr 2023 14:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppCuQ-0008KF-CW
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 14:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ppCuO-0000wF-Iz
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 14:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681930319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hS4DWN2qmeP36WD9ZHX7mMIPBRS78Jiokpqf6BGkG+4=;
 b=dXRxY4Yi13jI6j59NoYgQPW1RJ68o0DGcD64mqkHH+UrvZhSoB0VX41gwTFfHlSJ+/iaBY
 ISAXbpuuAQPChLzYv1FVCCOy+9FhWm/xqoTTOf8++Vky0tPBwSjttiGLj4CYl8/NMxxu6+
 m8K/hEvynw7CbeIIQDiL9+MYeCztmF4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-ozoFPFQuMuWMzNh6HcmPCA-1; Wed, 19 Apr 2023 14:51:56 -0400
X-MC-Unique: ozoFPFQuMuWMzNh6HcmPCA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DF4F3C0E464;
 Wed, 19 Apr 2023 18:51:55 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF8F492B04;
 Wed, 19 Apr 2023 18:51:49 +0000 (UTC)
Date: Wed, 19 Apr 2023 13:51:48 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Paul Durrant <paul@xen.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Kevin Wolf <kwolf@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, 
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>, 
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 16/16] virtio: make it possible to detach host
 notifier from any thread
Message-ID: <msjl3ep44f2dxpno7xw3zxjrkuh5iegyieszertt6ppkhpk62q@xxi7a5shhkc2>
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-17-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419172817.272758-17-stefanha@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 19, 2023 at 01:28:17PM -0400, Stefan Hajnoczi wrote:
> virtio_queue_aio_detach_host_notifier() does two things:
> 1. It removes the fd handler from the event loop.
> 2. It processes the virtqueue one last time.
> 
> The first step can be peformed by any thread and without taking the
> AioContext lock.
> 
> The second step may need the AioContext lock (depending on the device
> implementation) and runs in the thread where request processing takes
> place. virtio-blk and virtio-scsi therefore call
> virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
> AioContext
> 
> Scheduling a BH is undesirable for .drained_begin() functions. The next
> patch will introduce a .drained_begin() function that needs to call
> virtio_queue_aio_detach_host_notifier().
> 
> Move the virtqueue processing out to the callers of
> virtio_queue_aio_detach_host_notifier() so that the function can be
> called from any thread. This is in preparation for the next patch.
>

This mentions a next patch, but is 16/16 in the series.  Am I missing
something?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


