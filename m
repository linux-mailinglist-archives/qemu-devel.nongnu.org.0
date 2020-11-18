Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DCB2B7756
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 08:54:32 +0100 (CET)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIIR-0005H8-VZ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 02:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kfIHf-0004qZ-Ib
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 02:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kfIHd-0008I0-KV
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 02:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605686021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sm+LXZpYqBg1dnOqhbYPveOzqD/FioeWqDWzcLfbYRA=;
 b=GG/wwFmcbsnhN7esG5qtHc/ta2n6gYHCtLlINp0si8g7opcWfjQXci2lU9h7ea26d9Pqva
 QYI0tkOLuemlpi3VNd+Jx4rtBthGiLv3JgJjoQ1Q88OMwAlsy6sZdY8IIgGfuqecwNQthl
 RfZsUgxEbWuUcu30wBgyxQCKxbgDKJA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-yhayqoRCMvC2kbCkp5OmkQ-1; Wed, 18 Nov 2020 02:53:38 -0500
X-MC-Unique: yhayqoRCMvC2kbCkp5OmkQ-1
Received: by mail-wm1-f69.google.com with SMTP id g3so514762wmh.9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 23:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sm+LXZpYqBg1dnOqhbYPveOzqD/FioeWqDWzcLfbYRA=;
 b=dgSCNGFbdAuTkI6k0W67bw6BKR5mas9uvmM4Ope8DhaQbI7AJecOJcgdYgdT9smWra
 SvhYm8MGkoqkYboyxdg3GERifs4zbb6vB2q74gWE3iCC0vlqYDoi6KCVZ/AnXKEeQEDf
 YR6XDZl9FAyeaYuIRY6VMYrlmhro2UcDAvQDjKqEtpseUwydDEQur56gciNDwXQTMhaU
 gNd/znEcegWkMLLbyYA9s+7+6y+IGx+sT/SsuD1IirTwK+k/aS9jLzVh8ekT080qHzJU
 SBF6cH9UnFjzXi7NvSm1w7UeziawLHl1ONI6HgQGzVEajDscvieA0l4mYQ5wfdto8Ik6
 wSqg==
X-Gm-Message-State: AOAM530iGlOKRp7HVnJOijeelRr08+RHx9gmOKFLE1M2v9/Ao8EyUvj3
 OU9h25frPaUFGuck2UNtOiYJ9m/3GdzF2k4vs2hktpewcHDvl7HiQFUrkk2ieWzSGw2DvH85LWK
 OTMmR3u1Kjtzv6lM=
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr3254140wrv.87.1605686016436; 
 Tue, 17 Nov 2020 23:53:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1LJ/+U7ObH1gTn8jR2pETiZqkOcdr0DlDvbxY2F9jJNa9t1Qv6ja7cVGWT5UTq6O9v+nn6A==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr3254123wrv.87.1605686016177; 
 Tue, 17 Nov 2020 23:53:36 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id 34sm32943869wrq.27.2020.11.17.23.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 23:53:35 -0800 (PST)
Date: Wed, 18 Nov 2020 02:53:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH] Fix build with 64 bits time_t
Message-ID: <20201118025255-mutt-send-email-mst@kernel.org>
References: <20201117202846.138463-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201117202846.138463-1-fontaine.fabrice@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Tue, Nov 17, 2020 at 09:28:46PM +0100, Fabrice Fontaine wrote:
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
> ---
>  contrib/vhost-user-input/main.c | 10 +++++++++-
>  hw/input/virtio-input-host.c    | 10 +++++++++-
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
> index 6020c6f33a..e688c3e0a9 100644
> --- a/contrib/vhost-user-input/main.c
> +++ b/contrib/vhost-user-input/main.c
> @@ -17,6 +17,11 @@
>  #include "standard-headers/linux/virtio_input.h"
>  #include "qapi/error.h"
>  
> +#ifndef input_event_sec
> +#define input_event_sec time.tv_sec
> +#define input_event_usec time.tv_usec
> +#endif
> +
>  enum {
>      VHOST_USER_INPUT_MAX_QUEUES = 2,
>  };

Just update ./include/standard-headers/linux/input.h, we'll get these
defines for free.


> @@ -115,13 +120,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
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
> index 85daf73f1a..2e261737e1 100644
> --- a/hw/input/virtio-input-host.c
> +++ b/hw/input/virtio-input-host.c
> @@ -16,6 +16,11 @@
>  #include <sys/ioctl.h>
>  #include "standard-headers/linux/input.h"
>  
> +#ifndef input_event_sec
> +#define input_event_sec time.tv_sec
> +#define input_event_usec time.tv_usec
> +#endif
> +
>  /* ----------------------------------------------------------------- */
>  
>  static struct virtio_input_config virtio_input_host_config[] = {
> @@ -193,13 +198,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
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


