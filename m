Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C445D2D3282
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:03:51 +0100 (CET)
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiH8-0001VS-SV
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhvu-0007B1-TO
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhvs-0002KH-Ow
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607452912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34uuOK/3FRVFfUegIUptne0NmxFFM9vhLXaDGBp2TxI=;
 b=iFvio6zCU6nn/f8Ibh/mxzV+XsfDB9H9efHWt/pnKBklByNhXB8iR1ULt8zPaxvOeK4LfJ
 EhtBOUVlG2OEjXJXq5U+ln59uD6Y9akCiifQE1UkJBKkVRaSPQBX0Rt8XPHTRzu7wHbF9Q
 9dam8ONzBY4Xexrc0gsH9gsUvVP63rQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-llXLUjkFPp6bur3W0ArP9g-1; Tue, 08 Dec 2020 13:41:49 -0500
X-MC-Unique: llXLUjkFPp6bur3W0ArP9g-1
Received: by mail-wr1-f71.google.com with SMTP id q18so1102940wrc.20
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=34uuOK/3FRVFfUegIUptne0NmxFFM9vhLXaDGBp2TxI=;
 b=LeqEmnbumV48iOdgcMdM2u/+XYov9WVFs0pDeNL73BTlj5wOxKQvjy9y0lvZ/eCgJM
 Q1rDmBx6I+mbzOFFfBqQgRl+H/e2o3pBm0tGPrvm3c7V62cvtPleRyiriOWfSKJX5/9o
 0EI8BzMv4s0ve0qFvn041oDv6NkGuWId3LkqA2PZPUjBJSTRI9PTUbvZQy/UMGKEev4y
 rTd4b3EpmuWeWOzIp167EYwkWkPNEerjo5jRjmUKndoqWMtivOtlB3t/cMWGgBOlOMES
 29d9ASIhiL8DGwlfwDsz0SiexoJ6JXNTT06vs/g+TkGwLr1IQO+oi+JqU7SdLMkcqqD/
 BtnQ==
X-Gm-Message-State: AOAM5307ijcwaSTmP6JKRqHI/0n/EEblqsunK82YYzx+vZ+Ku9VpEXvc
 5Dm2R7/WWy+MPpyuweIDpnr0qaOPpc7iznjQXhNXVjyPzynvJFm+zC6YJxuxXHpjMsZDAdsM+Xu
 HANofSM7YkD9dldo=
X-Received: by 2002:adf:9b98:: with SMTP id d24mr9461347wrc.240.1607452907642; 
 Tue, 08 Dec 2020 10:41:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrjrck6U6T25iZjMDwH+2lprploJ6e9ZEQvSghIDjZXzjlMRbqmCiYoFPDlIuL224B93dV1w==
X-Received: by 2002:adf:9b98:: with SMTP id d24mr9461337wrc.240.1607452907465; 
 Tue, 08 Dec 2020 10:41:47 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 90sm21900022wrl.60.2020.12.08.10.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:41:46 -0800 (PST)
Date: Tue, 8 Dec 2020 13:41:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH v4] Fix build with 64 bits time_t
Message-ID: <20201208134133-mutt-send-email-mst@kernel.org>
References: <20201203195819.583626-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201203195819.583626-1-fontaine.fabrice@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 08:58:19PM +0100, Fabrice Fontaine wrote:
> time element is deprecated on new input_event structure in kernel's
> input.h [1]
> 
> This will avoid the following build failure:
> 
> hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
> hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
>   198 |     if (gettimeofday(&evdev.time, NULL)) {
>       |                            ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
>  - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Gerd pls feel free to merge.

> ---
> Changes v3 -> v4 (after review of Gerd Hoffmann):
>  - Include <sys/ioctl.h>
> 
> Changes v2 -> v3 (after review of Gerd Hoffmann):
>  - Replace include on <linux/input.h> by
>    "standard-headers/linux/input.h" to try to fix build on rhel-7
> 
> Changes v1 -> v2 (after review of Michael S. Tsirkin):
>  - Drop define of input_event_{sec,usec} as it is already done in
>    include/standard-headers/linux/input.h
> 
>  contrib/vhost-user-input/main.c | 8 ++++++--
>  hw/input/virtio-input-host.c    | 5 ++++-
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
> index 6020c6f33a..b27b12733b 100644
> --- a/contrib/vhost-user-input/main.c
> +++ b/contrib/vhost-user-input/main.c
> @@ -7,13 +7,14 @@
>  #include "qemu/osdep.h"
>  
>  #include <glib.h>
> -#include <linux/input.h>
> +#include <sys/ioctl.h>
>  
>  #include "qemu/iov.h"
>  #include "qemu/bswap.h"
>  #include "qemu/sockets.h"
>  #include "contrib/libvhost-user/libvhost-user.h"
>  #include "contrib/libvhost-user/libvhost-user-glib.h"
> +#include "standard-headers/linux/input.h"
>  #include "standard-headers/linux/virtio_input.h"
>  #include "qapi/error.h"
>  
> @@ -115,13 +116,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
>  static void vi_handle_status(VuInput *vi, virtio_input_event *event)
>  {
>      struct input_event evdev;
> +    struct timeval tval;
>      int rc;
>  
> -    if (gettimeofday(&evdev.time, NULL)) {
> +    if (gettimeofday(&tval, NULL)) {
>          perror("vi_handle_status: gettimeofday");
>          return;
>      }
>  
> +    evdev.input_event_sec = tval.tv_sec;
> +    evdev.input_event_usec = tval.tv_usec;
>      evdev.type = le16toh(event->type);
>      evdev.code = le16toh(event->code);
>      evdev.value = le32toh(event->value);
> diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
> index 85daf73f1a..137efba57b 100644
> --- a/hw/input/virtio-input-host.c
> +++ b/hw/input/virtio-input-host.c
> @@ -193,13 +193,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
>  {
>      VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
>      struct input_event evdev;
> +    struct timeval tval;
>      int rc;
>  
> -    if (gettimeofday(&evdev.time, NULL)) {
> +    if (gettimeofday(&tval, NULL)) {
>          perror("virtio_input_host_handle_status: gettimeofday");
>          return;
>      }
>  
> +    evdev.input_event_sec = tval.tv_sec;
> +    evdev.input_event_usec = tval.tv_usec;
>      evdev.type = le16_to_cpu(event->type);
>      evdev.code = le16_to_cpu(event->code);
>      evdev.value = le32_to_cpu(event->value);
> -- 
> 2.29.2


