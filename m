Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC472D49C9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:08:00 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4oh-00035X-Vd
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vL-0004ah-1X
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vD-0000Ky-Lv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c0kBt8I1oCPYpFP4q5PRaWZkMHzl2YDLms+Egf+MHrY=;
 b=AQJGBknVMiJR+p/FqJKF5ZJKPLASzswP/iVUPH4bSMQcONlXBBNn43QFvGB5Pss3zMlVdm
 1+97Pg9Yp5JlgLXJ/+qHio9xHM+y7j1Ef7c0ceh4KXYiU+F1UV2mowrw09WJ8Ju30X/2Bi
 9/vt6c748+heauVm6rah/N+fjCMo5sg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-dGDGDnxtPtWIRvMuYWzMZA-1; Wed, 09 Dec 2020 13:10:37 -0500
X-MC-Unique: dGDGDnxtPtWIRvMuYWzMZA-1
Received: by mail-wm1-f70.google.com with SMTP id r5so880810wma.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0kBt8I1oCPYpFP4q5PRaWZkMHzl2YDLms+Egf+MHrY=;
 b=OMiymc05wM3uJLz1SnoPrv4jqZXc7VV0qUEVzFnAlBl1F/29KnmwxPZfSRCyMBZRaM
 mWLST8xbkuITPOxYwli1hC+j5FYwDjs8twuY3r99hwuKkoczTiCGDrt9ZfFaX4C4hDPm
 m/xISJPjrkLE1sOAOa3ph2kERsfysJbxBhb9Ivf0mBl5XtLKkfF4E+p9ywY0D2Yarc4a
 j3LwKxMjZ8P9sTEq2QqS2708mavboRvKWykX2fxrUNV2kC+qr49MpzQ/kJ/Zx+D59+a8
 O60QgUhNnctVj4143MNXQh6Y72eITVXuoDB3V/EINGzQ0rirG15pGlsDkMNPVax8xxY7
 wt2g==
X-Gm-Message-State: AOAM5338IFaQmQmrF4S+ebr9EIpiq4V1WmbyaGqwj2ZURNj6Mze+quiF
 ptLo5onLcqYb1TzbNz2ZbBWILYc+11CMwle0nCD+Dsd4cmIiiJ6q5hc2L+xJ3NzaDfTLBTdtU8J
 JNtTNV4yFdhNrkaJTs9p1CGzTLO7N+a0tQuktWHEWxJKy6a+2fp8IwPNheDda
X-Received: by 2002:a7b:c773:: with SMTP id x19mr3956976wmk.127.1607537435543; 
 Wed, 09 Dec 2020 10:10:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3B0ZGqg9ncmvhpPgoPHIDhx0tlYHGK5QwJhsSgjKM+1RruqHjNp+WFYnhZzSkp37SL/HQsQ==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr3956959wmk.127.1607537435335; 
 Wed, 09 Dec 2020 10:10:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id w13sm4733738wrt.52.2020.12.09.10.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:34 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 52/65] contrib/vhost-user-gpu: avoid g_return_val_if()
 input validation
Message-ID: <20201209180546.721296-53-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Do not validate input with g_return_val_if(). This API is intended for
checking programming errors and is compiled out with -DG_DISABLE_CHECKS.

Use an explicit if statement for input validation so it cannot
accidentally be compiled out.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201118091644.199527-3-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index a019d0a9ac..f445ef28ec 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -1044,7 +1044,9 @@ vg_get_config(VuDev *dev, uint8_t *config, uint32_t len)
 {
     VuGpu *g = container_of(dev, VuGpu, dev.parent);
 
-    g_return_val_if_fail(len <= sizeof(struct virtio_gpu_config), -1);
+    if (len > sizeof(struct virtio_gpu_config)) {
+        return -1;
+    }
 
     if (opt_virgl) {
         g->virtio_config.num_capsets = vg_virgl_get_num_capsets();
-- 
MST


