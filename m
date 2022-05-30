Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81977537692
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 10:37:40 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvauB-0006bk-Ki
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 04:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nvaow-0004Ra-8C
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:32:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nvaor-0000ee-KH
 for qemu-devel@nongnu.org; Mon, 30 May 2022 04:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653899528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LoXUSrYxlXv31FO+PoJhp3If6rJCNdzmaChnIO0Apnk=;
 b=F0U2leMlQi2h9218BFN2nVl7VYeYQwRlnfG4fVZoPVRmwEcHET/cf39CPSmthECijW5psG
 tOZTyu6FhJlUTZV1wmHddyV+Yc3i8LmQmnuM1TlBmoHNQfUG/uRUZxFa1a+hyzofPdJfX1
 TqEaiv/33hrd/CLhLDP+Q5o9/azpS3M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-Zpe53s4fPWi_ZfAZ4VKVGQ-1; Mon, 30 May 2022 04:32:07 -0400
X-MC-Unique: Zpe53s4fPWi_ZfAZ4VKVGQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 m26-20020a05620a13ba00b006a32a7adb78so8243194qki.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 01:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LoXUSrYxlXv31FO+PoJhp3If6rJCNdzmaChnIO0Apnk=;
 b=LGMqk3nSaZxANQi47aeNmVkuvd37nHs+DUJe+cvCNGNQ6Ye2sMs63TP8It+phFLuA2
 xkS0a4cwy5XwFSGezUh14tDiZW4DGD8/+vnOscOs5H3xsjEcnWzRmVPGnvFH4f8/B8qN
 gCVSommO1nltlcuUs+byUJ9xn6ADeRSHNpzDRB/b4aL4Mxhg2/XVw+P1izZdS0gRAV03
 coV0GAMoYAOOxx+Gg7RfjK/0mf6vDvBaLsjeQzfNDMYoRaLgEYYo+u+wqJWzeA4fyDU+
 wv//+WBNvZAcTKj3UZ1q2sDKUnuc5hsrgfePt1HAVFin/clZwKP9jv4X7VQxd1WXthUO
 UkMA==
X-Gm-Message-State: AOAM532JLFrYT70v+iPJkX+c8Mw1UXP0IBhiuOCVg3kJ4vGGDodJRliE
 +xBJf6/wYJHLKoZa61MAqvIJHY2IiS3d0T1E1/Sal/iJWzlmYNuhOZiLmuAd5CUkyPOHO/02WMf
 O9OjRa9EqTUU4+Q0=
X-Received: by 2002:ad4:5ce8:0:b0:461:ebad:2abf with SMTP id
 iv8-20020ad45ce8000000b00461ebad2abfmr44047892qvb.20.1653899526872; 
 Mon, 30 May 2022 01:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnsf2gyMcmCVsiwZvEmLOVi2mS/NXn/savY5yox1DdD/5XJlXzVhC+s6Y5IW2Zjuz1k+EXUQ==
X-Received: by 2002:ad4:5ce8:0:b0:461:ebad:2abf with SMTP id
 iv8-20020ad45ce8000000b00461ebad2abfmr44047886qvb.20.1653899526668; 
 Mon, 30 May 2022 01:32:06 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-16.business.telecomitalia.it.
 [87.12.25.16]) by smtp.gmail.com with ESMTPSA id
 2-20020ac85942000000b002f90f479af6sm7145011qtz.40.2022.05.30.01.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 01:32:06 -0700 (PDT)
Date: Mon, 30 May 2022 10:32:00 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Peter Lieven <pl@kamp.de>, Ilya Dryomov <idryomov@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Tingting Mao <timao@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] block/rbd: report a better error when namespace does
 not exist
Message-ID: <20220530083200.a76fctmgr2serfcn@sgarzare-redhat>
References: <20220517071012.6120-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220517071012.6120-1-sgarzare@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

Gentle ping :-)

@Kevin, can this patch go with your tree?
Ilya already reviewed it.

Thanks,
Stefano

On Tue, May 17, 2022 at 09:10:12AM +0200, Stefano Garzarella wrote:
>If the namespace does not exist, rbd_create() fails with -ENOENT and
>QEMU reports a generic "error rbd create: No such file or directory":
>
>    $ qemu-img create rbd:rbd/namespace/image 1M
>    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>    qemu-img: rbd:rbd/namespace/image: error rbd create: No such file or directory
>
>Unfortunately rados_ioctx_set_namespace() does not fail if the namespace
>does not exist, so let's use rbd_namespace_exists() in qemu_rbd_connect()
>to check if the namespace exists, reporting a more understandable 
>error:
>
>    $ qemu-img create rbd:rbd/namespace/image 1M
>    Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>    qemu-img: rbd:rbd/namespace/image: namespace 'namespace' does not exist
>
>Reported-by: Tingting Mao <timao@redhat.com>
>Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>---
>v2:
>- check r < 0 for consistency (librbd errors are always negative) [Ilya]
>---
> meson.build |  6 ++++++
> block/rbd.c | 24 ++++++++++++++++++++++++
> 2 files changed, 30 insertions(+)
>
>diff --git a/meson.build b/meson.build
>index 9b20dcd143..e6c0afd62b 100644
>--- a/meson.build
>+++ b/meson.build
>@@ -1828,6 +1828,12 @@ config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
> config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
> config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
> config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
>+if rbd.found()
>+  config_host_data.set('HAVE_RBD_NAMESPACE_EXISTS',
>+                       cc.has_function('rbd_namespace_exists',
>+                                       dependencies: rbd,
>+                                       prefix: '#include <rbd/librbd.h>'))
>+endif
> if rdma.found()
>   config_host_data.set('HAVE_IBV_ADVISE_MR',
>                        cc.has_function('ibv_advise_mr',
>diff --git a/block/rbd.c b/block/rbd.c
>index 6caf35cbba..f826410f40 100644
>--- a/block/rbd.c
>+++ b/block/rbd.c
>@@ -831,6 +831,26 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>         error_setg_errno(errp, -r, "error opening pool %s", opts->pool);
>         goto failed_shutdown;
>     }
>+
>+#ifdef HAVE_RBD_NAMESPACE_EXISTS
>+    if (opts->has_q_namespace && strlen(opts->q_namespace) > 0) {
>+        bool exists;
>+
>+        r = rbd_namespace_exists(*io_ctx, opts->q_namespace, &exists);
>+        if (r < 0) {
>+            error_setg_errno(errp, -r, "error checking namespace");
>+            goto failed_ioctx_destroy;
>+        }
>+
>+        if (!exists) {
>+            error_setg(errp, "namespace '%s' does not exist",
>+                       opts->q_namespace);
>+            r = -ENOENT;
>+            goto failed_ioctx_destroy;
>+        }
>+    }
>+#endif
>+
>     /*
>      * Set the namespace after opening the io context on the pool,
>      * if nspace == NULL or if nspace == "", it is just as we did nothing
>@@ -840,6 +860,10 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
>     r = 0;
>     goto out;
>
>+#ifdef HAVE_RBD_NAMESPACE_EXISTS
>+failed_ioctx_destroy:
>+    rados_ioctx_destroy(*io_ctx);
>+#endif
> failed_shutdown:
>     rados_shutdown(*cluster);
> out:
>-- 
>2.35.3
>


