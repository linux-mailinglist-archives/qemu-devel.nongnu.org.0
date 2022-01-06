Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D818E48659F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:55:32 +0100 (CET)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TEp-00009X-WB
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se2-0004vy-P6
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdh-0000rd-KT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNzO3BmzKsU9XDhTDAgKzBlwWRwUQVLphv/ivYXligU=;
 b=Tfxk/mXxUBh16TwzE8kxugm+G7uwj2kBB15uwmlr4IQXST2l3iQkIafUIcGHpZ1Rt5Mi9a
 C64ut6g3N7tzfg66lB7YHYEOXQSwfoNkLGTKais6snetceTTz9yjTeaTIpjPBwl9sEr8IA
 Sh6GPtm9qq1FqeCXiXQfWcntuTHI66k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-wdjkzg_VM76nl0RY5NmQNA-1; Thu, 06 Jan 2022 08:17:08 -0500
X-MC-Unique: wdjkzg_VM76nl0RY5NmQNA-1
Received: by mail-wr1-f71.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so1227042wrh.23
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mNzO3BmzKsU9XDhTDAgKzBlwWRwUQVLphv/ivYXligU=;
 b=0LMduXC6/4L5edZw0JH9cgfZEtsm+oNk/FHy6P9cDJ0rJAmIZiUKF34VOMccRG61pY
 9/erhuzUknzQ5GgzUnQoY2bJa65ioB1qE+5+vCUqUyH047VLQsvPuQI1Olxe0CG4XyMr
 ThQOt+zCbD20ZYZkJVaRZFRU/dqMNIltlwCalYGBHimf2lUURPqU+naI69UGudiKvodv
 RBazhqkqjvGk3gN0hGtfq0jHC/t3zDAx72J6ubzwCPlnZWvFcdIopUnAVdpSYdy9XVh1
 GK75Usx6zPCCOFApsPUHs66qXke3sZAeiU3ykgFmfTBzQXyYruMOi+E69UtXA6HUGZtZ
 7kDw==
X-Gm-Message-State: AOAM53112OV1vg6NLz4DzyNppiPrCtXYz5C5f49WIeHfxFLEOXDO6Jkr
 3Xf+CUxhS6ZSJMRdkHnw1iK1fktt3bFmjKSnuWX0J/3xbZvlH1iYwYtc4LpVUaC7qRxZnx5dtno
 1/Denkq4ZD3x/7M1fscxzLF7QSrrkAfKthX3rve13m8IUSe6aecISNW1OhrFz
X-Received: by 2002:a1c:4406:: with SMTP id r6mr7017718wma.42.1641475026423;
 Thu, 06 Jan 2022 05:17:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpzehG4ul4BtHDDieNzsU1oK2TMPnh/u+vr+VP2rb5Iqnz50SVC9luQn/NRR22MQGXeJdFvA==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr7017700wma.42.1641475026180;
 Thu, 06 Jan 2022 05:17:06 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id u14sm1986163wrf.39.2022.01.06.05.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:05 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/52] vhost-backend: stick to -errno error return convention
Message-ID: <20220106131534.423671-19-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Almost all VhostOps methods in kernel_ops follow the convention of
returning negated errno on error.

Adjust the only one that doesn't.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-7-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/vhost-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 44f7dbb243..e409a865ae 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -47,7 +47,7 @@ static int vhost_kernel_cleanup(struct vhost_dev *dev)
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_KERNEL);
 
-    return close(fd);
+    return close(fd) < 0 ? -errno : 0;
 }
 
 static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
-- 
MST


