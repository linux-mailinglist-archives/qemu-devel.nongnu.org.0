Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76FE2AF209
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:25:32 +0100 (CET)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcq7v-0002Nr-Qe
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvF-0007Hp-Ne
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kcpvC-0002EL-IJ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605100337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=qCQNm77aajqbhwpOZ+VJ1a9LMBcVwIsdXJPMW8NHEHM=;
 b=Tx/3dHWrTW4r02jL/v3bab5KnxcCy4W5nQ2KQ+bAJmK7ou9vAsw25JXQsoC1M+VtQ6hW46
 +eBk5h0K59xzvkABN/np+Kd/TQqf/TGLAe7wDZTmpEF6YiSlKAiB1iRlvPIm///Nsqs/60
 Ig63pRdoHbqA1kFDVePwL97BRo6smKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-k_iFHKnBOjqFJwGSQ5FP9g-1; Wed, 11 Nov 2020 08:12:15 -0500
X-MC-Unique: k_iFHKnBOjqFJwGSQ5FP9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8E2802B7E;
 Wed, 11 Nov 2020 13:12:14 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-61.pek2.redhat.com
 [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA76055760;
 Wed, 11 Nov 2020 13:12:12 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 12/17] net: remove an assert call in eth_get_gso_type
Date: Wed, 11 Nov 2020 21:11:36 +0800
Message-Id: <1605100301-11317-13-git-send-email-jasowang@redhat.com>
In-Reply-To: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
References: <1605100301-11317-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Jason Wang <jasowang@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

eth_get_gso_type() routine returns segmentation offload type based on
L3 protocol type. It calls g_assert_not_reached if L3 protocol is
unknown, making the following return statement unreachable. Remove the
g_assert call, it maybe triggered by a guest user.

Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/eth.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 0c1d413..1e0821c 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -16,6 +16,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "net/eth.h"
 #include "net/checksum.h"
 #include "net/tap.h"
@@ -71,9 +72,8 @@ eth_get_gso_type(uint16_t l3_proto, uint8_t *l3_hdr, uint8_t l4proto)
             return VIRTIO_NET_HDR_GSO_TCPV6 | ecn_state;
         }
     }
-
-    /* Unsupported offload */
-    g_assert_not_reached();
+    qemu_log_mask(LOG_UNIMP, "%s: probably not GSO frame, "
+        "unknown L3 protocol: 0x%04"PRIx16"\n", __func__, l3_proto);
 
     return VIRTIO_NET_HDR_GSO_NONE | ecn_state;
 }
-- 
2.7.4


