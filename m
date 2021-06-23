Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F173B1D45
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:09:49 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4Vg-0002hp-5m
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4TJ-0006ij-SB
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:07:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4TI-0007qJ-5m
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=chY3fdp9MAjJtLhNKdbUGLrHkHTBAeGujXlbDvPXbhQ=;
 b=EqYAbQhP11C5gu/4FSASFi/P/L6Y917Dj6943qVAq3hfdSxpx7yqE9my/xa4JOJtoMVEv8
 NzVexqYX6045oueV2ONE+SrAE6MI1l0yeHfwUg3Qgir7hVTgtBheAt+YjbY56UnQEZlGdY
 3MO63oWGQhVPemrr/xKoN9R1nNxktJ0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-cHYVsv4ROT2btKPDKyvlzA-1; Wed, 23 Jun 2021 11:07:18 -0400
X-MC-Unique: cHYVsv4ROT2btKPDKyvlzA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso1481170edb.6
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=chY3fdp9MAjJtLhNKdbUGLrHkHTBAeGujXlbDvPXbhQ=;
 b=PjWlppUINJ0ZhPcamORWbcFQIkrdjUElbrrP2GWhOwCql0k6/Vr1OLJBI+lNITm5bq
 esd5Vs4rE1dXXocUUXB5wMnDoNAgAlMDCstPbtQE4E8MhIil06DWevzQto0uvkEOcX12
 IzbYUZhalkb5G/3wwdkiPSzUtHKVYGZt1cYgTzAtwosiYQNYnNRfF1uMS7WG4eK0MpKv
 izjvoQtNfc31mvUw5qfhF4XRi+zxn8cdJ41a6N+PbPeAVBLrho0gxXmLn1aJnSls+pu8
 J5dA1EgFpOCwS04J6RTKaLwE4/rcd7KvrLkfEfVI26jilYV3SdSzf+YpR/my1DvxBEYD
 znAQ==
X-Gm-Message-State: AOAM530bKY8xlQgbll6Z2YaSfuYqJmPpCUT0Iq1KkdzWZ4t+uEy89b93
 uCowgL3KBlAWks5vsSVKhs2snSOMukcRH5lzy/w3z+9FBukJ5JprOYgTj+y7De6871H/C+e7xAp
 97eZpM8pRntYjRxI=
X-Received: by 2002:a17:906:b190:: with SMTP id
 w16mr516056ejy.332.1624460836916; 
 Wed, 23 Jun 2021 08:07:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymVDEi8hMOtwXyuSEIaC2qtWmsHkf25AkWwTnXhpcjpbWoIOHMqlwhC7sONVWPLyxbS+yAlA==
X-Received: by 2002:a17:906:b190:: with SMTP id
 w16mr516041ejy.332.1624460836731; 
 Wed, 23 Jun 2021 08:07:16 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id l26sm178246edt.40.2021.06.23.08.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:07:16 -0700 (PDT)
Date: Wed, 23 Jun 2021 17:07:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 10/18] vhost-vdpa: open device fd in net_init_vhost_vdpa()
Message-ID: <20210623150714.yvdusp3zazyl6aco@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-11-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-11-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:16:42PM +0800, Jason Wang wrote:
>This path switches to open device fd in net_init_vhost_vpda(). This is
>used to prepare for the multiqueue support.
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> net/vhost-vdpa.c | 23 +++++++++++++++--------
> 1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 572aed4ca2..e63a54a938 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -157,24 +157,19 @@ static NetClientInfo net_vhost_vdpa_info = {
> };
>
> static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
>-                               const char *name, const char *vhostdev)
>+                               const char *name, int vdpa_device_fd)
> {
>     NetClientState *nc = NULL;
>     VhostVDPAState *s;
>-    int vdpa_device_fd = -1;
>     int ret = 0;
>     assert(name);
>     nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
>     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
>     s = DO_UPCAST(VhostVDPAState, nc, nc);
>-    vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
>-    if (vdpa_device_fd == -1) {
>-        return -errno;
>-    }
>+
>     s->vhost_vdpa.device_fd = vdpa_device_fd;
>     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
>     if (ret) {
>-        qemu_close(vdpa_device_fd);
>         qemu_del_net_client(nc);
>     }
>     return ret;
>@@ -202,6 +197,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                         NetClientState *peer, Error **errp)
> {
>     const NetdevVhostVDPAOptions *opts;
>+    int vdpa_device_fd, ret;
>
>     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>     opts = &netdev->u.vhost_vdpa;
>@@ -210,5 +206,16 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>                           (char *)name, errp)) {
>         return -1;
>     }
>-    return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
>+
>+    vdpa_device_fd = qemu_open_old(opts->vhostdev, O_RDWR);
>+    if (vdpa_device_fd == -1) {
>+        return -errno;
>+    }
>+
>+    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
>+    if (ret) {
>+        qemu_close(vdpa_device_fd);
>+    }
>+
>+    return ret;
> }
>-- 
>2.25.1
>
>


