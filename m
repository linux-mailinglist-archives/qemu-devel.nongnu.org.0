Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06E03BC7D7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:28:52 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gRn-0000Rg-NF
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m0gQD-0007fz-7Z
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m0gQA-0001tI-QL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RWBFWvGFB4494l1wCvzTm79TtlJ1rWMnwTHVUen0jmc=;
 b=N2pYQU3b0FPYN9EiJLxYOtpXbY1k5ry0BcOBKTlZNmXq8xmRJORMIyf9zwSXPZEB5438cg
 GaXDeOAFzkbWEY4tJBB+Gc+eObyMv1pM0MNe1qbWtfDsrlMpVUvXqeNdLXo5nRcp5TxTRH
 wSuXwOpWM1eFe24CGxQSLtcG3XvmXB0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-wIKqqCCPMCqvpUAd8x2b6A-1; Tue, 06 Jul 2021 04:27:08 -0400
X-MC-Unique: wIKqqCCPMCqvpUAd8x2b6A-1
Received: by mail-wr1-f70.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso6900405wrh.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RWBFWvGFB4494l1wCvzTm79TtlJ1rWMnwTHVUen0jmc=;
 b=bruEg57+5GZL19FtZJ8XAM2wEtBZv+xrVc5fCLadojP1YovrRktpg050LxJkQkmkuk
 IclQTlSLbmUFl3IfZKgDT8CUt3sCPDg9lVorNBD/W3OWSra16FolAekYMasrJ6Reupgf
 wfge5Nz31HIzflSWAp8A7KsfrxNebybvGcloUxWvmhsWR25jsWrrXo81tnfDEraY/Gdc
 /0celZbQjYCYIVrLKQ7rbFg9lrjLphsAvjAYcQugThm04VNdkXJ8RW057hi5EaGUD8uU
 +rZEHEHllvbybtbLos0o/gFAmeiXHgQXGhEb/A5uNx/5Kgv9u9IueiiXCgReuCSag2Yu
 AAmg==
X-Gm-Message-State: AOAM530eGx/c/sbJuU4iSStO/Anj4KWGeud4alrYSBYQqlto6Gnh3X1X
 NA6nPzS0YeD4IyvU08MMbOyf5GAZbsAJGZeWA/2LAo/ujr2YdtJwICWoAVCdA3dcgv4f2jGEgiM
 zhHPdSPj7KcBdefw=
X-Received: by 2002:a1c:4d10:: with SMTP id o16mr19094016wmh.160.1625560027060; 
 Tue, 06 Jul 2021 01:27:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgA4iCt/X9A+5tNptngO9Ix/1u4K4+LPDkoRqmrgLj7BSCkjmFWVOH3IiOLhacgjBxC5d4dQ==
X-Received: by 2002:a1c:4d10:: with SMTP id o16mr19093994wmh.160.1625560026892; 
 Tue, 06 Jul 2021 01:27:06 -0700 (PDT)
Received: from steredhat ([109.52.250.15])
 by smtp.gmail.com with ESMTPSA id f22sm14917188wmb.46.2021.07.06.01.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 01:27:06 -0700 (PDT)
Date: Tue, 6 Jul 2021 10:27:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 07/18] vhost-vdpa: tweak the error label in
 vhost_vdpa_add()
Message-ID: <20210706082703.julcfywtatytczbo@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-8-jasowang@redhat.com>
 <20210623150312.7g43l5qjwacxhw43@steredhat>
 <208edb63-a0d1-6d6b-e451-b17cb24708ed@redhat.com>
 <12f1b265-3dd0-9c9e-cfbe-e004e08ec7f1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <12f1b265-3dd0-9c9e-cfbe-e004e08ec7f1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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

On Tue, Jul 06, 2021 at 04:10:22PM +0800, Jason Wang wrote:
>
>在 2021/7/6 下午4:03, Jason Wang 写道:
>>
>>在 2021/6/23 下午11:03, Stefano Garzarella 写道:
>>>On Mon, Jun 21, 2021 at 12:16:39PM +0800, Jason Wang wrote:
>>>>Introduce new error label to avoid the unnecessary checking of net
>>>>pointer.
>>>>
>>>>Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
>>>>Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>>---
>>>>net/vhost-vdpa.c | 13 ++++++-------
>>>>1 file changed, 6 insertions(+), 7 deletions(-)
>>>>
>>>>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>index 21f09c546f..0da7bc347a 100644
>>>>--- a/net/vhost-vdpa.c
>>>>+++ b/net/vhost-vdpa.c
>>>>@@ -100,19 +100,18 @@ static int vhost_vdpa_add(NetClientState 
>>>>*ncs, void *be)
>>>>    net = vhost_net_init(&options);
>>>>    if (!net) {
>>>>        error_report("failed to init vhost_net for queue");
>>>>-        goto err;
>>>>+        goto err_init;
>>>>    }
>>>>    s->vhost_net = net;
>>>>    ret = vhost_vdpa_net_check_device_id(net);
>>>>    if (ret) {
>>>>-        goto err;
>>>>+        goto err_check;
>>>>    }
>>>>    return 0;
>>>>-err:
>>>>-    if (net) {
>>>>-        vhost_net_cleanup(net);
>>>>-        g_free(net);
>>>>-    }
>>>>+err_check:
>>>>+    vhost_net_cleanup(net);
>>>>+    g_free(net);
>>>
>>>Should we set s->vhost_net to NULL to avoid use after free?
>>>
>>>Then we should also remove the `assert(s->vhost_net)` in 
>>>net_vhost_vdpa_init() since we can fail.
>>
>>
>>Right, will do this in a separate patch.
>
>
>I just forget the job has been done in the next patch :)

I saw it later too ;-)

>
>So we are fine here.

Yep for the assert(), but what about setting s->vhost_net to NULL?
Or just move the s->vhost_net assignment just before the `return 0`.

Thanks,
Stefano


