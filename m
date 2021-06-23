Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED53B1CDD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:50:21 +0200 (CEST)
Received: from localhost ([::1]:38914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4Cq-0002on-SA
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4Bz-000282-K9
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4Bw-0004tf-7G
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624459763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8QFcoWObF1GrnE0VRH38pjlMj0NnkRW805h3TKLMU2E=;
 b=I2qNpJ1GLVLQ4cY9KBQ3M0wqipwqFP8XU+10ONqq4JNzosfGlLpuqJSfGVTBzLk4HLGpo0
 v4HgZMGiS90caBAkkQlq3J04XcHoy0ZFzzFavMgr6i/xPnZ5W4HaDs57zTexE+eVV4g4rA
 b1B6tAsP1OCVkBbpa7rRrYOTznJLibk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-yabvTEexNou-zlWO1HRjFw-1; Wed, 23 Jun 2021 10:49:21 -0400
X-MC-Unique: yabvTEexNou-zlWO1HRjFw-1
Received: by mail-ej1-f69.google.com with SMTP id
 c13-20020a17090603cdb029049617c6be8eso1060580eja.19
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 07:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8QFcoWObF1GrnE0VRH38pjlMj0NnkRW805h3TKLMU2E=;
 b=GAaYLAZfB0k1Cbl1oJ7YYGMCqIe/zbp7jTnCfqSecQWfdQcktE5A3FzOfFOfEwhezu
 qH4RcbSE0ta8QbZjyngX99HfoDLEQvEP8ltjBon6w+uiE7C6SBCsVN+dPfwhnQjkot2Z
 th5rxn7PgNusTVavMYreIsdfGM2L0730taSEYAUKFeF9r1k3OggfEESkptEuFM+X1IKI
 qVgkqNr4viT+qeoz4arF6gh6HG9oY5VA7nHqqeiucW5JMOyd3ir+R4Cgmr8fcxbVEixN
 IdcSRJhEJKrsDAEC+Tb4O+HbqkuwlkPctoVMMKKiMEFWKi2kUvfCzn6pkzIdypFJold9
 mjlA==
X-Gm-Message-State: AOAM532gLa2LeDj6qDw8sIvMvwgjQ9crXKv5Ok/z3FheiYmtDGZzgGO9
 +Spol8EK8yntfUR3R5lJfHNgYgbExhMAleUWUT5pBM+UUAbTTezKcKFXmHA501/3tbX8HmXeJ7f
 mbmj9Ujp1TXhb+wk=
X-Received: by 2002:a17:906:9419:: with SMTP id
 q25mr383832ejx.341.1624459760612; 
 Wed, 23 Jun 2021 07:49:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6T855b+p9fXRyGSNV2CRSXHxp/iqjUuNCxmxCt/c1FYyQFYzixYvgvf7gYCWpMwfHwym2lA==
X-Received: by 2002:a17:906:9419:: with SMTP id
 q25mr383816ejx.341.1624459760366; 
 Wed, 23 Jun 2021 07:49:20 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id y5sm159723eds.12.2021.06.23.07.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 07:49:19 -0700 (PDT)
Date: Wed, 23 Jun 2021 16:49:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 03/18] vhost_net: do not assume nvqs is always 2
Message-ID: <20210623144917.vomib2mdaq4xjrnl@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-4-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-4-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Mon, Jun 21, 2021 at 12:16:35PM +0800, Jason Wang wrote:
>This patch switches to initialize dev.nvqs from the VhostNetOptions
>instead of assuming it was 2. This is useful for implementing control
>virtqueue support which will be a single vhost_net structure with a
>single cvq.
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> hw/net/vhost_net.c      | 2 +-
> include/net/vhost_net.h | 1 +
> net/tap.c               | 1 +
> net/vhost-user.c        | 1 +
> net/vhost-vdpa.c        | 1 +
> 5 files changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>index 6bd4184f96..ef1370bd92 100644
>--- a/hw/net/vhost_net.c
>+++ b/hw/net/vhost_net.c
>@@ -163,9 +163,9 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
>         goto fail;
>     }
>     net->nc = options->net_backend;
>+    net->dev.nvqs = options->nvqs;
>
>     net->dev.max_queues = 1;
>-    net->dev.nvqs = 2;
>     net->dev.vqs = net->vqs;
>
>     if (backend_kernel) {
>diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
>index 172b0051d8..fba40cf695 100644
>--- a/include/net/vhost_net.h
>+++ b/include/net/vhost_net.h
>@@ -14,6 +14,7 @@ typedef struct VhostNetOptions {
>     VhostBackendType backend_type;
>     NetClientState *net_backend;
>     uint32_t busyloop_timeout;
>+    unsigned int nvqs;
>     void *opaque;
> } VhostNetOptions;
>
>diff --git a/net/tap.c b/net/tap.c
>index f5686bbf77..f716be3e3f 100644
>--- a/net/tap.c
>+++ b/net/tap.c
>@@ -749,6 +749,7 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>             qemu_set_nonblock(vhostfd);
>         }
>         options.opaque = (void *)(uintptr_t)vhostfd;
>+        options.nvqs = 2;
>
>         s->vhost_net = vhost_net_init(&options);
>         if (!s->vhost_net) {
>diff --git a/net/vhost-user.c b/net/vhost-user.c
>index ffbd94d944..b93918c5a4 100644
>--- a/net/vhost-user.c
>+++ b/net/vhost-user.c
>@@ -85,6 +85,7 @@ static int vhost_user_start(int queues, NetClientState *ncs[],
>         options.net_backend = ncs[i];
>         options.opaque      = be;
>         options.busyloop_timeout = 0;
>+        options.nvqs = 2;
>         net = vhost_net_init(&options);
>         if (!net) {
>             error_report("failed to init vhost_net for queue %d", i);
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 19187dce8c..18b45ad777 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -105,6 +105,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>     options.net_backend = ncs;
>     options.opaque      = be;
>     options.busyloop_timeout = 0;
>+    options.nvqs = 2;
>
>     net = vhost_net_init(&options);
>     if (!net) {
>-- 
>2.25.1
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


