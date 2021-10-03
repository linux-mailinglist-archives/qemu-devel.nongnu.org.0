Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DFD42036E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:33:40 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX6Is-0002Hw-Jx
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0ddf07066a45508848f78317aa311c2a8120aa9d@lizzy.crudebyte.com>)
 id 1mX6Fy-0000gb-Bj
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 14:30:40 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0ddf07066a45508848f78317aa311c2a8120aa9d@lizzy.crudebyte.com>)
 id 1mX6Fs-00009e-Dk
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 14:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:References:
 In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=ofIbKXcw5MeCVTtfInRG0pIYaeihr0khMk0pyTGTMfU=; b=BqvZa
 IXoR52ti3PDQRsLv/8DVKlMoYK8W2kIqC4oWNoIVhes/crqWN4WVwey4u9p/sZyGvNy7UWAPjSdaP
 dIUeldgm3AhsAJIBl+hczbrw24y+uA6Y9w6Wg93LlLztY3oKQeoP8inhJnVLXZnIed6DOuO5yuBta
 Hjmpo3sWnOwwMCRF3FvEklZVGjo7IuFeNZ1HENQIXsUcdJN7ZGgQmsXDltkC8Yskt34vgJFEp16EY
 VwqXoNzUzxBm5bayY3K5fhzeoft0Y9UUUVY7xnPggb9lteEeoDWhK5SmMH+mnY6yB2k5MJM7roJn4
 BDoivF//+ZQbdcQgbMd76y7oUgHYg==;
In-Reply-To: <9125826.uuVAOS58fx@silver>
References: <9125826.uuVAOS58fx@silver>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 3 Oct 2021 20:15:36 +0200
Subject: [PATCH] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
    Greg Kurz <groug@kaod.org>
Message-Id: <E1mX6En-00047K-As@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0ddf07066a45508848f78317aa311c2a8120aa9d@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VIRTQUEUE_MAX_SIZE reflects the absolute theoretical maximum
queue size possible, which is actually the maximum queue size
allowed by the virtio protocol. The appropriate value for
VIRTQUEUE_MAX_SIZE is therefore 32768:

https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 include/hw/virtio/virtio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..1f18efa0bc 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -48,7 +48,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *features,
 
 typedef struct VirtQueue VirtQueue;
 
-#define VIRTQUEUE_MAX_SIZE 1024
+#define VIRTQUEUE_MAX_SIZE 32768
 
 typedef struct VirtQueueElement
 {
-- 
2.20.1


