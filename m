Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D6724448
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 01:25:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSreY-0001fZ-HO
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 19:25:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrQc-00071n-S9
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:10:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hSrQa-0007x0-VH
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:10:46 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hSrQa-0007wE-RE
	for qemu-devel@nongnu.org; Mon, 20 May 2019 19:10:44 -0400
Received: by mail-qk1-f194.google.com with SMTP id a64so9928736qkg.5
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 16:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=lqcRP5TOl9HEzw5AKgljD79bRAyUWWqCwFejvOysXuY=;
	b=IvYiI2vrBxKS287eTxojop33QCbfDdWv030qApxAX777XHXeBri77QLjIsyyCtTaIN
	Ua38C5xPstjuukBAwlz8BmWzhdLQynS4kV9YSjxWLWI3V7v5pts8m41cESJ5vLxOrDSE
	ii14zLMAaasvPmU13hs77aNEzQeI6/jxaJUOC/V2c6CDIH3iX9JLzj/oR7D/yBKUQ7yB
	2JeYbKT7yrslCA6GNSp5dn7RD2km7RlW2vwtjBonWnuKnSY5mqEZvboFH3ecXRd7XRWV
	gplrHkrvJUGb25yBvQFW3EbbTS7K6tScihvHgYfHyRvud6W7zMpla+82To/9z15SlXiG
	Zekg==
X-Gm-Message-State: APjAAAWfqauPHLxuJCKvaIWlzoTKGGGsFOcB3sRqRsqEL+79bIIw1Oci
	BwQMSABSUkOMTx1kOa1Xo8kzVgfa/p8=
X-Google-Smtp-Source: APXvYqyxc7pF7zxphLR/xz6dXJKprUw9GGfLdFdEBJq+a2gqBz0T2Oaxg6uLDE3Q1H/v0GP0ayRgwg==
X-Received: by 2002:a37:6ca:: with SMTP id 193mr59713585qkg.64.1558393842882; 
	Mon, 20 May 2019 16:10:42 -0700 (PDT)
Received: from redhat.com (pool-173-76-105-71.bstnma.fios.verizon.net.
	[173.76.105.71]) by smtp.gmail.com with ESMTPSA id
	m8sm12396121qta.10.2019.05.20.16.10.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 16:10:42 -0700 (PDT)
Date: Mon, 20 May 2019 19:10:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190320112646.3712-5-xieyongji@baidu.com>
References: <20190520231008.20140-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520231008.20140-1-mst@redhat.com>
X-Mailer: git-send-email 2.17.1.1206.gb667731e2e.dirty
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.194
Subject: [Qemu-devel] [PULL v2 07/36] vhost-user-blk: Only start vhost-user
 backend with the first kick
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Zhang Yu <zhangyu31@baidu.com>, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>, Xie Yongji <xieyongji@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@baidu.com>

We should only start vhost-user backend at the first kick for
virtio 1.0 transitional devices.

Signed-off-by: Xie Yongji <xieyongji@baidu.com>
Signed-off-by: Zhang Yu <zhangyu31@baidu.com>
Message-Id: <20190320112646.3712-5-xieyongji@baidu.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 700c1dd111..39e1adc60a 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -239,8 +239,7 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
     int i;
 
-    if (!(virtio_host_has_feature(vdev, VIRTIO_F_VERSION_1) &&
-        !virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1))) {
+    if (!vdev->start_on_kick) {
         return;
     }
 
-- 
MST


