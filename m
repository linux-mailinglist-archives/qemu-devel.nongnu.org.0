Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061924C5A7B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 11:26:39 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOGlC-0007Pv-4Y
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 05:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOGiY-0006Ee-KS
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 05:23:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOGiV-0002rh-Fh
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 05:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645957430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eLtG/WtQQwV/a64ZTrc7RdWpsT7d+riLeRJYSimhsEo=;
 b=T3n5zZLOyPdNYwndwP8tIg+cXr10CgU9Lns6w4GRlSKfPmzhvwVGdSVZBHFtKHGzNG8mfr
 uNBxyOi6iry3w1fBQEoAFQzFLND1hv78IGab40DHXuCue0LVlx/sghxCKAU7C49GNbHeXJ
 SSzlQAymQ6JTy+HhOMFqYEfSUETI8rI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-twiaIyrGPMi2geZXcvQb7g-1; Sun, 27 Feb 2022 05:23:47 -0500
X-MC-Unique: twiaIyrGPMi2geZXcvQb7g-1
Received: by mail-wm1-f71.google.com with SMTP id
 i131-20020a1c3b89000000b0037bb9f6feeeso4675526wma.5
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 02:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eLtG/WtQQwV/a64ZTrc7RdWpsT7d+riLeRJYSimhsEo=;
 b=CTgXAn8bw2aL7GcLy1jSRPPE31cyyrml7BdkI56m9zznQDS4Zw02AVJdeJuFaHUleA
 Bpn/4lnsqHcOg5KRI8nBj/v8GsPRoRPAElPBP/ZdPfz53QQtoAg53U70UtEkR8pfLi3e
 XYjx+ExecF9Sq9IIW5Xla/CUCIc/OKJ2hfGIT7YDylxbdMzjQhBhWsbrsKwtPYIfsdCJ
 beOJ5x+GD8T8OSuBkwXlQ332csfMKcZpFK8OtFe59VEsFfFVBLNgBEne68U5xR+IlqOt
 +zQasvyTypQTuVdT7yoZXmqbQSoBoYWTYefNJDLCbGNQT6rl9EKPth2bYOxLVlmJYnR+
 s48g==
X-Gm-Message-State: AOAM533MZzXPLtsBh1uEDPUBpuLR6UtmBlj6Gq8fqcXUiSuHLrQG6rsB
 dT01M42SWgn7OInUOyD9w4baayAdgHIt0A2pToxHqOP4jLp8K77EO8kMKBcvFqYCCVGg/1/K986
 qdrNWZDsBgEcZy8E=
X-Received: by 2002:a5d:4e0e:0:b0:1ed:f5f5:89a0 with SMTP id
 p14-20020a5d4e0e000000b001edf5f589a0mr11897439wrt.525.1645957426209; 
 Sun, 27 Feb 2022 02:23:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx6hHChKePiPjVh1l0ftUQDrloMGHMFokmfL90NEjr0MpWAQOkumvyZqe9V7BdC7ZxJN5/lw==
X-Received: by 2002:a5d:4e0e:0:b0:1ed:f5f5:89a0 with SMTP id
 p14-20020a5d4e0e000000b001edf5f589a0mr11897426wrt.525.1645957426022; 
 Sun, 27 Feb 2022 02:23:46 -0800 (PST)
Received: from redhat.com ([2.53.153.125]) by smtp.gmail.com with ESMTPSA id
 x3-20020adfdd83000000b001e58c8de11bsm7397244wrl.39.2022.02.27.02.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 02:23:45 -0800 (PST)
Date: Sun, 27 Feb 2022 05:23:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH] virtio/virtio-balloon: Prefer Object* over void* parameter
Message-ID: <20220227052311-mutt-send-email-mst@kernel.org>
References: <20220217225351.140095-1-shentey@gmail.com>
 <20220217225351.140095-3-shentey@gmail.com>
 <A0141B14-70D7-4176-BD6E-B0FE5B6AC14A@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A0141B14-70D7-4176-BD6E-B0FE5B6AC14A@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 08:40:00PM +0000, Bernhard Beschow wrote:
> Am 17. Februar 2022 22:53:50 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >*opaque is an alias to *obj. Using the ladder makes the code consistent with
> >with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
> >makes the cast more typesafe.
> >
> >Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Send this kind of thing to qemu-trivial pls.

> >---
> > hw/virtio/virtio-balloon.c | 10 +++++-----
> > 1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> >index 9a4f491b54..38732d4118 100644
> >--- a/hw/virtio/virtio-balloon.c
> >+++ b/hw/virtio/virtio-balloon.c
> >@@ -241,7 +241,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
> >                                   void *opaque, Error **errp)
> > {
> >     Error *err = NULL;
> >-    VirtIOBalloon *s = opaque;
> >+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
> >     int i;
> > 
> >     if (!visit_start_struct(v, name, NULL, 0, &err)) {
> >@@ -276,7 +276,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
> >                                             const char *name, void *opaque,
> >                                             Error **errp)
> > {
> >-    VirtIOBalloon *s = opaque;
> >+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
> >     visit_type_int(v, name, &s->stats_poll_interval, errp);
> > }
> > 
> >@@ -284,7 +284,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
> >                                             const char *name, void *opaque,
> >                                             Error **errp)
> > {
> >-    VirtIOBalloon *s = opaque;
> >+    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
> >     int64_t value;
> > 
> >     if (!visit_type_int(v, name, &value, errp)) {
> >@@ -1014,12 +1014,12 @@ static void virtio_balloon_instance_init(Object *obj)
> >     s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
> > 
> >     object_property_add(obj, "guest-stats", "guest statistics",
> >-                        balloon_stats_get_all, NULL, NULL, s);
> >+                        balloon_stats_get_all, NULL, NULL, NULL);
> > 
> >     object_property_add(obj, "guest-stats-polling-interval", "int",
> >                         balloon_stats_get_poll_interval,
> >                         balloon_stats_set_poll_interval,
> >-                        NULL, s);
> >+                        NULL, NULL);
> > }
> > 
> > static const VMStateDescription vmstate_virtio_balloon = {
> 
> Ping


