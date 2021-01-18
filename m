Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AA2F9BCE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:22:05 +0100 (CET)
Received: from localhost ([::1]:36058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Qjc-00019T-EW
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l1Qho-0000Fn-AT
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:20:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l1Qhi-0004XD-1k
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610961602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uUhn68g0kMLY3TFq2zGOVa3m8qh8lkYfHoRBiw6+FcY=;
 b=CrbvTIJ/l1uSwnU3nrOjNUsYBPQm50U9r2i4+v7uSV0g1hNm3HBoK13NJbay9pJkiOZ5wT
 KtSy5YTeGn5QS72Eu/8ltwcrfcU2EpT3piDeRH9ctOxK/IP4Tq63sFgcnGI7Y08X+wXsDI
 H5m2OgeBYt2RV0oVvmDi3xjBgUQ6mt8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-DcgCVay1OIu3fWCiRjcHPg-1; Mon, 18 Jan 2021 04:20:00 -0500
X-MC-Unique: DcgCVay1OIu3fWCiRjcHPg-1
Received: by mail-wm1-f69.google.com with SMTP id z12so4202310wmf.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uUhn68g0kMLY3TFq2zGOVa3m8qh8lkYfHoRBiw6+FcY=;
 b=pU3a2IHuZQEnOqYPzz7G89qJfpveYwmILQt8VtiFfV0go+w7ypHwceK5tXjHtnx8Ma
 p1/UUxE4WZ1cES1id7hqDfxwGqVFRL+SxVJ9svEIkTaHCnkZz506pchEmc6YhWlYTBph
 Up2GyqpU8DCvfJfQVDzBPalPuz8Gs/h5rt89OTbaYPCUtYaQ4wJoJ6L+09gniuFLnHRl
 csQ51gdnQQTQ2jHkaZAOOx7ur87t4uyZAs2z+wcrdliX2tnOvH4Tic2u4PJjy9hzzIg6
 oDmn4JxeGABHUPTJlSiJSjaepcXjRqkAO4Qa7QY9gS/sX2uLuvr4H1jCxYfWT8r004RY
 MQmQ==
X-Gm-Message-State: AOAM532Ex9K7xiNXeTW74lykBKmkv5iVgV51Z4fM1VREVYW5G0/s+Grq
 OAa4N6toyPNP7RNMyMDwfBlAUiNnG735R9RuDMd6d7Fnsi/oua3oR5yHnvspuQYLmEoBw5D6UEm
 ABMpQqvkdDEhvb9vltpVOLmPNoxdr7g2Y9GXAkD2Bayaa+XBfB9Tu9WBObBWtbB1SlFI=
X-Received: by 2002:a1c:8153:: with SMTP id c80mr17792304wmd.74.1610961598498; 
 Mon, 18 Jan 2021 01:19:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsDgoJkrHHOC+6Grp/vF5kZY3nxSuzHy3RDD457+7C11fk+0IDyE9hcBQqcAqcEN1ojWsPSQ==
X-Received: by 2002:a1c:8153:: with SMTP id c80mr17792274wmd.74.1610961598194; 
 Mon, 18 Jan 2021 01:19:58 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id a6sm9027144wmj.27.2021.01.18.01.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 01:19:57 -0800 (PST)
Date: Mon, 18 Jan 2021 10:19:55 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Message-ID: <20210118091955.4iqfrbfpj6jyjzb2@steredhat>
References: <20210108171252.209502-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210108171252.209502-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 qemu-stable@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Jing Zhao <jinzhao@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping :-)

On Fri, Jan 08, 2021 at 06:12:52PM +0100, Stefano Garzarella wrote:
>Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
>set to true by default.
>To allow the migration, we set this property to false in the hw_compat,
>but in the wrong place (hw_compat_4_1).
>
>Since commit 9d7bd0826f was released with QEMU 5.0, we move
>'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
>will have the pre-patch behavior and the migration can work.
>
>The issue was discovered with vhost-vsock device and 4.2 machine
>type without running any kernel in the VM:
>    $ qemu-4.2 -M pc-q35-4.2,accel=kvm \
>        -device vhost-vsock-pci,guest-cid=4 \
>        -monitor stdio -incoming tcp:0:3333
>
>    $ qemu-5.2 -M pc-q35-4.2,accel=kvm \
>        -device vhost-vsock-pci,guest-cid=3 \
>        -monitor stdio
>    (qemu) migrate -d tcp:0:3333
>
>    # qemu-4.2 output
>    qemu-system-x86_64: Failed to load virtio-vhost_vsock:virtio
>    qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:03.0/virtio-vhost_vsock'
>    qemu-system-x86_64: load of migration failed: No such file or directory
>
>Reported-by: Jing Zhao <jinzhao@redhat.com>
>Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1907255
>Fixes: 9d7bd0826f ("virtio-pci: disable vring processing when bus-mastering is disabled")
>Cc: mdroth@linux.vnet.ibm.com
>CC: qemu-stable@nongnu.org
>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>---
> hw/core/machine.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/core/machine.c b/hw/core/machine.c
>index de3b8f1b31..5d6163ab70 100644
>--- a/hw/core/machine.c
>+++ b/hw/core/machine.c
>@@ -70,12 +70,12 @@ GlobalProperty hw_compat_4_2[] = {
>     { "qxl", "revision", "4" },
>     { "qxl-vga", "revision", "4" },
>     { "fw_cfg", "acpi-mr-restore", "false" },
>+    { "virtio-device", "use-disabled-flag", "false" },
> };
> const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
>
> GlobalProperty hw_compat_4_1[] = {
>     { "virtio-pci", "x-pcie-flr-init", "off" },
>-    { "virtio-device", "use-disabled-flag", "false" },
> };
> const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
>
>-- 
>2.26.2
>
>


