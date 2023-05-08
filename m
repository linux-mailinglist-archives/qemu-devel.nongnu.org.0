Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4E6FB134
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:17:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0g5-0001L1-W0; Mon, 08 May 2023 09:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pw0f1-0008Rf-Gu
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pw0ez-0001mk-5d
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEaFqiyPzbUYq88dmlnyG/J3ljxIPPscG7x0DEy3SS0=;
 b=aT1jmU4iiJ0nFJ3OL8K4AyAcan4mhym+Qkq63D97ABAaIpUjHNf9rOod6BT+MJ7XvdrJSj
 IxfwyzzS/qCwJc+B5ScgGnADelXt9FlNgyHgeXuwYqlwBHDRUsm4Ro0cVqBXGlDJFLSjvA
 ljlhNbJeqRqgiwPSNuTof/+zX0E3r1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-0GZX8eCTMDiX85tfYmYlTQ-1; Mon, 08 May 2023 09:12:10 -0400
X-MC-Unique: 0GZX8eCTMDiX85tfYmYlTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55A5C101A55C
 for <qemu-devel@nongnu.org>; Mon,  8 May 2023 13:12:10 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1040F2026D16;
 Mon,  8 May 2023 13:12:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 1/4] virtio-dmabuf: introduce virtio-dmabuf
In-Reply-To: <20230503081911.119168-2-aesteve@redhat.com>
Organization: Red Hat GmbH
References: <20230503081911.119168-1-aesteve@redhat.com>
 <20230503081911.119168-2-aesteve@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 08 May 2023 15:12:09 +0200
Message-ID: <87o7mvc6hi.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03 2023, Albert Esteve <aesteve@redhat.com> wrote:

> This API manages objects (in this iteration,
> dmabuf fds) that can be shared along different
> virtio devices.
>
> The API allows the different devices to add,
> remove and/or retrieve the objects by simply
> invoking the public functions that reside in the
> virtio-dmabuf file.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  hw/display/meson.build            |   1 +
>  hw/display/virtio-dmabuf.c        |  88 +++++++++++++++++++++++
>  include/hw/virtio/virtio-dmabuf.h |  58 ++++++++++++++++
>  tests/unit/meson.build            |   1 +
>  tests/unit/test-virtio-dmabuf.c   | 112 ++++++++++++++++++++++++++++++
>  5 files changed, 260 insertions(+)
>  create mode 100644 hw/display/virtio-dmabuf.c
>  create mode 100644 include/hw/virtio/virtio-dmabuf.h
>  create mode 100644 tests/unit/test-virtio-dmabuf.c
>
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index 17165bd536..62a27395c0 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -37,6 +37,7 @@ softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
>  softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
>  
>  softmmu_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> +softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-dmabuf.c'))
>  
>  if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
>      config_all_devices.has_key('CONFIG_VGA_PCI') or
> diff --git a/hw/display/virtio-dmabuf.c b/hw/display/virtio-dmabuf.c
> new file mode 100644

General comment: new files should be covered in MAINTAINERS; not sure if
there is any generic section that could match it, or if this should go
into a new section.

> index 0000000000..3db939a2e3
> --- /dev/null
> +++ b/hw/display/virtio-dmabuf.c

Is virtio-dmabuf only useful for stuff under display/, or could it go
into a more generic section?


