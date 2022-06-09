Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23868544E65
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:10:24 +0200 (CEST)
Received: from localhost ([::1]:36378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzIrf-0003k7-6L
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzGmk-0001PR-UH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nzGmi-0002h8-FZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654775827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1QueKO4NFw8r8GmCI6G4RX0gvrLteWnZ9zQiBJvNK0c=;
 b=GAJ45+/dfO8eSRbaKlhDLRGrccgkPAmwjPr6IQwW+ZuX3uBOD3hbbkH53ya/PxFltKl/P3
 2n8t4hmPGhhAKWm34HJpnXA/D5C9njq2xMCk8UuX4XBAzKnQdv/Zm1uwIeymJD2vl+0mWZ
 6hZyDreV6UpBeMh/uEq1qF3EgdOQBNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-VEK19qc1PUKNBxK5Xvn4SQ-1; Thu, 09 Jun 2022 07:56:59 -0400
X-MC-Unique: VEK19qc1PUKNBxK5Xvn4SQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF687811E7A
 for <qemu-devel@nongnu.org>; Thu,  9 Jun 2022 11:56:58 +0000 (UTC)
Received: from localhost (unknown [10.39.192.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79CC6404E4B5;
 Thu,  9 Jun 2022 11:56:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, thuth@redhat.com
Subject: Re: [PATCH 3/4] virtio: stop ioeventfd on reset
In-Reply-To: <20220609091534.1416909-4-pbonzini@redhat.com>
Organization: Red Hat GmbH
References: <20220609091534.1416909-1-pbonzini@redhat.com>
 <20220609091534.1416909-4-pbonzini@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 09 Jun 2022 13:56:56 +0200
Message-ID: <87leu69hiv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 09 2022, Paolo Bonzini <pbonzini@redhat.com> wrote:

> All calls to virtio_bus_reset are preceded by virtio_bus_stop_ioeventfd,
> move the call in virtio_bus_reset: that makes sense and clarifies
> that the vdc->reset function is called with ioeventfd already stopped.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/s390x/virtio-ccw.c   | 1 -
>  hw/virtio/virtio-bus.c  | 1 +
>  hw/virtio/virtio-mmio.c | 4 +---
>  hw/virtio/virtio-pci.c  | 1 -
>  4 files changed, 2 insertions(+), 5 deletions(-)
>

(...)

> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index d7ec023adf..896feb37a1 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -104,6 +104,7 @@ void virtio_bus_reset(VirtioBusState *bus)
>      VirtIODevice *vdev = virtio_bus_get_device(bus);
>  
>      DPRINTF("%s: reset device.\n", BUS(bus)->name);
> +    virtio_bus_stop_ioeventfd(bus);
>      if (vdev != NULL) {
>          virtio_reset(vdev);

I looked at the code and I'm wondering under which conditions we could
arrive here with vdev == NULL... virtio_bus_stop_ioeventfd() assumes
that a vdev is there, at least if the ioeventfd has been started.

The patch looks correct, though.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


