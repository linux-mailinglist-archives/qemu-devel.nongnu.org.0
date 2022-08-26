Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458935A2B47
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:31:01 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbIN-0005WK-Bg
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOe-0004FP-1i; Fri, 26 Aug 2022 10:33:20 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:39752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oRaOc-0007Aq-2V; Fri, 26 Aug 2022 10:33:19 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CA9952E19C7;
 Fri, 26 Aug 2022 17:33:08 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b581::1:d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 7Ht2PirWaX-X7OqEHsd; Fri, 26 Aug 2022 17:33:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661524388; bh=ztgGg+UO3nf6qzy6438YfteSjEzUC1lf//ceVN4qKTE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=B3knmzJOuksntlN4KmTHGmAeiF/gbr3hBUn6zGtQvvoLpz65ecpo9cOBmnzAY0DYv
 desqq3/ZtiPyUMEMWJfb3F4aLYfd1hsnhJbjO6awBRkmP2DcisO6c/x8DsJ0/nT1P+
 kvJn/TfNAoOmhSd+fjMmibF7G1ws2Tkqs0YPR/dQ=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v2 3/8] virtio-net: utilize VirtIOConfigSizeParams &
 virtio_get_config_size
Date: Fri, 26 Aug 2022 17:32:43 +0300
Message-Id: <20220826143248.580939-4-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Use the new common helper. As an added bonus this also makes use of
config size sanity checking via the 'max_size' field.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/net/virtio-net.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..dfc8dd8562 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -106,6 +106,11 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
+static const VirtIOConfigSizeParams cfg_size_params = {
+    .max_size = sizeof(struct virtio_net_config),
+    .feature_sizes = feature_sizes
+};
+
 static VirtIONetQueue *virtio_net_get_subqueue(NetClientState *nc)
 {
     VirtIONet *n = qemu_get_nic_opaque(nc);
@@ -3246,8 +3251,7 @@ static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
 {
     virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
 
-    n->config_size = virtio_feature_get_config_size(feature_sizes,
-                                                    host_features);
+    n->config_size = virtio_get_config_size(&cfg_size_params, host_features);
 }
 
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
-- 
2.25.1


