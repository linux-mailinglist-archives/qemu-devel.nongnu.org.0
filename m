Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E543376DC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:21:26 +0100 (CET)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN7t-0001oA-Ua
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc7-0004v7-6m
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc5-0002pt-B0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZMJJDeBY90DC6HPK2zHg7uUmG/3aQzChqZoF7r9sRw=;
 b=VrTcXJLU+kckZz835OIdhJFUXVJmSFAzgGfgpt939dc2bUpU4dara44E6xBo6E2yaOgljE
 OVj7ckgqaZdXQipy7mWTeCwx09BTuzfSGg5yK0YolhL+vJpRsiPdtcLY8PVGkMOylusCH8
 /GQ9xRBavu9yhV+ZRonW29qZP/zsSpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-fmoR8PZaOS6C4xDjTDqxsw-1; Thu, 11 Mar 2021 09:48:28 -0500
X-MC-Unique: fmoR8PZaOS6C4xDjTDqxsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 546A0107AFF7;
 Thu, 11 Mar 2021 14:48:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E3FE5D9F2;
 Thu, 11 Mar 2021 14:48:25 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/38] block/export: disable
 VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD for now
Date: Thu, 11 Mar 2021 15:47:39 +0100
Message-Id: <20210311144811.313451-7-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The vhost-user in-flight shmfd feature has not been tested with
qemu-storage-daemon's vhost-user-blk server. Disable this optional
feature for now because it requires MFD_ALLOW_SEALING, which is not
available in some CI environments.

If we need this feature in the future it can be re-enabled after
testing.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210309094106.196911-2-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/vhost-user-blk-server.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
index cb5d896b7b..fa06996d37 100644
--- a/block/export/vhost-user-blk-server.c
+++ b/block/export/vhost-user-blk-server.c
@@ -345,8 +345,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
 
 static uint64_t vu_blk_get_protocol_features(VuDev *dev)
 {
-    return 1ull << VHOST_USER_PROTOCOL_F_CONFIG |
-           1ull << VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD;
+    return 1ull << VHOST_USER_PROTOCOL_F_CONFIG;
 }
 
 static int
-- 
2.29.2


