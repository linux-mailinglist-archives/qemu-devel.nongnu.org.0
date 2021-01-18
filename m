Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C52FA597
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:06:31 +0100 (CET)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1X30-0008VT-QY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1X04-00077j-1X
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1X00-0007DR-ME
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610985803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VrK6PQYMmyp6xwYz0+dymPwd9q/7mmmYqN4QsnVcyT8=;
 b=AaRsdHNYYmLCabuLekL8MXIJxfB82y4DNx5RrxGB4cmniSss4zwJkVYiplt/x5r82EZNOd
 hBVXcoeE1CxAOQfeVZ/kTDKWwTTiLeMRYkpsckx8jPZbhQyDoCIye2qL0QVqSFOAEEbBky
 o/TjNG/5G0iVmGXYLDB5qE6oqjeCRTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-dRG8ubcjP7GtFdEVR97XAw-1; Mon, 18 Jan 2021 11:03:20 -0500
X-MC-Unique: dRG8ubcjP7GtFdEVR97XAw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD9B7AFA81;
 Mon, 18 Jan 2021 16:03:19 +0000 (UTC)
Received: from work-vm (ovpn-115-197.ams2.redhat.com [10.36.115.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2DA5D737;
 Mon, 18 Jan 2021 16:03:14 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:03:12 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Message-ID: <20210118160312.GB9899@work-vm>
References: <20210108171252.209502-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210108171252.209502-1-sgarzare@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 Jing Zhao <jinzhao@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefano Garzarella (sgarzare@redhat.com) wrote:
> Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
> set to true by default.
> To allow the migration, we set this property to false in the hw_compat,
> but in the wrong place (hw_compat_4_1).
> 
> Since commit 9d7bd0826f was released with QEMU 5.0, we move
> 'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
> will have the pre-patch behavior and the migration can work.

Be a little careful that fixing this probably causes a migration from
5.2->6.0 to fail with this machine type;  so when we do these
type of fixes we often fix an old machine type between some pair of qemu
versions and then break it between a different set.

Dave

> The issue was discovered with vhost-vsock device and 4.2 machine
> type without running any kernel in the VM:
>     $ qemu-4.2 -M pc-q35-4.2,accel=kvm \
>         -device vhost-vsock-pci,guest-cid=4 \
>         -monitor stdio -incoming tcp:0:3333
> 
>     $ qemu-5.2 -M pc-q35-4.2,accel=kvm \
>         -device vhost-vsock-pci,guest-cid=3 \
>         -monitor stdio
>     (qemu) migrate -d tcp:0:3333
> 
>     # qemu-4.2 output
>     qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
>     qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
>     qemu-system-x86_64: load of migration failed: No such file or directory
> 
> Reported-by: Jing Zhao <jinzhao@redhat.com>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1907255
> Fixes: 9d7bd0826f ("virtio-pci: disable vring processing when bus-mastering is disabled")
> Cc: mdroth@linux.vnet.ibm.com
> CC: qemu-stable@nongnu.org
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index de3b8f1b31..5d6163ab70 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -70,12 +70,12 @@ GlobalProperty hw_compat_4_2[] = {
>      { "qxl", "revision", "4" },
>      { "qxl-vga", "revision", "4" },
>      { "fw_cfg", "acpi-mr-restore", "false" },
> +    { "virtio-device", "use-disabled-flag", "false" },
>  };
>  const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
>  
>  GlobalProperty hw_compat_4_1[] = {
>      { "virtio-pci", "x-pcie-flr-init", "off" },
> -    { "virtio-device", "use-disabled-flag", "false" },
>  };
>  const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
>  
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


