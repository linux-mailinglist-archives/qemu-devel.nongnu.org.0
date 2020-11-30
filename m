Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA522C8AC1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:22:08 +0100 (CET)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjmsJ-0004XM-6b
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kjmqw-0003uo-0h
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:20:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kjmqt-0001Rs-H1
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606756837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lgn6/1PBog5oQsy8/dhZNMT7dglpMEHo25gM0sPP8j0=;
 b=N1t9usBY3klbVwW3jcW3zZmGjyYpyhOi0DhhLdYBO+RMtzFfCWoep7R/Fejyv0NZfpVr9y
 atXUsPnhzpTmaq+iI2bjhrwjITH5xns8plj1yhsqjalAWfpE1SNgvUh2H9Fs81baoZv08Z
 CUttBC3aD23LGxf6rx2Ll5/yDVgWfnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-7ZYXxwokN2G7GlxBWK8d1Q-1; Mon, 30 Nov 2020 12:20:35 -0500
X-MC-Unique: 7ZYXxwokN2G7GlxBWK8d1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3645F9CDB0;
 Mon, 30 Nov 2020 17:20:34 +0000 (UTC)
Received: from work-vm (ovpn-112-48.ams2.redhat.com [10.36.112.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FB8F60871;
 Mon, 30 Nov 2020 17:20:09 +0000 (UTC)
Date: Mon, 30 Nov 2020 17:20:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 8/9] virtio-mem: Require only coordinated discards
Message-ID: <20201130172006.GE3218@work-vm>
References: <20201119153918.120976-1-david@redhat.com>
 <20201119153918.120976-9-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119153918.120976-9-david@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> We implement the RamDiscardMgr interface and only require coordinated
> discarding of RAM to work.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/virtio/virtio-mem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 93257b6c26..932d386c37 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -687,7 +687,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> -    if (ram_block_discard_require(true)) {
> +    if (ram_block_coordinated_discard_require(true)) {
>          error_setg(errp, "Discarding RAM is disabled");
>          return;
>      }
> @@ -695,7 +695,7 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>      ret = ram_block_discard_range(rb, 0, qemu_ram_get_used_length(rb));
>      if (ret) {
>          error_setg_errno(errp, -ret, "Unexpected error discarding RAM");
> -        ram_block_discard_require(false);
> +        ram_block_coordinated_discard_require(false);
>          return;
>      }
>  
> @@ -738,7 +738,7 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
>      virtio_del_queue(vdev, 0);
>      virtio_cleanup(vdev);
>      g_free(vmem->bitmap);
> -    ram_block_discard_require(false);
> +    ram_block_coordinated_discard_require(false);
>  }
>  
>  static int virtio_mem_discard_range_cb(const VirtIOMEM *vmem, void *arg,
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


